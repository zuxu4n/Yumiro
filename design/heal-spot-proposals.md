# Heal → Spot proposals

Updated 2026-10-26. Implemented in `ui-a` after the user approved Face-style controls, requested Reset below the number, then requested commit and push. Only Spot presentation in `PhotoStudio/ContentView.swift` changed. The private preview remains a design reference; native build/device validation is pending.

## Current revision: Reset below the value

The user requested the circular brush Reset below the number. The slider/value row stays 44 pt high; a 44 pt footer places Reset directly under the badge. Endpoint words and guidance occupy the left footer column, aligned to the wider slider. The field's top gap is 4 pt, retaining the 184 pt panel: 24 padding + 44 picker + 4 gap + 20 label + 44 controls + 4 gap + 44 footer. Value/reset geometry and all behavior are unchanged. This supersedes the adjacent Reset placement below.

Placement QA: 12 browser combinations (light/dark × ready/healing/saving × 320/390 px widths) passed. Reset's center aligns with the value badge, its 44×44 target is below the badge without overlap, endpoint labels align with the slider, and normal/busy guidance fits. Reset still restores 28 and disables itself. No browser warnings/errors. These are mockup checks, not native iOS measurements.

## Implementation

`healSpotPanel` reuses `ValueSlider`, `adjustmentValueBadge` and `adjustmentResetControl`. It retains raw brush range `0.004...0.08`, default `.025`, the original `< .001` reset-disabled threshold, and the existing `sliding`/`brushRing` editing callbacks. Slider changes and Reset do not call `sliderEditing` or create image undo steps. The mode picker remains `ModeTabs` with the same items and selection binding. Other Heal modes use their original branch unchanged. No model, shared-slider, overlay, gesture, camera, video or onboarding code changed.

The native panel uses minimum heights for text/footer content to allow Dynamic Type wrapping while retaining the existing 184 pt minimum. `git diff --check` passed. A source comparison confirmed the non-Spot Heal branch is unchanged apart from indentation and all other `ContentView` code is unchanged apart from shared-control comments. No other app source file changed. Independent review found no actionable issues. Xcode/XCTest are unavailable on this Windows host.

## Previous revision: Face slider styling

Use the approved Face slider → value → reset row, 44 pt high with 8 pt gaps. Align “Smaller” and “Larger” under the slider ends, 4 pt below the row, reserving the same 104 pt accessory column. Keep “Brush size” above because Spot's mode label does not name this parameter. A separate 13 pt guidance line reads “Tap a spot to heal. Pinch to zoom.” Busy guidance reads “Available when processing finishes.”

The exact base-size budget is 24 pt panel padding + 44 picker + 8 gap + 20 label + 44 controls + 4 gap + 18 endpoints + 4 gap + 18 guidance = 184 pt. Value/reset shape, typography, neutral/edited/disabled treatment match the shared Face controls. The brush remains continuous and unipolar, with default 28; no Face zero marker, center catch or Reset all is added. Heal's existing segmented mode picker remains unchanged.

The two alternatives below are historical; the latest preview supersedes both with this requested revision.

Revision QA: all 18 combinations of light/dark × ready/healing/saving × the three screen sizes fit the 184 px panel. Endpoint labels align exactly with the slider column. Slider and Reset targets remain 44 px high; Reset is 44 px wide. A slider click changed the display to 50 and enabled Reset; Reset restored 28 and became unavailable. No browser warnings/errors. Keyboard End automation timed out in this revision, so that interaction was not re-certified. Native iPhone validation remains pending.

## Research

- [VSCO Remove brush control](https://mobbin.com/screens/2b5e652b-d8ab-4a5e-bd40-5d5fddfd45c6): labeled size, visible number, simple horizontal slider. Use its clear hierarchy, with Yumiro's approved value and reset treatment.
- [VSCO Remove guidance](https://mobbin.com/screens/db1ce4db-f435-46ee-8b27-4ad798743dd3): concise action guidance near the control. Its draw instruction does not apply to Spot; keep Yumiro's tap-to-heal behavior.
- [CapCut custom removal](https://mobbin.com/screens/0fce915d-55c0-45d7-b1d1-d9ce6565240e): adjacent brush sizing and Reset. This is a video removal reference; do not import its selection modes, confirmation workflow, masks, or additional tools.

## Alternatives

1. **Inline controls** — Brush size label above a row containing slider, value and Reset. Two short lines below: “Tap a spot to heal.” / “Pinch to zoom.” Reuses the approved Face/Warp control grouping.
2. **Full-width slider** — Brush size, value and Reset share the header; the slider spans the next row. One-line guidance underneath. This was the initial recommendation, superseded by the user's Face-style revision.

Both retain Heal's existing native segmented picker: Spot, People, Brush, Erase. Applying Face's blue-underlined rail only in Spot would make the picker change when switching Heal modes, so no new picker treatment is proposed. Both use the approved semantic palette, system typography, 15 pt labels/value, 13 pt guidance, 44×32 value badge, 44×44 Reset and 44 pt slider interaction height. Panel remains 184 pt at the default text size.

## Behavior contract

- Raw brush range `0.004...0.08`; default/reset `0.025`. Existing normalized unitless display is 0–100, default **28**. Never label it px or percent.
- Reset availability uses `abs(brush - 0.025) >= 0.001`, plus existing busy guard. Reset changes brush size only, retains healed pixels and creates no undo step.
- Ready allows slider/reset; Reset is unavailable at default. Processing shows the existing centered “Healing…” badge after 300 ms. Disabled is the existing “Saving…” state, with all editor interaction blocked and values retained. Spot has no face/model availability requirement.
- Keep the native segmented picker and other modes' controls/behavior unchanged. No Clear, Remove or Add shadow actions are added to Spot.
- Preserve the healing algorithm, tap-to-heal, zoom/pan recognizers, and pixel-patch undo/redo. Mockups do not perform healing or replace the actual photo.
- Existing temporary brush ring remains canvas-centered only during size editing; no persistent cursor or new overlay. Existing Compare stays bottom-left and hides while busy. Fit stays conditional on zoom > 1.01 (absent in these 1× specimens). Original stays conditional on holding Compare. Existing busy material badge stays centered on the canvas.
- Editor chrome and other modes are static context in this design preview, not navigation implementations.

## Preview and checks

Private source: `design/mockups/yumiro-heal-spot-options-local.html`, ignored by Git, reusing the previously supplied portrait. The inline response uses a byte-identical regular-file copy in this chat's visualization cache, avoiding the known OneDrive reparse-point read failure. Do not force-add the embedded photo preview.

Browser checks passed for both alternatives × light/dark × ready/healing/saving × 390×844, 375×667, 320×568 (36 combinations): panel/guidance fit, 184 px panel, 44 px slider height and Reset target, retained values, proper disabling, delayed busy badge, Compare visibility. Slider End shows 100 and enables Reset; Reset restores 28 and disables itself. No browser console warnings/errors observed.

At 320 px outer width the slider measures 182 px in Inline controls and 286 px in Full-width slider. Both preserve readable 15/13 px panel typography. Browser icons are Lucide approximations of SF Symbols, not native asset replacements. Native iOS rendering, VoiceOver and Dynamic Type validation remain pending; existing editor `.xLarge` cap is unchanged.
