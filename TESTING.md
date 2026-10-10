# Testing — Megabees Renew

Offline: `wsl python3 -m unittest discover -s Tests -v` (25 tests, 2 skip: ADS 2 not installed in the WSL; needs lxml and `RIMWORLD_DIR=~/rimworld`) and `scripts/Check-DefInjected.ps1 -TransMod Mod` (40 keys). Functional scenarios: [TEST_SCENARIOS.md](TEST_SCENARIOS.md). Pickle suite: [Tests/Pickle/](Tests/Pickle/README.md), 9 features, checked offline with `wsl python3 Tests/test_pickle_suite.py`. **Last played: six passes at 0e2e93b, 2026-10-10, green (`docs/runs/2026-10-10-0e2e93b-non-regression.txt`).**

## Passes (Tests/Pickle/README.md has the full matrix, filters and request commands)
1. **Minimal** (`tools`): no optional mod, Core + DLC + Pickle + mod + PickleTools' load audit. Own EN and FR runs (`-Language`).
2. **Optional integration** (`avec-ads2`): `wsl-deps.avec-ads2.map` with A Dog Said... Animal Prosthetics 2 (3238353862), the only integration with a patch (`Mod/Patches/Compat_ADogSaidAnimalProsthetics2.xml`); asserts Megabee gets surgery options it would lack unpatched. XND Nocturnal Animals and Better Crossbreeding need no pass: neither is patched, so a pass with them present would be a plain minimal pass under another name (written reasons in STATUS.md).
3. **Declared incompatibility** (`incompat-original`): `wsl-deps.incompat-original.map` mounting `zoura3025.megabees` (2830700043, installed on this machine); asserts the documented symptom (duplicate defNames, the original's own 1.3-form load fault), does not expect a plain red run.
4. **DLC absent** (`dlc-absent`): `wsl-deps.dlc-absent.map`, Royalty and Ideology only (the two the `willNeverEat` `MayRequire` entries name); asserts the guards raise nothing and the def still loads and reads the same.

5. **Make Honey EVEN MORE Compatible** (`make-honey`): `wsl-deps.make-honey.map` (TSP.zal.patchhoney2, 2959585309 and its dependencies); the honey syrup recipe accepts the tallow and the category icon loads (the patch `Compat_MakeHoneyEvenMoreCompatible.xml`).

## Pass 6, the gallery (`sanctuary`)
`09-gallery` stages three Workshop photographs (BACKLOG.md). It proves nothing about the mod; excluded from passes 1 to 3 by `!@gallery`. Filed once, after PickleTools' fixture message.

## Evidence: what to keep
Launch with `-EvidenceDir Tests/Pickle/Evidence/<date>-<sha>-<pass>`. Ignored by git. Keep per pass: `summary.json`, `summary.md`, `junit.xml`, `messages.ndjson`, `Player.log`, `evidence-complete.txt`/`no-report.txt`, and only the `@review` captures actually opened, minified to JPEG. Done 2026-10-02 on the five 2026-09-29 reports (32 MB to 1.1 MB). Delete: whole `screenshots/` copies, `report.html`, failed/infrastructure attempts once their cause is written in STATUS.md, reports superseded for the same scenario and revision (unless sole proof of a pass not repeated, e.g. a DLC-absent or language pass), reports of an older build. Never delete a report a STATUS.md field points to; repoint first. Launcher archives in `pickle-reports-archive/`: select from your own run, then delete that archive (`keep.txt` = leave). History: one line per run in `docs/runs/`, never folders.
