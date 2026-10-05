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

## Gallery (rule of 2026-10-02: staged photos, except menus)
Written 2026-10-05: `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature`, pass 6 `sanctuary` (`wsl-deps.sanctuary.map`), in Nelim's sanctuary, place "barn". Story: first light in the barn, the apiary wakes: 1 the queen and her brood, 2 the harvest (wool, tallow, eggs) laid out before her, 3 the salve at the feet of a worker and the brood. Same set (barn emptied, six lit torch lamps, no roof removal), animals removed between shots, noon and clear. Offline-checked (`test_pickle_suite.py` 12 ok); never played.
- [ ] Wait for PickleTools' message that the final Nelims-tribe fixture is installed (docs/GALERIE.md), then file pass 6 as one request.
- [ ] Open the three captures; verify the decor defs (TorchLamp, WoolMegabee, placement cells in the barn) and that the brood stage 0 shows; adjust cells if a step names one that is not standable.
- [ ] Copy the retained images to `Art/Gallery/1-…`, `2-…`, `3-…` (only own images).
- Missing steps asked of NPT 2026-10-05: stack of N as decor and facing, both non-blocking, not requested again.
