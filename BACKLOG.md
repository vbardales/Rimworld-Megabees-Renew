# Backlog — Megabees Renew

Mod-local TODO (not the monorepo's).

## Animal integrations (rule of 2026-09-28, PUBLISHING.md "Mods qui ajoutent des animaux") — done 2026-09-28
- [x] **A Dog Said... Animal Prosthetics 2**: `Mod/Patches/Compat_ADogSaidAnimalProsthetics2.xml`, guarded, adds `Megabee` to `ADS_Cat1/2/3` (analogue: Megascarab/Megaspider, source of its sounds/meat); `loadBefore` in About.xml.
- [x] **[XND] Nocturnal Animals (Continued)**: no patch, written reason in STATUS.md (no insect analogue listed Nocturnal in its Core patches; Megabee stays diurnal by default).
- [x] **Better Crossbreeding**: no patch, written reason in STATUS.md (no vanilla animal named as an ancestor or plausible partner in Megabee's own description).
- [x] Offline test (`Tests/test_mod.py::CompatibilityPatchTests`, model Funny Creatures Renew), 7 tests. Skips in this WSL (no lxml, no pip/sudo); hand-verified once with ElementTree instead. Install lxml when possible and rerun.

## Blocking `done` -> `tested` (suite written 2026-09-28)
- [x] `Tests/Pickle/` written: 8 features, 5 `wsl-deps.*.map` files, offline-checked (`Tests/test_pickle_suite.py`, 12/12). Nothing played in game.
- [x] Step assembly built and the suite requested: five passes played 2026-09-29, all green.
- [x] 5 requests played; `exitReason`, counts and the `@review` capture read 2026-10-02. `tested` established.

## Upstream
- [ ] Pull request to the original author: none possible today. Searched 2026-09-28: no repository for `zoura3025.megabees` (About.xml has no `<url>`, Workshop page 2830700043 links none, GitHub search finds only this port). Recheck if the author publishes one; then the PR is systematic (needs Virginie's OK, public).

## Later (`tested -> prepublished`)
- [ ] `PUBLICATION.md`: description block, change notes `### 0.1.0`/`### 1.0.0`, gallery order, adult-content answers, dependencies/DLC, thanks drafts.
- [ ] Gallery: `Art/Workshop/` holds only `0-preview` copy of the Preview (renamed `00-` to `0-` on 2026-10-02, the current rule, byte-identical to Mod/About/Preview.png); page captures with the megabee dressed to stand out, none yet.
- [ ] WORKSHOP_COMMENTS.md row for the original page (2830700043), ADS 2, XND, Better Crossbreeding, Dogs mate (read 2026-10-02, not patched).
- [ ] Virginie: French review of FRENCH_REVIEW.md; reply stamped in STATUS.md.
- [ ] Publish `0.1.0` is done; `1.0.0` by CI dry-run then `publish` with the full SHA.

## Gallery plan (rule of 2026-10-02: staged photos, except menus) — draft, not yet shot
Story: a handler's apiary on a sunlit meadow; the megabee is the star, its products are the plot. Common set for all shots: ScreenshotStudio flower meadow (`the flower meadow studio is prepared`), same ground and light, decor placed, shot, removed (`the decor is removed`), next. `0-preview` = Preview copy (done).
1. `1-megabee-and-brood`: adult and brood close together (`adult animals ... spawned close together`, `I frame the animals of kind`), a lamp and plants for scale. Most demonstrative image, goes first after the Preview.
2. `2-harvest`: tallow, wool and eggs laid out by the decor step on a shelf beside the bee, a handler dressed in a palette that contrasts with the yellow-black stripes (teal/olive, as the Preview accent), body and face chosen, never random.
3. `3-salve`: the salve item on a crafting spot, same set.
Menus (health tab, bill) would be plain screenshots, not staged; none planned.
Steps: all exist in PickleTools (spawn close together, frame, studio, decor place/remove, hair/body/tattoo/dye, screenshot mode, developer mode off). Possibly missing: a step that places a named item stack (eggs, wool) on a cell, and one that spawns the brood beside a chosen adult; check `docs/steps.md` "place" section, else ask NPT via the TicketDispatcher. Nothing requested yet.
