---
localization: complete
translation_en: complete
translation_fr: complete
settings_audit: not_applicable
mod:          Megabees Renew
packageId:    nelim.megabees
repo:         Rimworld-Megabees-Renew
visibility:   public
detached:     yes
workflow_stage: followUp[1.0.1]
licence:      open
licence_at:   "2026-10-10: open, decided by Virginie. zoura3025 (creator of Megabees, 2830700043) answered the thanks comment on 2026-10-09 with an explicit permission (I do not mind people maintaining my mods while I am away). Before: silent since 2026-09-13 (no licence anywhere, abandoned at 1.4)."
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    2026-10-10 (5 passes plus make-honey at 41c1e6c, all green; docs/runs/2026-10-10-41c1e6c-passes.txt; deploy non-regression of 1.0.1 still to play)
workshop:     3811291235 (public since 2026-10-10; 1.0.0 uploaded 2026-10-09 by CI run 37934952391 at 02ceebb, tag v1.0.0; 1.0.1 uploaded 2026-10-10 by CI run 38054412347 at 48b94e9, tag v1.0.1, with preview, description and title)
remaining:
  - unverified: CompatibilityPatchTests (7 tests) skipped, lxml unavailable in this WSL (no pip, no sudo); patch logic hand-verified once with plain ElementTree (docs/runs/2026-09-28-animal-integrations.txt) and, since 2026-09-29, played in game by Pickle 04 (avec-ads2). Install lxml and rerun before relying on the offline suite alone.
  - todo: 1.0.1 follow-up by Virginie: replace the gallery image 0 by Art/Gallery/0-preview.png (by hand), set the item public when ready, re-enable the mod (packageId changed), then the thanks comments (TSP 2959585309 drafted in PUBLICATION.md, register row drafted). Then non-regression after deploy (AUDIT.md 14.a) and cleanup (14.c).
  - unverified: Migration of a save made with the original mod: no such save exists; not a gate (TEST_SCENARIOS.md, "Existing colony").
  - unverified: Codex task title (set_thread_title unavailable in this session): set it to `followUp[1.0.1]`.
code_review_sha: db6bf5f7f5b96bb11ee402b071491a8065e9e706
echo_review_sha: 79f0a04fde19a23afb83b1541825d788e929abec
social_preview_sha256: 73449e48a5072d81cc3c1b30a9b85f890063e4cab27537069c960b36f99e02c7
publication_changelog_review_sha: 09254f92aab40dcdf41cc4a3e2e27a6f179188a9
session:      megabees / followUp[1.0.1]
updated:      2026-10-09
protocols_read_sha: fc2fe915a7378bc22fdefadc18a2ccb246c9d5cb
---

# Megabees Renew — status

Older dated sections (audits 2026-09-13 to 2026-10-09, dry-run, publication) are one line each in `docs/runs/2026-10-09-status-history.txt`; the full text is in git.

## Current state

- **Published 1.0.0.** CI run `37934952391` at `02ceebb13739e2e80e090a60029ae1c1b24aec9c`, tag `v1.0.0`, GitHub release. Item `3811291235` is public. Steam page: description pasted by hand from the converter output (`[h1]` headings), gallery of four images uploaded by hand. Production checklist done by Virginie (public, subscribed, Watch all activity); thanks comment for zoura3025 posted, register row `posted`.
- **Gates.** `code_review_sha` e306e4c (range 898cf93..e306e4c, level low, no finding). `publication_changelog_review_sha` 313b07d, since changed by headings and link fixes in `PUBLICATION.md`; Virginie asked not to be asked again for this review.
- **Tests.** Five Pickle passes green at 0145956 (2026-09-29). Non-regression after deploy green at 3875ccc, 2026-10-09 (31 passed, 12 skipped by requirement, 0 failed; `docs/runs/2026-10-09-3875ccc-non-regression.txt`). Offline: unittest 25 ok, 8 skipped (no lxml in this WSL).
- **Translations.** English native in `Mod/Defs`; French 30 keys reviewed by Virginie 2026-10-09; no pawn agreement (animal).
- **Settings.** `not_applicable`: fixed content balance, no settings page or shortcut.
- **Compatibility.** Optional ADS 2 patch (`loadBefore`); no patch for XND Nocturnal Animals, Better Crossbreeding, Dogs mate (written reasons in `docs/runs`). Declared incompatible with the original (`zoura3025.megabees`). Hard dependencies: none.
- **Upstream.** Original has no repository (About.xml has no `<url>`); no PR possible. Licence `open` (permission quoted in ATTRIBUTION.md, identical in `Mod/`).
- **Next.** 1.0.1 uploaded 2026-10-10 (item private). Owner: gallery image 0, public switch, thanks comments. Session: non-regression after deploy, then cleanup of evidence and WSL (Universal Processor 2633514537, make-honey deps) when the last ticket is played.
- **Echo.** Kept, validated by Virginie 2026-10-10 with the accepted gallery in hand (larva line-art still fits the three photos; panel shortened after the tag was removed).

WSL note 2026-10-09: pass 7 first failed at staging (exit 1, no report): Universal Processor (2633514537) was in no Workshop folder. Downloaded into the WSL cache with `scripts/download-workshop-wsl.sh` under `Use-Wsl.ps1`; to remove at the cleanup after the test, unless another mod's `wsl-deps` names it. Request retried as `make-honey-English-671ecaf-2`.

Item taken out of public by Virginie 2026-10-09 (reported): 2 subscribers (herself included), before the packageId change `nelim.megabeesrenew` to `nelim.megabees` ships in 1.0.1. The item is private again until `1.0.1` is published and tested.

Author's reply 2026-10-10 (reported by Virginie, pasted from the original's page): zoura3025, creator of Megabees, answered the thanks comment: "No problem! Modding is a collaborative effort; I don't mind people maintaining my mods while I'm away. Thanks for the shout here <3". That is an explicit permission found in the Workshop comments (PUBLISHING.md, Licence). Virginie then set `licence: open` (2026-10-10). Still to do after the pass-7 `RUN_DONE` (`Mod/` is frozen): ATTRIBUTION.md (both copies) records the quote and the new status; the `(unofficial)` suffix (`About.xml` name, Preview tag, `mod` field here, README title) and the UNOFFICIAL paragraph (description) only apply to `silent` (PUBLISHING.md, Licence), so they go if Virginie confirms; that means a Preview regeneration and a description update on the page.

Pass 7 findings 2026-10-09 (make-honey): a control run without any patch of this port showed Make Honey EVEN MORE Compatible already accepts `MegabeeTallow` in `KYD_HoneySyrup` (its root patch puts the tallow in a category under Honey), so the first version of the patch (repointing two `MayRequire` attributes) was dropped. The real defect is its category icon `oldmegabee_east`, a texture only the original ships: the game logs "Could not load Texture2D" and the category shows the red square. `Compat_MakeHoneyEvenMoreCompatible.xml` repoints it at `megabee_east`; `About.xml` gains `<loadAfter>TSP.zal.patchhoney2</loadAfter>`. Control without the patch: scenario 3 failed as expected (`make-honey-icon-nopatch`, "the icon ... did not load").
