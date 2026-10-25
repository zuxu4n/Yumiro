# Home screen — Quick start

2026-10-25 · ui-a · selected explicitly by the user after reviewing both mockups.

## Implemented

Only the HomeView portion of PhotoStudio/HomeView.swift changes. WelcomeView and AboutView remain identical to the pre-change file. Existing editor/design edits in the worktree belong to other work and are not part of this change.

- Blue Edit a Photo is primary (68-point minimum height, title3 bold).
- Camera and Edit a Video use neutral, 56-point minimum targets immediately below it.
- All eight shortcuts retain their existing names, SF Symbols, descriptions and order from Tool.groups: Enhance/Adjust; Smooth/Retouch/Face/Warp; Heal/Background. Two-column tiles have 72-point minimum heights and 12-point padding.
- The fixed header retains Yumiro and the 44 × 44 About action. The content scrolls to accommodate smaller phones and larger text.
- Native semantic colors, system fonts, 14-point corners, 16-point content insets and 70% pressed opacity follow the approved editor styling. Home-only button styling does not change shared components.
- Dynamic Type is uncapped. Secondary actions and tools switch to one column at xxLarge and above. Text wraps without fixed label heights or forced shrinking.
- Tool buttons expose their names/descriptions as one label with the existing choose-photo hint.

## Behavior preserved

Edit a Photo still calls openPhoto(nil), keeping the existing model-tool selection behavior. Each tool still calls openPhoto(tool). Camera and video use their unchanged callbacks. No recent-photo library, new tabs, templates, automatic edits or destinations are introduced.

The home disables all actions, including About, whenever busy is non-nil. DelayedPresence and BusyBadge are unchanged: the existing Opening… indicator appears after 300 ms, without a percentage or Cancel. Existing picker transfer and errors remain owned by ContentView/EditorModel.

About still opens its existing sheet; showing the welcome again remains deferred until that sheet dismisses. Onboarding, editor, camera, video editor, model behavior, shared controls and signing are outside this implementation.

## Research and review artifact

- [Photoroom home](https://mobbin.com/screens/3cfc75ba-70f3-4d5e-9c79-f6328b569a3d): distinct photo entry alongside tool choices.
- [CapCut editing home](https://mobbin.com/screens/58984ebf-3e01-469c-ae98-a8e1caec2fdd): labeled shortcuts and a prominent primary action in a mixed photo/video app.
- [VSCO Studio](https://mobbin.com/screens/ffc69f16-60cd-4285-af73-e160d5ee648f): restrained framing and a distinct start control.

The references informed hierarchy only; Yumiro's approved editor remains the visual source of truth.

Local review fragment: design/mockups/yumiro-home-options-local.html (ignored). It contains Quick start and the unselected Guided list alternative. The inline viewer uses a byte-identical regular-file copy at C:/Users/Jason/.codex/visualizations/2026/10/25/01a17303-4c89-7020-8c3c-f782194262fa/yumiro-home-options-local.html. Direct worktree references produced Invalid visualization read request; use the chat-owned regular copy when presenting it again.

## Verification and remaining native checks

- Independent source review found no actionable routing, scope, SwiftUI structure, or target-size issues.
- git diff --check passed for HomeView and this note. Welcome/About preservation was checked during the edit and against HEAD.
- The reviewed browser mockups were checked at 320 × 568, 375 × 667 and 390 × 844, light/dark, default/140% text: no horizontal text overflow and no controls smaller than 44 points. Those measurements are browser evidence, not native app measurements.
- This Windows host has no Swift compiler or Xcode. Native compilation, XCTest and actual device behavior have not been verified.

On the Mac, build/install the ui-a variant using the existing tools/install_variant.sh a workflow. Check the home on a small iPhone in both appearances, normal and accessibility Dynamic Type, all eight tool entry points, generic Edit a Photo after changing tools, Camera, video, loading and errors. Verify VoiceOver labels/order, scrolling to the last tools/privacy text, About dismissal, and Show the welcome again. Confirm the editor, camera, video and onboarding retain their existing behavior.