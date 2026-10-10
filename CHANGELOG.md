# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.1] — unreleased

### Added

- **Licence status `open`**: zoura3025 gave explicit permission to maintain the mod (2026-10-09). The `(unofficial)` suffix, the UNOFFICIAL paragraph, the Preview tag and the README notice are gone; `ATTRIBUTION.md` quotes the permission.

- **Optional patch for Make Honey EVEN MORE Compatible** (`TSP.zal.patchhoney2`, Workshop 2959585309). That mod already accepts the megabee tallow in its honey syrup recipe by defName, but gives its "Mega Bees" category the icon `oldmegabee_east`, a texture only the original Megabees ships: the game logs `Could not load Texture2D` and the category shows the red error square. `Mod/Patches/Compat_MakeHoneyEvenMoreCompatible.xml` repoints that icon at `megabee_east`, guarded by `PatchOperationFindMod`; `About.xml` declares `<loadAfter>` for that mod.

### Changed

- **packageId `nelim.megabeesrenew` becomes `nelim.megabees`** (owner's decision, 2026-10-09: a `renew` suffix does not belong in the id, PUBLISHING.md). Same Workshop item. Anyone who subscribed to 1.0.0 has to enable the mod again, and a mod that named the old id in a `loadAfter` or `MayRequire` no longer matches.
- Description: `[h1]` headings, links to the original Megabees and PickleTools. No change to the mod's defs.

## [1.0.0] — 2026-10-09

Published to the Workshop by the CI (run 37934952391, commit 02ceebb), tag `v1.0.0`.

First release of the 1.6 update of **Megabees**, by zoura3025.

### Changed

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the bee tamed for
  almost nothing instead of sitting at 0.80.

### Notes

That one line is the entire difference from the original files. The body defs, the resource defs and
the salve recipe are byte for byte the author's, and no balance value was changed.

The unfertilized egg needed no work here: `EggMegabeeUnfertilized` was already declared, which is
not the case for most of the egg-layers in this family of ports, where 1.6's `CompEggLayer` throws
on a null `eggUnfertilizedDef`.

### Audit follow-up — 2026-09-13

- Added complete French DefInjected resources, preserving native English source text.
- Added unofficial notices and the final GitHub source link.
- Added delivered artwork, reusable XML/resource tests and functional test scenarios.
- Verified that the game parser accepts the inherited repeated closing parentheses in colors; gameplay Defs were not changed.

## [0.1.0] — 2026-10-01

Creation of the `About/PublishedFileId.txt` (Workshop item 3811291235). Pre-publication only: the
item is private, this version is neither public nor a tested release, and `1.0.0` above stays
unreleased. The upload contained `Mod/` as it stood on 2026-10-01 (the last change to `Mod/` before
it was `238adf2`, the Preview of 2026-09-29); nothing else changed in it since, apart from this file.
