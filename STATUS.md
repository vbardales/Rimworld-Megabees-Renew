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
stage:        published[1.0.0]
workflow_stage: published[1.0.0]
licence:      silent
licence_at:   2026-09-13
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    2026-10-09 (non-regression after deploy, 5 passes at 3875ccc, all green; docs/runs/2026-10-09-3875ccc-non-regression.txt; earlier 2026-09-29 at 0145956)
workshop:     3811291235 (public; 1.0.0 uploaded 2026-10-09 by CI run 37934952391 at 02ceebb, tag v1.0.0)
remaining:
  - unverified: CompatibilityPatchTests (7 tests) skipped, lxml unavailable in this WSL (no pip, no sudo); patch logic hand-verified once with plain ElementTree (docs/runs/2026-09-28-animal-integrations.txt) and, since 2026-09-29, played in game by Pickle 04 (avec-ads2). Install lxml and rerun before relying on the offline suite alone.
  - unverified: test with Make Honey EVEN MORE Compatible (TSP) (Workshop 2959585309): requested by Virginie 2026-10-09; not read, not staged, no Pickle map yet. Read the mod, decide patch or none, then a pass (`wsl-deps.<name>.map`).
  - unverified: Migration of a save made with the original mod: no such save exists; not a gate (TEST_SCENARIOS.md, "Existing colony").
  - unverified: Codex task title (set_thread_title unavailable in this session): set it to `published[1.0.0]`.
code_review_sha: e306e4c69f4999efc8374c34897ef3345332458b
publication_changelog_review_sha: 313b07d02bf27b9a6f4e6853923f125688d0a14a
session:      megabeesrenew / published[1.0.0]
updated:      2026-10-09
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
- **Upstream.** Original has no repository (About.xml has no `<url>`); no PR possible. Licence `silent`; ATTRIBUTION.md identical in `Mod/`.
- **Next.** Test with Make Honey EVEN MORE Compatible (2959585309), after the non-regression. The cleanup of evidence and WSL waits for that test.
