# Shared Face controls

2026-10-25 (America/Toronto), `ui-a`, based on the approved Nose Direction words design in `de9803a`. The user authorized direct implementation throughout Face, with no new proposals or Mobbin research.

## Implementation

All 33 slider subtabs now use `focusedFaceControls`. Position remains a canvas-oval control, using `positionFaceControls` with the original `resetPosition()` action. Both paths share `faceResetControl`, `faceControlFooter`, and `FaceControlLayout` geometry. The approved category/option navigation is unchanged.

- Control row / selected Reset: 44 pt. Value badge: 44 x 32 pt, 10 pt corners, medium monospaced subheadline. Selected Reset retains the approved 14 pt neutral backing through `PhotoEditorTopBarButtonStyle`.
- Footer: 4 pt gap, minimum 28 pt, footnote direction words and Reset all. It reserves the same 104 pt accessory width. Face-only panel padding is 8 pt top / 12 pt bottom / 16 pt horizontal, preserving the intended 184 pt minimum.
- Semantic colors preserve neutral, edited, selected and unavailable appearance in light/dark. Values remain visible while unavailable. Selection and edit dots remain independent.
- Every scalar feature defines short direction words and an anatomical accessibility explanation in `FaceFeature`. Position retains its existing visible drag instruction and helper. Normal slider footers use endpoint words, as approved for Nose.
- Smile, Define and Narrow keep unsigned 0...100 output with zero at the leading edge; every other slider keeps signed -100...+100 output with zero centered. Shared `ValueSlider` behavior is unchanged, including continuous values, two-way zero catch/haptics and per-drag undo boundaries.

## Inventory and state coverage

Every row below passed the browser reference's **neutral, edited, selected Reset, missing mapping, processing and no-face** state checks in both appearances: 34 x 6 x 2 = **408 state checks**. All 34 also passed narrow-width checks in both appearances: **68 layout checks** at a 320 px browser viewport. Browser checks validate the design reference and its interaction simulation; native iOS verification remains pending for every row.

| Category | Subtab | Internal range | Short endpoint words |
|---|---|---|---|
| Face | Size | -1...1 | Smaller / Larger |
| Face | Width | -1...1 | Narrower / Wider |
| Face | Smile | 0...1 | Original / More smile |
| Face | Position | Existing two-axis oval | Existing drag instruction |
| Face | Perspective | -1...1 | Farther / Closer |
| Face | Smirk | -1...1 | Left corner / Right corner |
| Head | Size | -1...1 | Smaller / Larger |
| Head | Width | -1...1 | Narrower / Wider |
| Head | Height | -1...1 | Shorter / Taller |
| Jaw | Jaw | -1...1 | Narrower / Wider |
| Jaw | Jawline | -1...1 | Slimmer / Fuller |
| Jaw | Chin | -1...1 | Shorter / Longer |
| Jaw | Size | -1...1 | Smaller / Larger |
| Jaw | Define | 0...1 | Original / Defined |
| Jaw | Length | -1...1 | Shorter / Longer |
| Nose | Size | -1...1 | Smaller / Larger |
| Nose | Width | -1...1 | Narrower / Wider |
| Nose | Narrow | 0...1 | Original / Slimmer |
| Nose | Lift | -1...1 | Down / Up |
| Nose | Tip | -1...1 | Smaller / Larger |
| Eyes | Size | -1...1 | Smaller / Larger |
| Eyes | Width | -1...1 | Shorter / Longer |
| Eyes | Height | -1...1 | Less open / More open |
| Eyes | Tilt | -1...1 | Down / Up |
| Eyes | Distance | -1...1 | Closer / Farther |
| Lips | Size | -1...1 | Smaller / Larger |
| Lips | Height | -1...1 | Thinner / Fuller |
| Lips | Width | -1...1 | Narrower / Wider |
| Eyebrows | Thick | -1...1 | Thinner / Thicker |
| Eyebrows | Lift | -1...1 | Down / Up |
| Eyebrows | Shape | -1...1 | Flatter / Arched |
| Eyebrows | Tilt | -1...1 | Down / Up |
| Eyebrows | Raise | -1...1 | Lower / Higher |
| Forehead | Height | -1...1 | Lower / Higher |

Every scalar neutral remains 0. Face/Head Size and Width retain their original shared properties. There are 34 subtab entries, 33 slider presentations and 32 unique feature mappings including Position.

## Behavior checks

Source comparison against `de9803a` confirmed:

- Category/subtab order and memory, feature mappings, key paths, ranges, original hints and mesh guards are unchanged. Jawline and Eyes Size retain their landmark fallback; the other features retain their mesh requirement.
- `EditorModel.swift`, `Adjustments.swift`, `FaceAnalyzer.swift`, shaders, theme, video, camera and tests are unchanged. Native per-face shape storage, `storeShape()`, `showSliders(_:)`, undo/redo snapshots and rendering remain intact.
- Every original render-on-change callback, canvas/Position overlay and gesture region is unchanged. Position still calls its original two-axis reset and uses `positionMoved`; no value badge or slider is invented for Position.
- Scalar Reset still calls `sliderEditing(true)`, assigns only its current key path to 0, then calls `sliderEditing(false)`. Its disabled threshold remains `< 0.001`; edit dots remain based on the existing `> 0.001` comparisons.
- Reset all still invokes `resetFaceSliders()` with its original availability and all-Face shape scope for the selected face, keeping Retouch and other faces. Busy, no-face and missing-mapping guidance share the approved footer.

Browser interaction checks confirmed the reference simulation retains shared Face/Head values, independent per-face settings, selected Reset versus all-Face Reset all scope, Position reset/undo, one undo per slider edit, redo and remembered subtabs. Examples: Face 1 Size +18 reset to 0 and Head Size showed 0; Undo restored +18; Face 2 retained -24. Reset all on Face 1 also cleared Nose Width while Face 2 retained its Nose value. Position reset removed its edit dot and Undo restored it. Returning to Eyebrows remembered Shape.

The browser reference retained 184/449 px panel/canvas geometry, 44 px reset targets and the 4 px reset-row gap in all tested states. Short endpoint text fits within the existing footer at narrow widths. The browser warning/error log was empty. These measurements approximate default-size native points; they are not native device measurements.

## Native checks still required

This Windows host has no Swift/Xcode toolchain, simulator or device session. No native build, XCTest or native appearance verification was performed. On the Mac, build/install `ui-a`, then verify every inventory row in light/dark, including VoiceOver, Dynamic Type through the current xLarge cap, native disabled/pressed states, retained values, slider/selected-reset/Reset-all undo/redo and real per-face switching. Drag Position's existing oval, cancel with a second finger, reset it, undo/redo, and confirm its reach, guides and canvas gestures remain unchanged. Check native panel/canvas geometry with multi-face captions and larger text.

Private browser reference: `design/mockups/yumiro-face-controls-local.html`. It derives its inventory/guidance from native source and reuses the approved Nose styles and existing supplied photo. It is ignored by Git and must not be force-added or published. It simulates controls/history; it does not run native effects or replace device verification.
