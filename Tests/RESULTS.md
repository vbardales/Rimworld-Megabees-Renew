# Validation results — 2026-09-13

Base revision: `96b1f2859cd5cc15798fa2fdd3a36c2e6efaec61` plus local audit fixes.
`delivered-sha256.json` identifies every file under Mod/ at validation time.
No gameplay Defs changed. No commit, push or Workshop publication performed.

| Check | Command / method | Result |
| --- | --- | --- |
| XML/resources | `python -m unittest discover -s Tests -v` | 6 tests passed: syntax/duplicate identities, exhaustive owned text inventory/resources, metadata/attribution parity, production references and migration field, PNG constraints, absence of empty settings. |
| Native translation paths | `powershell -NoProfile -ExecutionPolicy Bypass -File ../scripts/Check-DefInjected.ps1 -TransMod Mod` | 40 keys checked, 0 errors, exit 0; installed RimWorld 1.6.4871 rev590. See DefInjected-results.txt. Process-only execution policy flag; no system policy changed. |
| First translation run | Same checker before correction | 2 errors: brood labels incorrectly used numeric index. Corrected to brood handle, regenerated and rerun successfully. |
| Color parsing concern | ilspycmd with DOTNET_ROLL_FORWARD=Major; inspected installed Verse.ParseHelper and Verse.GenColor | ParseColor trims repeated parentheses; numeric 256 accepted and divided by 255. Gameplay source preserved. This is code inspection, not in-game execution. |
| Visual QA | Direct full-size and thumbnail inspections | Preview 896 x 504 / 268 px; icon 128 / 32 px. Title and version readable, subject clear, no clipping observed. |
| Contrast | Sampled background-only render throughout text rectangles | Title 11.42, suffix 9.39, tag 9.48, summary 11.45; Segoe UI available. See Art/contrast-results.json. |
| Build | File inventory | Not applicable: no custom C# or assembly. |
| Game scenarios | TEST_SCENARIOS.md | NOT RUN. No logs, language UI, new game or existing save pass claimed. |

The portable suite does not emulate all of RimWorld's XML inheritance or UI behavior.
The separate shared checker validates actual translation field paths with reflected
game classes. Final game validation remains required for `tested`.
