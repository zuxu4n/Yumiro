# Yumiro B: launch animation

The research, analysis and concepts behind the launch animation in `LaunchIntro.swift`, and the reasoning for the one that was built. Written 2026-10-24 against `ui-b` at `95b5ffc`.

The brief called the app Miyori; ui-b's home screen and display name say **Yumiro**, so the animation uses Yumiro. It lands on ui-b's "Tool cards" home screen (see DESIGNB.md).

## How the research was done, and what the evidence can and can't show

Everything below comes from the Mobbin connector (`search_screens` and `search_flows`, iOS). **Mobbin serves still screenshots, not recordings.** No animation in this report was watched in motion. Each finding is labelled with one of these:

- **Sequence:** two or more consecutive captures of the same launch, so the change between frames is seen and only the in-between motion is inferred.
- **Single frame:** one capture, often caught mid-animation (a shape half-way somewhere, a blur, a crop). The motion is inferred from that state and is marked as inferred.
- **Static:** nothing suggests motion. These are kept only as the "conventional splash" baseline the brief wants to avoid.

Links are Mobbin screen or flow pages. Image URLs from the connector expire in 30 days, so none are embedded.

## Phase 1: 15 applications

| # | App | Mobbin reference | What moves or transforms | Entrance | Exit | Motion character | What makes it memorable | Relevance to Yumiro | Evidence |
|---|---|---|---|---|---|---|---|---|---|
| 1 | **Luma** (the brief's reference) | [Onboarding flow](https://mobbin.com/flows/9f730ef5-83c9-4478-9440-df07b3b0c66f), first frame; star-pattern header on [profile](https://mobbin.com/screens/dbc57f37-ea1c-4a10-9b97-eb4b68beed26) | A crisp white four-point star sits on a soft magenta/violet/coral bloom. The bloom is lopsided (coral top-left, violet bottom-left), so it reads as light caught moving. | Inferred: the bloom gathers behind the star. | Not captured. The next capture is the home screen, where the star is the small mark beside "Home". The star returns as a tiled pattern behind the profile header. | Inferred: slow, organic bloom against a perfectly still mark. Two speeds at once. | Sharp mark + soft light. The mark is small and the light carries the feeling. | High. A sharp shape over soft light reads as "a lens and its light". The mark reused as a pattern later shows how a launch mark can live on in the UI. | Single frame |
| 2 | **Pinterest** | [Splash flow](https://mobbin.com/flows/90bba5c8-df1c-4d15-9edb-78911c7df563): [shapes](https://mobbin.com/screens/fb4addfd-d6e3-4a74-840c-1297d0b112a6) → [logo alone](https://mobbin.com/screens/cca5c63f-2902-4585-97c5-e6868207a754); also [Tuning your feed](https://mobbin.com/screens/2ded248b-fdd1-4ede-80c6-0d6a45b9f033) | Five pastel shapes (star, flower, sparkle, pushpin, burst) hover above the logo in one frame and are gone in the next. | Logo already centred. | The shapes leave before the feed (the in-between is inferred: burst out or dissolve). | Scattered, playful, each shape at its own height and tilt, so they move independently. | The brand's shape vocabulary (the same shapes as its photo-cutout tool) appears for a beat, then clears. | Medium-high. Pieces that leave the mark are a good idea; random scatter is not, for a precise editor. | Sequence (2 frames) |
| 3 | **Tubi** | [Onboarding flow](https://mobbin.com/flows/1dac5696-38d4-4761-8668-4ffc6733676c); [ball over a flat ellipse](https://mobbin.com/screens/6c0094c9-ec3e-4649-8da7-c67abf70ebc5); [wordmark on purple](https://mobbin.com/screens/59296a97-6723-41de-9c83-6296e47ca58b) | On yellow, a purple disc is squashed into a tall ellipse with a small ball beside it; in another frame the disc lies flat like a hole with the ball above it; the last frame is a yellow wordmark on a purple field. | A disc turns edge-on (squash); a ball enters. | Inferred: the ball drops into the "hole" and purple floods the screen, flipping the colours. | Squash-and-stretch, a physical cause and effect, a full colour inversion. | Elements interact: one object causes the next event. It's a tiny story, not an effect. | High for choreography (cause → effect, anticipation), low for tone (cartoon physics). | Sequence (3 frames) |
| 4 | **Arc Search** | [Onboarding flow](https://mobbin.com/flows/b301625d-6a9f-4edc-9658-384217f1f8e7); [logo centred with glow](https://mobbin.com/screens/9fc3f86c-60c6-454a-8b06-5c31f75568c6); [logo docked at top](https://mobbin.com/screens/9ebac6d9-f609-401f-9057-d99b154fc066) | The sticker-outlined logo is partly off-screen at the lower left in one frame and centred in the next, while a pink glow rises from the bottom. On the first onboarding page it sits small at the top. | The logo arrives along an arc from the lower left. | Inferred: it shrinks and travels to its docked place at the top of the page, so the page builds around it. | Arcing path rather than a straight line; the glow trails the mark. | The mark doesn't disappear; it **becomes part of the next screen**. | Very high. The splash element ends as a piece of the real interface. | Sequence (3 frames) |
| 5 | **Halide Mark III** | [Onboarding flow](https://mobbin.com/flows/b37e3f2d-d9ae-4fcc-94ae-cd885c9d9621): [launch card](https://mobbin.com/screens/e27e77fc-6828-42eb-8ac2-ef4e1b5e1976), then the feature-tile grid | A black card inset from the screen edges, with an oversized orange-to-pink concentric aperture mark cropped by the right edge, and "HALIDE MARK III / PHOTO APPLICATION" set like a camera box. | Inferred: the inset card is mid-scale (pushing in or out). | Next capture: the app icon centred in a grid of feature tiles. | Photographic: crop, scale, concentric rings like lens elements. | The mark is **cropped and huge**, a graphic, not a centred logo. It feels like packaging for a camera. | High. The photographic language (rings, crop) and the confidence of an oversized, cropped mark. | Single frame + next screen |
| 6 | **(Not Boring) Vibes** | [Onboarding flow](https://mobbin.com/flows/d9dda92e-8374-4c21-b0f0-da8762bcb69e) | A hand-drawn "-O^O-" face glyph is dim grey in one frame and bright white in the next (with Skip), then a glossy 3D gradient tube fills the next screen. | The glyph powers up from grey to white. | Not captured between the glyph and the tube; a morph can't be confirmed. | A slow brightness ramp, like a screen warming up. | Character: the glyph has a face, so it reads as waking up. | Low-medium. A "power up" beat is a useful anticipation idea. | Sequence (2 frames) |
| 7 | **(Not Boring) Camera** | [App icon on grey](https://mobbin.com/screens/87bd689e-a089-4524-840b-474b520fccfe); [Pick up your camera](https://mobbin.com/screens/9eebc429-1e56-4a2d-8781-12f4b9867d10) | The full app icon sits at the top left at roughly springboard-icon size on a flat grey field. | Inferred: the launch continues from the icon's home-screen position. | Next: a 3D camera on a workbench with "Pick Up". | Object continuity from the home screen into the app. | The app treats its icon as a physical object you pick up. | Medium. Continuity from icon to app is strong, but Yumiro B has no app icon right now. | Single frame |
| 8 | **Google Health (Fitbit)** | [Logo over a blurred dashboard](https://mobbin.com/screens/98c0bca6-5d5e-449c-8667-a46daa5f497c) | A sharp heart logo sits over a heavily blurred copy of the real dashboard (a coral blob top-left, blue shapes). | The interface is already there, out of focus. | Inferred: the logo leaves and the dashboard comes into focus. | Rack focus: one depth-of-field pull. | The interface is **present from the first frame**, so there's no hand-off. | Very high for a photo app: focus is the most photographic transition there is. | Single frame |
| 9 | **Google Photos** | [Pinwheel splash](https://mobbin.com/screens/9388a01c-6071-410c-84a4-1b6e782e2b2b) | Four separate petal shapes form a pinwheel; the wordmark sits at the bottom. | None visible. | None visible. | Static in this capture; the petals being separate pieces hints at assembly, but it isn't shown. | A mark made of four pieces. | Medium: a four-part mark that could come apart. | Static |
| 10 | **Stardust** | [Wordmark with chromatic glow](https://mobbin.com/screens/d64e05f6-5817-41a8-bd29-0143eb485ee0) | A serif wordmark with an RGB-split glow (red, green, violet fringes) on deep indigo. | Inferred: the glow or fringes pulse. | Not captured. | Optical: light split like a prism. | Lens-like colour fringing as identity. | Low-medium: chromatic aberration is photographic, but easily gimmicky. | Single frame |
| 11 | **Fresha** | [Wordmark over gradient bloom](https://mobbin.com/screens/ef7b307a-b52f-4315-80f4-44f895fbe1b0) | A white wordmark over a large, soft violet-to-blue oval that bleeds off both edges onto white. | Inferred: the bloom expands from the centre. | Not captured. | Soft, slow, atmospheric. | Colour as the brand moment. | Medium: close to Luma's bloom; on its own it's a background, not a choreography. | Single frame |
| 12 | **Riveo** | [Glitched wordmark](https://mobbin.com/screens/db7368ad-a925-40bd-a6aa-26933a8f343c) | The wordmark is sliced and offset; light streaks and RGB splits run over a video still. | Caught mid-glitch. | Not captured. | Fast, jittery, digital. | Unmistakably "video effects". | Low: the opposite of Yumiro's calm, precise tone. | Single frame |
| 13 | **Unfold** | [Line mark splash](https://mobbin.com/screens/25a88d2c-4cf7-44cf-be56-9166a33da1b7); [Studio home](https://mobbin.com/screens/6a30e520-7ab5-4d5f-92ee-447bf500ab9a) | A thin-line looped mark centred, "FROM SQUARESPACE" at the bottom; on the home screen the same mark is the tab icon and sits in the top bar. | Not captured. | Not captured; the mark reappears in the UI. | Static in the capture. | A drawn line mark that the UI keeps using. | Medium: the mark living on inside the UI. | Static |
| 14 | **Airbnb** | ["Switching to hosting": house](https://mobbin.com/screens/7b540b04-1c64-4f54-8d1d-d31078b72fdc) → [island](https://mobbin.com/screens/39eb8b0c-1eb3-4d59-82b7-1e757b38a644) | A 3D diorama above a fixed caption changes from a house to a beach island. | Inferred: the diorama spins or morphs. | Inferred: it gives way to the hosting interface. | One object transforms while the text stays still: a fixed anchor and a moving subject. | A branded transition between two modes, not just a launch. | Medium: a fixed anchor while one thing transforms. | Sequence (2 frames) |
| 15 | **corner** | ["finding the best spots" loader](https://mobbin.com/screens/a56ffdd9-91e8-4cc9-aca1-e9c90fbebc6d) | Two pairs of rounded photo cards, each pair overlapping on a diagonal, above and below a centred line of text. | Inferred: the cards slide in pairs and stack. | Not captured. | Paired, diagonal, staggered. | Photos as the loading graphic. | Medium: rounded photo tiles that move as groups. | Single frame |

Static baselines seen in the same searches (logo appears, holds, goes): [Instagram](https://mobbin.com/screens/0c1525e9-31e3-4e12-9610-5141ba1124bf), [Spotify](https://mobbin.com/screens/259aa2ac-78f1-49be-a3fc-91851f61dbbd), [Granola](https://mobbin.com/screens/b63248d6-da8c-440d-8cd2-ccfec2b18da7), [CapCut](https://mobbin.com/screens/055b327b-4bd7-42a9-9754-df6880684abb), [GoPro Quik](https://mobbin.com/screens/f2d58bfa-2e75-4c36-b283-47cb137fb9d2). Nothing in their captures suggests motion, so they aren't counted among the 15.

What Mobbin couldn't give: easing curves and timings. None can be measured from stills, so every timing below is a design decision, not a copy.

## Phase 2: the five strongest

1. **Arc Search: the mark becomes part of the interface.** The logo arrives on an arc and ends docked at the top of the first page. *Anticipation:* the glow rises before the mark settles. *Interaction:* the page lays itself out around the mark. *Ending:* there's no exit; the mark just has a new job. That's the single most important lesson: **the best exit is not an exit.**
2. **Tubi: cause and effect.** A disc turns edge-on (squash = anticipation), a ball meets it, the colour floods. Each element triggers the next, so it reads as one event rather than three effects. That's what makes motion feel choreographed rather than like a pile of CSS transitions.
3. **Google Health: the interface is there from frame one.** The dashboard waits behind the logo, out of focus, so the end is a focus pull, not a cut. Identity comes from the logo; continuity comes from the UI never leaving.
4. **Pinterest: pieces leave the mark.** The brand's own shapes appear around the logo for a beat, then clear. It shows a mark as a set of parts. Its weakness for Yumiro is that the parts scatter at random and go nowhere.
5. **Halide Mark III: photographic restraint.** A cropped, oversized, concentric mark and camera-box type. The identity comes from the medium (lens, aperture, crop), not decoration, which is why it feels premium and not gimmicky.

Luma, the brief's reference, isn't in the five because Mobbin has only one frame of it. Its lesson (a crisp mark against moving, soft light, with two speeds at once) is folded into concepts 2 and 4.

**Principles that carry over to Yumiro**

- **One cause, then its effects** (Tubi): one compression beat, the "shutter", should cause everything after it, rather than five things animating on their own timers.
- **No exit, only a hand-off** (Arc, Google Health): whatever is on screen at the end of the animation must be the real interface, in its real place, at its real size and colour.
- **Build the mark from the medium** (Halide): a photo app's identity should come from frames, exposure, focus and the shutter, not sparkles.
- **Pieces with somewhere to go** (Pinterest, corrected): if a mark breaks apart, every piece needs a destination.
- **Restraint:** one accent colour, a short, quiet run, one haptic. Premium motion is mostly about what it leaves out.

## Phase 3: five concepts

### 1. Contact Sheet (built)

- **Idea:** Yumiro's mark is four rounded frames in a 2×2 grid, like four bracketed exposures on a contact sheet: the same frame at four exposures (full accent, then lighter). The shutter fires, and the four frames fly out to become the home screen's own tiles.
- **Visual:** four squares at radius 9 on a blank background, in the accent colour at 100%, 72%, 48% and 28%. The home screen's tiles all use radius 14, so the mark is literally made of the interface's unit.
- **Sequence** (cold launch; the system launch screen is the same blank background, so frame 0 matches it):
  - **0.00–0.60 s Assemble.** The four frames come in from just outside their corners. They're rotated −24°, scaled to 0.4 and transparent; each lands on a spring 50 ms after the last (top left, top right, bottom left, bottom right) to form the grid with 6 pt gaps.
  - **0.62–0.74 s Shutter (anticipation).** The grid closes: gaps go to 0 and it scales to 0.88, an ease-in over 0.12 s, like a shutter closing. A soft haptic fires at 0.74 s.
  - **0.74–1.55 s Release and fly.** The frames spring to their places on the home screen. Each quadrant goes to the part of the screen it already points at: top left → "Edit a photo" (stays accent, stretches to full width); top right → About (up into the header); bottom left → Camera; bottom right → Video. The three that land on grey tiles blend from their accent tint to the grey as they fly; the corners ease from 9 to 14. Each starts 45 ms after the last. At the release, a faint accent ring expands from the centre and fades (the flash). "Yumiro" wipes in from the left. "Start with a tool", the group names and the tool cards rise 18 pt into place one after another, 30 ms apart.
  - **1.55 s Hand-off.** The flying frames now sit exactly over the real tiles (same frame, fill and radius). In one transaction they're removed and the real tiles appear, so nothing visibly changes.
  - **1.55–1.80 s Labels.** The tiles' icons and names rise 6 pt and fade in. Total: about 1.8 s.
- **Choreography:** four tiles assemble, compress, fly and become buttons; a ring appears and fades; the title wipes; the cards rise in order. Nothing fades out: everything on screen at the end is the real interface.
- **Transition:** an exact hand-off. The last frame of the animation is the home screen.
- **Photography link:** bracketed exposures, a contact sheet, the shutter, the flash; the frames are the tiles you tap to start shooting or editing.
- **Complexity:** medium. Anchor preferences for the target frames, one overlay, staged springs, no assets.
- **Inspired by:** Arc Search (the mark becomes the UI), Tubi (one compression that causes the rest), Pinterest (the mark as parts, given destinations), Halide (identity from the medium).

### 2. Rack Focus

- **Idea:** the home screen is there from the first frame, deeply out of focus. A thin accent focus ring turns, and the screen pulls into focus with it.
- **Sequence:** 0–0.3 s the blurred home and a small ring appear; 0.3–1.1 s the ring turns 120° (like a focus ring) while the blur radius falls from 30 to 0 on an ease-in-out; 1.1–1.5 s the ring expands past the screen edges as a mask and is gone.
- **Choreography:** the ring's turn drives the blur, so one element causes the other.
- **Transition:** perfect continuity, since the UI never leaves.
- **Photography link:** focus pulling.
- **Complexity:** low-medium, but a full-screen live blur on every frame costs more GPU than the other concepts.
- **Inspired by:** Google Health (blurred UI under the mark), Luma (crisp mark, soft light).

### 3. Aperture

- **Idea:** six accent blades form a closed iris and rotate open; the opening is a mask through which the home screen appears; the blades sweep off the screen.
- **Sequence:** 0–0.4 s the blades fan in and lock closed; 0.4–1.2 s the iris opens on an ease-out and the hole grows to fill the screen; 1.2–1.5 s the last blade tips leave off the corners.
- **Transition:** a mask reveal.
- **Photography link:** a lens aperture.
- **Complexity:** medium-high (blade geometry, an even-odd mask).
- **Inspired by:** Halide (concentric lens rings), Google Photos (a mark of separate petals).
- **Risk:** the most literal and most common "camera app" idea.

### 4. Drop and Develop

- **Idea:** an accent drop falls, squashes on landing, and its ripple becomes a ring inside which the home screen "develops" like a print in a tray, from flat grey to full contrast.
- **Sequence:** 0–0.45 s fall and squash; 0.45–1.2 s the ring expands with the screen developing inside it; 1.2–1.6 s the contrast settles.
- **Transition:** a mask plus a colour ramp.
- **Photography link:** darkroom developing.
- **Complexity:** medium (a saturation and contrast ramp on the live UI).
- **Inspired by:** Tubi (cause and effect, squash), Fresha and Luma (soft colour fields).
- **Risk:** a drop reads as "water" before it reads as "photo".

### 5. Crop to Canvas

- **Idea:** four crop-corner brackets slide in from the screen corners, snap around a small square, then open out until they sit on the screen's own corners. The interface scales from 0.96 to 1 inside them as they go.
- **Sequence:** 0–0.5 s the brackets arrive and snap (an overshoot); 0.5–0.7 s hold, with a small squeeze; 0.7–1.4 s they open out to the corners while the home settles; 1.4–1.6 s the brackets fade into the corner radius.
- **Transition:** the frame becomes the screen.
- **Photography link:** the crop tool.
- **Complexity:** low.
- **Inspired by:** Halide (the inset card), (Not Boring) Camera (continuity from an object).
- **Risk:** it ends with brackets that have no counterpart in the interface.

## Phase 4: choosing

Scores out of 5:

| | Contact Sheet | Rack Focus | Aperture | Drop and Develop | Crop to Canvas |
|---|---|---|---|---|---|
| Originality | 5 | 3 | 2 | 4 | 3 |
| Polish potential | 5 | 4 | 4 | 3 | 4 |
| Brand relevance | 5 | 4 | 4 | 3 | 4 |
| Memorability | 4 | 3 | 3 | 4 | 3 |
| Hand-off to the app | 5 | 5 | 3 | 3 | 3 |
| Performance | 5 | 3 | 4 | 3 | 5 |
| Practicality | 4 | 4 | 3 | 3 | 5 |
| **Total** | **33** | **26** | **23** | **23** | **27** |

**Contact Sheet wins** because ui-b's home screen is made of radius-14 tiles in one accent colour and one grey. A mark built from that tile isn't a logo in front of the interface; it's the interface folded up. Its last frame is the home screen itself, which none of the others manage as fully. It's also the cheapest to draw (four shapes, one ring, transforms only), it needs no assets (ui-b has no app icon or logo), and it follows light and dark mode, Increase Contrast and the system accent for free.

## The build (`PhotoStudio/LaunchIntro.swift`)

- **Stages:** `LaunchStage` is `blank`, `mark`, `shutter`, `fly`, then `done`. The `launchIntro` modifier on `HomeView` steps through them on a timer. Every element animates on its own `.animation(_:value: stage)`, so its curve and delay are chosen for the stage it's entering.
- **Targets:** `.launchTarget(.edit / .camera / .video / .about)` puts each real tile's bounds in an anchor preference. The overlay reads them and flies its frames there. The real tile (fill and label) stays hidden until `done`, then appears in the same transaction that removes the frame over it.
- **The rest of the screen:** `.launchRise(order)` (header title, tool section, group names, cards, privacy line) and `.launchLabel()` (the labels inside the four tiles).
- **Interaction:** the home screen doesn't take touches until the hand-off. A tap anywhere skips straight to it.
- **Reduce Motion:** no mark, no travel. The home screen fades in over 0.25 s.
- **VoiceOver:** the animation is skipped, so focus lands on a finished screen.
- **The welcome sheet** (first launch only) now opens after the animation instead of covering it.
- **The warm-up waits for it.** `model.warmUp()` keeps every core busy for about 4 s, so it now starts when the animation ends (about 1.8 s later than before), instead of competing with it for frames.
- **Replaying in development:** Debug builds replay it with a long press on "Yumiro". The launch argument `NoLaunchIntro` turns it off (for benches and UI tests). The `#Preview` has a Replay button.
- **Checking a stage (Debug):** `LaunchIntroHold mark`, `shutter` or `fly` stops at the end of that stage. A screenshot of `fly` differs from the finished home screen only in the tiles' labels, which is what makes the hand-off invisible.
- **Cost:** at most four rounded rectangles, one ring and the home screen's own views, animated with transforms and opacity. No offscreen blur, no timeline redraws.

### Validation so far

- Builds (Debug, simulator, iOS 27.1 SDK) with no new warnings.
- In the iPhone 17 simulator, light and dark: the held `mark` and `shutter` stages look as designed, and the held `fly` stage matches the finished home screen pixel for pixel apart from the labels.
- **Not checked yet:** timing and smoothness. This Mac was too loaded to judge motion (load average 40–87, screenshots taking seconds), and the simulator's screen recording caught one frame. Watch it on the phone. Reduce Motion and VoiceOver weren't turned on in the simulator either.
