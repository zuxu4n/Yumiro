# Shared Background mask correction proposals

Reviewed design handoff prepared on 2026-10-27 in ui-a. The final compact layout incorporates the user's density, text-removal and spacing revisions. This handoff publishes the design only; no application source is changed. The target remains the controls shared by Background Blur and Remove: mode selection, brush size, size reset and Reset Fixes.

## Compact revision

- One 44 pt row contains the native-style View / Brush / Erase picker and a 96×44 pt Reset Fixes action.
- One 44 pt row contains Size, the slider, the existing 44×32 value badge and a 44×44 size Reset. The user's density correction supersedes the earlier Reset-below-value placement for this proposal. Fonts, badge/reset surfaces and semantic colors retain the approved Heal treatment.
- The user then requested removal of “Adds foreground” and “Transparent PNG.” The mode/export footer and its space are removed. Foreground/background semantics remain in mode accessible labels/tooltips; Clear's full PNG explanation remains in its accessible label/tooltip.
- Removed mode descriptions, repeated paint instructions, Smaller/Larger, gesture guidance, fixes-status sentences, separate export paragraphs and the descriptive alternative. Reset Fixes availability already indicates whether fixes exist.

Both reset actions keep their separate meanings and availability. Selection remains visible through native segment shape and semibold text. No control target was reduced below 44 pt.

At 390×844 the revised painting panel is 228 pt and the canvas is 405 pt, replacing the rejected 390/243 allocation. The budget is 32 pt Background tabs + 4 pt extra margin below those tabs + 68 pt existing context + 92 pt correction region + two 4 pt gaps + 24 pt padding. This gives the background choices an 8 pt gap below the tabs, following the user's spacing correction. The correction region remains two 44 pt control rows with a 4 pt gap. These are browser reference sizes, not verified native constraints.

View hides the size row and foreground overlay. Its panel uses the existing 184 pt editor minimum and the canvas grows to 449 pt. Reset Fixes stays reachable. Showing Reset Fixes in View expands its placement from the current source, which only shows it in painting modes; its action and undo scope would remain unchanged.

## Mobbin references

Compact modes uses the mode strip and nearby size control in [CapCut custom removal](https://mobbin.com/screens/0fce915d-55c0-45d7-b1d1-d9ce6565240e) and the labeled Add/Erase mode row in [Pinterest cutout editing](https://mobbin.com/screens/7f107ad3-8e3b-4cdd-87a3-897c36601226). CapCut's screen edits video; it supplies control arrangement only. Neither supplies Yumiro's painting semantics or styling.

The rejected Descriptive modes alternative used separate correction actions from [Telegram Erase/Restore](https://mobbin.com/screens/6bac1a5b-75e9-49be-9ae2-732708167b4d) and explicit add/subtract actions in [Edits cutout editing](https://mobbin.com/screens/7abafe9b-5c55-471d-8844-073c246e49b4). It is no longer shown in the current preview.

## Behavior contract

- **View** is a presentation rename of the current “Auto” mode. It disables painting and hides the foreground overlay; it does not clear fixes.
- **Brush** adds areas to the foreground (writes 255). **Erase** marks areas as background (writes 0), rather than restoring automatic detection. Both show the same pink foreground tint and opaque white boundary. The overlay depicts all foreground, not only edits. The preview mask is illustrative and is not detector output.
- Background brush range remains `0.005...0.15`, default/reset `.04`, normalized unitless display **24**. Do not copy Heal's default 28 or add px/% units. Size Reset is unavailable at `abs(size - .04) < .001` or busy. Size changes/reset do not create image undo steps. The existing temporary centered size ring appears only while adjusting size.
- **Reset Fixes** replaces the ambiguous “Reset” label. It calls the existing `resetBlurEdits()`, clears all manual corrections to the automatic mask and creates one undo step. It retains mode, brush size, Blur strength and background choice. It is disabled when `blurEdits.isEmpty || busy != nil`.
- Each completed paint stroke retains one undo step. Undo/redo restores fixes/matte, not mode or brush size. Normalized/resized corrections carry between both Background panels, after Enhance/Heal, and into full-resolution exports.
- Switching Remove to Blur retains Clear/White/Black. Strength stays disabled until removal is Off. The mockup does not silently switch that choice. First opening Remove still has its existing Clear selection behavior.
- Processing represents the existing Saving busy lock. Keep the selected mode, size, fixes and overlay visible; disable editor interaction and show the existing Saving badge. Ordinary asynchronous matte rebuilding after strokes does not acquire a new busy lock. Detecting people remains separate and retains the existing nil-matte mode-picker guard; this optional state is not added to the required four-state review.

## Review states and local preview

The state picker offers Ready with no fixes (size24), Edited with fixes (size45), No fixes with a changed size (Erase, size45), and Saving, which retains mode, size and fixes. View/Brush/Erase, Blur/Remove, background choices, size/reset and illustrative history remain interactive. The preview does not run painting, segmentation or export.

Private preview: `design/mockups/yumiro-mask-correction-options-local.html`. It embeds the already supplied portrait and stays ignored by Git. Do not force-add it. A byte-identical regular-file copy in the active chat's display cache is used for inline display because OneDrive source files have failed direct inline reads before.

Application implementation and native Xcode/device, Dynamic Type, VoiceOver, painting/overlay, history and export validation remain pending. This design handoff does not implement the controls.

## Preview verification

The final spacing review measured an 8 pt gap below the Background tabs and evenly spaced swatch centers. Footer-removal checks passed in View, Brush and Erase. The final painting panel/canvas measured 228/405; View retains the 184/449 allocation. Application source remained unchanged.

The earlier compact revision passed 16 browser combinations across four states, Blur/Remove and light/dark, plus six narrow-width checks covering all three modes in both appearances. Those checks measured the former 248/385 and 200/433 allocations, before the final footer removal. Mode/reset targets remained at least 44 pt and no browser warnings or errors were observed.

The earlier rejected layouts passed 32 state/context/appearance combinations and 12 narrow checks before the density revision. Those results describe the previous geometry only.

Interactive checks confirmed that mode/size/fixes carry from Remove to Blur and back; Clear keeps Strength unavailable; selecting Off makes Strength available; Reset Fixes retains mode/size and can be undone/redone; size Reset remains outside image history; View hides painting controls/overlay but retains fixes; and Saving preserves the active mode/value/fixes. A preview-only state-persistence issue that cleared the simulated history was corrected and these history checks passed afterward. These are checks of the illustrative browser preview, not native processing tests.
