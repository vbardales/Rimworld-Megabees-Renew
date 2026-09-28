# Protocols read, and which version

Version = last commit touching the file, in its own repository. Protocol docs (AGENTS, AUDIT, PUBLISHING, TRANSLATIONS, STYLE_RIMWORLD, MOD_SETTINGS, WORKSHOP_COMMENTS, SEARCHING) live in `../rimworld-protocols.git`: read with `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 -- <file>` from the monorepo root, `git log` there lies. `M` = read as on disk, not committed. Reread when the version moves. Last pass: **2026-09-28**.

## Read in full, useful
| Document | Version | What it changed here |
| --- | --- | --- |
| `AGENTS.md` (collection) | 3a1d2cb 2026-09-24 M | Ordered gates; evidence rules; CI-only publication. |
| `AGENTS.md` (this mod) | 9391da0 2026-09-13 | Stage change => rename Codex task (`set_thread_title` not available here: pending). |
| `AUDIT.md` | c5ca0c0 2026-09-26 M | Step 12 audit rule (fall back to last established state), `tested` gate criteria, no game launch, requests only via `Submit-PickleRun.ps1`. |
| `TRANSLATIONS.md` | f5c2d9d 2026-09-25 | Plural rule: no counted text in this mod, n/a. |
| `MOD_SETTINGS.md` | b83933b 2026-09-23 | `not_applicable` stands (no settings, no page, no shortcut). |
| `PUBLISHING.md` | 95c6dfd 2026-09-28 M | Read: origin-repo rule, **animal integrations rule (ADS 2, XND, Better Crossbreeding) before preTest**. Rest skimmed by headings; reread fully at `prepublished`. |
| `PickleTools/Authoring/README.md` | 8d3ca6d 2026-09-26 | Suite layout, pass matrix, timeouts (watchdog 120 s). |
| `PickleTools/TESTING.md` (section "What to keep") | 650adce 2026-09-25 | Evidence keep/delete table, copied into TESTING.md. |
| `PickleTools/README.md` | c771bef 2026-09-25 | Tool catalogue (LoadAudit, CoatSteps, DefFieldSteps fit an animal mod). |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 77ca9d7 2026-09-27 | Filters, DepMap, no SHA in requests, no `.ico`/`desktop.ini` under `Mod/` (`*.ico` now ignored). |
| `scripts/SEARCHING.md` | 50de695 2026-09-28 | `Search-Workshop.sh` for a corpus-wide defName/class/texture search; not what confirmed `upstream_mod_remotes: N/A` (that was a web search, About.xml/Workshop page reading, done 2026-09-13/28), but this is the tool of record for the next defName-collision recheck. |

## Read via digest (sub-agent), useful later
| Document | Version | Note |
| --- | --- | --- |
| `PickleTools/Headless/README.md` | ed4e73a 2026-09-26 | Needed when writing the suite. |
| `PickleTools/docs/steps.md` | 09f9c0e 2026-09-28 | Spawn/animal steps; life-stage assertion has no step. |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | d07b2b8 2026-09-26 | Needed at first run request. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 3c03f51 2026-09-26 | Needed at `prepublished`/`published`. |
| `WORKSHOP_COMMENTS.md` | 5dcb0c7 2026-09-28 M | Needed at publication; no row for the original page yet. |
| `STYLE_RIMWORLD.md` | 7311308 2026-09-25 M | Only if icon/Preview is regenerated (owner only). |

## Not useful now (reread only if version moves)
`Rimworld-Ticket-Dispatcher/docs/WELCOME.md` sections on gallery zoom: publication time.

## Other mods read as a model
`FunnyCreaturesRenew/Mod/Patches/Compat_*.xml` and `FunnyCreaturesRenew/Tests/test_mod.py::CompatibilityPatchTests`, 2026-09-28, for the three animal-integration patches: structure, guards, and the lxml offline-test pattern copied and adapted for a single animal with no crossbreed candidate.

## Mod files
STATUS.md, README.md, CHANGELOG.md, ATTRIBUTION.md, TEST_SCENARIOS.md, About.xml read. Absent: LICENSE (silent licence, justified), PUBLICATION.md (due before `prepublished`), NOTES.md, BUGS.md (never needed).
