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
- [x] `PUBLICATION.md` drafted 2026-10-07 (description, notes, gallery order, comment for zoura3025, dependencies); open items are listed at its end.
- [ ] Gallery: `Art/Workshop/` holds only `0-preview` copy of the Preview (renamed `00-` to `0-` on 2026-10-02, the current rule, byte-identical to Mod/About/Preview.png); page captures with the megabee dressed to stand out, none yet.
- [ ] WORKSHOP_COMMENTS.md row for the original page (2830700043), ADS 2, XND, Better Crossbreeding, Dogs mate (read 2026-10-02, not patched).
- [ ] Virginie: French review of FRENCH_REVIEW.md; reply stamped in STATUS.md.
- [ ] Publish `0.1.0` is done; `1.0.0` by CI dry-run then `publish` with the full SHA.

## Gallery (rule of 2026-10-02: staged photos, except menus)
Written 2026-10-05: `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature`, pass 6 `sanctuary` (`wsl-deps.sanctuary.map`), in Nelim's sanctuary, place "barn". Story: first light in the barn, the apiary wakes: 1 the queen and her brood, 2 the harvest (wool, tallow, eggs) laid out before her, 3 the salve at the feet of a worker and the brood. Same set (barn emptied, six lit torch lamps, no roof removal), animals removed between shots, noon and clear. Offline-checked (`test_pickle_suite.py` 12 ok); never played.
- [x] Pass 6 played 2026-10-06 (docs/runs/2026-10-06-8f9a438-gallery.txt), green, captures opened.
- [ ] PAUSED by Virginie 2026-10-06: no more gallery generations with a pawn. Ticket 81e8 (commit 2b7c234, undressed + zoom 7) cancelled before it ran. Resume when she says so; candidates of run d31e are not used (clothes not visible).
- [ ] Copy the retained images to `Art/Gallery/1-…`, `2-…`, `3-…` (only own images).
- Missing steps asked of NPT 2026-10-05: stack of N as decor and facing, both non-blocking, not requested again.

### Choice of place for the gallery (2026-10-06, all 60 named places read in docs/SANCTUAIRE-LIEUX.md, fixture final)
Kept `barn` (193, 237). Why: the subject is a large animal (body size 5.25) with its brood and three goods, so the place needs ~12x12 free ground that can be emptied without losing its meaning. Rejected: house rooms (`hearth-hall`, `prestige-hall`, `ritual-hall`, `terrace`, `hut`, nooks: furnished, small, thrumbos sleep there); `statue-garden`, `flower-garden`, `water-garden`, `plant-garden` (the plants are the place and would hold the cells, so a placed item fails on an occupied cell; thematic for bees, a candidate for a second series); `emerald-clearing`/`calm-zone`/`exhibition-zone` (marking carpets, `exhibition-zone` is for windows); `gravel-yard`, `rice-*`, `cotton-field` (open fields, no story); `enclosure`, `enclosure-south` (crop zone, laying boxes), `enclosure-north` (the barn's neighbour, fenced bamboo); river, banks, bridge, `dump`, smileys (no animal-ground, or meaningful to verify). `barn`: earth floor, made for animals, open on the enclosure, emptied by a step NPT allows for a named place, lit by six torches. Open point: its frame (10.5) is still under Virginie's review; adjust cells if the capture shows the lamps off the floor.

### Pawn mods suggested by TMW (2026-10-07, none required, none staged)
FemaleBodyVariants 3798082132, FemaleApparelVariants 3799726535 (before WDI), wdi.realistic.bodies 3527486510, ab.vplrf 2986402536 (visible trousers; needs a seed config, see TailorMadeWaistlines/Tests/Pickle/config/gallery/), astryl.tailormade 3756915448. Full map: TailorMadeWaistlines/Tests/Pickle/wsl-deps.gallery.map; green model: its 05-gallery.feature. Nelim's body and face come from the fixture, so this suite stays on vanilla clothes (Apparel_BasicShirt + Apparel_Pants dyed). Untested by TMW: dye lost on dropped apparel, seated pose, care outfit. Revisit only if run 3f14 shows the trousers or the shirt unreadable.
