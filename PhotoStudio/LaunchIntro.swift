import SwiftUI

/// The launch animation, "Contact Sheet" (LAUNCH.md): four rounded frames, like one shot bracketed at four exposures,
/// close like a shutter and fly out to become the home screen's own tiles while the rest of the screen rises in.
/// Nothing fades out at the end: the last frame of the animation is the home screen.
enum LaunchStage: Int, Comparable {
    case blank      // the plain background, as the system launch screen left it
    case mark       // the four frames assemble in the middle
    case shutter    // they close up, the anticipation before the release
    case fly        // they fly to their tiles; the title and the tools come in
    case done       // the real home screen, and it takes touches

    static func < (a: LaunchStage, b: LaunchStage) -> Bool { a.rawValue < b.rawValue }
}

/// The home tiles the mark's frames become, in the mark's reading order: top left, top right, bottom left, bottom
/// right. Each frame flies to the part of the screen it already points at.
enum LaunchPart: Int, CaseIterable, Identifiable {
    case edit, about, camera, video
    var id: Int { rawValue }
}

extension LaunchIntro {
    /// Plays on a cold launch, except with VoiceOver on (focus should land on a finished screen), for the benches,
    /// and with the `NoLaunchIntro` launch argument.
    static var wanted: Bool {
        !ProcessInfo.processInfo.arguments.contains("NoLaunchIntro") && !UIAccessibility.isVoiceOverRunning
            && !EnhanceBench.requested && !RemoveBench.requested
    }
}

extension View {
    /// Plays the launch animation over this view (the home screen) while `isPlaying`, and sets it false when done.
    func launchIntro(isPlaying: Binding<Bool>) -> some View { modifier(LaunchIntro(isPlaying: isPlaying)) }

    /// A home tile one of the mark's frames lands on. It stays hidden until the frame over it hands off.
    func launchTarget(_ part: LaunchPart) -> some View { modifier(LaunchTarget(part: part)) }

    /// A tile's icon and name, which come in once the tile is real.
    func launchLabel(_ order: Int = 0) -> some View { modifier(LaunchLabel(order: order)) }

    /// Part of the screen that rises into place while the frames fly, `order` steps after the first.
    func launchRise(_ order: Int) -> some View { modifier(LaunchRise(order: order)) }

    /// The app's name, wiped in from the left.
    func launchWipe() -> some View { modifier(LaunchWipe()) }
}

extension EnvironmentValues {
    @Entry var launchStage = LaunchStage.done
    /// Plays the animation again (Debug builds offer it on a long press of the title).
    @Entry var replayLaunch: (() -> Void)? = nil
}

struct LaunchIntro: ViewModifier {
    @Binding var isPlaying: Bool
    @State private var stage: LaunchStage
    @State private var run = 0
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    init(isPlaying: Binding<Bool>) {
        _isPlaying = isPlaying
        _stage = State(initialValue: isPlaying.wrappedValue ? .blank : .done)
    }

    func body(content: Content) -> some View {
        content
            .environment(\.launchStage, stage)
            .environment(\.replayLaunch, replay)
            .allowsHitTesting(stage == .done)
            .overlayPreferenceValue(LaunchTargetsKey.self) { anchors in
                if stage != .done {
                    GeometryReader { proxy in
                        LaunchMark(stage: stage, targets: anchors.mapValues { proxy[$0] }, size: proxy.size)
                    }
                    // A tap anywhere skips to the finished screen.
                    .contentShape(Rectangle())
                    .onTapGesture { finish() }
                    .accessibilityHidden(true)
                }
            }
            .task(id: run) { await play() }
    }

    private func play() async {
        guard isPlaying else { return }
        do {
            // One frame of the plain background first, so the animation starts from the launch screen.
            try await Task.sleep(for: .milliseconds(60))
            if reduceMotion { return finish() }       // no travel: the home screen just fades in
            guard stage == .blank else { return }
            stage = .mark
            if Self.hold == .mark { return }
            try await Task.sleep(for: .milliseconds(620))
            guard stage == .mark else { return }
            stage = .shutter
            if Self.hold == .shutter { return }
            try await Task.sleep(for: .milliseconds(120))
            guard stage == .shutter else { return }
            UIImpactFeedbackGenerator(style: .soft).impactOccurred(intensity: 0.7)
            stage = .fly
            if Self.hold == .fly { return }
            try await Task.sleep(for: .milliseconds(820))
        } catch {}
        finish()
    }

    /// Debug builds: `LaunchIntroHold mark`, `shutter` or `fly` stops the animation at the end of that stage, to
    /// check a stage's layout (`fly` against the finished screen shows the hand-off). A tap still finishes it.
    private static var hold: LaunchStage? {
        #if DEBUG
        let args = ProcessInfo.processInfo.arguments
        guard let i = args.firstIndex(of: "LaunchIntroHold"), i + 1 < args.count else { return nil }
        return ["mark": .mark, "shutter": .shutter, "fly": .fly][args[i + 1]]
        #else
        return nil
        #endif
    }

    private func finish() {
        stage = .done
        isPlaying = false
    }

    private func replay() {
        // Back to the blank screen at once (not animated), then the whole run again.
        var hide = Transaction()
        hide.disablesAnimations = true
        withTransaction(hide) { stage = .blank }
        isPlaying = true
        run += 1
    }
}

/// Where each target tile is, so the frames know where to land.
private struct LaunchTargetsKey: PreferenceKey {
    static let defaultValue: [LaunchPart: Anchor<CGRect>] = [:]
    static func reduce(value: inout [LaunchPart: Anchor<CGRect>], nextValue: () -> [LaunchPart: Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}

/// The four frames and the flash ring, drawn over the home screen until the hand-off.
private struct LaunchMark: View {
    let stage: LaunchStage
    let targets: [LaunchPart: CGRect]
    let size: CGSize

    private let side: CGFloat = 34      // one frame of the mark
    private let gap: CGFloat = 6
    /// The four exposures: the accent at full strength, then lighter.
    private let tints: [Double] = [1, 0.72, 0.48, 0.28]

    var body: some View {
        let centre = CGPoint(x: size.width / 2, y: size.height / 2)
        ZStack {
            ForEach(LaunchPart.allCases) { part in
                let f = frame(part, centre)
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .fill(fill(part))
                    .frame(width: f.width, height: f.height)
                    .rotationEffect(.degrees(stage == .blank ? -24 : 0))
                    .position(x: f.midX, y: f.midY)
                    .opacity(opacity(part))
                    .animation(animation(part), value: stage)
            }
            // The flash: a faint ring that opens out from the middle as the shutter releases.
            Circle()
                .strokeBorder(Color.accentColor, lineWidth: 1.5)
                .frame(width: side * 2 + gap, height: side * 2 + gap)
                .keyframeAnimator(initialValue: Flash(), trigger: stage == .fly) { ring, flash in
                    ring.scaleEffect(flash.scale).opacity(flash.opacity)
                } keyframes: { _ in
                    KeyframeTrack(\.scale) {
                        MoveKeyframe(0.9)
                        CubicKeyframe(3.4, duration: 0.7)
                    }
                    KeyframeTrack(\.opacity) {
                        MoveKeyframe(0)
                        LinearKeyframe(0.45, duration: 0.06)
                        CubicKeyframe(0, duration: 0.6)
                    }
                }
                .position(centre)
        }
        .allowsHitTesting(false)
    }

    private struct Flash {
        var scale: CGFloat = 1
        var opacity: Double = 0
    }

    /// Each stage's frame for a part: off its corner, in the mark, closed up, or on its tile.
    private func frame(_ part: LaunchPart, _ c: CGPoint) -> CGRect {
        let dx: CGFloat = part.rawValue % 2 == 0 ? -1 : 1
        let dy: CGFloat = part.rawValue < 2 ? -1 : 1
        func square(_ s: CGFloat, out: CGFloat) -> CGRect {
            CGRect(x: c.x + dx * out - s / 2, y: c.y + dy * out - s / 2, width: s, height: s)
        }
        switch stage {
        case .blank: return square(side * 0.4, out: side / 2 + gap / 2 + 40)
        case .mark: return square(side, out: side / 2 + gap / 2)
        case .shutter: return square(side * 0.88, out: side * 0.44)
        case .fly, .done: return targets[part] ?? square(side, out: side / 2 + gap / 2)
        }
    }

    private var radius: CGFloat {
        switch stage {
        case .blank, .mark: return 9
        case .shutter: return 7
        case .fly, .done: return 14     // the home tiles' corner
        }
    }

    /// The exposure tint in the mark; the tile's own fill once it flies (only "Edit a photo" is filled).
    private func fill(_ part: LaunchPart) -> Color {
        if stage >= .fly { return part == .edit ? Color.accentColor : Color(.secondarySystemBackground) }
        return Color.accentColor.opacity(tints[part.rawValue])
    }

    private func opacity(_ part: LaunchPart) -> Double {
        if stage == .blank { return 0 }
        return stage >= .fly && targets[part] == nil ? 0 : 1      // a tile that isn't on screen: the frame just goes
    }

    /// Each stage's curve, one frame after another: springs in, a quick close, then a long, settled glide.
    private func animation(_ part: LaunchPart) -> Animation? {
        let i = Double(part.rawValue)
        switch stage {
        case .mark: return .spring(response: 0.5, dampingFraction: 0.72).delay(i * 0.05)
        case .shutter: return .easeIn(duration: 0.12)
        // An ease-out that ends exactly on time, so every frame is at rest on its tile at the hand-off.
        case .fly: return .timingCurve(0.16, 1, 0.3, 1, duration: 0.66).delay(i * 0.045)
        case .blank, .done: return nil
        }
    }
}

private struct LaunchTarget: ViewModifier {
    let part: LaunchPart
    @Environment(\.launchStage) private var stage
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        content
            .anchorPreference(key: LaunchTargetsKey.self, value: .bounds) { [part: $0] }
            // Shown in the same moment the frame over it goes, so the swap can't be seen.
            .opacity(stage == .done ? 1 : 0)
            .animation(reduceMotion ? .easeOut(duration: 0.25) : nil, value: stage)
    }
}

private struct LaunchLabel: ViewModifier {
    let order: Int
    @Environment(\.launchStage) private var stage
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        let shown = stage == .done
        content
            .opacity(shown ? 1 : 0)
            .offset(y: shown || reduceMotion ? 0 : 6)
            .animation(shown ? .easeOut(duration: 0.25).delay(Double(order) * 0.04) : nil, value: stage)
    }
}

private struct LaunchRise: ViewModifier {
    let order: Int
    @Environment(\.launchStage) private var stage
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        let shown = stage >= .fly
        content
            .opacity(shown ? 1 : 0)
            .offset(y: shown || reduceMotion ? 0 : 18)
            .animation(animation(shown), value: stage)
    }

    private func animation(_ shown: Bool) -> Animation? {
        guard shown else { return nil }
        if reduceMotion { return .easeOut(duration: 0.25) }
        return .spring(response: 0.55, dampingFraction: 0.86).delay(0.16 + Double(order) * 0.03)
    }
}

private struct LaunchWipe: ViewModifier {
    @Environment(\.launchStage) private var stage
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    func body(content: Content) -> some View {
        let shown = stage >= .fly
        content
            .mask(alignment: .leading) {
                GeometryReader { g in
                    // A soft-edged band slides across, so the name is revealed, not faded.
                    HStack(spacing: 0) {
                        Rectangle()
                        LinearGradient(colors: [.black, .clear], startPoint: .leading, endPoint: .trailing)
                            .frame(width: 28)
                    }
                    .frame(width: g.size.width + 28)
                    .offset(x: shown || reduceMotion ? 0 : -(g.size.width + 28))
                }
            }
            .opacity(reduceMotion && !shown ? 0 : 1)
            .animation(shown ? (reduceMotion ? .easeOut(duration: 0.25) : .easeOut(duration: 0.55).delay(0.08)) : nil,
                       value: stage)
    }
}

#Preview("Launch") {
    @Previewable @State var playing = true
    HomeView(openPhoto: { _ in }, openVideo: {}, openCamera: {}, showWelcome: {})
        .overlay(alignment: .bottom) { ReplayButton() }
        .launchIntro(isPlaying: $playing)
}

/// The preview's Replay button, reading the replay action the launch animation provides.
private struct ReplayButton: View {
    @Environment(\.replayLaunch) private var replay
    var body: some View {
        Button("Replay") { replay?() }.buttonStyle(.borderedProminent).padding()
    }
}
