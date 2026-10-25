# Warp panel: approved Stacked sliders

2026-10-25 (America/Toronto), branch `ui-a`, based on the approved Face styling in `c6b33b9`. The user reviewed both proposals and explicitly selected **stacked** in writing. Stacked sliders are now implemented in `PhotoStudio/ContentView.swift`; Focused slider remains an unselected alternative.

Private preview: `design/mockups/yumiro-warp-panel-local.html`. It reuses the current editor chrome, Focus rail, fixed canvas/photo and face guides. The supplied photo is embedded only in this ignored local preview. Do not force-add or publish it. Both layouts preserve the 184 px preview panel and 449 px canvas inside the existing 844 px phone shell.

## Layouts

- **Stacked sliders (selected and implemented):** Brush Size and Strength are both visible, each with a minimum 20 pt label area above the approved 44 pt full-width slider/value/reset row. The two 64 pt default-size groups have a 4 pt gap. A 4 pt gap separates the last selected Reset from the minimum 28 pt guidance/Reset Face footer. Face-style 8 pt top / 12 pt bottom / 16 pt horizontal insets target the 184 pt minimum panel budget. Both controls remain easy to find without switching modes. Native font metrics, Dynamic Type and multi-face context may increase the height.
- **Focused slider:** a single 44 pt Face-style choice rail selects Brush size or Strength, followed by the approved wide 44 pt slider/value/reset row, a 4 pt gap and a 28 pt endpoint/Reset Face footer. A 4 pt gap leads to a 40 pt guidance area. The same 8/12/16 pt insets preserve the 184 pt budget. Endpoints are Smaller / Larger and Gentler / Stronger. This gives guidance more room while showing one active slider at a time.

Both use the approved native-style slider, 44 x 32 pt medium monospaced value badge with 10 pt corners, neutral 44 x 44 pt parameter reset with 14 pt corners, and footnote guidance. Reset Face uses the existing Face footer's compact text-action treatment. Edited parameter values are accented; defaults are neutral even when their number is nonzero. Processing retains values in tertiary styling and disables the controls. Focused-slider dots indicate a brush setting differs from its default; they do not indicate a photo edit or change the main Warp rail's existing edit detector.

Normal guidance is concise: drag a face to push it; drag off-face to pan; pinch to zoom. Missing detection says No face detected while retaining navigation guidance. Processing says the settings are kept and editing is available after processing. Existing multi-face context and tap-on-canvas switching must be preserved in any implementation; allow the minimum panel to grow if that context or native text sizing needs more room.

## Existing values and behavior

| Control | Existing binding | Internal range | Reset/default | Existing unitless display |
|---|---|---|---|---|
| Brush size | `reshapeSize` | 0.08...0.5 | 0.22 | 0...100, default 33 |
| Strength | `reshapeStrength` | 0.1...1 | 1 | 0...100, default 100 |

These values use ValueSlider's original normalized output, rounded as `(value - min) / (max - min) * 100`. Brush size is a radius relative to face width internally, not a newly introduced percentage label. Strength's display 0 still corresponds to its existing 0.1 minimum, not a new zero-strength setting. Do not introduce negative values, a midpoint/zero catch, numeric stepping, a new range or changed defaults. Both previews use continuous `step="any"`.

The adjusted sample uses Brush size 0.32 (display 57), Strength 0.55 (display 50), and an existing selected-face Warp edit. The processing sample keeps those settings/edits. The no-face sample retains the adjusted brush settings but has no selected face pushes. The photograph is fixed in every sample; this prototype reviews controls and does not execute the warp renderer.

- Brush size and Strength are global tool settings, not per-face image edits. Both current `sliderRow` calls use `undoable: false`; changing/resetting these settings must not create image undo steps. Resets return to 0.22 and 1, not zero.
- Preserve the existing `sliding` / `brushRing` editing callbacks and temporary brush-size ring. No new canvas gesture, permanent brush overlay or image interaction is proposed.
- Reset Face still calls `resetReshape()`. It removes only the selected face's push list in one undo step, preserving that face's Face adjustments and other faces. Its existing availability is `selectedHasPushes && busy == nil`; do not turn it into a Face-shape, all-faces or brush-settings reset.
- No-face detection does not currently disable brush-setting sliders/resets. Keep them available while idle; Reset Face is unavailable because there are no selected-face pushes. Do not add a new no-face or mesh lock.
- `beginReshape` selects the face under the drag first, retains that face's settings, and captures size/strength once at drag start. Each completed push remains one undo step. Preserve the existing movement threshold, source-coordinate handling, step spacing, push limit and rendering.
- Tapping a face still selects it. Starting a drag off-face still pans. A second finger cancels an in-progress push through the existing `cancelReshape()` path so the gesture can become a pinch. Preserve undo/redo, base pushes, zoom/pan and Compare behavior.
- Keep the existing selected-face caption when multiple faces are present; do not add a product face picker or make brush settings per face. The sample photo is single-person, so multi-face switching is source-inspected rather than simulated in the mockup.

## Focused Mobbin references

- [VSCO brush size](https://mobbin.com/screens/2b5e652b-d8ab-4a5e-bd40-5d5fddfd45c6): a concise Brush Size label and numeric value paired with one full-width slider. Informs the clearly labeled slider groups and focused alternative.
- [Unfold brush controls](https://mobbin.com/screens/ad77fe37-e2d1-4c91-a292-97a5c401033d): compact brush settings below the photo, with a slider and adjacent numeric value. Informs the space-efficient panel grouping and nearby readouts.

Reference images were inspected; no reference-app images or assets were imported. The two proposals retain Yumiro's approved Face visual language.

## Verification

- JavaScript syntax validation passed. Both layouts render within the current editor context with the same fixed photo, guides, top bar, canvas proportions and main tool rail; only Warp's panel content is proposed.
- 24 browser state/control checks passed: Stacked sliders and both Focused-slider choices in default, adjusted, processing and no-face states, each in light/dark. Defaults show 33/100 with parameter resets unavailable. Adjusted shows 57/50 with resets available. Processing locks controls and retains values. No-face retains enabled brush settings and unavailable Reset Face.
- 16 narrow browser checks passed at a 320 px viewport across both layouts, all four states and both appearances. Panel/canvas stayed 184/449 px, slider and parameter-reset rows stayed 44 px, and guidance fit its allotted space. Stacked's last reset/footer gap measured 4 px.
- Changing brush size to its maximum without a detected face displayed 100 and left Undo unavailable. Reset restored 33 without enabling Undo. Strength's minimum displayed 0; its reset restored 100. Reset Face cleared the sample face pushes while preserving 57/50 brush settings; Undo restored those pushes and Redo removed them again.
- Browser warning/error logs were empty. The proposal phase left application source unchanged from `c6b33b9`.

## Implementation and native handoff

The native `warpPanel` uses two `warpParameter` groups and a compact guidance/Reset Face footer. It reuses Face's extracted, unchanged `adjustmentValueBadge` and renamed `adjustmentResetControl`, existing `FaceControlLayout` dimensions, ValueSlider and top-bar button style. Other tools retain their padding; Warp alone joins Face's 8 pt top inset. Face's presentation and interactions remain equivalent after extracting the shared helpers.

- Source comparison checks all ContentView code outside the Warp branch/helpers, its top-padding condition and the equivalent shared badge/reset extraction against `c6b33b9`. The canvas, guides, gestures, Face feature definitions/navigation, other tool panels and render callbacks are unchanged.
- Model, renderer, shared ValueSlider, theme, camera and video source remain unchanged. Both bindings, continuous ranges, defaults, normalized output and original reset-disabled threshold are retained. Warp's drag callback still sets only `sliding`/`brushRing`; its parameter reset only assigns the original default. Reset Face retains its original model action/availability.
- `git diff --check` and source-scope/behavior audits passed. The full ContentView comparison matched `c6b33b9` outside the approved Warp presentation, top-padding condition and equivalent shared-helper extraction. The private preview remains ignored and is excluded from the commit.

The browser checks above concern the reference mockup. No native build, device gesture test, actual warped-photo output or native Dynamic Type/VoiceOver result was produced on this Windows host; no Swift/Xcode toolchain is available. On the Mac/device, verify:

1. Light/dark, narrow widths and Dynamic Type through the existing xLarge cap: both visible labels/rows, 44 pt reset targets, footer wrapping and actual panel/canvas sizing. Include multiple faces.
2. Default 33/100, adjusted values, processing with retained values/disabled controls, no-face with usable brush settings and unavailable Reset Face. Check exact minimum/maximum values and both parameter resets without creating image history.
3. Push a face, change brush settings, switch faces, and use Reset Face. Confirm one push/reset per undo step, undo/redo, independent face pushes, retained Face adjustments and unchanged brush settings.
4. Tap another face, start a push on another face, pan off-face, pinch during a push, inspect the temporary brush ring and hold Compare. Confirm original selection/gesture/cancellation behavior.
5. VoiceOver: Brush Size/Strength labels, unitless values, default announcements, parameter explanations and correct reset scopes.
