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
workflow_stage: playTests[1.1.0]
licence:      open
licence_at:   "2026-10-10: open, decided by Virginie. zoura3025 (creator of Megabees, 2830700043) answered the thanks comment on 2026-10-09 with an explicit permission (I do not mind people maintaining my mods while I am away). Before: silent since 2026-09-13 (no licence anywhere, abandoned at 1.4)."
upstream_mod_remotes: N/A
dependencies: none
showcase:     complete
tested_1_7:   yes
tested_on:    2026-10-10 (non-regression after deploy of 1.0.1 at 0e2e93b, six passes all green; docs/runs/2026-10-10-0e2e93b-non-regression.txt)
workshop:     3811291235 (public since 2026-10-10; 1.0.0 uploaded 2026-10-09 by CI run 37934952391 at 02ceebb, tag v1.0.0; 1.0.1 uploaded 2026-10-10 by CI run 38054412347 at 48b94e9, tag v1.0.1, with preview, description and title)
remaining:
  - 1.1.0 prepared (7471d8a, 2026-10-26): `<li>1.7</li>` declared, Preview badge 1.7, CHANGELOG `[1.1.0]`, Steam change note. Social preview re-uploaded 2026-10-26 (sha256 recorded). Left: code review (`code_review_sha`); publication through the CI (tag `v1.1.0`, update_tags=true).
  - Dry-run 1.1.0 green (2026-10-26, run `40401820328`, https://github.com/vbardales/Rimworld-Megabees-Renew/actions/runs/40401820328, ref `89ab7f9b1a896beaac5a9daff3eb2c19b6efa326`, options update_preview=true update_tags=true, template 61d714225d9c): change note read, preview sha256 `dea90a48...b26a8` replaces the page image, tags Mod/1.6/1.7 (adds 1.7). Next: publish with the same ref and options through dispatch-publish.sh, then Virginie approves `steam-production`.
  - unverified: 1.7 diagnostic ran (ticket `20261013-144235-646-d174`, `docs/runs/2026-10-15-1.7-diagnostic.md`): 1 passed, 4 failed, all `Undefined step` (the `net48` step DLL has no 1.7 build); not a mod defect. `net10.0` steps built (WSL `~/pt17/mods`, map `wsl-deps.minimal-17.map`); replay 01-03 filed 2026-10-15, ticket `20261015-225350-702-3974`, evidence `Tests/Pickle/Evidence/p17-replay-english-7b3170f`. Replay result (found on disk 2026-10-26, `Tests/Pickle/Evidence/p17-replay-english-7b3170f`, set minimal-17): 5 scenarios, 5 passed, 0 failed (summary.json `exitReason` passed).
  - unverified: Migration of a save made with the original mod: no such save exists; not a gate (TEST_SCENARIOS.md, "Existing colony").
code_review_sha: a04e760e6329acd1cc325d3a8a2b6615ed7c876e
echo_review_sha: 7471d8aba214ad223cf0ba7b348107e1a325f8c1
social_preview_sha256: dea90a487219b88482163c74690836586158d3b7fa8b031ddd6d1395e84b26a8
publication_changelog_review_sha: 7471d8aba214ad223cf0ba7b348107e1a325f8c1
session:      megabees / playTests[1.1.0]
updated:      2026-10-13
protocols_read_sha: 43dd90d4b7873c500347fba1be01275a48d5795b
---

# Megabees Renew — status

Older dated sections (audits 2026-09-13 to 2026-10-10, dry-run, publication, WSL, author reply, pass 7 findings) are one line each in `docs/runs/2026-10-09-status-history.txt` and `docs/runs/2026-10-10-status-history.txt`; the full text is in git.

## Current state

- **Published 1.0.1** (2026-10-10, CI run `38054412347` at `48b94e9`, tag `v1.0.1`; 1.0.0 was run `37934952391` at `02ceebb`). Item `3811291235` is public (packageId `nelim.megabees`; subscribers of 1.0.0 had to enable the mod again). Description, title and header image sent by the CI; gallery image 0 replaced by hand.
- **Gates.** `code_review_sha` and `publication_changelog_review_sha` are the commits reviewed for 1.0.1; the echo is `Art/echo-source.png`, drawn from the gallery and validated by Virginie 2026-10-15 (the 2026-10-10 echo was replaced; `echo-preview.png` removed); social preview sha256 recorded.
- **Tests.** Non-regression after deploy green at 0e2e93b, 2026-10-10: six passes (tools EN/FR, avec-ads2, incompat-original, dlc-absent, make-honey), 34 passed, 0 failed (`docs/runs/2026-10-10-0e2e93b-non-regression.txt`). Offline (2026-10-11, d34b315, lxml installed, `RIMWORLD_DIR=~/rimworld`): unittest 25 tests, 0 failed, 2 skipped (ADS 2 not in the WSL Workshop folder; its patch is covered by the avec-ads2 pass). `test_every_operation_is_guarded` was stale since 1.0.1 (expected only the ADS 2 patch, rejected the FindMod guard of the Make Honey patch); fixed; Check-DefInjected 40 keys, 0 errors.
- **Translations.** English native in `Mod/Defs` (three inherited typos fixed in 1.0.1); French 30 keys reviewed by Virginie 2026-10-09; no pawn agreement (animal).
- **Settings.** `not_applicable`: fixed content balance, no settings page or shortcut.
- **Compatibility.** Optional ADS 2 patch (`loadBefore`) and optional Make Honey EVEN MORE Compatible patch (category icon, `loadAfter`); no patch for XND Nocturnal Animals, Better Crossbreeding, Dogs mate (written reasons in `docs/runs`). Declared incompatible with the original (`zoura3025.megabees`). Hard dependencies: none.
- **Upstream and licence.** Original has no repository; no PR possible. Licence `open` (zoura3025's permission quoted in ATTRIBUTION.md, identical in `Mod/`).
- **Register.** Thanks posted to zoura3025 and Make Honey EVEN MORE Compatible (`WORKSHOP_COMMENTS.md`); Use This Instead `reported` 2026-10-10 (`USE_THIS_INSTEAD.md`).
- **Cleanup 2026-10-10 (AUDIT.md 14.c).** Evidence pruned to the latest report per scenario (24 folders, 111.6 MB); STATUS, BACKLOG, TESTING, PROTOCOLS-READ trimmed. WSL: the cache holds Universal Processor 2633514537 (downloaded by this mod for pass 7) but `FullzoonCookiesRenew/Tests/Pickle/wsl-deps.avec-mlie.map` names it too, so it stays; `2919554065` and `2959585309` are read from the Windows Workshop folder, not the WSL cache; nothing removed. A mod this mod mounts and others name (ADS 2 3238353862) stays.
