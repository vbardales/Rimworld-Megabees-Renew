# Pickle suite: Megabees Renew

In-game functional tests, written 2026-09-28, run by [Pickle](https://github.com/RimWorks/Rimworld-Pickle) in the headless
WSL install. **Nothing here has been played.** A run is filed by request, never launched by hand; see "Running it".

What belongs in Gherkin, and what does not, is decided in [`../../TESTING.md`](../../TESTING.md). In one line: the XML
contract, the def values and the French coverage are proved offline by `Tests/test_mod.py`, and a scenario that repeats
one of those is deleted, not kept. What is left is what the engine does with those values, and what one other mod does
with them.

## Layout

```
Tests/Pickle/
  README.md                               this file
  pickle-steps.txt                        the 205 step expressions of Pickle 4.9.1, for the offline check
  wsl-deps.tools.map                      passes 1 and 2: the bare set plus PickleTools' load audit
  wsl-deps.avec-ads2.map                  pass 3: A Dog Said... Animal Prosthetics 2
  wsl-deps.incompat-original.map          pass 4: the original mod next to this one
  wsl-deps.dlc-absent.map                 pass 5: Royalty and Ideology left out
  Source/                                 the C# of the step assembly (Megabees.PickleSteps.csproj)
  Mod/                                    the test companion, nelim.megabeesrenew.pickletests
    About/About.xml
    Pickle/Features/*.feature             the scenarios
    Pickle/Assemblies/                    the built step DLL: git-ignored, rebuilt before a run
  Evidence/                               git-ignored: reports and captures, see "Evidence"
```

The companion stays out of the Workshop payload: the staging copies `Mod/` of the mod under test and this companion,
and nothing of `Tests/`.

## Build, and check without a game

```powershell
dotnet build Tests/Pickle/Source/Megabees.PickleSteps.csproj -c Release     # Pickle loads step DLLs at start
python Tests/test_pickle_suite.py                                            # no game
```

`test_pickle_suite.py` shows, from the files alone, that every line of every feature matches **exactly one** step (an
undefined or ambiguous step costs a whole run), that no scenario is set aside, that every tag is known, that each map
ends with a newline and stages folders that exist and declare the id written, that the passes are consistent with the
tags they select, and that the def names the scenarios point at exist. It does not show that a step does what it says:
that is what the run is for.

## The features

| Feature | Scenario of `TESTING.md` | What only a running game shows |
|---|---|---|
| `01-the-megabee` | A | The megabee is defined, drawn at two life stages, and the engine reads the wildness stat instead of falling back to its default |
| `02-save-and-reload` | Q | The megabee, adult and brood, comes back from a save as what it was |
| `03-texts-in-the-language-of-the-pass` | P | The megabee, its wool, eggs, salve and brood label read as the language of the pass, in English and in French |
| `04-animal-prosthetics` | R | The real surgery recipes list the megabee, which depends on this mod loading before ADS 2 |
| `05-without-ads2` | R | Without the mod, nothing is patched: the guard holds on the defs the engine loaded |
| `06-dlc-absent` | (Load order) | With Royalty and Ideology out, the megabee loads and reads the same, and its `willNeverEat` guards raise nothing |
| `07-the-original-mod` | L | The declared incompatibility is still true: the game logs the original's own 1.3-form fault |
| `08-load-is-clean` | (Logs) | Nothing in the game's log, from the start, is attributed to this mod |

## Tags

| Tag | Meaning |
|---|---|
| `@requires:<packageId>` | Skipped when that package is absent, and **counted** as skipped. It does not stage it: the map of the pass does |
| `@sans-facultatifs` | Only meaningful in the pass that mounts no optional mod; excluded from pass 3 |
| `@dlc-absent` | Only meaningful with Royalty and Ideology out; excluded from passes 1 to 4 |
| `@clean-load` | The load audit; excluded from pass 4, where the original's duplicates are attributed to this mod |
| `@allow-errors` | The errors are the point of the scenario (feature 07) |
| `@review` | Attaches a capture that a person must open. Its green says the path ran, not that the image shows the megabee |

There is no `@wip`, and `test_pickle_suite.py` refuses one: a scenario put aside is repaired or deleted.

## The passes, and the request that plays each

Five requests, none with `-IncludeWip`. `<sha>` is the commit the tree is on: **a request carries no SHA and the tree is
staged when the ticket plays**, so keep the tree of this repository unchanged until the `RUN_DONE` of each. Give a new
`-EvidenceDir` every time, so an older report is never read as the result. The full command form, options and exit codes
are in `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md`.

```powershell
powershell.exe -ExecutionPolicy Bypass -File C:\Users\nelim\Documents\rimworld\Rimworld-Ticket-Dispatcher\scripts\Submit-PickleRun.ps1 `
  -Mod MegabeesRenew -Owner local_<session id> -Label "<sha> <pass>" -DepMap <map> -Language <language> `
  -Filter '<filter>' -EvidenceDir MegabeesRenew/Tests/Pickle/Evidence/<pass>-<language>-<sha>
```

| # | Pass | `-DepMap` | `-Language` | `-Filter` | Plays |
|---|---|---|---|---|---|
| 1 | `tools` (the bare set) | `wsl-deps.tools.map` | English | `'Megabees Renew - Pickle tests,!@dlc-absent'` | 01 to 03, 05, 08; **04 and 07 are skipped by requirement** |
| 2 | `tools` | `wsl-deps.tools.map` | French | the same | the same, in French: the point is 03 |
| 3 | `avec-ads2` | `wsl-deps.avec-ads2.map` | English | `'Megabees Renew - Pickle tests,!@sans-facultatifs,!@dlc-absent'` | 01 to 04 and 08; 05 excluded; 07 skipped by requirement |
| 4 | `incompat-original` | `wsl-deps.incompat-original.map` | English | `'07-the-original-mod'` | 07 |
| 5 | `dlc-absent` | `wsl-deps.dlc-absent.map` | English | `'06-dlc-absent,08-load-is-clean'` | 06 and 08 |

The report of every pass carries its name (`-pickle-set-name`), so the passes can be set side by side. Pass 3 runs the
whole suite on purpose, not only 04: it is the pass that shows the mod stands in the game it will really be loaded in.

A pass that leaves features skipped by requirement is not a pass of them. Feature 04 has played only when pass 3 has,
on a map that mounted its mod; the counts are read against the features discovered.

## What the two limits of the built-in steps forced

Read from the installed Pickle 4.9.1 (2026-09-28), and the reason `Source/MegabeesSteps.cs` exists (the same two facts
Funny Creatures Renew's suite documents):

- **Pawn steps resolve a colonist by nickname only** (`PawnLookup.FindLiving`). The megabee is never a colonist, so
  the steps here spawn it with a nickname and find it again by it (also after a reload).
- **Def steps throw on an ambiguous defName** (`DefLookup.RequireAny`). Megabee is both a ThingDef and a PawnKindDef,
  so `def X of type Y exists` is used, since it is not ambiguous; the recipe list and the texts are read by custom
  steps.
- **Pickle 4.9.1 has no step that asserts an error was logged.** Feature 07 reads the log file, as feature 10 of
  Funny Creatures Renew does.

## What was left out of Gherkin, and why

`TESTING.md`, "Passes required", has the scope this suite covers. In short: milking, shearing, hatching, crafting the
salve, taming difficulty, herding, wild spawning and trade are proved by XML tests, or are the engine's own mechanics;
a scenario would test the engine (production and hatching also take real game-days, days this run cannot spend). The
migration of a save made with the original mod needs a save that does not exist, and stays unverified. That the mod
list shows a warning for `incompatibleWith` is the game's reaction to a declaration, not tested here.

## Cells and timing

The scenarios use the free ground of Pickle's `test-colony` (a 250 by 250 map) around x=140 to 146, z=153 to 155, the
same cells Funny Creatures Renew's suite uses, chosen there by reading the fixture's things. **It has not been seen in
a run**: if a cell is not standable, the step says so and the coordinates are what to change.

## Evidence

Reports go to `Tests/Pickle/Evidence/<run>/` (git-ignored), and the history is **one line per run** in
[`../../docs/runs/`](../../docs/runs). What to keep and what to delete is in `TESTING.md`, "Evidence: what to keep":
`summary.json`, `summary.md`, `junit.xml`, `messages.ndjson`, `Player.log`, `evidence-complete.txt`/`no-report.txt`,
and only the `@review` capture that was opened, minified to JPEG. Never `report.html` or a whole `screenshots/`
folder.
