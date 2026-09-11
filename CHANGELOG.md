# Changelog

Format inspired by [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
This file serves the repository and the writing of Steam patch notes; RimWorld does not display it
in game.

## [1.0.0] — unreleased

On release: add `Mod/About/ModIcon.png` and `Mod/About/Preview.png`, create the `v1.0.0` tag and
the matching GitHub release, then publish to the Workshop.

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
