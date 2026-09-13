---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Megabees Renew (unofficial)
packageId:    nelim.megabeesrenew
repo:         Rimworld-Megabees-Renew
visibility:   public
detached:     yes
stage:        done
licence:      silent
licence_at:   2026-09-13
dependencies: none
showcase:     complete
tested_on:
workshop:
remaining:
  - unverified: In-game scenarios, logs, EN/FR UI, new game and existing save.
session:      workflow audit
updated:      2026-09-13
---

# Megabees Renew — status

## Fix follow-up — 2026-09-13 (current validation)

**horsMonoRepo -> done**, ready for final functional validation in game, not tested.
Base commit remains `96b1f2859cd5cc15798fa2fdd3a36c2e6efaec61`; fixes are local,
uncommitted and unpublished. See Tests/RESULTS.md and Tests/delivered-sha256.json
for the checks and exact delivered content. The earlier audit and failures below
are retained as history and superseded only where this section records a recheck.

- About.xml and README now carry the exact unofficial title/notice; the description
  ends with the required Steam-formatted source link. Attribution copies match.
- Forty French fields cover the owned source inventory; English remains native Def
  text. All six portable XML/resource tests pass. Shared Check-DefInjected reports
  40 keys, zero errors, exit 0. Its first run found two indexed brood paths; those
  were changed to the native `brood` handle and the complete check rerun successfully.
- No gameplay Def or texture changed. Decompiled installed Verse.ParseHelper shows
  ParseColor trims all closing parentheses, then parses numeric channels. GenColor
  divides integer channels by 255 without rejecting 256. The suspicious source values
  are accepted by this implementation; no speculative balance/color change was made.
  This source verification resolves the audit question, not a claim of a game session.
- ModIcon is installed at 128 x 128, 37,660 bytes. The existing bee-smiley artwork
  was retained, archived as Art/ModIcon-original.png and resized; 128/32 px inspected.
- Preview is installed at 896 x 504, 523,196 bytes. Source Art/Preview.png was generated
  with built-in imagegen using the mod's bee texture as reference. Direct inspection
  at full size and 268 px confirms readable subject/title/version and overhead framing.
  Palette source: olive earth/bee stripes for secondary ink; teal bowl for the distinct
  accent. Art/preview-palette.json and Art/preview.html retain composition parameters.
  Segoe UI is available. Art/contrast-results.json records minima of 11.42 (title),
  9.39 (suffix), 9.48 (tag), 11.45 (summary), all above 4.5:1. Badge uses dark ink on teal.
- Settings remain not_applicable for the previously established content-only reasons.
  Dependencies remain Core-only, with optional DLC tree exclusions. No C# build or
  executable-logic unit tests apply. Relevant resource/XML regression tests now exist
  and passed against the delivered files. Functional scenarios are in TEST_SCENARIOS.md.

All gates through done are established by the previous independent checks and these
fixes/rechecks. The next transition is done -> tested: execute the documented scenarios
in game, review logs, both languages and new/existing saves, then rerun affected checks
after any correction. No interactive game tests were executed or claimed. Existing
output/imagegen artwork and historical audit notes were preserved.

## Historical audit — 2026-09-13

Revision: `96b1f2859cd5cc15798fa2fdd3a36c2e6efaec61`. Repository:
`C:/Users/nelim/Documents/rimworld/MegabeesRenew`; distributed content: `Mod/`.
Read parent AGENTS.md, PUBLISHING.md, STYLE_RIMWORLD.md, MOD_SETTINGS.md and
TRANSLATIONS.md, applying the user's explicit overrides. Reference installation:
RimWorld `1.6.4871 rev590` under `C:/Program Files (x86)/Steam/steamapps/common/RimWorld`.

**Empty stage -> horsMonoRepo.** Literal stage values follow the supplied chain:
`dansMonoRepo -> horsMonoRepo -> ModIcon générée -> Preview générée -> preOptions -> options -> l10n -> preTest -> done -> tested`.
Later independent checks do not validate missing earlier gates. No monorepo remote
needs restoring. The malformed licence fields were normalized to `silent`.

Before this audit, STATUS.md already contained three uncommitted localization fields,
all `unchecked`; these fields are retained with evidence-based values. During the
audit, untracked `output/imagegen/megabees-smiley.png` appeared (1,619,652 bytes).
It was not created, changed or visually inspected by this audit and is outside Mod/.
It does not meet the installed ModIcon requirement. Only STATUS.md was edited by
this audit; no development, generated artwork, translation or publication was performed.

### Ordered transitions

| Transition | Result | Evidence / outstanding requirement |
| --- | --- | --- |
| dansMonoRepo -> horsMonoRepo | Validated | Independent .git, public GitHub repository, configured origin, pushed HEAD matching audited revision; English documentation and rights classification established below. |
| horsMonoRepo -> ModIcon générée | Defect / unverified | Installed icon absent. Compilation not applicable. Development completion not certified; color parsing question below. |
| ModIcon générée -> Preview générée | Defect | Installed Preview.png absent. |
| Preview générée -> preOptions | Defect | Description is English, but exact unofficial suffix/opening notice and final Steam GitHub link are missing. Image styling cannot be assessed without the image. |
| preOptions -> options | Independently validated, not applicable | Fixed content; no useful settings contract, empty page or MainButtons shortcut. |
| options -> l10n | Defect | Native English coverage exists; French resources absent. |
| l10n -> preTest | Independent static check passed | Core references and optional DLC guards checked; no third-party dependency, patches or LoadFolders. |
| preTest -> done | Defect / unverified | No written functional scenarios or reusable XML suite. Audit-time XML checks passed; complete loading/regression validation remains unverified. |
| done -> tested | Unverified | No attributable results for this revision; no game run, log review, EN/FR UI, new-colony or existing-save validation performed. |

### Repository and rights

`gh repo view vbardales/Rimworld-Megabees-Renew --json name,visibility,url,defaultBranchRef`
returned PUBLIC, main and the expected URL. `git ls-remote origin HEAD` returned the
audited SHA. The initial sandbox CLI/network failures were resolved by an authorized
read-only retry. Package ID, display name, folder and repository name are coherent;
literal equality is not required. About.xml has a name field, not packageName.

The installed upstream `workshop/content/294100/2830700043/About/About.xml` declares
1.3/1.4 and `zoura3025.megabees`, no reuse terms or source repository. No LICENSE or
COPYING file exists in that source. The [Workshop page](https://steamcommunity.com/sharedfiles/filedetails/?id=2830700043)
returned the same supported versions, a January 2023 update, and no explicit permission
or prohibition in its description or returned comments. The author's 2025 activity
does not establish declared 1.6 support. Older comment pages were not exhaustively
reviewed. The web response was marked crawled two months earlier, not an exhaustive
live snapshot. Firecrawl was unavailable; the built-in web reader was used.

`silent` and public visibility follow the documented project convention, not an
assertion of upstream consent. Attribution and takedown commitments exist. No licence
was invented for inherited content: absence of LICENSE is justified here.
ATTRIBUTION.md and Mod/ATTRIBUTION.md are byte-identical, SHA256
`9CE463CF72FC413B256BB90CA512642AD64220127334048E4169CA7608178AD8`.
README and CHANGELOG are initialized in English. Mandatory unofficial presentation
remains a defect at the preOptions naming gate; the mod field records the current title.

### Settings audit

Reviewed the animal, body, wool, tallow, eggs and salve recipe. Yields, intervals,
nutrition, combat values and crafting costs are fixed content balance, not an existing
configuration interface. No player configuration, toggleable subsystem, persistence,
inherited settings integration or requested customization was found. Exposing these
constants would invent new options. Full file/Def inspection found no C#, assembly,
settings class, MainButtonDef or patch creating a settings page or shortcut.
`settings_audit: not_applicable` is justified. Input limits, saved settings, application
timing and customization integration tests are not applicable. No RIMMSQOL integration
was tested or claimed. Per the prompt, this no-settings gate needs no game interaction.

### Translation audit

Read all four Def files, including nested fields. Forty owned English text nodes
are nonempty: labels, descriptions, labelMale, labelPlural, 16 body customLabel entries
and two attack labels. These use native translatable Def fields; no custom code strings,
Keyed keys, formatted parameters or concatenated UI exist. English source values provide
coverage without redundant language files. Identifiers, comments, devNote and About
metadata are excluded. Localization mechanism and English resource readiness are
complete, not certified in game. French is partial because Mod/Languages is absent.
All owned fields need French, including nested body parts, attack and brood labels.
There are no existing injection paths to validate with Check-DefInjected; once resources
exist, validate their actual nested paths and generated recipe text. FR/EN runtime
checks remain separate and unverified.

### Executed checks and limitations

- PowerShell `[xml](Get-Content -Raw)` parsed all five XML files successfully.
  Thirteen Def declarations have no duplicate type/defName pair.
- Parsed installed Core Defs, checked all used ParentName bases and 61 explicit
  references: zero missing. Scope included body parts, products, race/hatcher,
  life stages, sounds, tools, recipe users, work stats/skills and categories.
  Identifier presence is not full inheritance/type or game-loader validation.
- Verified Royalty Plant_TreeAnima and Ideology Plant_TreeGauranlen definitions and
  matching MayRequire guards. DLC loadAfter entries do not make DLC mandatory.
  incompatibleWith matches the installed source ID. The four named comps are native
  Milkable, Shearable, EggLayer and Hatcher; no third-party implementation is used.
- `git diff --no-index` against installed upstream megabee.xml confirmed only the
  Wildness move. Hash comparisons confirmed BodyDefs.xml, ResourceDefs.xml and
  salveDefs.xml are byte-identical to that upstream installation.
- File checks confirmed both delivered About images absent. No dimensions, palette,
  composition or camera pass is claimed; no camera defect was observed or asserted.
- Enumerated 40 text fields, zero empty entries, no French directory.
- No build project/DLL requires compilation. Custom-code unit tests are not applicable;
  XML regression tests are applicable. No test suite, scenarios or attributable
  historical game results were found. Audit-time checks do not establish `done`.

Four juvenile/adult graphic colors in megabee.xml contain `(256,256,256))`, with an
extra closing parenthesis. Baby colors are `(256,256,256)`. These are inherited from
upstream. XML accepts the text, but game color conversion was not exercised; their
runtime effect is **unverified**, not a proven load failure. Resolve this question
before certifying development completion.

### Strict next step and optional observations

To reach ModIcon générée: establish development completion, including the color parser
question, then provide and verify an installed 128 x 128 PNG ModIcon. No C# build applies.
Later gates need the preview, required presentation corrections, French resources,
written scenarios/reusable XML tests, then actual in-game validation of delivered content.

Optional: proofread source wording such as `psuedo-wool`. The upstream availability
wording in ATTRIBUTION could be refreshed: the web response contains generic removal
and incompatibility banners, which alone establish neither author withdrawal nor a
redistribution refusal. No optional visual recommendation is made without an inspection.

## Historical sweep notes (superseded by the audit above)

The previous header had empty stage/tested_on/workshop, unchecked language fields,
`licence: licence_ou:`, `licence_at: vitrine: aucune`, and a 2026-09-12 automatic sweep
date. Its only remaining item was `unverified: never seen running`. The explanatory
notes below are preserved as history; their stage vocabulary is not the active mapping.

Read by a sweep across every mod, rather than by asking each thread in turn. It lives at the
root, never inside `Mod/`, so Steam never receives it.

The fields above were read off the disk on 2026-09-12. Four cannot be, and wait for whoever
holds this mod:

- **`stage`** — one of `port`, `showcase`, `preTest`, `done`, `tested`, `published`. Filled in
  from the session group where one exists; confirm it.
- **`tested_on`** — the date of the last run in game. Empty means never.
- **`dependencies`** — `declared` when every mod this one needs is named in the About's
  `modDependencies`, `to check` when a non-vanilla `loadAfter` suggests a dependency that is not
  declared, `none` when the mod needs nothing. An undeclared dependency is not cosmetic: on
  2026-09-11 Reequilibrage animaux took 47 vanilla animals down with it, Muffalo included, because
  the class it injects belongs to a mod that was not declared and not loaded.
- **`remaining`** — what is left, in three kinds: `feature` for something missing from a first
  release, `defect` for a known fault left unfixed, `unverified` for what could not be checked.
  The line already there is true of nearly the whole repository; replace it once it stops being.

`licence` vocabulary: `open` an explicit licence, `silent` no licence and a dead source,
`alive` no licence but a living source, `forbidden` a written refusal, `original` owing nothing
to anyone — not a name, not an idea traceable to one mod, not a value derived from its assets.
