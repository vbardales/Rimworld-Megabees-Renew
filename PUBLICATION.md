# Publication: Megabees Renew (unofficial)

What the Workshop page asks for and the repository holds nowhere else: the description, the change notes, the order of the
captures, the messages to the mods this one is built on, the dependencies, and the answer to the content questions. It serves
twice: for the first upload of `1.0.0`, and for whoever takes the mod over.

**State, 2026-10-09: a draft, gallery and content questions done.** The item `3811291235` exists, created by the prepublication `0.1.0` of 2026-10-01
(`Mod/About/PublishedFileId.txt`, commit `8996319`); it is private and stays private until the owner makes it public by hand.
The stage is `tested`; `prepublished` still needs the owner's French review (`FRENCH_REVIEW.md`) and a green dry-run of
the exact SHA. The rules this follows are in `PUBLISHING.md` and `AUDIT.md`, steps `tested -> prepublished` and
`prepublished -> published`.

## Steam description

The single source, in Markdown: the CI converts it to the Steam description (BBCode) and to the plain-text `<description>` of
`Mod/About/About.xml`, and stops when they differ. **`About.xml` was regenerated from this block on 2026-10-08 (plain text: bold marks dropped, links written `text (url)`); it is regenerated from this block, not the other way round.** The block below keeps that text, with the sections the rules add: it opens with the UNOFFICIAL paragraph, has `IF I GO
QUIET`, `AI-GENERATED` and `THANKS` in that order after the body, then the pointer to `ATTRIBUTION.md` and the licence, and ends with
the source link. It contains no code fence.

```markdown
UNOFFICIAL. This mod is published without the original author's explicit consent. If the original author contacts me to request its removal, I undertake to take it down promptly.

The megabee, brought forward to RimWorld 1.6. A stingless, docile, enormous honeybee engineered to produce rather than to sting.

I am not the author of this mod. The bee is zoura3025's; all I did was the work needed to make it run on 1.6. Credit goes to them, mistakes in the update are mine. If they come back to it, or ask me to take this down, it comes down.

Original mod: [Megabees](https://steamcommunity.com/sharedfiles/filedetails/?id=2830700043), last supporting 1.4, last updated in January 2023. Abandoned, not withdrawn.

# WHAT IT ADDS

One animal and the four things it makes. The megabee has body size 5.25, larger than a muffalo, and moves at 1.4 cells per second, slower than a colonist walking. Sixty-five years of life, worth 500 silver, wildness 0.80, and it cannot be trained at all. It eats rough vegetation and trees both, and it eats a great deal of it.

- Megabee wool, shearable every three days. Stiff rather than soft, good in heat, and very durable.
- Megabee tallow, milked rather than churned, which is what the hive would otherwise make honey with.
- Megabee eggs, fertilized and unfertilized: two or three every day and a half, like a chicken that weighs as much as a cow.
- Megabee tallow salve, a healing item craftable at a crafting spot or a drug lab.

It also brings its own body plan: a thorax, an abdomen, a metathorax, a trophylactic stomach and a reproductive tract, so wounds and surgery land where a bee has parts rather than where a quadruped does.

# WHAT CHANGED IN THE 1.6 UPDATE

One line of the original. Wildness stopped being a field of RaceProperties in 1.6 and became a stat declared under statBases. The old form is not an error, it is simply never read, and the stat defaults to -1, outside the range the game uses, so the bee tamed for almost nothing instead of sitting at 0.80. The original balance values are preserved. French translations and presentation assets have been added.

# COMPATIBILITY

Nothing is required. One patch applies only when the other mod is loaded, and changes nothing otherwise.

- [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862): the megabee gets its surgeries, in the same categories as the megascarab and the megaspider.

The original Megabees defines the same defs and is declared incompatible. This is a content mod: removing it mid-save will lose any megabee, and any megabee wool, tallow, egg or salve already in play.

# IF I GO QUIET

If I do not answer within a reasonable time after being contacted, anyone may freely update this or any other of my mods, including publishing a continuation of it. All credit must be preserved.

**AI-GENERATED**

The update work—code, tests and documentation—was carried out with the help of AI assistants: Claude, by Anthropic, and Codex, by OpenAI. The icon and the Preview illustration were generated with DALL-E, by OpenAI.

# THANKS

- zoura3025, for [the megabee](https://steamcommunity.com/sharedfiles/filedetails/?id=2830700043), its body, its products and its textures.
- SamBucher, for [A Dog Said... Animal Prosthetics 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3238353862); Mlie and XeoNovaDan, for [Nocturnal Animals (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2269731409); DizzyEevee, for [Better Crossbreeding](https://steamcommunity.com/sharedfiles/filedetails/?id=3520675842); Mlie and Revolus, for [Dogs mate (Continued)](https://steamcommunity.com/sharedfiles/filedetails/?id=2441132298). Their files were read to decide what the megabee needed, and nothing of theirs was copied.
- The tools this was tested with, for development only and never a dependency: [Pickle](https://steamcommunity.com/sharedfiles/filedetails/?id=3791648678), [RimLogging](https://steamcommunity.com/sharedfiles/filedetails/?id=3733484696) and PickleTools.

Licence and sources: the original states no licence anywhere, and this port rests on the Workshop's own custom for abandoned mods, named credit and a takedown on request. `ATTRIBUTION.md`, in the mod folder and on GitHub, has the licence check and the port in detail.

[Source code on GitHub](https://github.com/vbardales/Rimworld-Megabees-Renew)
```

Settled by the owner, 2026-10-07: DALL-E for the icon and the Preview illustration, Claude and Codex for everything else.
## Steam change notes

Written now, sent when `1.0.0` goes up; they start with the version, alone on the first line, in BBCode. The `0.1.0` upload only created
the item and had no notes of its own.

### 1.0.0

```text
[b]1.0.0[/b]
First release of the 1.6 update of Megabees, by zoura3025.
[list]
[*] Wildness is read again: the old form was silently ignored in 1.6, so the bee tamed for almost nothing instead of at 0.80.
[*] Optional patch for A Dog Said... Animal Prosthetics 2: the megabee gets its surgeries.
[*] French translation.
[/list]
```

## Gallery

**Produced.** The gallery is a manual step on the Steam page (SteamCMD sends the header image only), from `Art/Gallery/`, which holds
the images to upload numbered `0-`, `1-`, `2-`… and nothing else. `0-preview.png` is a byte-identical copy of `About/Preview.png`
(owner rule of 2026-09-29). Every capture is a staged photograph and is opened and read before it goes in (`PUBLISHING.md`, rules of
2026-10-02 and 2026-10-06).

| # | Image | Source | Why here |
|---|---|---|---|
| 0 | `Art/Gallery/0-preview.png`, byte-identical copy | the `About/Preview.png` of this same build | Owner rule 2026-09-29 |
| 1 | The queen and her brood, with Nelim greeting them | `09-gallery` scenario 1, `enclosure-south` of the Sanctuary | Shows what is being installed: the adult and the young stage side by side |
| 2 | The harvest: wool, tallow, eggs | `09-gallery` scenario 2 | What the animal gives |
| 3 | The salve | `09-gallery` scenario 3 | The craftable item |

**Shooting plan (PUBLISHING.md rules of 2026-10-02 to 2026-10-06).** One story, "Noon at the apiary", in the flower enclosure `enclosure-south` of the Sanctuary (SanctuaryBacklot), noon then +5 min then +10 min, with the plan line per image in the header of `09-gallery.feature`. Candidates in `Art/Gallery/` are named `N-candidate-<name>.jpg` until accepted; accepted 2026-10-08 by the owner (all four final images are in `Art/Gallery/`): `1-noon-arrival.jpg`, `2-the-harvest.jpg`, `3-the-salve.jpg` (each under 2 MB, all under 8 MB). Latest run read: `83c5` at `36bc227` (`docs/runs/2026-10-08-36bc227-gallery.txt`); the owner chooses. Not shown: the optional ADS 2 integration and the megabee's body plan tab (`BACKLOG.md`, "Gallery, rewrite"); the face expression waits for an NPT step.

**Held earlier.** The pawn captures were paused on 2026-10-06; the owner re-enabled them and the pause is closed. The zoom must be close enough that the bee is seen; on the default scale an animal is lost in the map (owner, 2026-09-26).

## Thanks to post

Only after the item is visible to its readers, and only what is true. One comment per page, ever; `WORKSHOP_COMMENTS.md` decides
whether one is still needed. Register updated 2026-10-09 (`WORKSHOP_COMMENTS.md`): row added for the original page, this mod added to `Covers` of the others.

| Recipient | Workshop | Registry | Action |
|---|---|---|---|
| Megabees (zoura3025) | 2830700043 | no row | Row added 2026-10-09, `drafted`; draft below (343 characters with the link, within the 150-350 guide). It is also how the author can reach me to ask for a takedown. Page not re-read (Steam answered 429): read its last comments right before posting |
| A Dog Said... Animal Prosthetics 2 | 3238353862 | `posted` | Done 2026-10-09: this mod is in `Covers`. Post nothing |
| [XND] Nocturnal Animals (Continued), Mlie and XeoNovaDan | 2269731409 | `posted` | Files read, no patch (the megabee has no insect analogue listed nocturnal). Done 2026-10-09: this mod is in `Covers`. Post nothing |
| Better Crossbreeding (DizzyEevee) | 3520675842 | `drafted` | Files read, no patch. Done 2026-10-09: this mod is in `Covers`; the draft that exists is Funny Creatures Renew's. Post nothing from here |
| Dogs mate (Continued) (Mlie, update of Revolus's mod) | 2441132298 | `drafted` | Groups read 2026-10-02, no patch (mammals only). Done 2026-10-09: this mod is in `Covers`. Post nothing from here |
| Pickle, RimLogging | 3791648678, 3733484696 | `posted` | Done 2026-10-09: this mod is in `Covers`. Post nothing |
| PickleTools | 3806142401 | `not_applicable` | Same author; `Covers` updated 2026-10-09 |
| Harmony | 2009463077 | `posted` | Every pass stages it: added to `Covers` 2026-10-09. Post nothing |

`<ID>` is `3811291235`, the id of this mod's item (known).

**For zoura3025**, on the page of the original:

```
Hi zoura3025 :) your megabee was stuck at 1.4, so I carried it to 1.6, credit and all: [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3811291235]Megabees Renew (unofficial)[/url]. Its wildness had silently stopped being read, so it tamed for nothing; that is the only change to your files. If you want it down, say so and it goes.
```

## Dependencies and DLC

| Item | Decision | Why |
|---|---|---|
| Hard dependency | **None** | The mod is XML only. `modDependencies` is empty (offline suite) |
| Expansions | None required | `loadAfter` names Core and the five expansions, which only orders loading; `willNeverEat` `MayRequire` on Royalty and Ideology; pass 5 (`dlc-absent`, 4/4 green 2026-09-29) shows it resolves without them |
| A Dog Said... Animal Prosthetics 2 | Optional, `loadBefore` | It copies its category lists once, at its own last patch, so this mod has to load first; pass 3 (`avec-ads2`) green |
| [XND] Nocturnal Animals, Better Crossbreeding, Dogs mate | No patch, no order | Written reasons in `STATUS.md` |
| The original Megabees (`zoura3025.megabees`) | `incompatibleWith` | Same defNames; pass 4 (`incompat-original`) green, the symptom still holds |

## Content questions

Answered 2026-10-09 from the four final images in `Art/Gallery/`: a file name does not say what a picture holds, and these boxes
commit the page. **Nothing adult to declare.** One large insect-like animal, its young, wool, tallow, eggs and a salve, and a clothed
colonist; no gore, no nudity, no sexual content.

## After the upload, which cannot be caught up

- `Mod/About/PublishedFileId.txt` is already committed (`8996319`). Never delete it: lost, the next upload creates a second item.
- The item is **private** and RimWorld never sets its visibility. The owner subscribes to it, tests it, then makes it public by hand,
  subscribes to its comments and watches its activity and its parents' (`PUBLISHING.md`).
- `CHANGELOG.md` opens with `## [0.1.0]`, "creation of a publishIdFile", and `## [1.0.0]` stays `unreleased` above it until the CI
  publishes it. The CI creates the tag and the release after a good upload: not by hand.
- The publication is by CI: a dry-run of the exact SHA first, `publish` with the 40-character SHA, and only the owner approves
  `steam-production`. `generate-publish-workflow.sh` writes into `.github/` and waits for the owner's word.

## Open, and the owner's

1. **The French review** of `FRENCH_REVIEW.md` (`translation_fr: partial`).
2. **The rollback target**, chosen before publishing: the last commit whose runs are all green. None published yet, so none.
3. **Regenerate `About.xml`** from the Markdown block above once the runs are done and `Mod/` is free.
4. **Visibility**: public, by hand, after subscribing to the item and testing it.
