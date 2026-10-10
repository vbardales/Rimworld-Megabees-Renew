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
workflow_stage: dormant
licence:      open
licence_at:   "2026-10-10: open, decided by Virginie. zoura3025 (creator of Megabees, 2830700043) answered the thanks comment on 2026-10-09 with an explicit permission (I do not mind people maintaining my mods while I am away). Before: silent since 2026-09-13 (no licence anywhere, abandoned at 1.4)."
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_on:    2026-10-10 (non-regression after deploy of 1.0.1 at 0e2e93b, six passes all green; docs/runs/2026-10-10-0e2e93b-non-regression.txt)
workshop:     3811291235 (public since 2026-10-10; 1.0.0 uploaded 2026-10-09 by CI run 37934952391 at 02ceebb, tag v1.0.0; 1.0.1 uploaded 2026-10-10 by CI run 38054412347 at 48b94e9, tag v1.0.1, with preview, description and title)
remaining:
  - unverified: Migration of a save made with the original mod: no such save exists; not a gate (TEST_SCENARIOS.md, "Existing colony").
  - unverified: Codex task title (set_thread_title unavailable in this session): set it to `followUp[1.0.1]`.
code_review_sha: db6bf5f7f5b96bb11ee402b071491a8065e9e706
echo_review_sha: 79f0a04fde19a23afb83b1541825d788e929abec
social_preview_sha256: 73449e48a5072d81cc3c1b30a9b85f890063e4cab27537069c960b36f99e02c7
publication_changelog_review_sha: 09254f92aab40dcdf41cc4a3e2e27a6f179188a9
session:      megabees / dormant
updated:      2026-10-11
protocols_read_sha: 62af5f82742c841b95ec95288e9ac77833517ac0
---

# Megabees Renew — status

Older dated sections (audits 2026-09-13 to 2026-10-10, dry-run, publication, WSL, author reply, pass 7 findings) are one line each in `docs/runs/2026-10-09-status-history.txt` and `docs/runs/2026-10-10-status-history.txt`; the full text is in git.

## Current state

- **Published 1.0.1** (2026-10-10, CI run `38054412347` at `48b94e9`, tag `v1.0.1`; 1.0.0 was run `37934952391` at `02ceebb`). Item `3811291235` is public (packageId `nelim.megabees`; subscribers of 1.0.0 had to enable the mod again). Description, title and header image sent by the CI; gallery image 0 replaced by hand.
- **Gates.** `code_review_sha` and `publication_changelog_review_sha` are the commits reviewed for 1.0.1; the echo is kept (validated by Virginie 2026-10-10); social preview sha256 recorded.
- **Tests.** Non-regression after deploy green at 0e2e93b, 2026-10-10: six passes (tools EN/FR, avec-ads2, incompat-original, dlc-absent, make-honey), 34 passed, 0 failed (`docs/runs/2026-10-10-0e2e93b-non-regression.txt`). Offline (2026-10-11, d34b315, lxml installed, `RIMWORLD_DIR=~/rimworld`): unittest 25 tests, 0 failed, 2 skipped (ADS 2 not in the WSL Workshop folder; its patch is covered by the avec-ads2 pass). `test_every_operation_is_guarded` was stale since 1.0.1 (expected only the ADS 2 patch, rejected the FindMod guard of the Make Honey patch); fixed; Check-DefInjected 40 keys, 0 errors.
- **Translations.** English native in `Mod/Defs` (three inherited typos fixed in 1.0.1); French 30 keys reviewed by Virginie 2026-10-09; no pawn agreement (animal).
- **Settings.** `not_applicable`: fixed content balance, no settings page or shortcut.
- **Compatibility.** Optional ADS 2 patch (`loadBefore`) and optional Make Honey EVEN MORE Compatible patch (category icon, `loadAfter`); no patch for XND Nocturnal Animals, Better Crossbreeding, Dogs mate (written reasons in `docs/runs`). Declared incompatible with the original (`zoura3025.megabees`). Hard dependencies: none.
- **Upstream and licence.** Original has no repository; no PR possible. Licence `open` (zoura3025's permission quoted in ATTRIBUTION.md, identical in `Mod/`).
- **Register.** Thanks posted to zoura3025 and Make Honey EVEN MORE Compatible (`WORKSHOP_COMMENTS.md`); Use This Instead `reported` 2026-10-10 (`USE_THIS_INSTEAD.md`).
- **Cleanup 2026-10-10 (AUDIT.md 14.c).** Evidence pruned to the latest report per scenario (24 folders, 111.6 MB); STATUS, BACKLOG, TESTING, PROTOCOLS-READ trimmed. WSL: the cache holds Universal Processor 2633514537 (downloaded by this mod for pass 7) but `FullzoonCookiesRenew/Tests/Pickle/wsl-deps.avec-mlie.map` names it too, so it stays; `2919554065` and `2959585309` are read from the Windows Workshop folder, not the WSL cache; nothing removed. A mod this mod mounts and others name (ADS 2 3238353862) stays.
