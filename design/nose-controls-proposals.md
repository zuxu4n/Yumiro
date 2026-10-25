# Nose controls: approved Direction words implementation

Updated 2026-10-25 (America/Toronto), branch `ui-a`. The user selected Direction words, requested shorter endpoints, then explicitly requested commit/push. The approved Nose presentation is implemented in `ContentView.swift`; Inline guidance remains an alternative.

Read `DESIGN.md` and the approved Eyes implementation before continuing. Private preview: `design/mockups/yumiro-nose-controls-local.html`. It reuses the supplied photograph embedded in the existing Eyes preview and is ignored by Git. Never force-add or publish that preview or its photo.

The user selected **Direction words** and requested shorter endpoints, for example Smaller nose → Smaller. The revised mockup opens on that direction, and native controls use the same short words.

## Guidance options

- **Direction words (selected):** retain the Eyes endpoint-only presentation with short pairs: Smaller / Larger, Narrower / Wider, Original / Slimmer, Down / Up, and Smaller / Larger. Each option also has its explanation in its accessible description and preview tooltip.
- **Inline guidance (alternative):** keep the approved Eyes wide slider, value badge, selected Reset, endpoint words and Reset all; add one concise explanation on the second line of the existing 28 pt footer. The selected option in the approved rail provides the adjustment label.

Both proposals preserve the approved Stacked rails, their original conditional edit dots and scrolling, 44 pt slider interaction row, 44 x 32 pt value badge with 10 pt corners, 44 x 44 pt Reset with 14 pt corners, 8 pt accessory gaps, 4 pt reset-row gap, and 8/12/16 pt top/bottom/horizontal panel insets. The default single-face mockup panel/canvas stay 184/449 px inside the original 844 px phone shell. No title is duplicated beside the wide slider.

## Existing controls and proposed copy

| Existing rail label | Model property | Concise explanation | Left / right endpoint | Internal range | Display range | Neutral |
|---|---|---|---|---|---|---|
| Size | `noseSize` | Scales the whole nose. | Smaller / Larger | -1...1 | -100...+100 | 0, center |
| Width | `noseWidth` | Adjusts nostrils and wings. | Narrower / Wider | -1...1 | -100...+100 | 0, center |
| Narrow | `nose` | Slims the nose bridge. | Original / Slimmer | 0...1 | 0...100 | 0, left edge |
| Lift | `noseLift` | Moves the tip down or up. | Down / Up | -1...1 | -100...+100 | 0, center |
| Tip | `noseTip` | Changes the nose tip size. | Smaller / Larger | -1...1 | -100...+100 | 0, center |

Width affects nostrils and wings; Narrow affects the bridge. Lift changes tip position; Tip changes tip size. These distinctions were checked against `FaceAnalyzer.swift` and the current feature hints. The bridge control is one-way: never add a negative direction, center catch, midpoint neutral, or signed positive display to Narrow. Its neutral marker sits at the left edge. The other four retain the shared continuous ValueSlider range, signed output, zero catch at `abs(v) < 0.03`, and existing haptic behavior. Do not add stepping or quantization.

## States and behavior to preserve

The preview offers light/dark appearance and default, adjusted, missing mapping, processing, and no-face states. Adjusted examples are Size +18, Width -12, Narrow 32, Lift -16, and Tip +10. Unavailable states keep values, selection and edit dots visible. The photo, canvas dimensions, guides, approved top bar, other categories and main tool rail are reused for context.

All five Nose controls currently require a selected face mesh, including Narrow. The `selectedHasMesh` comment in EditorModel is older than the operative `FaceFeature.needsMesh` implementation; preserve the implementation. Missing mapping leaves option navigation enabled but disables the slider and selected Reset. Processing retains the editor-wide lock. Reset all keeps its existing checks and remains available with retained Face edits when mapping alone is missing.

- Selected Reset changes only that adjustment to 0. Keep its original `abs(value) < 0.001` disabled check; edited dots use `abs(value) > 0.001`. Do not derive either from the rounded readout.
- Reset all retains `resetFaceSliders()` and its scope over every Face shape setting on the selected face. Preserve that face's Retouch values and other faces. Do not introduce a Nose-only or all-faces reset.
- Keep the existing Binding key paths, all five render-on-change callbacks, `sliderShape(keeping:)`, `storeShape()`, and `showSliders(_:)`. Values remain per face.
- Each drag and actual Reset remains one undo step through `model.sliderEditing(true/false)`. Preserve history snapshots, render callbacks, and native Undo/Redo availability.
- Keep tap-on-canvas face selection and the existing multi-face caption. No product face picker is proposed. The mockup's optional Face context sample is a review setting only; the single-person photo and guide geometry remain fixed. With multi-face context, its existing caption takes the second footer line and explanations remain available through the option's accessible description/tooltip.
- The prototype includes local Undo/Redo and separate face records to review interaction intent; it does not execute native effects. A preview preset starts a fresh sample history. Switching appearance or guidance option does not clear edits.

## Focused Mobbin references

- [VSCO strength adjustment](https://mobbin.com/screens/62d0dba7-72e7-4dfb-a691-a986a789b5df): a focused slider, numeric strength, and adjacent adjustment choices.
- [VSCO white balance](https://mobbin.com/screens/db2178a7-c420-4fb0-a0db-7bf067340d69): a signed readout and visible neutral reference. Only the neutral-reference principle informs the Nose proposal; Yumiro retains the approved Eyes controls.

Reference previews were inspected. No Mobbin image or application asset was imported.

## Validation boundary

JavaScript syntax and browser layout/interaction checks apply to the private prototype. No Xcode build, XCTest, native rendering test, device screenshot, or native Dynamic Type result is available on this Windows host. The native change only opts Nose into the approved focused controls, with short direction words, unsigned one-way output and a leading neutral marker for Narrow. It shares the existing Eyes layout without changing Eyes presentation. Native model/history, shared ValueSlider, renderer, other Face controls and canvas are unchanged.

Completed browser checks:

- Both guidance options show default, adjusted and missing-mapping states in light/dark; Inline guidance also covers processing and no-face states in both appearances. Missing mapping retains Narrow 32 with its slider/reset disabled and option navigation available. Processing disables controls/navigation and retains values.
- The panel/canvas measure 184/449 px and the reset-row gap is 4 px. At a 320 px browser viewport all five Inline guidance explanations fit, the native-style reset target stays 44 px, and panel/canvas dimensions remain unchanged. The narrow Direction words unavailable caption also fits its footer.
- Selected Reset changed Face 1's Narrow from 32 to 0 while Face 2 retained 14. Returning to Face 1 retained 0; Undo restored 32, Redo restored 0, and Width retained -12. Moving Width to +100 and pressing Undo once restored -12.
- Browser error/warning log was empty. JavaScript syntax validation passed. The preview's local history ignores host state echoes so saving preview state does not clear Undo/Redo.

Native implementation source checks passed: after substituting the shared helper's Eyes parameters, its original layout, value output, accessibility text and callbacks match the prior Eyes implementation. Everything outside the Nose opt-in/padding and focused presentation helpers matches HEAD, including navigation, feature inventory/mappings/ranges, other Face controls, canvas and gestures. `Adjustments.swift`, `EditorModel.swift`, `FaceAnalyzer.swift`, shaders, theme, video and tests have no changes. Whitespace checks passed. Native build and device validation remain pending on the Mac.
