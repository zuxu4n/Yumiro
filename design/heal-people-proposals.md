# Heal selection panel proposals

Design review in `ui-a`; no application code was edited by this review. The interactive preview covers People, Brush and Erase, using the latest approved Spot panel as the styling reference, including Reset below the value.

## Selected revision: Compact actions with a stable photo

The user selected Compact actions and requested that tab switching keep the picture size unchanged. The current mockup now shows this direction alone. All four Heal tabs share a 250 pt panel allocation at the default text size. People uses the same photo bounds as Brush and Erase, and the selection action row stays pinned to the same bottom position. The approved Spot controls are included as unchanged context inside that shared allocation so the full tab transition can be reviewed; Spot gets no selection actions or mask.

Only the panel content changes on tab switches. The photo's size, position, and fit remain identical, and selection state is retained across switches. For a later native implementation, use a common height sufficient for the largest tab at the current available width and Dynamic Type size; never derive the canvas allocation from only the active tab. Keep existing zoom/pan transforms and all processing/history behavior intact.

Revision checks: all four tabs × five states × light/dark × three phone sizes passed (120 combinations). Photo bounds were identical across all tabs and states at each screen size. The selection action row stayed fixed across People, Brush and Erase, controls fit with 44 pt targets, and no JavaScript page errors occurred. Clicking People → Brush → Erase → Spot → People also produced identical photo bounds throughout. These checks supersede the varying panel-height measurements in the earlier comparison below.

## Previous layout comparison

- **Compact actions** (recommended): one action row with Add Shadow, Clear and a prominent Remove. Keeps more of the photo visible, especially while using Brush or Erase.
- **Full-width Remove**: a secondary row for Clear selection and Add Shadow, followed by a full-width Remove. Stronger action hierarchy, with a taller panel.

Both keep the existing segmented Heal picker, semantic light/dark palette, 15 pt control text, 13 pt guidance, 44 pt interaction targets, and the latest approved Spot placement: slider and value on one row, with Reset directly below the value. Brush size retains its label and Smaller/Larger endpoints aligned to the slider, reserving a 52 pt accessory column (44 pt plus 8 pt gap). The footer grows to 58 pt to fit two lines of selection guidance. Clear is labeled “Clear selection” for accessibility. Remove is the only filled primary panel action when a selection exists. Without a selection, all three selection actions remain visible and disabled.

## References inspected on Mobbin

- [Google Photos Magic Eraser](https://mobbin.com/screens/07f63521-92d7-4e09-ade5-0ec71d4aa40f): brief action guidance near the canvas. Yumiro keeps its own tap behavior.
- [VSCO Remove](https://mobbin.com/screens/db1ce4db-f435-46ee-8b27-4ad798743dd3): concise selection guidance and a clearly labeled brush size control.
- [CapCut custom removal](https://mobbin.com/screens/0fce915d-55c0-45d7-b1d1-d9ce6565240e): adjacent Brush and Erase modes plus a size slider. No new modes are imported.
- [Pinterest selection editing](https://mobbin.com/screens/7f107ad3-8e3b-4cdd-87a3-897c36601226): explicit add/erase tools and a visible selection boundary. Yumiro retains its existing pink mask and white outline.

## States

| State | Guidance and availability |
| --- | --- |
| No selection | People: “Tap a person to select them. Tap the outline again to remove.” Selection actions disabled. Brush/Erase size stays available. |
| Selection ready | People: “Tap another person to add them. Tap the outline or Remove to remove.” Remove primary; Clear and Add Shadow secondary. |
| Finding people | Represents the existing foreground tap lookup: centered delayed “Finding the person…” badge. Existing selection remains visible; editor interactions disabled while `busy` is set. |
| Removing | Existing selection remains visible, centered delayed “Removing…” badge. Controls disabled; no invented percent, cancellation, or additional confirmation. |
| No person found | “No person found there. Try another person or use Brush.” This is a missed tap, not proof the entire image has no people. Existing selection, if any, is retained and remains removable. |

Brush guidance: “Paint to add to the selection. Two fingers move and zoom.” Erase guidance: “Paint to trim the selection. Two fingers move and zoom.” Without a selection, Erase guides users to People or Brush first. The no-person-found message is contextual to People; switching to Brush/Erase restores that mode's guidance.

## Behavior contract for any later implementation

- No detector, segmentation, selection geometry, mask growth, overlay rendering, gesture, processing, or history changes. The preview's manually traced mask is illustrative, not detector output.
- People taps still add an unselected person; tapping inside the existing mask still removes it immediately. There is no new confirmation step, tap-to-toggle, person count, or select-all control.
- Automatic `preparePeople()` prewarming remains nonblocking. Its task is distinct from foreground `peopleTap` busy state and from Background's `findingPeople` property. Do not make background prewarming disable Brush or Erase.
- The selection persists when changing between People, Brush and Erase. Existing masks use pink `(255,60,90,95)` and an opaque white edge. Preserve compare visibility, pinch/pan behavior, and the size-editing-only brush ring.
- Preserve continuous raw brush range `0.004...0.08`, default/reset `0.025`, and unitless normalized display 0–100 (default 28). Reset only changes size and adds no undo step. Reset availability retains the 0.001 tolerance.
- Clear only clears the selection. Add Shadow keeps its existing asynchronous action, busy badge, successful and no-shadow feedback. No new undo entry is added for selection changes or size edits.
- Remove keeps existing full-resolution processing, retained selection on failure, one pixel undo step on success, clearing the successful selection, and undo/redo behavior. Keep the editor history controls in their approved location.
- Other panels, Spot, the tool rail, top bar, Compare/Fit, saving and existing toasts remain outside the redesign. They appear only as editor context in the preview.
- The no-person-found panel hint is presentation of the existing missed-tap result, cleared on successful selection or mode change. It must never be inferred from an empty detector cache or hijack unrelated `info` messages.

## Preview

`design/mockups/yumiro-heal-selection-options-local.html` is the private review source. Its rendered companion is `design/mockups/yumiro-heal-selection-editor-local.html`. Both are ignored by Git because they reuse the existing supplied portrait. Do not force-add these previews.

Inline display fix: the OneDrive source has the Windows `ReparsePoint` attribute, and referencing it directly produced “Invalid visualization read request.” Keep the editable source in `ui-a`, but refresh a byte-identical regular-file copy in this chat's visualization cache for inline responses: `C:/Users/Jason/.codex/visualizations/2026/10/26/01a17641-5db9-7dc0-83c2-92b672843381/yumiro-heal-selection-options-local.html`. This cache is only for rendering; do not edit it as an independent design source. The copy's SHA-256 matches the source, has no reparse-point attribute, and passes the visualization fragment renderer.

Native iOS rendering, Dynamic Type and VoiceOver remain implementation-time checks. This design review does not run person detection or image removal.

## Verification

Browser checks passed for both layouts × People/Brush/Erase × five states × light/dark × 390×844, 375×667 and 320×568 (180 combinations). All panel controls fit with 44 pt targets. Value and Reset centers align, Reset sits below the value, and endpoint labels align with the slider. The rendered page also fits a 320 px host width without horizontal overflow. No JavaScript page errors occurred.

At base size, Compact actions uses a 188 pt People panel and 250 pt Brush/Erase panels. Full-width Remove uses 240 pt and 302 pt respectively. Compact actions leaves 52 pt more photo space. The most constrained full-width specimen leaves 126 pt of canvas, reinforcing the compact recommendation.

Interaction checks confirmed: a missed tap can retain an existing selection with Remove enabled; Clear disables all selection actions; Reset restores 28; processing disables interaction and preserves the mask; centered busy feedback appears after 300 ms. The preview demonstrates People selection and removal-state transitions, slider sizing, Clear, and Add Shadow's busy presentation. It does not execute detection, paint strokes, shadow inference, image removal, or history operations. Native undo/redo remains unchanged and appears as static editor context.

Private QA screenshots and results are in `design/mockups/.heal-selection-review/`, with a local ignore file. The repository status check showed no modified tracked application files; only this design note was untracked. Spot's separately approved implementation is outside this review.
