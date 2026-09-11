# Megabees Renew

The megabee, brought forward to RimWorld 1.6.

**I am not the author of this mod.** The bee is zoura3025's; all I did was the work needed to make
it run on 1.6. Credit goes to them, mistakes in the update are mine.

Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2830700043 — last supporting
1.4, last updated in January 2023. Abandoned, not withdrawn.

## What the mod does

It adds one animal and the four things it makes.

- **Megabee** — body size 5.25, larger than a muffalo, moving at 1.4 cells per second. Sixty-five
  years of life, market value 500, wildness 0.80. Stingless and docile by design; its bulk and its
  resemblance to a honeybee are what keep predators off.
- **It cannot be trained at all** (`trainability: None`) and it eats both rough vegetation and
  trees, in quantity.
- **Megabee wool** — shearable every three days. Stiff rather than soft, good in heat, very durable.
- **Megabee tallow** — milked rather than churned, the raw material a hive would turn into honey.
- **Megabee eggs**, fertilized and unfertilized: two or three every day and a half.
- **Megabee tallow salve** — a healing item, craftable at a crafting spot or a drug lab.

It also brings **its own body plan**: thorax, abdomen, metathorax, a trophylactic stomach and a
reproductive tract, so wounds and surgery land where a bee has parts rather than where a quadruped
does.

No DLC required. No Harmony, no framework, no dependency of any kind.

Content mod: removing it mid-save will lose any megabee, and any wool, tallow, egg or salve already
in play.

## What changed in the 1.6 update

One line.

- **`wildness` moved to `<Wildness>` under `statBases`.** It stopped being a field of
  `RaceProperties` in 1.6 and became a StatDef. The old form is not an error, it is simply never
  read, and the stat's default is `-1` — outside the range the game uses, so the bee tamed for
  almost nothing instead of sitting at 0.80.

Nothing else needed touching: the rest is valid 1.6 as it stands. No balance value was changed.

## Terms

The original **states no licence anywhere** — no file in the mod, nothing in its `About.xml`, no
linked repository, and nothing on its Workshop page, which was read looking for a refusal rather
than for a permission. Silence grants nothing and forbids nothing.

This port rests on the Workshop's own custom for abandoned mods: named credit, and a takedown on
request. If zoura3025 comes back to the bee, or asks for this to be taken down, it comes down.

If I do not answer within a reasonable time after being contacted, anyone may freely update this or
any other of my mods, including publishing a continuation of it. All credit must be preserved.

## Credits

- **zoura3025** — the mod, the bee, its products and its textures.
- 1.6 update by nelim. Written with the help of Claude (Anthropic).

See [ATTRIBUTION.md](ATTRIBUTION.md) for the licence check and the port in detail.
