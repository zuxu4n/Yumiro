# Remove Background: Labeled swatches

Selected by the user on 2026-10-27 after reviewing two editor-context mockups. The selected presentation is implemented in `PhotoStudio/ContentView.swift`. Preview tiles remains an unselected alternative. No separate approved Blur redesign was found in the inspected chats or worktree, so the proposals reuse current Blur/Refine controls and the approved shared editor styling.

## References

- [Unfold background swatches](https://mobbin.com/screens/0920ff5f-eacd-4f71-9b01-55cb2f4dd3b2): circular background swatches and an outer selected ring.
- [Depop background choices](https://mobbin.com/screens/a0073193-a947-41cd-b4ff-d0b8e63db63a): visible labels beneath background swatches. Its photo editor is the referenced region.
- The unselected Preview tiles proposal used [Photoroom](https://mobbin.com/screens/c40937f8-672c-46db-92b4-8d4d83a827aa) for background previews and [Shopee](https://mobbin.com/screens/a414c310-cb0f-48ae-ad41-22940d946d0f) for thumbnail selection borders. Neither supplies the selected implementation's layout.

Use Yumiro's semantic colors, system typography, SF Symbols, spacing and existing button state treatment. New wording and the selected check placement are design decisions for this panel. The references supply picker structure only.

## Selected presentation

- Preserve Off, Clear, White and Black in their original order. Equal-width buttons have a minimum 68 pt height and a 36 pt circular swatch within a 44 pt slot. Footnote labels, 14 pt corners and a 12% accent selection backing reuse the editor's styling. Selected choices add an outer ring and check; `.isSelected` exposes selection to VoiceOver. White and Black have neutral borders in both appearances.
- Clear's decorative swatch uses the same approximate neutral checker values as the real preview, 0.78/0.94, in both appearances. Checkerboard pixels remain preview-only. “Clear saves a transparent PNG.” appears separately from detection/correction guidance and is included in the accessible hint.
- Detecting keeps the current photo visible, shows “Detecting people…” with a small progress indicator, and leaves choices available unless the existing editor busy lock applies. Save retains its existing availability. A nil matte before detection starts receives a truthful pending message.
- Auto with a person matte says “Ready. Everyone found is kept.” Auto with no person says “No person found. Use Brush to paint what to keep.” Off says “Background removal is off.” Brush and Erase retain the original correction guidance. Clear's export explanation remains visible in each case.
- Guidance uses minimum height and wrapping, so the normal ready state and no-person state can fit without a fixed native height or truncating the export note. The existing xLarge editor Dynamic Type cap remains. The browser review's 224 pt panel allocation is illustrative, not a native frame constraint.

## Preserved behavior

Only Remove's picker and guidance are replaced. `setBackground(choice)` remains the sole picker action. No new binding, render callback, image-processing task or history operation is introduced. Re-selecting the current choice remains a model no-op; changing choices retains one undo step.

First opening Remove still selects Clear. Off retains any existing Blur strength. Clear/White/Black keep their existing rendering precedence. The existing model owns the checkerboard canvas preview, true-alpha PNG export for Clear, filled export for White/Black, full-resolution masking and guided edge refinement.

Blur Strength, the Background segmented picker, Refine Auto/Brush/Erase, the matte-availability guard, Brush size, correction Reset, overlays and gestures retain their code. A no-person matte still permits Brush recovery. Finding people does not acquire a new busy lock. Segmentation, export and undo/redo source files are unchanged.

## Verification

The design preview passed 48 browser combinations: two layouts × four choices × three detection states × light/dark. The final preview passed 12 narrow layout/state/appearance checks, including hidden cutouts while detecting/no-person in Preview tiles and readable no-person/PNG copy. These checks validate browser mockups, not native image processing.

The private preview is `design/mockups/yumiro-remove-background-options-local.html`, ignored because it embeds the supplied photo. Do not add it to Git. Application code uses generated checker squares and SF Symbols, with no embedded portrait or browser assets.

Implementation verification passed `git diff --check` and a source comparison: reversing the picker/guidance substitutions and removing the new helpers restores `ContentView.swift` byte-for-byte. Model, segmentation, export and history files have no diff. Independent review found no actionable issues.

Native build, device layout, Dynamic Type and VoiceOver require Xcode. On a Mac, check both appearances at narrow widths and xLarge; all four choices and their selected announcements; detecting/ready/no-person states; Brush recovery and Reset; choice undo/redo; first-open Clear; Off retaining Blur; and saving Clear as transparent PNG versus White/Black as filled output. Keep the real canvas checkerboard and segmentation edges under review separately from the illustrative mockup cutout.
