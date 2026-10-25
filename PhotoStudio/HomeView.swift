import SwiftUI

/// The first screen: open a photo (straight into a tool, if one is picked), the beauty camera or a video.
struct HomeView: View {
    var busy: String?
    var openPhoto: (Tool?) -> Void
    var openVideo: () -> Void
    var openCamera: () -> Void
    var showWelcome: () -> Void
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @State private var showAbout = false
    @State private var welcomeAfterAbout = false

    private var singleColumn: Bool { dynamicTypeSize >= .xxLarge }
    private var secondaryForeground: Color { busy == nil ? .secondary : Color(.tertiaryLabel) }
    private var toolColumns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: Space.s, alignment: .leading),
              count: singleColumn ? 1 : 2)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                header
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        entryActions
                        toolShortcuts
                        privacyNote
                    }
                    .padding(.horizontal, Space.l)
                    .padding(.top, Space.xs)
                    .padding(.bottom, Space.xl)
                }
            }
            .background(Color(.systemBackground))
            .toolbar(.hidden, for: .navigationBar)
            .disabled(busy != nil)
        }
        .overlay {
            DelayedPresence(value: busy) { BusyBadge(text: $0) }
        }
        // The welcome opens once About has finished closing (one sheet can't open while another closes).
        .sheet(isPresented: $showAbout, onDismiss: {
            if welcomeAfterAbout { welcomeAfterAbout = false; showWelcome() }
        }) {
            AboutView(showWelcome: { welcomeAfterAbout = true; showAbout = false })
        }
    }

    private var header: some View {
        HStack(spacing: Space.m) {
            Text("Yumiro")
                .font(.title.weight(.bold))
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityAddTraits(.isHeader)
            Spacer(minLength: 0)
            Button { showAbout = true } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 20))
                    .foregroundStyle(secondaryForeground)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(HomeActionStyle())
            .accessibilityLabel("About Yumiro")
        }
        .frame(minHeight: 52)
        .padding(.horizontal, Space.l)
        .padding(.top, Space.xs)
        .padding(.bottom, Space.s)
    }

    private var entryActions: some View {
        VStack(spacing: Space.m) {
            Button { openPhoto(nil) } label: {
                HStack(spacing: Space.m) {
                    Image(systemName: "photo")
                        .font(.system(size: 24))
                    Text("Edit a Photo")
                        .font(.title3.weight(.bold))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, Space.l)
                .padding(.vertical, Space.m)
                .frame(maxWidth: .infinity, minHeight: 68)
            }
            .buttonStyle(HomeActionStyle(primary: true))
            .accessibilityLabel("Edit a Photo")
            .accessibilityHint("Choose a photo to edit")

            let layout = singleColumn
                ? AnyLayout(VStackLayout(spacing: Space.m))
                : AnyLayout(HStackLayout(spacing: Space.m))
            layout {
                secondaryAction("Camera", icon: "camera", action: openCamera)
                secondaryAction("Edit a Video", icon: "play.rectangle", action: openVideo)
            }
        }
    }

    private func secondaryAction(_ title: String, icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: Space.s) {
                Image(systemName: icon).font(.system(size: 20))
                Text(title)
                    .font(.subheadline.weight(.medium))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, Space.s)
            .padding(.vertical, Space.m)
            .frame(maxWidth: .infinity, minHeight: 56)
        }
        .buttonStyle(HomeActionStyle())
        .accessibilityLabel(title)
    }

    private var toolShortcuts: some View {
        VStack(alignment: .leading, spacing: Space.m) {
            VStack(alignment: .leading, spacing: Space.xs) {
                Text("Start with a tool")
                    .font(.body.weight(.semibold))
                    .accessibilityAddTraits(.isHeader)
                Text("Choose a tool, then a photo.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            // Keep the editor's three existing groups and order; each tile opens the same picker route.
            ForEach(Tool.groups.indices, id: \.self) { group in
                LazyVGrid(columns: toolColumns, alignment: .leading, spacing: Space.s) {
                    ForEach(Tool.groups[group]) { tool in
                        toolShortcut(tool)
                    }
                }
            }
        }
    }

    private func toolShortcut(_ tool: Tool) -> some View {
        Button { openPhoto(tool) } label: {
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: Space.s) {
                    Image(systemName: tool.icon)
                        .font(.system(size: 20))
                        .foregroundStyle(secondaryForeground)
                        .frame(width: 20, height: 20)
                    Text(tool.rawValue)
                        .font(.subheadline.weight(.medium))
                        .fixedSize(horizontal: false, vertical: true)
                }
                Text(tool.blurb)
                    .font(.footnote)
                    .foregroundStyle(secondaryForeground)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(Space.m)
            .frame(maxWidth: .infinity, minHeight: 72, alignment: .leading)
        }
        .buttonStyle(HomeActionStyle())
        .accessibilityLabel("\(tool.rawValue), \(tool.blurb)")
        .accessibilityHint("Choose a photo to open in \(tool.rawValue)")
    }

    private var privacyNote: some View {
        HStack(alignment: .firstTextBaseline, spacing: Space.s) {
            Image(systemName: "lock").accessibilityHidden(true)
            Text("Everything happens on this iPhone. Your photos are never uploaded.")
                .fixedSize(horizontal: false, vertical: true)
        }
        .font(.footnote)
        .foregroundStyle(.secondary)
    }

    /// Home-only counterpart to the approved editor buttons, with native appearance and disabled colors.
    private struct HomeActionStyle: ButtonStyle {
        @Environment(\.isEnabled) private var isEnabled
        var primary = false

        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundStyle(isEnabled ? (primary ? Color.white : Color.primary) : Color(.tertiaryLabel))
                .background {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(primary ? Color.accentColor.opacity(isEnabled ? 1 : 0.35)
                              : Color(.secondarySystemBackground))
                }
                .contentShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

// MARK: Welcome

/// Shown once, the first time Yumiro opens.
struct WelcomeView: View {
    var done: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("A photo studio that lives on your iPhone.")
                }
                Section {
                    Label("Every edit happens on this iPhone. Nothing is uploaded.", systemImage: "lock")
                    Label("Enhance, smooth skin, reshape features and remove what doesn't belong.", systemImage: "wand.and.stars")
                    Label("Free and open source. No subscription, no watermark, no account.", systemImage: "heart")
                }
            }
            .navigationTitle("Welcome to Yumiro")
            .safeAreaInset(edge: .bottom) {
                Button(action: done) {
                    Text("Get started").frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
            }
        }
    }
}

// MARK: About

/// About Yumiro: privacy, the source code, the open models it runs on, and the welcome again.
struct AboutView: View {
    var showWelcome: () -> Void
    @Environment(\.dismiss) private var dismiss

    private var version: String {
        let v = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let b = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(v) (\(b))"
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    LabeledContent("Version", value: version)
                }
                Section("Privacy") {
                    Text("Yumiro has no servers and no network code. Photos and videos are only read when you pick them, and saved copies go straight to Photos.")
                }
                Section("Open source") {
                    Link("Source code on GitHub", destination: URL(string: "https://github.com/zuxu4n/Yumiro")!)
                }
                Section("Built with open models") {
                    LabeledContent("Real-ESRGAN", value: "Enhance · BSD-3-Clause")
                    LabeledContent("LaMa", value: "Heal · Apache-2.0")
                    LabeledContent("MediaPipe Face Mesh", value: "Face · Apache-2.0")
                }
                Section {
                    Button("Show the welcome again", action: showWelcome)
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
