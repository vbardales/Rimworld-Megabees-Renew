# Testing — Megabees Renew

Offline: `wsl python3 -m unittest discover -s Tests -v` (13 tests, 7 skip: lxml unavailable in this WSL) and `scripts/Check-DefInjected.ps1 -TransMod Mod` (40 keys). Functional scenarios: [TEST_SCENARIOS.md](TEST_SCENARIOS.md). Pickle suite: [Tests/Pickle/](Tests/Pickle/README.md), 8 features, checked offline with `wsl python3 Tests/test_pickle_suite.py` (12 tests). **Written 2026-09-28; all five passes played 2026-09-29 on 0145956, green (`docs/runs/2026-09-29-0145956-pickle-passes.txt`). `done -> tested` established 2026-10-02 (STATUS.md).**

## Passes (Tests/Pickle/README.md has the full matrix, filters and request commands)
1. **Minimal** (`tools`): no optional mod, Core + DLC + Pickle + mod + PickleTools' load audit. Own EN and FR runs (`-Language`).
2. **Optional integration** (`avec-ads2`): `wsl-deps.avec-ads2.map` with A Dog Said... Animal Prosthetics 2 (3238353862), the only integration with a patch (`Mod/Patches/Compat_ADogSaidAnimalProsthetics2.xml`); asserts Megabee gets surgery options it would lack unpatched. XND Nocturnal Animals and Better Crossbreeding need no pass: neither is patched, so a pass with them present would be a plain minimal pass under another name (written reasons in STATUS.md).
3. **Declared incompatibility** (`incompat-original`): `wsl-deps.incompat-original.map` mounting `zoura3025.megabees` (2830700043, installed on this machine); asserts the documented symptom (duplicate defNames, the original's own 1.3-form load fault), does not expect a plain red run.
4. **DLC absent** (`dlc-absent`): `wsl-deps.dlc-absent.map`, Royalty and Ideology only (the two the `willNeverEat` `MayRequire` entries name); asserts the guards raise nothing and the def still loads and reads the same.

## Pass 6, the gallery (`sanctuary`)
`09-gallery` stages three Workshop photographs (BACKLOG.md). It proves nothing about the mod; excluded from passes 1 to 3 by `!@gallery`. Filed once, after PickleTools' fixture message.

## `done -> tested` gate (AUDIT.md, step 9, version of 2026-10-02): all met
- Order of passes (Virginie, 2026-10-02): what never ran or is red is replayed alone, in small tickets; the non-regression passes (full suite, both languages) are filed together, last, on the final revision. A scenario with a green run on the current logic is non-regression; a change to `Mod/` or to a step it uses makes it new again.
- No scenario tagged `@wip`: repaired and replayed, or deleted with its reason.
- Every `@requires:<packageId>` scenario ran in a pass that mounts that mod, its report read (`setName`, suite and scenario names checked; the report folder is shared).
- No manual test left: each is automated and green, or listed not applicable with its reason. `@review` captures are still opened and looked at.
- `exitReason` read before counts; scenarios played vs features discovered; logs and EN/FR UI checked; one Pickle run never proves what its screenshot shows.

## Evidence: what to keep
Launch with `-EvidenceDir Tests/Pickle/Evidence/<date>-<sha>-<pass>`. Ignored by git. Keep per pass: `summary.json`, `summary.md`, `junit.xml`, `messages.ndjson`, `Player.log`, `evidence-complete.txt`/`no-report.txt`, and only the `@review` captures actually opened, minified to JPEG. Done 2026-10-02 on the five 2026-09-29 reports (32 MB to 1.1 MB). Delete: whole `screenshots/` copies, `report.html`, failed/infrastructure attempts once their cause is written in STATUS.md, reports superseded for the same scenario and revision (unless sole proof of a pass not repeated, e.g. a DLC-absent or language pass), reports of an older build. Never delete a report a STATUS.md field points to; repoint first. Launcher archives in `pickle-reports-archive/`: select from your own run, then delete that archive (`keep.txt` = leave). History: one line per run in `docs/runs/`, never folders.
