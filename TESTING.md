# Testing — Megabees Renew

Offline: `wsl python3 -m unittest discover -s Tests -v` (6 tests) and `scripts/Check-DefInjected.ps1 -TransMod Mod` (40 keys). Functional scenarios: [TEST_SCENARIOS.md](TEST_SCENARIOS.md). Nothing has run in game.

## Passes required (declared 2026-09-28; none exists yet)
1. **Minimal**: no `-DepMap`; Core + DLC + Pickle + mod. Own EN and FR runs (`-Language`).
2. **Optional integrations**: `wsl-deps.avec-facultatifs.map` with ADS 2, XND Nocturnal Animals, Better Crossbreeding, once their patches exist (see BACKLOG.md). EN and FR.
3. **Declared incompatibility**: `wsl-deps.incompat-megabees.map` mounting `zoura3025.megabees` (2830700043); assert the documented symptom (duplicate defNames, load-order winner), do not expect red.
4. **Without a DLC** (`!ludeon.rimworld.royalty`, `!ludeon.rimworld.ideology`): the `willNeverEat` `MayRequire` entries raise nothing.

## `done -> tested` gate (AUDIT.md, step 9, 2026-09-28)
- No scenario tagged `@wip`: repaired and replayed, or deleted with its reason.
- Every `@requires:<packageId>` scenario ran in a pass that mounts that mod, its report read (`setName`, suite and scenario names checked; the report folder is shared).
- No manual test left: each is automated and green, or listed not applicable with its reason. `@review` captures are still opened and looked at.
- `exitReason` read before counts; scenarios played vs features discovered; logs and EN/FR UI checked; one Pickle run never proves what its screenshot shows.

## Evidence: what to keep
Launch with `-EvidenceDir Tests/Pickle/Evidence/<date>-<sha>-<pass>`. Ignored by git. Keep per pass: `summary.json`, `summary.md`, `junit.xml`, `messages.ndjson`, `Player.log`, `evidence-complete.txt`/`no-report.txt`, and only the `@review` captures actually opened, minified to JPEG. Delete: whole `screenshots/` copies, `report.html`, failed/infrastructure attempts once their cause is written in STATUS.md, reports superseded for the same scenario and revision (unless sole proof of a pass not repeated, e.g. a DLC-absent or language pass), reports of an older build. Never delete a report a STATUS.md field points to; repoint first. Launcher archives in `pickle-reports-archive/`: select from your own run, then delete that archive (`keep.txt` = leave). History: one line per run in `docs/runs/`, never folders.
