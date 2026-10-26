# Functional validation — RimWorld 1.6

Disposition of the ten functional scenarios, 2026-10-02 (audit, `done -> tested`). Nothing is left as a manual test:
each row is played by an automated check, or is not applicable with its reason (AUDIT.md: not testing what the mod
does not change, not testing the game). Pickle results: `docs/runs/2026-09-29-0145956-pickle-passes.txt`; reports in
`Tests/Pickle/Evidence/` (git-ignored). The only `@review` capture was opened.

| Scenario | Disposition | Proof or reason |
| --- | --- | --- |
| Clean load | Automated, green | Pickle 08 `the load of the mod is clean` in 3 passes (tools, avec-ads2, dlc-absent); 01 spawns adult and brood. |
| Identity and stats | Partly automated, rest N/A | 01 asserts the Def and the engine reading `Wildness` (the one value this port changed); `test_mod.py` asserts `Wildness 0.80`. Body size, speed, trainability are the author's inherited values, unchanged: not retested. |
| Body and attacks | N/A | `BodyDefs.xml` byte-identical to the original; the engine resolves injuries and attacks. French labels covered by `Check-DefInjected` (40 keys) and Pickle 03. |
| Production | N/A | `Milkable`, `Shearable`, `EggLayer` are the engine's comps with the author's unchanged values; `test_mod.py` asserts every product def exists. Takes game-days. |
| Hatching | N/A | Engine `Hatcher` comp, values unchanged. |
| Salve | N/A | Recipe and costs byte-identical to the original; `test_mod.py` asserts every cost def exists. |
| Food and fabric | N/A | Vanilla systems accept the products; generated recipe text covered by 03 and `Check-DefInjected`. |
| Optional DLC | Automated, green | Pickle 06 in `dlc-absent` (guards resolve cleanly, def read the same). The anima/gauranlen behaviour with the DLC is the engine's reaction to `willNeverEat`. |
| Save persistence | Automated, green | Pickle 02 (`an adult megabee and a brood come back as what they were`) in tools-English and tools-French. |
| Existing colony | N/A | The mod adds Defs only and patches nothing unguarded; adding a mod to a save is the game's job. No save made with the original exists to migrate. |
| FR/EN interface | Automated, green | Pickle 03 in tools-English and tools-French (`-Language`). No settings page, no MainButton (`test_no_empty_settings`). |

Optional-mod and incompatibility passes: ADS 2 (04, 05), the original mod (07). Not asserted: four-direction art
(textures are the author's, unchanged).
After a change to `Mod/`, rerun the rows that name an automated check.
