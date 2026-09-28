# Backlog — Megabees Renew

Mod-local TODO (not the monorepo's).

## Animal integrations (rule of 2026-09-28, PUBLISHING.md "Mods qui ajoutent des animaux") — done 2026-09-28
- [x] **A Dog Said... Animal Prosthetics 2**: `Mod/Patches/Compat_ADogSaidAnimalProsthetics2.xml`, guarded, adds `Megabee` to `ADS_Cat1/2/3` (analogue: Megascarab/Megaspider, source of its sounds/meat); `loadBefore` in About.xml.
- [x] **[XND] Nocturnal Animals (Continued)**: no patch, written reason in STATUS.md (no insect analogue listed Nocturnal in its Core patches; Megabee stays diurnal by default).
- [x] **Better Crossbreeding**: no patch, written reason in STATUS.md (no vanilla animal named as an ancestor or plausible partner in Megabee's own description).
- [x] Offline test (`Tests/test_mod.py::CompatibilityPatchTests`, model Funny Creatures Renew), 7 tests. Skips in this WSL (no lxml, no pip/sudo); hand-verified once with ElementTree instead. Install lxml when possible and rerun.

## Blocking `done` -> `tested` (suite written 2026-09-28)
- [x] `Tests/Pickle/` written: 8 features, 5 `wsl-deps.*.map` files, offline-checked (`Tests/test_pickle_suite.py`, 12/12). Nothing played in game.
- [ ] `dotnet build Tests/Pickle/Source/Megabees.PickleSteps.csproj -c Release` before the first request (no .NET SDK checked in this session).
- [ ] File the 5 requests (see Tests/Pickle/README.md), keep the tree unchanged from submission to each `RUN_DONE`, read `exitReason` and the `@review` capture before recording a result.

## Upstream
- [ ] Pull request to the original author: none possible today. Searched 2026-09-28: no repository for `zoura3025.megabees` (About.xml has no `<url>`, Workshop page 2830700043 links none, GitHub search finds only this port). Recheck if the author publishes one; then the PR is systematic (needs Virginie's OK, public).

## Later
- [ ] `PUBLICATION.md` (before `prepublished`), WORKSHOP_COMMENTS.md row for the original page.
