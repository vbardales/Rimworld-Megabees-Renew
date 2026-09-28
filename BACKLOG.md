# Backlog — Megabees Renew

Mod-local TODO (not the monorepo's).

## Blocking `preTest` (rule of 2026-09-28, PUBLISHING.md "Mods qui ajoutent des animaux")
- [ ] **A Dog Said... Animal Prosthetics 2**: guarded patch adding `Megabee` to `ADS_Cat1/2/3`; classify by the vanilla analogue (muffalo-sized herbivore); `loadBefore` in About.xml. Or record why it does not apply.
- [ ] **[XND] Nocturnal Animals (Continued)**: guarded `NocturnalAnimals.ExtendedRaceProperties` per its Core patches, or record "diurnal, like its analogue".
- [ ] **Better Crossbreeding**: decide (both directions, or explicit no) and record in STATUS.md.
- [ ] Offline lxml patch tests for the three (model: Funny Creatures Renew `CompatibilityPatchTests`).

## Blocking `done`
- [ ] Write `Tests/Pickle/` (minimal pass + optional-mods pass + incompatibility pass for `zoura3025.megabees`, EN and FR) and its `wsl-deps.*.map` files, or justify their absence in writing.

## Upstream
- [ ] Pull request to the original author: none possible today. Searched 2026-09-28: no repository for `zoura3025.megabees` (About.xml has no `<url>`, Workshop page 2830700043 links none, GitHub search finds only this port). Recheck if the author publishes one; then the PR is systematic (needs Virginie's OK, public).

## Later
- [ ] `PUBLICATION.md` (before `prepublished`), WORKSHOP_COMMENTS.md row for the original page.
