# Yumiro design A handoff

Updated 2026-10-27 (America/Toronto). This is the design A source of truth for approved colors, typography, spacing, component states, references, and implementation boundaries. Home uses **Quick start** in **2dfc24e**, with Edit a Photo primary. The approved Nose Direction words design was pushed in **de9803a**. All eight Face categories and 34 subtabs reuse that design through shared controls in **c6b33b9**, with Position retaining its canvas oval. Warp uses **Stacked sliders** in **08f498b**, and Heal → Spot uses Face-style controls with Reset below the value in **d7c7184**. The user selected **Compact actions** for Heal → People, Brush and Erase, with a stable photo size across all four Heal tabs; its design spec was pushed in **ca7c7dd**, but the app UI is not implemented. Retouch remains a proposal. Browser/source checks are recorded below; native build and device validation remain unfinished. Read this document before continuing design A.

## Worktree, branch, and authorization

Home update, 2026-10-25: the user selected Quick start and authorized implementation. The HomeView changes were pushed in `2dfc24e`; see [Home handoff](design/home-screen-proposals.md). Existing photo/tool entry points, Camera, Edit a Video and About remain available. WelcomeView, AboutView, editor, camera and video implementations were preserved.

Heal → Spot update, 2026-10-26: the user approved Face-style slider controls with Reset below the value and requested commit/push. This presentation is now implemented in `ContentView.swift`; see [Heal Spot handoff](design/heal-spot-proposals.md). Other Heal modes, canvas overlays, healing, gestures and undo/redo retain their existing code. Native validation remains pending.

Heal selection update, 2026-10-26: the user requested design-only work for People, Brush and Erase, chose Compact actions, then requested that switching tabs keep the picture size fixed. The selected mockup now includes all four Heal tabs within a common panel allocation. The subsequent commit/push request published only [the design spec](design/heal-people-proposals.md) in `ca7c7dd`; it did not implement the panels or publish the private photo mockups. Preserve that distinction when continuing this work.

- Work only in `C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a`, on branch `ui-a`. Use absolute paths for file operations.
- Remote: `https://github.com/zuxu4n/Yumiro.git`.
- The user authorized committing to `ui-a` and pushing with `git push origin ui-a`. This supersedes the earlier instruction not to push until told.
- Never merge into main or push to `main` or `ui-b`. Do not edit `C:/Users/Jason/OneDrive/Desktop/Code/js/photoStudioClaude` (main) or `C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-b` (the other design session).
- New UI areas follow the established workflow: research with Mobbin, show two editor-context mockups, wait for the user's selection, then implement the approved area only. Do not treat switching a preview carousel as implementation approval.
- For the Face-wide consistency update, the user explicitly authorized direct implementation using the completed Nose panel, with no new design directions or Mobbin research. This supersedes the proposal/research step for that update only.
- Early exploration, before the worktree instructions, changed the separate original `C:/Users/Jason/OneDrive/Desktop/Code/js/photoStudio/Yumiro` checkout. It may retain an uncommitted duplicate Focus rail edit; its status was not rechecked for this handoff. It is not the design A worktree. No edits were made to `photoStudioClaude`.

This Windows PC has no Xcode, model packages, or `Local.xcconfig`. The user builds on a Mac, from their checkout containing those local assets:

```sh
tools/install_variant.sh a
```

The script fetches/pulls `ui-a` and installs a separate app named **Yumiro A**, bundle ID `com.zuxu4n.photostudio.a`. Do not change signing, model assets, bundle IDs, or the install script for visual work.

## Implementation status

Background → Remove update, 2026-10-27: the user selected **Labeled swatches** after reviewing both editor-context proposals. The Remove-only presentation is implemented in `ContentView.swift`, with Off/Clear/White/Black swatches, selected rings/checks, separate detection status and transparent-PNG guidance. Source checks passed; native validation remains pending. Blur and mask-correction controls retain their existing code. See [Remove Background handoff](design/remove-background-proposals.md).

Implemented components and selected designs are listed separately by status below. The latest implemented Heal update is Spot with Face-style controls and Reset below the value. The selected People/Brush/Erase Compact actions design and stable canvas remain mockup-only, as requested. No Retouch redesign is implemented. Every implemented component still needs native validation on the Mac/device.

The 2026-10-27 source review confirmed that `ContentView` still routes Spot to `healSpotPanel`, Warp to `warpPanel`, and People/Brush/Erase to their original controls. The editor still uses a 184 pt minimum tool panel; the proposed common 250 pt Heal allocation is not in app code. Remove's additional content can grow that minimum naturally. `HomeView` retains Quick start and all existing entry callbacks.

| Area | Approved direction | UI commit | Status |
|---|---|---|---|
| Home screen | Quick start; Edit a Photo primary | `2dfc24e` | Implemented and pushed; native validation pending |
| Bottom photo-editor tool picker | Focus rail | `1799676` | Implemented and pushed |
| Photo-editor top bar | Balanced bar | `93155a5` | Implemented and pushed |
| Canvas Compare, Original badge, fit-to-screen | Soft controls | `63b357c` | Implemented and pushed |
| Smooth panel | Quiet row | `e8d5a3d` | Implemented and pushed |
| Photo Adjust → Crop controls | Shape rail | `48ff495` | Implemented and pushed |
| Photo Adjust → Rotate & Straighten | Action row | `c9b55d6` | Implemented and pushed |
| Photo Adjust → Brightness, Contrast, Saturation, Warmth | Focused slider hybrid | `5efeeba` | Implemented and pushed |
| Face → category and subcategory navigation | Stacked rails | `dd97cc7` | Implemented and pushed; native validation pending |
| Face → Eyes controls | Wide slider with endpoint words and 4 pt reset-row gap | `709b132` | Implemented and pushed; native validation pending |
| Face → Nose controls | Direction words with short endpoints | `de9803a` | Implemented and pushed; native validation pending |
| Face → every category/subtab | Shared Nose typography, controls, short guidance and states; Position retains oval | `c6b33b9` | Implemented and pushed; native validation pending |
| Warp panel | Stacked sliders | `08f498b` | Implemented and pushed; browser reference/source checks passed; native validation pending |
| Heal → Spot | Face-style slider; Reset below value | `d7c7184` | Implemented and pushed; source/browser reference checks passed; native validation pending |
| Heal → People, Brush, Erase | Compact actions; stable photo size across all Heal tabs | None; design spec `ca7c7dd` | Selected mockup only; spec pushed; no app UI changes |
| Background → Remove | Labeled swatches | This change | Implemented; source checks passed; native validation pending |
| Background → shared mask corrections | Compact rows; revised spacing and no footer text | None; design handoff in this change | Reviewed design only; app UI not implemented |
| Retouch panel | Compact rows preferred | None | Mockup only; latest spacing revision awaits acceptance |

The photo-editor picker, top bar, canvas controls, Smooth, Face, Warp and Spot presentation changes are in [ContentView.swift](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/PhotoStudio/ContentView.swift). Crop, Rotate, and light/color styling are in [Adjustments.swift](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/PhotoStudio/Adjustments.swift), with explicit photo-only opt-ins (`photoCropStyle`, `photoRotateStyle`, `photoColorStyle`) at the `AdjustPanel` call in `ContentView.swift`. Home was implemented separately in [HomeView.swift](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/PhotoStudio/HomeView.swift), preserving the WelcomeView and AboutView definitions. The shared video panel keeps its original presentation. These presentation changes preserve effect rendering, per-face storage, canvas gestures, camera and video-editor behavior. Retouch still uses the original three `sliderRow` calls in app code.

## Visual foundations

### Colors and materials

Use SwiftUI semantic colors and system materials in app code. The following hex values are the browser mockups' approximate light/dark palette, not a new hardcoded application theme.

| Role | Light mockup | Dark mockup | Application source of truth |
|---|---|---|---|
| Editor surface | `#FFFFFF` | `#000000` | System background |
| Secondary controls/canvas backing | `#F2F2F7` | `#1C1C1E` | `Color(.secondarySystemBackground)` |
| Primary text | `#171719` | `#F5F5F7` | `Color.primary` |
| Secondary text/helper copy | `#696971` | `#A1A1AA` | `Color.secondary` |
| Disabled foreground | `#B6B6BE` | `#55555D` | `Color(.tertiaryLabel)` / native disabled state |
| Separator | `#D9D9DE` | `#38383A` | `Divider` / system separator |
| Accent | `#007AFF` | `#0A84FF` | `Color.accentColor` |
| Soft selected backing | `#E9F3FF` | `#092B4C` | Accent at 12% opacity |
| Stronger blue text in previews | `#0064CC` | `#6BB5FF` | Mockup approximation; existing app uses accent color |
| Canvas overlay backing | `#F8F8FA` | `#242426` | `.regularMaterial` |

Save has a solid accent background and white text. Secondary controls use neutral surfaces. Selection combines blue with shape/underline; it should not depend on hue alone. Preview material fills are approximately 94% opaque with blur, but native material rendering is system-managed. No native color-contrast audit has been completed.

### Typography and icons

Use the system font and SF Symbols in the app. Browser mockups use system-font fallbacks and Lucide approximations; those icons are not assets to import into SwiftUI.

| Element | Implemented typography |
|---|---|
| Save | `.body.weight(.semibold)` (about 17 pt at default size) |
| Top-bar / canvas action icons | System 20 pt |
| Focus rail icons | `.title3`, within a 24 pt icon frame |
| Focus rail labels | `.caption2` (about 11 pt), regular; selected semibold |
| Smooth label and value | `.subheadline.weight(.medium)` (about 15 pt); value uses monospaced digits |
| Helper text | `.footnote` (about 13 pt), secondary foreground |
| Original badge | `.caption.weight(.semibold)` (about 12 pt) |
| Fit zoom value | `.footnote.weight(.medium)`, monospaced digits |
| Crop header | `.body.weight(.medium)` (about 17 pt) |
| Crop Cancel / Done | `.subheadline` (about 15 pt), regular / semibold |
| Crop ratios | `.caption2` (about 11 pt), regular; selected semibold |
| Rotate action icons / short captions | System 20 pt / `.caption2` (about 11 pt) |
| Straighten label / angle | `.subheadline.weight(.medium)` (about 15 pt); angle uses monospaced digits |
| Compact Straighten label / angle; Reset all | `.footnote` (about 13 pt); compact angle uses monospaced digits |
| Light/color header / active value / edited tile number | `.subheadline.weight(.medium)` (about 15 pt); numbers use monospaced digits |
| Light/color neutral tile icons / captions | System 20 pt / `.caption2` (about 11 pt), regular; selected caption semibold |
| Light/color slider endpoint labels | `.caption2.monospacedDigit()` (about 11 pt), secondary |
| Face category / subcategory labels | `.subheadline` (about 15 pt) / `.footnote` (about 13 pt); selected semibold |
| Eyes value / endpoint words / multi-face context | `.subheadline.weight(.medium).monospacedDigit()` / `.footnote` / `.caption2` |

The photo editor already caps Dynamic Type at `.xLarge`; that limit was preserved. Default browser text sizes do not establish native Dynamic Type behavior. Retouch's compact mockup labels/value badges are 13 px; check native legibility before treating that as final SwiftUI typography.

### Spacing and geometry

Existing `Space` constants: `xs = 4`, `s = 8`, `m = 12`, `l = 16`, `xl = 24`, `xxl = 32`.

- Top bar: 52 pt high; 12 pt horizontal insets; icon targets at least 44 x 44 pt.
- Save: at least 76 x 44 pt; 17 pt horizontal label padding; 14 pt continuous corner radius.
- Primary neutral control radius: 14 pt. Value badge radius: 10 pt.
- Bottom picker: 66 pt high. Each tool has a 58 pt visual backing inside a 66 pt target, minimum width 66 pt, 6 pt horizontal content padding.
- Picker item spacing: 2 pt. Horizontal outer padding: 8 pt. Group dividers: 24 pt high with 5 pt horizontal padding.
- Selected picker underline: 14 x 2 pt, 3 pt above the backing's bottom edge. Changed-tool dots: 6 x 6 pt on non-selected tools.
- Canvas controls: bottom-left/bottom-right, 12 pt inset. Original stays top-center with a 10 pt top inset.
- Tool panel: existing minimum 184 pt area, generally 16 pt horizontal and 12 pt vertical padding. Preserve canvas proportions when changing a panel.
- Native sliders keep system track/thumb rendering and a 44 pt interaction frame. The mockup's 4 px track and 26 px thumb are illustrative.
- Adjust panels use 6 pt vertical gaps. Crop and Rotate retain their original subtool row; the light/color hybrid uses a 46 pt strip. Crop ratio tiles use 4 pt gaps; light/color numeric tiles use 2 pt gaps.
- Light/color control budget: header 44 + gap 6 + slider/endpoints 58 + gap 6 + strip 46 = 160 pt, plus the existing 24 pt vertical padding = 184 pt. Endpoint labels occupy 14 pt below the slider. This is the intended default-size budget, not a native layout measurement.
- Rotate and light/color Reset all targets are 64 × 44 pt, or 46 × 44 pt in their compact variant. Header item spacing is 8 pt; Rotate's transform-action spacing is 4 pt.
- Face navigation: two 44 pt rows; each visible backing is 32 pt high with 14 pt corners, 12 pt horizontal label padding and 4 pt item gaps. Minimum category/option widths are 54/58 pt. Overflow fades are 16 pt wide and appear only at edges where content continues.
- Eyes controls: a 44 pt slider/value/reset row, then a 4 pt gap before the minimum 28 pt endpoint/Reset all footer. Value badge is 44 × 32 pt with 10 pt corners; selected Reset is 44 × 44 pt with 14 pt corners. Footer reserves 104 pt for the badge/reset columns and two 8 pt gaps so endpoint words align with the slider.
- Every Face category uses 8 pt top / 12 pt bottom padding, retaining 16 pt horizontal insets. Two 44 pt rails + 44 pt controls + 4 pt gap + 28 pt footer + 20 pt padding = the intended 184 pt minimum. Shared `FaceControlLayout` owns the row, value-badge and footer dimensions, now also reused by Warp and Spot. Warp uses the same insets; Spot retains Heal's 12 pt vertical padding. Native text or multi-face context may increase height.

### Shared adjustment controls

- `ValueSlider` in `Adjustments.swift` remains the common native slider. `adjustmentValueBadge`, `adjustmentResetControl` and `FaceControlLayout` in `ContentView.swift` supply the approved badge, reset style and dimensions for Face, Warp and Heal Spot. Continue reusing these parts when implementing an approved component.
- Preserve each panel's placement: Face and Warp put Reset beside the value; Spot puts it below the value. Position retains its special canvas oval and two-axis reset without a numeric badge.
- Sharing presentation does not share reset behavior. Face sliders reset to zero within the existing image undo boundary. Warp brush settings reset to 0.22/1 (display 33/100), and Spot brush size resets to 0.025 (display 28), without an image undo step. Warp's Reset Face remains a separate selected-face image operation. Keep each control's existing thresholds and availability checks rather than deriving them from rounded badge text or adding a blanket no-face lock.

### Selected, changed, and unavailable states

| State | Approved treatment |
|---|---|
| Selected main-rail tool, Crop ratio, or light/color tile | Soft 12% accent backing, accent foreground, semibold caption, short underline; selection remains visible at neutral. The original Crop/Rotate subtool row retains its existing accent-only selection |
| Changed tool | Existing 6 pt dots on the main rail and non-selected Crop/Rotate subtools; light/color tiles instead replace the icon with a signed number |
| Neutral light/color setting | SF Symbol in the tile; active value badge shows 0 on a neutral surface; selected Reset is unavailable |
| Edited light/color setting | Signed number occupies the same 44 × 24 pt icon slot; active badge is accented; selected Reset restores only this parameter and its icon |
| Selected Face category / option | Soft 12% accent backing, accent text, selected semibold label and 14 × 2 pt underline, including at neutral |
| Edited Face category / option | Separate 6 pt secondary dot, including when selected; original conditional insertion remains. No reserved dot slot or rail-stability change was approved |
| Neutral / edited Eyes control | Unitless signed value badge; neutral styling at zero, accent styling when edited. Midpoint stem and left/right endpoint words communicate direction; no duplicate title or normal-state helper sentence |
| Unavailable Eyes control | Retained value in tertiary styling; existing mesh/busy guards disable slider and selected Reset. Missing-mesh option navigation stays available; Size retains its fallback |
| Unavailable action / busy panel | Native disabled controls and tertiary action foreground; ratio/numeric tiles use 45% opacity and retain current values and selection |
| Pressed custom action / tile | 70% opacity where the approved button style supplies it |

Reset availability follows existing model checks, not the rounded text: light/color uses `abs(value) > 0.001`; Rotate uses its existing geometry check; Crop uses its current ratio check. Reset all remains unavailable when all Adjust settings are off and continues to reset the entire Adjust model, including crop and rotation. Do not silently change these scopes as part of styling.

Eyes preserves the original selected-Reset disabled check `abs(value) < 0.001` plus mesh/busy availability. Its edit indicator uses `abs(value) > 0.001`; keep the existing comparisons rather than deriving state from rounded text. Face Reset all retains its scope over all Face shape settings on the selected face, preserving that face's Retouch settings and other faces.

## Home: approved Quick start

The user selected **Quick start** after reviewing two Mobbin-informed home mockups. It is implemented and pushed in `2dfc24e`. Guided list remains an unselected alternative.

- **Edit a Photo** is the primary blue action, with a 68 pt minimum height and bold title3 text. Camera and Edit a Video sit immediately below as neutral actions with 56 pt minimum heights.
- All eight existing tool shortcuts retain their names, SF Symbols, descriptions and order from `Tool.groups`: Enhance/Adjust; Smooth/Retouch/Face/Warp; Heal/Background. The two-column tiles have 72 pt minimum heights and 12 pt padding. The fixed Yumiro header retains a 44 × 44 pt About action; content scrolls through the tools and privacy text.
- Semantic colors, system fonts, 14 pt corners, 16 pt content insets and 70% pressed opacity reuse the approved editor styling. Home Dynamic Type is uncapped. Secondary actions and tools switch to one column at xxLarge and above; labels wrap without fixed heights or forced shrinking.
- Edit a Photo calls `openPhoto(nil)`, preserving the current model-tool selection. Shortcuts call `openPhoto(tool)`; Camera and video keep their existing callbacks. About keeps its existing sheet, including deferring Show the welcome again until dismissal. No new features or destinations were added.
- Busy disables every home action, including About. Existing `DelayedPresence` and `BusyBadge` show **Opening…** after 300 ms, without a percentage or Cancel. Photo transfer and errors remain owned by ContentView/EditorModel.

Only HomeView presentation changed; WelcomeView and AboutView remained identical. Editor, camera, video, onboarding, model and shared-control implementations were preserved. Browser checks covered 320 × 568, 375 × 667 and 390 × 844 in light/dark at default and 140% text, with no horizontal text overflow or targets below 44 px. Native layout, Dynamic Type, VoiceOver, navigation and loading still need Mac/device validation.

Research and implementation details: [home-screen-proposals.md](design/home-screen-proposals.md). Local ignored preview: `design/mockups/yumiro-home-options-local.html`.

## Approved components and behavior

### Focus rail

One horizontally scrolling strip, in the existing order and groups:

1. Enhance, Adjust.
2. Smooth, Retouch, Face, Warp.
3. Heal, Background.

Selected tool: soft blue rounded backing, accent icon/text, semibold label, short underline. Other tools stay neutral; tools with edits retain their existing changed dots. Auto-centering on selection, selection haptics, accessibility labels/selected traits, and tool behavior are retained. Do not add tools or categories.

### Balanced top bar

Close left, Undo/Redo truly centered as a pair with 4 pt spacing, Save right. Save is the primary action. Separate neutral 44 pt rounded icon targets match the rail's geometry. Undo/Redo use the existing availability/busy guards; unavailable actions use tertiary foreground. Save's disabled backing uses accent at 35% opacity; pressed controls use 70% opacity. Existing discard confirmation and export behavior are retained. VoiceOver priorities order Close, Undo, Redo, Save.

### Soft canvas controls

- Compare: 44 x 44 pt, rounded rectangle radius 14; hold to compare, not a toggle. Active appearance adds accent foreground and a 12% tint.
- Original: non-interactive top-center badge; minimum height 28 pt; horizontal padding 12 pt, vertical padding 5 pt, radius 14.
- Fit: appears only for `zoom > 1.01`; inward arrows plus the current one-decimal zoom factor; minimum 44 pt height; horizontal padding 12 pt; icon/value spacing 7 pt. Tap resets zoom to 1 and pan to zero.
- Shared backing: regular material, subtle 1 pt border (primary at 8%, active accent at 28%), black shadow at 8% opacity, radius 2, y-offset 1.

Image aspect-fit sizing, clipping, pinch/pan calculations, photo hold behavior, and crop/busy control visibility are unchanged. Compare retains its original zero-duration press handling and 60 pt maximum distance. Native press and gesture behavior still requires device verification.

### Smooth Quiet row

Header has Smooth skin, a fixed blue numeric value badge, and Reset. A full-width native slider sits below, then helper text, with 8 pt vertical spacing. Header and slider have 44 pt interaction frames; value badge is at least 44 x 32 pt.

Behavior that must remain intact:

- Continuous internal range `0...1`, shown as rounded `0...100`.
- First entry into Smooth on a photo starts at `0.3` (display **30**) and records the existing automatic edit. Returning to the tool does not reapply it.
- Reset goes to **0**, not 30. It is disabled near zero (`abs(smooth) < 0.001`) or while busy.
- Each drag is bracketed by `model.sliderEditing(editing)`; Reset brackets its assignment with `sliderEditing(true/false)`. Each actual drag/reset remains one undo step.
- Native slider availability follows the existing busy lock. No new no-face restriction was added.
- Helper: “Edges, eyes and lips stay sharp”; no-face: “No face found in this photo”; busy: “Available when processing finishes”.

## Adjust → Crop: approved Shape rail

The user explicitly selected **Shape rail** after reviewing two editor-context proposals, Shape rail and Pinned modes, on 2026-10-24. Only the photo editor opts into the new styling (`photoCropStyle: true`); video retains its original panel.

- All ten options stay in their existing order: Original, Free, 1:1, 4:5, 3:4, 2:3, 9:16, 4:3, 3:2, 16:9.
- Each ratio has its existing 26 pt outline/icon above an 11 pt system caption, in a minimum 58 × 58 pt tile with a 14 pt continuous radius. Selection adds a 12% accent fill, accent foreground, semibold caption, and a 14 × 2 pt underline 3 pt above the bottom. Tiles have 4 pt spacing and retain horizontal scrolling and initial centering on the current ratio.
- Crop, Reset, Cancel, and Done share a 44 pt header. Reset is a neutral 44 × 44 pt icon control. Cancel and Done have at least 60 × 44 pt targets; Done uses the solid accent treatment. All colors are semantic for light/dark appearance, and controls respect the existing busy lock.
- The existing 58 pt ratio area, 6 pt panel gaps, Adjust subtool row, and outer panel padding remain. The default-size content fits the existing 184 pt minimum panel budget; native sizing at larger Dynamic Type still requires device verification.
- Selecting a ratio still clears `cropRect` through the existing `change` callback and remains one undo step. Original means no crop; Free remains unrestricted. Reset still restores Original and clears `cropRect`, and is unavailable when the crop is Original. Cancel restores the ratio and frame captured on entry; Done retains the crop. Both exit to the previous Adjust subtool and retain existing haptics.
- The crop frame, masks, handles, geometry, rendering callbacks, canvas gestures, and video controls were not changed.

The approved review includes light/dark, Original/reset unavailable, changed/reset available, existing crop/Cancel restore, and busy states. The browser mockup is illustrative; no native screenshot, Xcode build, or iOS runtime verification has been completed on this Windows host. JavaScript syntax validation passed; the browser could not reach the local preview server for visual QA in this chat.

## Adjust → Rotate & Straighten: approved Action row

The user explicitly selected **Action row** after reviewing Action row and Split controls. This styling is enabled only for the photo editor (`photoRotateStyle: true`); video and the other Adjust sections keep their existing controls.

- Four 44 × 44 pt controls show Turn left, Turn right, Flip across, and Flip upside down. Their short captions are Left, Right, Across, and Up/down. Turns are momentary actions; active flips have soft accent fill and a short underline, computed in the displayed orientation.
- Reset Rotate clears turns, both flips and straighten through the original `AdjustTool.rotate.reset` and undo callback. It does not clear crop or color settings. Reset all retains its existing scope over all Adjust settings. Existing availability and busy guards remain.
- A labeled native straighten slider and a 60 × 32 pt signed angle badge occupy the next row. The slider still uses the existing `ValueSlider` binding, continuous -1...1 range (±15°), zero catch, haptics, drag callbacks and degree formatter. `showsValue: false` hides only the duplicate inline output for this use; every existing caller retains the default output.
- Controls retain semantic colors, 14 pt action radii and a 10 pt value-badge radius. The angle is neutral at displayed zero and accented otherwise.
- `ViewThatFits` provides a compact version: the five transform/reset controls remain in the first row, Reset all moves beside the slider, and the angle moves beside the Straighten label. Both layouts retain 44 pt touch targets, the 44 + 6 + 58 pt control budget, existing subtool row and outer panel padding. Native Dynamic Type/layout verification remains necessary on a Mac.
- Quarter turns still clear `cropRect`. Flips retain their orientation-aware callbacks. Reset Rotate preserves `cropRect`. The crop frame, canvas, gestures, rendering callbacks, other panels and video behavior were not changed.

The user supplied a replacement preview photo. It is embedded only in local, ignored Rotate and light/color mockups and in this chat's local previews; do not add the photo or its embedded bytes to Git or publish them. Future previews should reuse that local image instead of the astronaut. The original public-image proposal remains available in the prior chat history. The supplied photo is not an app asset or an editor default.

References: [Apple Photos](https://mobbin.com/screens/3a719f66-2139-427b-99c5-2ebc19fc044c), [Instagram](https://mobbin.com/screens/720bfb83-b9d4-4577-a1b9-814ca1646d24), [GoPro Quik](https://mobbin.com/screens/c628e27c-ed54-440e-9e80-4a64333d73b8).

Mockup QA covered default and adjusted light/dark appearances, quarter turns, flip orientation, signed ±15° endpoints, Reset availability, narrow reflow, a 184 px panel and 44 px reset target. These are browser mockup checks, not native runtime tests. Xcode and XCTest are unavailable on this Windows host.

## Adjust → Light and color: approved Focused slider hybrid

The user reviewed two editor-context proposals, chose the focused slider with visible changed values, then approved the combined mockup and requested commit/push. Only the photo editor opts in (`photoColorStyle: true`), and only while Brightness, Contrast, Saturation, or Warmth is selected. Crop and Rotate retain their approved controls and subtool row; video retains its original presentation.

- The selected tool has a 44 pt header with a 15 pt medium label, a 44 × 32 pt signed value badge, a 44 × 44 pt Reset control, and the existing Reset all action. Neutral values use secondary styling; edited values use accent foreground and a 12% accent backing. Action corners remain 14 pt and value-badge corners 10 pt. A compact Reset all width is available through `ViewThatFits`.
- One full-width native `ValueSlider` sits below, with −100 / 0 / +100 endpoint labels. All four retain their continuous internal **−1...1** ranges, **0** neutral, rounded signed −100...+100 display, existing zero catch, haptics, bindings, rendering callbacks, and per-drag undo grouping. The shared slider implementation is unchanged; only its duplicate inline output is hidden here.
- In the adjustment strip, each neutral tool shows its SF Symbol. A changed tool replaces only that icon with its signed numeric value in the same 44 × 24 pt slot. There is no additional changed dot for these four tools. Resetting a tool to neutral restores its icon; other edited tools keep their values.
- Selection remains separate from edit state: a 12% accent tile, semibold caption, and 14 × 2 pt underline identify the selected tool even at zero. Edited peer numbers remain accented. Numeric tiles are at least 52 × 46 pt and scroll horizontally at narrow widths while preserving selected-tool visibility. Crop and Rotate keep their original icons, labels, and changed dots alongside this group.
- Reset uses the existing selected-tool reset and undo callback and is unavailable at neutral. Reset all keeps its original scope over **all Adjust settings**, including geometry. The existing busy lock disables the controls without discarding the displayed values. Semantic colors provide light/dark appearances; disabled numeric tiles dim while retaining their icons or values.
- The 44 + 6 + 58 + 6 + 46 pt content fits the existing 184 pt panel with the unchanged outer padding. Canvas, crop frame, gestures, image processing, other editor panels, and video are unchanged. Native layout and accessibility still need device verification.

The approved private preview is `design/mockups/yumiro-focused-slider-hybrid-local.html`; the earlier two-option comparison is `design/mockups/yumiro-adjust-colors-local.html`. Both embed the supplied photo and remain ignored by Git. The photo is neither an app asset nor part of the pushed implementation.

Mobbin references: [VSCO](https://mobbin.com/screens/adea8809-53d5-419b-9ceb-67d4f0def085) for light/color grouping, [Google Photos](https://mobbin.com/screens/9b042739-12d6-41ac-a180-2d438133cba1) for adjacent adjustments and changed indicators, and [Apple Photos](https://mobbin.com/screens/75d7aa74-5770-4c83-a4b5-8afd6555ae7f) for a focused adjustment strip.

Mockup QA covered all-neutral icons, mixed signed values, selection independent of edits, Reset restoring an icon while preserving peer edits, disabled values, light/dark appearances, narrow scrolling, and signed endpoints. Implementation validation compares the model, shared slider, original Crop/Rotate controls, canvas, video, and rendering/undo callbacks against the previous commit. These are browser and source checks; Xcode and iOS runtime checks are unavailable on this Windows host.

## Face navigation: approved Stacked rails

The user explicitly selected **Stacked rails** in a written message after reviewing both editor-context mockups. Category picker remains an unselected alternative. The `dd97cc7` implementation changed only category/subcategory navigation and its Face-specific layout grouping in `ContentView.swift`. The subsequent Eyes control implementation is described separately below.

- Two horizontal rails retain all eight categories and all 34 options in their original order. Each category still remembers its selected subcategory. Both rails reveal their selected item on appearance; categories center on selection, and subcategories center on selection or when their category is reopened.
- Categories use system subheadline and subcategories use footnote, regular or selected semibold. Each button has at least a 54 pt category / 58 pt subcategory width and a 44 pt target. Its visible backing is 32 pt high with 14 pt continuous corners; item spacing is 4 pt and horizontal label padding is 12 pt.
- Selection uses accent text, a 12% accent backing and a 14 x 2 pt underline, including at neutral. A separate 6 pt secondary-colored dot identifies applied edits, including on selected categories/options. The existing selected-face change detector is unchanged: ordinary features use `abs(value) > 0.001`, and Position uses `positionMoved`. Face/Head Size and Width continue to share model properties and changed states.
- The native scroll views retain horizontal overflow. Small leading/trailing fades appear only where content actually continues, using iOS 18 scroll geometry (the existing project deployment target is iOS 18). Fades ignore hit testing and accessibility. No canvas gesture was added or changed.
- The two 44 pt rails, 44 pt control slot and minimum 28 pt footer model the existing 160 pt content / 184 pt panel budget. The Face-only stack removes redundant inter-row gaps; the original slider/Position view and helper/Reset all contents are retained. The panel remains a minimum rather than a fixed height, so native text sizing may require more room. No native height measurement has been performed here.
- The original slider/value/reset styling, effect ranges, bindings, selected-face storage, render callbacks, reset scopes, undo grouping, selection haptics, mesh availability and editor processing lock are unchanged. The shared `Chip` and `ValueSlider` implementations were not modified. Canvas, face guides, other tool panels, camera and video are unchanged.
- VoiceOver receives the original label, selected trait, and an explicit “Edits applied” value when changed. Decorative dots/fades are hidden. Custom buttons use the approved 70% pressed opacity and 45% disabled opacity while retaining selection and edit indicators. Semantic colors support light/dark appearance, and the existing xLarge Dynamic Type cap remains.

Preserved inventory (8 categories, 34 options):

| Category | Options in existing order |
|---|---|
| Face | Size, Width, Smile, Position, Perspective, Smirk |
| Head | Size, Width, Height |
| Jaw | Jaw, Jawline, Chin, Size, Define, Length |
| Nose | Size, Width, Narrow, Lift, Tip |
| Eyes | Size, Width, Height, Tilt, Distance |
| Lips | Size, Height, Width |
| Eyebrows | Thick, Lift, Shape, Tilt, Raise |
| Forehead | Height |

Local private mockup: `design/mockups/yumiro-face-navigation-local.html` (ignored, contains the supplied photo). The original review used the chat-owned regular-file copy at `C:/Users/Jason/.codex/visualizations/2026/10/24/01a16cbd-75e4-7df3-aa0a-c421b001d992/yumiro-face-navigation-local.html`. For another chat, use its own allowed visualization cache as described below. Do not force-add either private preview. Full inventory and research are in `design/face-navigation-proposals.md`.

Mobbin references: [WhatsApp](https://mobbin.com/screens/a6e343ee-c1a6-419b-a22c-f962884c951d) for the two-level hierarchy, [VSCO](https://mobbin.com/screens/8aa78b87-281b-4e81-bb2e-a1d9e1d931f9) for grouped adjustments, and [Azar](https://mobbin.com/screens/8f295b8c-0d6e-4715-879d-af53d7f8352d) for independent selection/edit indicators.

Validation: `git diff --check` passed. A source comparison confirmed changes are confined to the Face layout/navigation regions, with the original slider/Position controls, helper/reset behavior, Face inventory and feature mappings preserved. Everything outside those regions in `ContentView.swift`, including canvas/gestures/guides, is unchanged. No native build or XCTest run is possible on this Windows host. On the Mac, verify both appearances, narrow widths, Dynamic Type through xLarge, VoiceOver, selecting offscreen items, reopening each category's remembered option, selected-neutral/selected-edited states, shared Face/Head dots, per-face switching, busy lock, Position and unchanged slider undo/reset behavior.

## Eyes controls: approved Wide slider

After reviewing the Eyes mockups and requesting reset spacing, restoring original dots, and replacing helper prose with endpoint words, the user requested commit/push. The reviewed Wide slider is implemented only for Face → Eyes in `ContentView.swift`. Labeled slider remains an unselected alternative.

- All five options remain Size, Width, Height, Tilt, Distance with their existing bindings and continuous **−1...1** ranges, neutral **0**, and signed rounded **−100...+100** unitless output. The existing `ValueSlider` is reused with only its duplicate inline value hidden. Its center catch (`abs(v) < 0.03`), zero haptic and drag callbacks are unchanged; no new stepping or quantization is added.
- The approved category/option rails identify the current control, so the duplicate slider title is omitted. A semantic 44 x 32 pt value badge uses 10 pt corners, monospaced subheadline digits, neutral styling at zero and accent styling for an edit. Unavailable controls retain their signed value in tertiary styling.
- Plain endpoint words align with the actual slider edges: Smaller/Larger, Shorter/Longer, Less open/More open, Down/Up, Closer/Farther. The separate meaning/neutral helper paragraph and minus/plus prefixes were removed. A non-interactive midpoint stem and the slider's accessibility hint identify zero as neutral.
- Selected Reset reuses the approved 44 pt neutral icon-button styling. It returns only the selected parameter to zero through the original `sliderEditing(true/false)` undo boundary. Its original `abs(value) < 0.001` disabled threshold is preserved. Reset all still calls `resetFaceSliders()`, with its existing availability and scope over all Face shape settings for the selected face; Retouch and other faces retain their existing behavior.
- The reset rows have a 4 pt gap. Only Eyes uses 8 pt top / 12 pt bottom padding; other panels/categories retain 12 pt vertical insets. The intended default-size budget is two 44 pt navigation rows + 44 pt controls + 4 pt gap + minimum 28 pt footer + 20 pt padding = 184 pt. Footer space for the 44 pt value, 44 pt reset and two 8 pt gaps keeps endpoint words aligned with the slider. The panel remains a minimum and may grow for native text sizing or multi-face context; no native height measurement has been performed.
- Original navigation and dot behavior are unchanged, as requested. No fixed dot slots or rail-stability revision was applied to app code. The shared `Chip`, `ValueSlider`, other Face controls, rendering model, effect ranges, per-face storage, canvas, guides, gestures, camera and video are unchanged.
- Width/Height/Tilt/Distance retain the existing mesh requirement; Size retains its Vision landmark fallback. There is no new blanket no-face lock. Existing unavailable/no-face captions remain, and the busy state shows concise processing guidance. Multi-face context (“Face N of M · tap another face to switch”) is retained below the endpoint words. The editor-wide processing lock remains intact.

| Eyes option | Existing property | Left / negative direction | Right / positive direction |
|---|---|---|---|
| Size | `eyes` | Smaller | Larger |
| Width | `eyeWidth` | Shorter | Longer |
| Height | `eyeHeight` | Less open | More open |
| Tilt | `eyeTilt` | Down | Up |
| Distance | `eyeDistance` | Closer | Farther |

Reviewed states: default (all zero, selection visible, selected Reset unavailable); adjusted (signed values and independent edit dots); missing mesh (retained values, the four mesh-dependent sliders/resets unavailable, Size fallback available); processing (navigation and controls unavailable, values retained). Each was shown in light and dark. The requested dot-layout change was reverted in the mockups and never applied to native navigation; the reset-spacing correction was retained.

Validation: `git diff --check` passed. Source comparison confirmed that only the Eyes presentation branch, new Eyes presentation helpers and Eyes-specific top padding changed. The original controls for every other Face category and all navigation/dot code remain identical. The shared slider, adjustment/model files, undo boundaries, per-face storage, canvas/guide/gesture code and all feature mappings/ranges are unchanged. The final browser review covered endpoint alignment, reset spacing, signs, default/adjusted/unavailable states, light/dark and narrow widths. Those are browser results, not native screenshots. Xcode/build/XCTest are unavailable on this Windows host; the Mac must validate native layout, Dynamic Type, VoiceOver, mesh fallback, per-face switching and drag/reset undo/redo.

Private preview: `design/mockups/yumiro-eyes-controls-local.html` (ignored, contains the supplied photo). The inline regular-file copy is at `C:/Users/Jason/.codex/visualizations/2026/10/24/01a16cbd-75e4-7df3-aa0a-c421b001d992/yumiro-eyes-controls-local.html`. Do not force-add either preview. Research, inventory and review notes are in `design/eyes-controls-proposals.md`.

## Nose controls: approved Direction words

This section records the initial Nose-only implementation in `de9803a`. The following Face-wide section supersedes its original category boundary; the approved Nose wording and design remain the reference.

The user selected Direction words, requested shorter endpoints (for example Smaller nose → Smaller), reviewed the revision, then explicitly requested commit/push. Only Nose adopts the new controls. Eyes retains its existing appearance and behavior through the same focused-control helper; other Face categories keep their original controls.

- Reuse the approved Stacked rails, original conditional edit dots, wide native ValueSlider, 44 x 32 pt value badge, 44 x 44 pt selected Reset, 4 pt reset-row gap, 28 pt minimum footer and 8/12/16 pt top/bottom/horizontal insets. Navigation, canvas, guides, gestures and the main tool rail are unchanged.
- Short endpoint words are Size: Smaller / Larger; Width: Narrower / Wider; Narrow: Original / Slimmer; Lift: Down / Up; Tip: Smaller / Larger. The selected rail option provides the visible label. Concise anatomical explanations are part of the slider's accessibility hint, with no separate normal-state helper paragraph.
- Size (`noseSize`), Width (`noseWidth`), Lift (`noseLift`) and Tip (`noseTip`) retain continuous -1...1 ranges, zero neutral at center and rounded signed -100...+100 display. Narrow (`nose`) retains continuous 0...1, zero neutral at the left edge and unsigned 0...100 output. Its neutral marker sits at the leading edge. The shared slider's two-way zero catch/haptic behavior is unchanged; Narrow does not acquire a center catch.
- All five retain their existing mesh requirement. Missing mapping/no-face captions and retained unavailable values use the existing availability checks; busy processing retains the editor-wide lock. There is no new fallback or blanket restriction on other categories.
- Selected Reset still brackets only its own assignment to 0 with `model.sliderEditing(true/false)` and keeps the original `abs(value) < 0.001` disabled check. Edit indicators retain `abs(value) > 0.001`. Reset all still calls `resetFaceSliders()`, retaining its all-Face shape scope for the selected face, Retouch preservation and other-face preservation.
- Per-face storage, bindings, all five render callbacks, native undo history, shared ValueSlider and rendering/model files are unchanged. Existing multi-face context and tap-on-canvas switching remain.

Private preview: `design/mockups/yumiro-nose-controls-local.html`, ignored because it contains the supplied photo. Do not force-add or publish it. Research and review notes: [nose-controls-proposals.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/nose-controls-proposals.md). Focused Mobbin references: [VSCO strength](https://mobbin.com/screens/62d0dba7-72e7-4dfb-a691-a986a789b5df) and [VSCO neutral reference](https://mobbin.com/screens/db2178a7-c420-4fb0-a0db-7bf067340d69).

Browser checks covered light/dark, neutral/adjusted/unavailable states, narrow widths, 184/449 px panel/canvas geometry, reset spacing, separate face values and local reset/undo/redo. Source validation checks the presentation-only scope and unchanged native storage/ranges/undo/render callbacks. Native build, XCTest, Dynamic Type, VoiceOver, native geometry and device behavior still require validation on the Mac.

## All Face controls: approved Nose design throughout

The user requested direct implementation across every Face category and subtab, reusing the completed Nose panel without new design directions or Mobbin research. All 33 slider subtabs now use `focusedFaceControls`, `FaceFeature.directions` and `FaceFeature.explanation`. Position retains its special canvas control through `positionFaceControls`. Both paths share `adjustmentResetControl` (originally `faceResetControl`), `faceControlFooter` and `FaceControlLayout` constants, plus the existing top-bar reset style and shared ValueSlider. The Warp update extracts Face's unchanged badge into `adjustmentValueBadge` and reuses it; Face's appearance and interactions are preserved.

- All eight categories and 34 subtabs retain their original order, selected-option memory, feature bindings and conditional edit dots. The category/option rails themselves are unchanged.
- Every Face control uses the approved typography, signed or unsigned value badge, 44 pt control/reset row, 4 pt footer gap, minimum 28 pt helper/Reset-all footer and Face-only 8/12 pt top/bottom padding. Position keeps the original drag instruction and two-axis reset; it does not acquire a slider or an invented numeric value.
- Normal slider footers show concise direction words. Anatomical explanations are included in accessibility hints. No-face, missing-mapping, processing and multi-face context follow the shared Nose footer hierarchy.
- Smile, Jaw Define and Nose Narrow retain continuous 0...1 ranges, unsigned 0...100 output and leading zero. All other sliders retain their original -1...1 ranges, signed output and centered zero. Position's reach and two-axis neutral remain unchanged. Face/Head Size and Width retain their shared model properties.
- Mesh availability, landmark fallbacks for Jawline/Eyes Size, selected Reset thresholds, Reset all scope, per-face storage, drag/reset undo boundaries, rendering callbacks, Position overlay/gestures and other editor tools are unchanged. No model, renderer, shader, shared slider, theme, video or camera file changed.

Verification: **408 browser state checks** cover every subtab in neutral, edited, selected-reset, missing-mapping, processing and no-face states in both appearances. **68 narrow-width checks** cover all subtabs in light/dark at a 320 px browser viewport. The reference retains 184/449 px panel/canvas geometry, 44 px reset targets and the 4 px reset gap. Shared Face/Head values, independent per-face records, Reset all scope, Position reset/undo, slider undo/redo and subtab memory were checked in the browser simulation. Source comparisons confirmed unchanged feature definitions, availability guards, model/history, canvas, gestures and render callbacks. Browser logs were empty.

These are browser/source results, not native build or device results. Windows has no Swift/Xcode toolchain; every subtab still needs native light/dark, Dynamic Type, VoiceOver, real per-face and undo/redo checks on the Mac/device. Full inventory, exact endpoints, coverage and remaining device work: [face-controls-verification.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/face-controls-verification.md).

Private verification preview: `design/mockups/yumiro-face-controls-local.html`, ignored because it reuses the supplied photo. Do not force-add or publish it. The preview is one implementation reference, with no alternative directions or approval step.

## Warp: approved Stacked sliders

After reviewing two editor-context proposals researched with Mobbin, the user explicitly selected **stacked** in writing. Only that layout is implemented. Focused slider remains an unselected alternative.

- Brush Size and Strength are visible together. Each has a medium subheadline label in a minimum 20 pt area above a 44 pt slider/value/reset row. Groups and the guidance footer have 4 pt gaps. Insets are 8 pt top, 12 pt bottom and 16 pt horizontal, preserving the editor's 184 pt minimum panel. Native text and multi-face context may increase the height; the browser budget is not a native measurement.
- Face and Warp share `adjustmentValueBadge`, `adjustmentResetControl`, `FaceControlLayout`, the existing top-bar reset button style and ValueSlider. Badges remain 44 × 32 pt with 10 pt corners; reset targets remain 44 × 44 pt with 14 pt corners. Defaults are neutral, edited parameters accented, and processing values retained in tertiary styling. Semantic colors support both appearances.
- Brush Size retains `reshapeSize`, continuous 0.08...0.5 and default/reset 0.22, shown as **33**. Strength retains `reshapeStrength`, continuous 0.1...1 and default/reset 1, shown as **100**. The existing normalized unitless 0...100 display is preserved; Strength's displayed 0 still means internal 0.1. No new snapping, midpoint, units or step size was added.
- Parameter drags retain `sliding` and `brushRing`; parameter resets assign only their original default. Neither creates an image undo step. Busy is the only new helper's unavailability check; no-face brush settings remain usable as before. Reset thresholds remain `abs(value - reset) < 0.001`.
- The footer says “Drag a face to push.” / “Pan off-face · Pinch zoom.” No-face says “No face detected.” with the same navigation guidance. Processing says “Available after processing.” / “Your settings are kept.” Multi-face context and tap-to-select remain. Concise accessibility hints explain each parameter and its default.
- Reset Face still calls `resetReshape()` with availability `selectedHasPushes && busy == nil`. It clears only the selected face's Warp pushes in one undo step, preserving Face adjustments, other faces and brush settings. The model, rendering, canvas gestures, face selection, push grouping, second-finger cancellation, zoom/pan and Compare are unchanged.

The private editor-context reference covers default, adjusted, processing and no-face states in light/dark. Prior browser checks passed for all 24 layout/choice/state/appearance combinations and 16 narrow-width combinations; these review the reference, not native output. Source checks preserve the original canvas, model, shared slider and all other tool behavior; Face's extracted badge/reset helpers are equivalent to their original presentation. Native build, light/dark layout, Dynamic Type, VoiceOver and device behavior remain pending on the Mac.

Research, exact ranges, source checks and native verification checklist: [warp-panel-proposals.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/warp-panel-proposals.md). Private preview: `design/mockups/yumiro-warp-panel-local.html`, ignored because it embeds the supplied photo. Never force-add or publish it.

## Heal → Spot: approved Face-style controls

The user requested the approved Face slider styling, then placed the circular brush Reset below the number. This final revision is implemented and pushed in `d7c7184`.

- Keep the original Spot / People / Brush / Erase `ModeTabs` picker and binding. The Brush size label sits above a 44 pt slider/value row. The shared value badge is 44 × 32 pt with 10 pt corners; an 8 pt gap separates its column from the slider. Reset is directly below the badge, with a 44 × 44 pt target and 14 pt corners.
- A 4 pt gap leads to the minimum 44 pt footer. Smaller/Larger align with the slider ends above “Tap a spot to heal. Pinch to zoom.” Reset occupies the right column. The base allocation is 24 pt vertical padding + 44 picker + 4 gap + 20 label + 44 controls + 4 gap + 44 footer = 184 pt. Native text/footer heights can grow for Dynamic Type; this is a minimum, not a fixed cap.
- Reuse `ValueSlider`, `adjustmentValueBadge`, `adjustmentResetControl` and `FaceControlLayout`. Brush size stays continuous over `0.004...0.08`, with default/reset `.025` and normalized unitless 0–100 display, default **28**. Add no percent/px unit, zero marker, center catch or Reset all.
- Reset is unavailable when `abs(brush - 0.025) < 0.001` or busy. It changes only brush size, preserving healed pixels and image undo history. Slider callbacks retain `sliding` and `brushRing`; neither parameter editing nor Reset calls `sliderEditing` or creates an image undo step.
- Ready retains the neutral/edited Face styling. Healing and Saving retain the value in tertiary styling, disable interaction and show “Available when processing finishes.” Endpoint words are hidden while busy. The existing delayed canvas badge, temporary size-editing brush ring, Compare/Fit behavior and busy lock remain unchanged.

Only Spot presentation and shared-control comments changed. Other Heal branches remain unchanged apart from indentation. Healing, tap behavior, pinch/pan, overlays and pixel undo/redo are preserved. The final placement passed 12 browser combinations: light/dark × ready/healing/saving × 320/390 px widths, including target size, alignment, guidance and Reset restoring 28. Source and whitespace checks passed; native build/device validation remains pending.

Research, state contract and checks: [heal-spot-proposals.md](design/heal-spot-proposals.md). Private ignored preview: `design/mockups/yumiro-heal-spot-options-local.html`. The selected common 250 pt Heal allocation below is a later design-only proposal and is not part of the implemented Spot panel.

## Heal selection: selected Compact actions, design only

The user explicitly chose **Compact actions** after reviewing two Mobbin-informed editor mockups, then requested that switching tabs never change the picture size. The current preview shows only this selected revision. Full-width Remove is an unselected alternative. The detailed [Heal selection spec](design/heal-people-proposals.md) was committed and pushed in `ca7c7dd`; no application source was changed by this work.

### Layout and photo stability

- Keep the existing Spot / People / Brush / Erase segmented picker. All four tabs share a **250 pt panel allocation at default text size in the mockup**, so the photo keeps identical size, position and fit through tab changes and state changes. People, Brush and Erase also keep their action row at the same bottom position.
- For a later native implementation, derive a shared panel height from the largest tab at the current width and Dynamic Type size. Do not resize the canvas from the active tab's content height or reset zoom/pan on a mode change. The 250 pt browser reference is not a verified native size or a hard cap for larger text.
- Brush and Erase reuse the latest approved Spot styling: 15 pt label/value text, 13 pt guidance, 44 pt control targets, value beside the slider, and Reset directly below the value. Smaller/Larger align with the slider, reserving a 44 pt accessory column plus an 8 pt gap. The selection guidance footer is 58 pt tall in the base mockup.
- Keep **Add Shadow**, **Clear**, and **Remove** on one row. Remove is the only filled primary panel action when a selection exists. Clear has the accessible label “Clear selection.” Without a selection, all three remain visible and disabled.
- Spot appears as context for reviewing the stable tab transition: its approved controls and guidance are unchanged, and it gets no selection mask, Clear, Remove or Add Shadow. Only the shared outer panel allocation reserves additional space. Other editor panels and chrome remain outside this redesign.

### Selection states and guidance

| State | Presentation |
|---|---|
| No selection | “Tap a person to select them. Tap the outline again to remove.” Selection actions disabled; Brush/Erase sizing remains available. |
| Selection ready | “Tap another person to add them. Tap the outline or Remove to remove.” Remove primary; Add Shadow and Clear secondary. |
| Finding people | Existing foreground lookup uses the delayed, centered “Finding the person…” badge. Keep any selection visible and disable interaction while busy. Background prewarming remains nonblocking. |
| Removing | Keep the selection visible with the existing delayed “Removing…” badge; disable interaction. Add no progress percentage, cancel action or confirmation. |
| No person found | “No person found there. Try another person or use Brush.” This reports a missed tap. Retain any prior selection and keep it removable when processing finishes. |

Brush says “Paint to add to the selection. Two fingers move and zoom.” Erase says “Paint to trim the selection. Two fingers move and zoom.” With no selection, Erase directs the user to select with People or Brush first. A successful selection or mode change clears the missed-tap panel hint.

### Preserved behavior and verification

- Preserve person detection, splitting/growth, pink selection tint and white outline, and existing tap behavior. An unselected person is added; tapping inside the selected mask still removes it immediately. The mockup outline is illustrative, not detector output.
- Preserve continuous brush range `0.004...0.08`, default/reset `.025`, unitless normalized display 0–100 (default **28**), and the `.001` reset threshold. Size changes and Reset do not create image undo steps. Clear only clears selection; Add Shadow retains its current asynchronous processing and result feedback.
- Preserve full-resolution removal, retained selection on failure, selection clearing on success, one pixel undo step per removal, and existing undo/redo. Keep selection across mode switches, existing Compare/Fit behavior, temporary size-editing brush ring, and pinch/pan gestures. Do not use Background's `findingPeople` property for Heal or make `preparePeople()` prewarming block Brush/Erase.
- The selected revision passed **120 browser combinations**: four tabs × five states × light/dark × 390×844, 375×667 and 320×568. Photo bounds stayed identical across tabs/states at each size; selection actions stayed fixed; controls fit with 44 pt targets. Clicking People → Brush → Erase → Spot → People also preserved identical photo bounds. No JavaScript page errors occurred.

Native implementation, device layout, Dynamic Type, VoiceOver and real detection/removal/history checks remain pending. The preview demonstrates controls and states; it does not run image processing. Mobbin references, earlier comparisons and the full behavior contract are in [heal-people-proposals.md](design/heal-people-proposals.md).

Private source: `design/mockups/yumiro-heal-selection-options-local.html`; standalone editor preview: `design/mockups/yumiro-heal-selection-editor-local.html`. Both embed the supplied portrait and stay ignored by Git. The source is a OneDrive reparse-point file, which failed direct inline reads. The original review used a byte-identical regular-file copy at `C:/Users/Jason/.codex/visualizations/2026/10/26/01a17641-5db9-7dc0-83c2-92b672843381/yumiro-heal-selection-options-local.html`. For another chat, copy into its own allowed visualization cache; keep the worktree file as the editable source. Do not force-add photo previews or QA screenshots.

## Background → Remove: selected Labeled swatches

The user chose **Labeled swatches** in writing. Preview tiles remains an unselected alternative. The selected implementation changes only Remove's picker and guidance in `ContentView.swift`.

- Keep Off / Clear / White / Black in their original order. Each equal-width button has a minimum 68 pt height, a 36 pt swatch within a 44 pt slot, a footnote label and 14 pt corners. Selection uses the existing 12% accent backing, semibold accent label, an outer ring and a separate check. Neutral borders keep White and Black visible in either appearance. Reuse the existing pressed/disabled button treatment.
- Clear uses neutral checkerboard squares in its swatch. The real canvas checkerboard and true-alpha PNG export remain unchanged. The separate note reads “Clear saves a transparent PNG.” Off keeps the existing Blur setting; White and Black keep their current filled export behavior.
- Detecting shows a small progress indicator and “Detecting people…” without disabling the choices or Save. Ready says “Ready. Everyone found is kept.” No-person-found says “No person found. Use Brush to paint what to keep.” Refine remains available once a matte exists, including a matte with no detected person. Brush/Erase retain their original correction guidance and controls.
- The review mockups reserve 224 pt for the Remove panel and 409 pt for the canvas in a 390×844 phone. These are browser reference sizes. Native layout retains the existing 184 pt minimum and allows content/Dynamic Type to increase its height; no fixed native panel or canvas height was introduced.
- Blur's Strength control, Refine picker, Brush size/Reset, segmentation, edge refinement, rendering, export and undo/redo are preserved. The picker still calls `setBackground` directly, keeping one undo step per changed choice. First opening Remove still selects Clear automatically.

The previous review passed 48 browser combinations across both alternatives, four choices, three detection states and light/dark. The final preview also passed 12 narrow-width layout/state checks. These checks cover the mockup, whose cutout is illustrative. Native compilation, Dynamic Type, VoiceOver, actual segmentation and export/history checks still require Xcode and a device/simulator.

No separate approved Blur redesign was found in the other chats or this worktree. This design uses ui-a's current Blur/Refine controls and approved shared editor styling. Research and the implementation contract: [remove-background-proposals.md](design/remove-background-proposals.md). Private ignored preview: `design/mockups/yumiro-remove-background-options-local.html`.

## Background mask corrections: reviewed compact design, not implemented

The user reviewed the shared Blur/Remove correction controls, requested less text and a larger photo, removed the foreground/PNG footer labels, corrected the gap below the Background tabs, then requested commit/push. This publishes the [design handoff](design/mask-correction-proposals.md) only; no application UI changes are included.

The final mockup uses one 44 pt row for View / Brush / Erase and Reset Fixes, plus one 44 pt row for Size, slider, value and size Reset. The swatches have an 8 pt gap below Blur/Remove. Brush/Erase use a 228 pt panel and 405 pt canvas in the 390×844 browser reference; View hides Size and uses the existing 184 pt minimum. Mode meanings and Clear's PNG explanation remain in accessible labels/tooltips. The two reset scopes, default size 24, foreground overlay, painting/history behavior and correction carryover remain the implementation contract, with native implementation/validation pending.

Private ignored preview: `design/mockups/yumiro-mask-correction-options-local.html`. It contains the supplied photo and must not be force-added to Git. Final browser checks confirmed the footer removal, tab gap and swatch alignment; earlier state/history checks are recorded in the handoff.

## Retouch: preferred proposal, not implemented

The user prefers **Compact rows**, then requested two spacing corrections. The latest revision has been shown but has not received explicit final acceptance. Do not implement or push Retouch UI merely because Compact rows is the carousel's selected preview.

Latest mockup details:

- All three adjustments stay visible: Whiten Teeth, Brighten Eyes, Even Tone.
- Each row contains label, native-style slider, value badge, and its own 44 x 44 reset button with 14 pt corners.
- A soft row highlight and short leading accent marker identify the adjustment being edited. Nonzero values are blue; zero values are neutral. Selection and a nonzero effect are distinct concepts.
- Rows are 44 pt high, with **4 pt gaps between rows/reset buttons**.
- Helper text has an **8 pt gap below the last row**. This fixes the original cramped footer without merging the reset buttons.
- Default-size panel budget: `3 * 44 + 2 * 4 + 8 + 18 = 166` pt content, plus **6 pt top / 12 pt bottom padding = 184 pt**. Horizontal padding stays 16 pt.
- If implemented, account for the shared panel's existing vertical padding with a Retouch-specific layout change. Do not shrink the touch targets or change padding for every other tool to make it fit.
- No-face state uses the existing message and control availability; sliders are currently not locked just because no face was detected. Zero resets stay disabled as usual. The preview simulates detection state without changing its sample photo.

The alternative **Adjustment tabs** is not selected: all three values remain visible in a tab row, with one full-width slider and a reset for the selected adjustment.

Retouch behavior to preserve:

- Effects are color-only: Whiten Teeth, Brighten Eyes, Even Tone. Do not alter masks, shaders, rendering order, or face shape.
- All three defaults are zero; each uses the existing continuous `0...1` range / rounded 0–100 display. Reset affects only its own adjustment and returns it to zero.
- `teeth`, `brightEyes`, and `tone` are the selected face's settings. `FaceRetouch` is stored inside each face's shape; `storeShape()` saves them and `showSliders()` restores them when the selected face changes.
- Face switching remains the existing tap-on-canvas interaction. With multiple faces, preserve the existing “Face N of M · tap another face to switch” caption and guides. Do not add an all-faces reset or make values global across faces.
- Retain the existing per-drag and per-reset undo grouping, render-on-change callbacks, busy guards, and unchanged tool behavior.

## Mockups and where to find them

Portable copies are saved in `design/mockups/`. These are interactive HTML fragments for Codex's visualization surface, not standalone apps or native screenshots. Older committed proposals use public NASA portrait imagery. New previews with the user-supplied photo are local-only and ignored by Git. Slider previews change controls/values, not the photo-processing pipeline.

| Mockup path on this PC | Direction to inspect | Status |
|---|---|---|
| [yumiro-home-options-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-home-options-local.html) | Quick start / Guided list | Quick start selected and implemented in `2dfc24e`; Guided list unselected; local and ignored |
| [yumiro-toolbar-options.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-toolbar-options.html) | Focus rail | Original approved rail; Grouped shelf is an unselected alternative |
| [yumiro-picker-light-dark.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-picker-light-dark.html) | Focus rail | Light/dark rail follow-up; Labeled chips is unselected |
| [yumiro-top-bar-options.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-top-bar-options.html) | Balanced bar | Approved; Action cluster is unselected |
| [yumiro-canvas-controls.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-canvas-controls.html) | Soft controls | Approved; normal/comparing/zoomed, light/dark; Labeled controls is unselected |
| [yumiro-smooth-panel-options.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-smooth-panel-options.html) | Quiet row | Approved; default/adjusted/processing, light/dark; Soft card is unselected |
| [yumiro-retouch-panel-options.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-retouch-panel-options.html) | Compact rows | Latest preferred proposal and corrected spacing, not implemented; light/dark, adjusted/all-off/no-face |
| [yumiro-crop-options.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-crop-options.html) | Shape rail | Explicitly selected and implemented for photo Crop; Pinned modes is the unselected alternative |
| [yumiro-rotate-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-rotate-local.html) | Action row | Selected and implemented; local-only preview contains the supplied photo and is intentionally ignored by Git |
| [yumiro-adjust-colors-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-adjust-colors-local.html) | Focused slider / Value tabs | Earlier comparison; local-only and ignored because it contains the supplied photo |
| [yumiro-focused-slider-hybrid-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-focused-slider-hybrid-local.html) | Focused slider with changed values | Approved and implemented; local-only and ignored because it contains the supplied photo |
| [yumiro-face-navigation-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-face-navigation-local.html) | Stacked rails / Category picker | Stacked rails explicitly selected and implemented; local-only and ignored because it contains the supplied photo |
| [yumiro-eyes-controls-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-eyes-controls-local.html) | Wide slider / Labeled slider | Reviewed Wide slider implemented with endpoint words and 4 pt reset gap; original dots retained; private and ignored |
| [yumiro-nose-controls-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-nose-controls-local.html) | Direction words / Inline guidance | Direction words selected with short endpoints and implemented; private and ignored |
| [yumiro-face-controls-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-face-controls-local.html) | Shared Nose controls throughout Face | Implementation verification reference for all 8 categories / 34 subtabs; private and ignored |
| [yumiro-warp-panel-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-warp-panel-local.html) | Stacked sliders / Focused slider | Stacked explicitly selected and implemented; Focused remains an alternative; private and ignored |
| [yumiro-heal-spot-options-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-heal-spot-options-local.html) | Face-style slider, Reset below value | Approved and implemented in `d7c7184`; private and ignored |
| [yumiro-heal-selection-options-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-heal-selection-options-local.html) | Compact actions, stable photo across all Heal tabs | Selected design only; all five selection states in light/dark; private and ignored |
| [yumiro-remove-background-options-local.html](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-remove-background-options-local.html) | Labeled swatches / Preview tiles | Labeled swatches selected and implemented; native validation pending; private and ignored |

Absolute portable-copy directory on this PC:

`C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/`

Original toolbar, top-bar, canvas, Smooth, and Retouch conversation artifacts (outside Git):

`C:/Users/Jason/.codex/visualizations/2026/10/24/01a16bec-b7ee-70d3-9fdf-41f62dc294d9/`

Current Crop, Rotate, and light/color conversation artifacts (outside Git):

- [Crop Shape rail / Pinned modes](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16c81-7e78-7cc2-94fb-eb94cd773c4b/yumiro-crop-options.html).
- [Rotate Action row / Split controls](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16c81-7e78-7cc2-94fb-eb94cd773c4b/yumiro-rotate-options.html).
- [Light/color original comparison](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16c81-7e78-7cc2-94fb-eb94cd773c4b/yumiro-adjust-colors.html).
- [Approved Focused slider hybrid](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16c81-7e78-7cc2-94fb-eb94cd773c4b/yumiro-focused-slider-hybrid.html).

Current Face and Eyes conversation artifacts (outside Git):

- [Approved Stacked rails](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16cbd-75e4-7df3-aa0a-c421b001d992/yumiro-face-navigation-local.html).
- [Approved Eyes Wide slider, final endpoint words and reset spacing](C:/Users/Jason/.codex/visualizations/2026/10/24/01a16cbd-75e4-7df3-aa0a-c421b001d992/yumiro-eyes-controls-local.html).

Home and Spot conversation artifacts (outside Git):

- [Approved Quick start](C:/Users/Jason/.codex/visualizations/2026/10/25/01a17303-4c89-7020-8c3c-f782194262fa/yumiro-home-options-local.html).
- [Approved Spot, Reset below the value](C:/Users/Jason/.codex/visualizations/2026/10/25/01a17303-4c89-7020-8c3c-f782194262fa/yumiro-heal-spot-options-local.html).

Direct worktree previews have failed with “Invalid visualization read request” because of OneDrive reparse-point files. Keep the worktree mockup as the editable source and copy it byte-for-byte to a regular file in the active chat's allowed visualization directory for inline display. The paths above belong to their respective review chats; another chat must use its own allowed cache rather than assume those paths are valid inline references. Face/Eyes and Home/Spot copies were checked against their sources during their respective reviews.

Rotate, light/color, Face, Eyes, Nose, Warp and Heal local artifacts contain the private supplied photo. Their repo copies use the ignored `*-local.html` suffix. Never force-add these files. The original photo stays at `C:/Users/Jason/OneDrive/Pictures/Pfp/e9f7a063d2e8c7e60bf6781376e2c5f1.jpg`. These PC-local previews are not included in a Mac checkout; the committed implementation and proposal notes remain the portable handoff.

No native app screenshots were provided or saved in this chat. Browser screenshots were inspected during preview QA but were not persisted as files. The mockups approximate UIKit colors/icons; native code is authoritative for the implementation.

To preview a fragment locally on this Windows host, use the visualize skill's renderer, for example:

```powershell
python -X utf8 'C:/Users/Jason/.codex/plugins/cache/openai-bundled/visualize/1.0.55/skills/visualize/scripts/render.py' 'C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/mockups/yumiro-retouch-panel-options.html' --serve
```

The preview server reads the fragment when it starts: restart it after editing, rather than assuming a page reload picked up the file. The HTML fragments need the host/renderer for carousel, icon, and optional design-control support. Do not modify app code merely to make a mockup render.

## Mobbin reference library

Use the canonical links below. Expiring image-download URLs are intentionally not part of this handoff.

### Bottom tool picker

- [CapCut](https://mobbin.com/screens/dba73525-e68a-4540-93cf-dd839c82f16b): consistent icon/label rhythm and a partially visible next tool.
- [VSCO](https://mobbin.com/screens/8aa78b87-281b-4e81-bb2e-a1d9e1d931f9): related-tool grouping.
- [Unfold](https://mobbin.com/screens/1a6347cb-9ce7-4c7a-8dbb-b0604eb89e19): clear individual tool targets.
- [Canva](https://mobbin.com/screens/6bedcf20-70f8-4c24-bbfc-96ed72eb2671): consistent icons and spacing in a long row.
- [Instagram](https://mobbin.com/screens/142955aa-23c8-4d74-a51c-ce34919c1385): separate tool backings.

### Top bar

- [Pinterest](https://mobbin.com/screens/e0a593e7-f1ac-4750-aa7b-66cde5001d46): separate Close, history, and completion roles.
- [Unfold](https://mobbin.com/screens/dde89b67-c1d2-48c8-adda-cebe19196387): paired Undo/Redo with different emphasis for availability.
- [Photoroom](https://mobbin.com/screens/54bde2a7-8801-44a4-8c0f-fba99fd8f9fc): compact grouping of related top actions.

### Canvas controls

- [Apple Photos](https://mobbin.com/screens/1a3464f9-d5e6-4b3a-a8d1-1411eff8a26e): compact Original indication.
- [Photoroom](https://mobbin.com/screens/c81968f1-67c1-4652-bd13-bf8595e8605c): explicit before/after orientation; its comparison slider is not being adopted.
- [LinkedIn](https://mobbin.com/screens/1390e851-257b-48df-87ed-90a8e42a0b46): visible zoom magnitude.

### Smooth panel

- [VSCO](https://mobbin.com/screens/df9557ce-8461-4c68-a07f-823919f788ca): numeric strength close to the active slider.
- [Shopee](https://mobbin.com/screens/e0a34c4b-29b8-4bdf-aced-9fb455d9aa09): Smooth strength with a separate Reset action.
- [(Not Boring) Camera](https://mobbin.com/screens/4a350c13-9234-42a0-97ea-acef9019fb76): title, value, helper, and slider grouped in a compact panel.

### Crop aspect-ratio selection

- [Unfold](https://mobbin.com/screens/e65a8df7-97f0-4b12-b429-955b64c919ee): outlined ratio shapes with labels in a horizontal strip.
- [Apple Photos](https://mobbin.com/screens/5bcf365a-c53b-471d-95e5-08dc4d9fa79d): compact aspect labels with a selected backing.
- [Google Maps](https://mobbin.com/screens/4aaecdc2-8367-4027-8a2c-a76390f4e527): explicit checkmarked aspect selection in its iOS crop picker.

### Rotate & Straighten

- [Apple Photos](https://mobbin.com/screens/3a719f66-2139-427b-99c5-2ebc19fc044c): adjacent orientation actions and a focused straighten control.
- [Instagram](https://mobbin.com/screens/720bfb83-b9d4-4577-a1b9-814ca1646d24): compact controls beneath the photo.
- [GoPro Quik](https://mobbin.com/screens/c628e27c-ed54-440e-9e80-4a64333d73b8): keep rotation/flip actions distinct from continuous straightening.

### Brightness, Contrast, Saturation, and Warmth grouping

- [VSCO](https://mobbin.com/screens/adea8809-53d5-419b-9ceb-67d4f0def085): related light/color adjustments in one group.
- [Google Photos](https://mobbin.com/screens/9b042739-12d6-41ac-a180-2d438133cba1): adjacent adjustment choices with changed-state visibility.
- [Apple Photos](https://mobbin.com/screens/75d7aa74-5770-4c83-a4b5-8afd6555ae7f): one focused slider tied to the selected adjustment.

The icon-to-signed-number swap is the user's approved synthesis of the Focused slider and visible changed-value directions. The alternative Value tabs layout is not the implementation.

### Face category and subcategory navigation

- [WhatsApp avatar editor](https://mobbin.com/screens/a6e343ee-c1a6-419b-a22c-f962884c951d): visible two-level category/option hierarchy.
- [VSCO tools](https://mobbin.com/screens/8aa78b87-281b-4e81-bb2e-a1d9e1d931f9): grouping many related adjustments without flattening the hierarchy.
- [Azar beauty editor](https://mobbin.com/screens/8f295b8c-0d6e-4715-879d-af53d7f8352d): distinct selected-tool and edited-tool indicators.
- [Halide Quick Edit](https://mobbin.com/screens/298d9809-7e34-4cb6-9c07-4a0fa712c8ba): compact mode row above horizontal choices.

The approved synthesis is Stacked rails. Category picker remains a mockup alternative. Research and inventory notes: [face-navigation-proposals.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/face-navigation-proposals.md). The earlier Eyes deferral in those navigation-only notes is superseded by `709b132` and the Eyes section in this handoff.

### Eyes precise adjustments

- [VSCO](https://mobbin.com/screens/df9557ce-8461-4c68-a07f-823919f788ca): signed numeric strength close to its active slider.
- [Halide Mark III](https://mobbin.com/screens/094dc15f-2903-401e-9984-d97633308ae4): signed value and a neutral reference on the scale; no ruler or histogram is being adopted.
- [Shopee](https://mobbin.com/screens/e0a34c4b-29b8-4bdf-aced-9fb455d9aa09): separate tool selection, numeric strength and Reset.

The approved synthesis is Wide slider with a midpoint stem, signed value badge and plain endpoint words. Labeled slider and the separate meaning/neutral helper block are not the implementation. Research and revision notes: [eyes-controls-proposals.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/design/eyes-controls-proposals.md).

### Retouch grouping

- [Azar](https://mobbin.com/screens/8f295b8c-0d6e-4715-879d-af53d7f8352d): distinguish the selected adjustment from neighboring tools.
- [Shopee](https://mobbin.com/screens/fbda85d0-d09e-4a6c-af5d-61a00f498c00): associate the selected adjustment with strength, value, and Reset.
- [Apple Photos](https://mobbin.com/screens/0dc105f4-8259-4396-bb88-979b3c4d9a66): compact adjustment navigation with one focused slider.

These references inform layout details; they do not authorize importing application assets, features, or code.

## Validation completed and remaining

Completed:

- This 2026-10-27 handoff refresh began with `git pull --ff-only origin ui-a`: already up to date at `621073e`, with a clean worktree. That hash is the refresh base, not the later documentation commit. Source inspection confirmed the Home, Warp and Spot implementations and the still-original People/Brush/Erase branches. The refresh changes only `DESIGN.md`; implementation and mockup checks below are historical, not new native results.
- The refresh passed `git diff --check` and local Markdown-link checks. The local renderer path exists. No app runtime tests, new browser QA, native build or device validation were run for this documentation-only change.
- Home (`2dfc24e`) passed the source-scope and browser checks recorded in `design/home-screen-proposals.md`: three small-phone sizes, both appearances and default/enlarged text. WelcomeView/AboutView preservation and existing routes were checked in source. Spot (`d7c7184`) passed the final 12 Reset-below-value combinations and brush-reset checks recorded in `design/heal-spot-proposals.md`; source comparison preserved other Heal branches and the rest of the editor.
- Heal selection's final Compact actions mockup passed 120 tab/state/appearance/size combinations, plus direct tab-click checks confirming identical photo bounds. Clear, Reset, busy feedback and retained-selection presentation were also checked during design review. The spec was pushed to `origin/ui-a` as `ca7c7dd`; photo mockups remained local, and no application code was included. These are mockup checks, not native results.
- `git diff --check` and the staged whitespace check passed for the Face navigation (`dd97cc7`) and Eyes (`709b132`) implementations. Their pushes were confirmed. At the historical Eyes checkpoint, local `ui-a` and `origin/ui-a` both resolved to `709b132f5323b31108ee09eff7b896b88d342823`, with a clean worktree; this is not the current branch tip.
- Source-scope comparisons confirmed that each UI commit only changed its approved area. The Smooth check also confirmed `EditorModel.swift` was unchanged.
- Native behavior was inspected in source: selection, undo/reset grouping, smoothing default, per-face values, busy/crop guards, gesture calculations, and fit reset. These were source checks, not runtime tests.
- Mockup JavaScript passed syntax checks. Browser previews were visually inspected for light/dark, selected/unselected or enabled/disabled states, and the requested panel states.
- Browser interactions confirmed Smooth reset to zero, value updates, processing locks; Retouch independent values/tab switching, reset of only one adjustment, and no-face presentation; canvas fit returning to normal; and top-bar history availability changes.
- Latest Retouch browser geometry was measured: **184 px panel height, 44 px reset targets, 4 px reset-button gaps, 8 px helper-text gap**. Browser pixels model native points at the intended preview scale; this is not native layout validation.
- Rotate mockup checks covered default/adjusted light and dark, signed ±15° endpoints, flip orientation, Reset availability, narrow layout, 184 px panel sizing, and 44 px reset targets.
- The light/color hybrid mockup showed all-neutral icons and mixed edited values in light/dark; resetting Brightness restored its icon while leaving Contrast's signed value visible. Selected highlight remained distinct from edit state. Disabled controls retained values. The comparison also covered narrow scrolling and −100/+100 endpoints.
- The `5efeeba` source audit compared the adjustment model, original Crop/Rotate controls, shared `ValueSlider`, reset/undo callbacks, crop frame, `EditorModel.swift`, and `VideoEditView.swift` against its parent. They were unchanged. `ContentView.swift` changed only by enabling `photoColorStyle: true`; rendering callbacks, busy lock and canvas code were unchanged. The commit contains only `Adjustments.swift`, `ContentView.swift`, and this handoff.
- Face browser QA covered both proposed layouts, light/dark, all 8 categories and 34 options in order, selected-neutral/selected-edited states, shared Face/Head edit dots, remembered subcategory selection, horizontal overflow access, and navigation targets of at least 44 px. The panel/canvas remained 184/449 px in the 844 px phone shell; a 320 px viewport had no page overflow. No browser errors were reported.
- The `dd97cc7` source audit confirmed that only the Face navigation/layout regions changed; original slider/Position controls, helper/reset callbacks, feature mappings, shared slider and model were preserved. Canvas, guides, gestures and other tools were unchanged.
- Eyes browser QA covered both layouts and all five options, default/adjusted/missing-mesh/processing in light/dark, signed −100/+100 endpoints and the existing zero catch. Selected Reset returned only that value to zero while preserving peer edits. Missing-mesh Width retained −12 with its slider/reset unavailable; Size remained available. Processing retained values and disabled navigation and controls.
- Final Eyes endpoint words align with the slider's left/right edges below the track; the separate meaning/neutral sentence is absent. The 4 px reset-row gap and 184/449 px panel/canvas were preserved in light/dark and at a 320 px viewport. All five endpoint pairs fit without overlap, with wrapping where needed. Original dot visibility/layout was restored. No browser warnings/errors were reported. Rail stability from the discarded dot-slot trial is not an approved or implemented result.
- The `709b132` source audit confirmed that only the Eyes presentation branch/helpers and Eyes-only top padding changed. Every other Face control and all navigation/dot code remained identical. `Adjustments.swift`, `EditorModel.swift`, `Theme.swift`, and `VideoEditView.swift` were unchanged; ranges, mesh guards, bindings, per-face storage, render/undo/reset callbacks and canvas code were preserved.
- All five private repo previews (Rotate, original light/color comparison, hybrid, Face navigation, Eyes) remain ignored/untracked and outside the implementation commits. Earlier photo-byte checks confirmed the supplied JPEG in the Rotate/light/color previews; Face and Eyes reuse that same local image. No native app photo asset was added. Face/Eyes inline regular-file copies match their worktree mockups byte-for-byte.
- The earlier Eyes handoff passed `git diff --check` and a check of its then-current 23 linked local files. That count is historical. No native screenshots are recorded; linked HTML files are approved mockups or explicitly marked alternatives. Documentation-only refreshes do not establish app runtime or native layout results.
- Crop's JavaScript syntax/source checks passed, but its initial browser visual-QA attempt could not reach the local renderer. Do not count later successful Rotate/light/color QA or preview selections as completed Crop visual/runtime validation.

Still unfinished:

- Verify Quick start Home on a small iPhone in light/dark and normal/accessibility Dynamic Type: primary action, all eight tool routes, Camera/video, loading/errors, 44 pt targets, scrolling through the privacy text, VoiceOver order, About dismissal and Show the welcome again. Check generic Edit a Photo after switching tools. Home has no Dynamic Type cap; the editor's xLarge cap does not apply to it.
- Heal → People/Brush/Erase remains design-only. If the user requests implementation, use the selected Compact actions revision and common Heal panel height, preserve all existing processing/selection/history behavior, and validate the native photo bounds across all four tabs, both appearances, narrow widths and Dynamic Type. Do not treat the spec-only commit/push as completed UI implementation.
- Verify Heal → Spot on iOS: 0–100 brush display/default 28, Reset below the value, 44 pt control targets, endpoint and guidance wrapping through xLarge, light/dark and busy states, temporary brush ring, tap-to-heal, pinch/pan, Compare, Save and image undo/redo. Reset must change only brush size and create no undo step. People/Brush/Erase remain unchanged. Browser mockup checks are recorded in `design/heal-spot-proposals.md`; no native build or layout result is claimed.

1. Get acceptance of the latest Retouch spacing revision before implementing Compact rows. Retouch remains the original UI in the app.
2. Build/install the pushed design A on the user's Mac with `tools/install_variant.sh a`. No Xcode build, XCTest, or phone install has been run in this chat. No compiler-success claim is justified.
3. Run the relevant existing regression tests on a Mac; see [TESTING.md](C:/Users/Jason/OneDrive/Desktop/Code/js/yumiro-ui-a/TESTING.md). Smooth's automatic default/undo/redo tests are especially relevant. Do not add tests that only mirror cosmetic view code.
4. Inspect native light/dark appearance, smaller supported phone widths, Dynamic Type through the existing xLarge cap, VoiceOver order/announcements, and real material legibility. Check Compare hold/release, pinch/pan, zoomed fit reset, Save, Undo/Redo, Smooth reset, and per-face Retouch persistence.
5. Verify Crop on iOS: all ten ratios, Original/Free, selected states, Reset availability, Cancel restoring an existing frame, Done returning to the previous tool, undo grouping, processing locks, light/dark, and Dynamic Type. Confirm the frame and pinch/pan behavior are unchanged.
6. Verify Rotate on iOS: left/right quarter turns, orientation-aware flips, ±15° straighten, zero catch and haptics, geometry-only Reset, global Reset all, undo/redo, busy lock, narrow reflow, and selected flip states in light/dark.
7. Verify all four light/color tools on iOS: default icons, icon-to-number replacement, signed display, selected-neutral versus edited-peer states, Reset restoring the icon and preserving peers, Reset all scope, unchanged range/neutral/zero snapping, per-drag undo/redo, disabled availability, scroll-to-selection, VoiceOver values, and light/dark at narrow widths and xLarge Dynamic Type.
8. Verify Face navigation on iOS: all 8 categories/34 options, selected-neutral and selected-edited states, shared Face/Head dots, remembered subcategories, scrolling to offscreen selections, actual-overflow fades, busy lock, VoiceOver selected/edit announcements, per-face switching, Position, and unchanged slider/reset/undo behavior. Include narrow widths, light/dark and Dynamic Type through xLarge.
9. Verify Eyes on iOS: all five signed ranges, neutral midpoint/zero catch, endpoint alignment/wrapping, 4 pt reset-row spacing, narrow phones and multi-face footer sizing, mesh-dependent availability and Size fallback, no-face/busy captions, retained unavailable values, per-face persistence, selected Reset versus all-Face Reset all scope, drag/reset undo/redo, haptics, VoiceOver and both appearances. No native height or canvas-size claim is established by browser measurements.
10. Complete native contrast/material legibility checks and save actual device screenshots if requested. No native build, XCTest result, native screenshot, or device layout measurement is available in this handoff.
11. Verify Nose on iOS: all five ranges and short endpoint pairs, Narrow's unsigned 0...100 display and leading neutral marker, centered signed values for the other four, reset availability, missing mesh/no-face/busy values and captions, per-face switching, selected Reset versus all-Face Reset all scope, drag/reset undo/redo, narrow widths, Dynamic Type, VoiceOver and both appearances. Confirm the shared focused helper preserves approved Eyes behavior and native canvas geometry.
12. Verify all Face categories/subtabs natively using the inventory in `design/face-controls-verification.md`: both appearances, all control states, one-way and two-way ranges/zero positions, selected Reset and Reset all, per-face values and Face/Head aliases, undo/redo, availability/fallbacks, Dynamic Type, VoiceOver and native panel/canvas geometry. Position must retain oval dragging, second-finger cancellation, its original two-axis reset and all canvas gestures.
13. Verify Warp's Stacked sliders on iOS: both appearances; default/adjusted/processing/no-face states; exact brush ranges and normalized 33/100 defaults; parameter resets without image undo; Reset Face with undo/redo and preserved Face adjustments/other faces/brush settings; temporary brush ring; tap/drag face selection; off-face pan; pinch cancelling an in-progress push; Compare; narrow widths, multi-face context, Dynamic Type and VoiceOver. Measure native panel/canvas layout; no native size claim is established by the browser reference.
14. Keep home, camera, video editor, other tool panels, effects, and image geometry outside unsolicited redesign work. Home uses Quick start; every Face category reuses the approved Nose design, with Position's special interaction preserved; Warp uses Stacked sliders; Spot uses Face-style controls with Reset below the value. Continue within explicitly requested scope. Unselected layouts (Home Guided list, Grouped shelf, Labeled chips, Action cluster, Labeled controls, Soft card, Pinned modes, Split controls, Value tabs, Face Category picker, Eyes Labeled slider, Nose Inline guidance, Warp Focused slider, Heal selection Full-width Remove, and Retouch Adjustment tabs) remain alternatives, not implementation tasks. The reverted dot-slot revision and removed Eyes helper prose are not pending implementation work.
