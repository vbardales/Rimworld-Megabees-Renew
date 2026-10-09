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
- [x] Gallery: `Art/Gallery/` holds `0-preview.png` (byte-identical to Mod/About/Preview.png) and the three accepted captures `1-noon-arrival.jpg`, `2-the-harvest.jpg`, `3-the-salve.jpg` (accepted 2026-10-08). Closed 2026-10-09; the sections below are history.
- [ ] WORKSHOP_COMMENTS.md row for the original page (2830700043), ADS 2, XND, Better Crossbreeding, Dogs mate (read 2026-10-02, not patched).
- [ ] Virginie: French review of FRENCH_REVIEW.md; reply stamped in STATUS.md.
- [ ] Publish `0.1.0` is done; `1.0.0` by CI dry-run then `publish` with the full SHA.

## Gallery (rule of 2026-10-02: staged photos, except menus) — closed 2026-10-09, kept as history
Written 2026-10-05: `Tests/Pickle/Mod/Pickle/Features/09-gallery.feature`, pass 6 `sanctuary` (`wsl-deps.sanctuary.map`), in Nelim's sanctuary, place "barn". Story: first light in the barn, the apiary wakes: 1 the queen and her brood, 2 the harvest (wool, tallow, eggs) laid out before her, 3 the salve at the feet of a worker and the brood. Same set (barn emptied, six lit torch lamps, no roof removal), animals removed between shots, noon and clear. Offline-checked (`test_pickle_suite.py` 12 ok); never played.
- [x] Pass 6 played 2026-10-06 (docs/runs/2026-10-06-8f9a438-gallery.txt), green, captures opened.
- [x] Pause of 2026-10-06 (no gallery generation with a pawn): lifted by Virginie, gallery done. Ticket 81e8 (commit 2b7c234) was cancelled before it ran; candidates of run d31e were never used.
- [x] Retained images copied to `Art/Gallery/1-…`, `2-…`, `3-…` (only own images).
- Missing steps asked of NPT 2026-10-05: stack of N as decor and facing, both non-blocking, not requested again.

### Choice of place for the gallery (2026-10-06, all 60 named places read in docs/SANCTUAIRE-LIEUX.md, fixture final)
Kept `barn` (193, 237). Why: the subject is a large animal (body size 5.25) with its brood and three goods, so the place needs ~12x12 free ground that can be emptied without losing its meaning. Rejected: house rooms (`hearth-hall`, `prestige-hall`, `ritual-hall`, `terrace`, `hut`, nooks: furnished, small, thrumbos sleep there); `statue-garden`, `flower-garden`, `water-garden`, `plant-garden` (the plants are the place and would hold the cells, so a placed item fails on an occupied cell; thematic for bees, a candidate for a second series); `emerald-clearing`/`calm-zone`/`exhibition-zone` (marking carpets, `exhibition-zone` is for windows); `gravel-yard`, `rice-*`, `cotton-field` (open fields, no story); `enclosure`, `enclosure-south` (crop zone, laying boxes), `enclosure-north` (the barn's neighbour, fenced bamboo); river, banks, bridge, `dump`, smileys (no animal-ground, or meaningful to verify). `barn`: earth floor, made for animals, open on the enclosure, emptied by a step NPT allows for a named place, lit by six torches. Open point: its frame (10.5) is still under Virginie's review; adjust cells if the capture shows the lamps off the floor.

### Pawn mods suggested by TMW (2026-10-07, none required, none staged)
FemaleBodyVariants 3798082132, FemaleApparelVariants 3799726535 (before WDI), wdi.realistic.bodies 3527486510, ab.vplrf 2986402536 (visible trousers; needs a seed config, see TailorMadeWaistlines/Tests/Pickle/config/gallery/), astryl.tailormade 3756915448. Full map: TailorMadeWaistlines/Tests/Pickle/wsl-deps.gallery.map; green model: its 05-gallery.feature. Nelim's body and face come from the fixture, so this suite stays on vanilla clothes (Apparel_BasicShirt + Apparel_Pants dyed). Untested by TMW: dye lost on dropped apparel, seated pose, care outfit. Revisit only if run 3f14 shows the trousers or the shirt unreadable.

### Gallery, rewrite (2026-10-07, after rereading PUBLISHING.md rules of 2026-10-06)
The run-3 candidates meet the technical rules (undressed then dressed, no counters, same frame) but not the storytelling ones: (1) one story with time passing: `I set the hour to 12` once, then a cumulative wait per image (image 1 set-up only, image 2 +208 ticks, image 3 +417); (2) a shooting plan in the header of `09-gallery.feature`, one line per image (place, moment, subject, composition, living thing, what it says); (3) a composed photo, not a centred row on a neutral ground: foreground, depth, off-centre subject; (4) animal scenes prefer `enclosure-south` (Virginie via AnimalArk, 2026-10-06), whose laying boxes fit the eggs; (5) show everything the mod offers: adult and brood, the four products, the salve, ADS 2 (needs a map with the place and ADS 2, and the health tab), the body plan (inspection tab in the same place); (6) diurnal living things at noon (the megabee is diurnal). Proposed story, "Noon at the apiary": 1 noon, Nelim reaches the enclosure gate, the queen settled by the laying boxes, the brood beside her; 2 noon+5 min, Nelim shears and gathers, wool and eggs in her hands (`carries the item`); 3 noon+10 min, Nelim dresses a worker's wound with the salve, brood asleep. Cells of `enclosure-south` are unknown: first run reads them. Not started: waits for Virginie's go.

## Idea: flight (asked 2026-10-07, not decided)
1.6 (Odyssey) gives flight through two stats under `statBases`, `MaxFlightTime` and `FlightCooldown` (read in `Odyssey/Defs/ThingDefs_Races/Races_Animal_Birds.xml` and `Races_Animal_Insect.xml`). The megabee declares neither, so it does not fly (read from the files, not seen in game); its body (`BodyDefs.xml`) has no wings, as the author made it. Adding the stats would be a new feature, not a port: it changes balance (a body size 5.25 animal crossing walls and fences), contradicts "wingless", and breaks the rule that no balance value is touched. If Virginie decides yes: add both stats, note it in `CHANGELOG.md` as a change from the original, add a Pickle step or test that reads them, and replay pass 1.

### Gallery anomalies reported to NPT 2026-10-07 (run 5924, commit 424b650) — both fixed, checked in run 6d8d at f19cb40 (docs/runs/2026-10-07-f19cb40-gallery.txt)
Clothing items lie on the ground in the three frames (grey cloak and a small yellow garment near (150, 210)): dropped by `"Nelim" is undressed` or by `wears` replacing layers, contrary to "goes to the inventory". Asked NPT for a fix; not redeposited until it answers. Also open: the queen is spawned lying down in shots 1 and 3 (random resting pose); Nelim overlaps the queen in 2 and 3.
Second anomaly reported to NPT 2026-10-07: in shot 2 the egg and the tallow (decor placed at (148, 213) and (148, 215)) are drawn under the flowers of enclosure-south, hidden in part. Asked NPT for a draw-above step or the plant-free cells (maybe the bare grey patch left of the frame, x 140-146, z 212-218 by eye). Not redeposited until it answers; then the items move to bare cells.

### Migration to SanctuaryBacklot (owner, 2026-10-08)
Face kits tried and removed (run 0c4f red): no 1.6 mod gives a smile here, see docs/runs/2026-10-08-c8a9d0f-gallery-red.txt; revisit when a 1.6 face-parts mod is staged.
`wsl-deps.sanctuary.map` now follows SanctuaryBacklot's minimum map (+ the mod itself via `path:SanctuaryBacklot/Mod`, + ColonistRace), seeds copied to `Tests/Pickle/config/sanctuary/`. Place steps use `Nelim's Sanctuary:` (SB: "I am at the sanctuary", "the animals are removed from the sanctuary"); every other step stays `Nelim's Pickle Tools:` (NPT). Looks change (WDI, bodies, EyeGenes eyes, facial animation): candidates of run 6d8d are the old look. Cells of enclosure-south to recheck against the current fixture (see SANCTUAIRE-CASES.md).
