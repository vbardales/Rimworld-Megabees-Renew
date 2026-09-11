# Megabees — where the content comes from, and what had to be changed

Everything in this mod is **zoura3025's** work: the bee, its body plan, its products, its textures.
This repository holds the port to RimWorld 1.6 and nothing else.

## The source

| | |
|---|---|
| Mod | Megabees |
| Author | zoura3025 |
| Workshop | [2830700043](https://steamcommunity.com/sharedfiles/filedetails/?id=2830700043) |
| Last version supported | 1.4 |
| Last updated | 24 January 2023 |
| Licence | none stated |

**Abandoned, not withdrawn.** The item is still on the Workshop and still downloadable; it stopped
at 1.4, missing 1.5 and 1.6. Nobody else has picked it up: Mlie has no continuation of it, and a
Workshop search filtered on the 1.6 tag returns one unrelated bee mod. No installed mod declares
`Megabee` or `WoolMegabee`.

## The licence, looked for in four places

"None stated" is a verdict, not an absence of checking. A refusal never presents itself as a
licence, so each place was searched for the refusal rather than for the permission — `prohibit`,
`forbid`, `do not redistribute`, `no reupload`, `all rights reserved`, `without permission`, and
the Japanese and Chinese forms 禁止, 転載, 無断, 二次配布, 不得.

| Where | What it says |
|---|---|
| A `LICENSE` or `COPYING` file in the mod | there is none |
| The `<description>` of its `About.xml` | nothing about reuse |
| A linked repository | there is none |
| The Workshop page description | nothing about reuse |

Silence grants nothing and forbids nothing. This port rests on the Workshop's own custom for
abandoned mods: named credit, and a takedown on request.

## What the port changed

One line.

- **`<wildness>0.80</wildness>` inside `<race>` became `<Wildness>0.80</Wildness>` under
  `<statBases>`.** Wildness stopped being a field of `RaceProperties` in 1.6 and became a StatDef.
  The old form does not error: nothing reads it, and the stat's own default is `-1`, which Core's
  comment describes as deliberately out of range "so we can catch missing wildness stats on
  animals". The bee was taming for almost nothing.

A diff against the original files shows that change and nothing else. The body defs, the resource
defs and the salve recipe are byte for byte the author's.

## What was left alone, and why

- **The unfertilized egg was already there.** Unlike most of the egg-laying animals in this family
  of ports, `EggMegabeeUnfertilized` is declared by the author, so 1.6's stricter `CompEggLayer`
  had nothing to complain about.
- **The bee is milkable and shearable at once**, tallow on one side and wool on the other, which is
  unusual and entirely deliberate on the author's part. Untouched.
- **No balance value was touched**, including the food appetite that makes the megabee expensive to
  keep and the 1.4 move speed that makes it slower than a walking colonist.

## Where this came from

The port was done inside a private pack that had gathered two dozen abandoned animal mods, where
this bee was one source among them — and the only one besides Steve's Animals to bring a craftable
item rather than an animal alone. It leaves the pack to stand on its own, because the rule that pack
follows is that a mod which is dead **and** states nothing gets republished with credit rather than
kept back. The pack keeps only what cannot be published: sources that are alive in 1.6, and the one
whose author refuses redistribution.
