# Protocols read, and which version

Version = last commit touching the file, in its own repository. Protocol docs (AGENTS, AUDIT, PUBLISHING, TRANSLATIONS, STYLE_RIMWORLD, MOD_SETTINGS, WORKSHOP_COMMENTS, SEARCHING) live in `../rimworld-protocols.git` (from the monorepo root: `git --git-dir=../rimworld-protocols.git --work-tree=. log -1 -- <file>`). Reread a file only when its version moves. Last pass: **2026-10-02**. "Digest" = read in full by a sub-agent, rules relayed.

## Read in full by this session, useful
| Document | Version | What it changed here |
| --- | --- | --- |
| `AUDIT.md` | 5a975b5 2026-10-02 | `tested` gate (no `@wip`, `@requires` scenarios played, no manual test left), step 12 fall-back rule, prepublication `0.1.0` and CHANGELOG, pass-order rule, session title `<packageId sans nelim.> / <workflow_stage>`. |
| `PUBLISHING.md` | 4e44398 2026-10-02 | Read in full. **Dogs mate** joins the animal-integration rules (written no for Megabee), `0-` gallery naming, PublishedFileId commit, fail-fast policy for `prepublished`. |
| `TRANSLATIONS.md` | af8427f 2026-10-02 | Read in full. French review by Virginie keeps `translation_fr` at `partial`; reference generator is now `scripts/Make-FrenchReview.ps1` (this mod's `_tools/Generate-FrenchReview.ps1` predates it; same table format). |
| `AGENTS.md` (collection) | 7fd7475 2026-09-29 (digest) | Evidence retention; `docs/runs/` one line per run; CI-only publication. |
| `AGENTS.md` (this mod) | 9391da0 2026-09-13 | Stage change => rename Codex task (`set_thread_title` not available here). |

## Read via digest, useful
| Document | Version | Note |
| --- | --- | --- |
| `MOD_SETTINGS.md` | b83933b 2026-09-23 | `not_applicable` stands. |
| `Rimworld-Release-Admin/docs/OPERATIONS.md` | 3c03f51 2026-09-26 | Needed at `prepublished`/`published`: CHANGELOG `## [version]`, PUBLICATION `### version` block. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` | 77ca9d7 2026-09-27 | No SHA in a request, no `.ico`/`desktop.ini` in `Mod/`, delete evidence with `robocopy /MIR`. |
| `Rimworld-Ticket-Dispatcher/docs/SUBMIT.md` | d07b2b8 2026-09-26 | Only if another run is submitted. |
| `PickleTools/Headless/README.md` | ed4e73a 2026-09-26 | Only if another run is submitted. |
| `STYLE_RIMWORLD.md` | 4e44398 2026-10-02 | Only if icon/Preview is regenerated (owner only). |

## Read, not useful now (reread only if the version moves)
| Document | Version | Why |
| --- | --- | --- |
| `WORKSHOP_COMMENTS.md` | 4e44398 2026-10-02 | Publication time only; no row for the original page (2830700043) yet. |
| `scripts/SEARCHING.md` | 50de695 2026-09-28 | Only for a corpus-wide defName/class search. |
| `PickleTools/README.md` | ff20d89 2026-09-29 (M) | Tool catalogue; suite already written. |
| `PickleTools/docs/steps.md` | da7c3b0 2026-09-28 (M) | Only before writing a new step. |
| `Rimworld-Ticket-Dispatcher/docs/WELCOME.md` gallery-zoom section | | Publication time. |

## Other mods read as a model
`FunnyCreaturesRenew/Mod/Patches/Compat_*.xml` and `Tests/test_mod.py::CompatibilityPatchTests`, 2026-09-28. Dogs mate groups read directly in `2441132298/1.6/Defs/CompatibleSpecies/` 2026-10-02.

## Mod files
STATUS.md, README.md, CHANGELOG.md, ATTRIBUTION.md, TESTING.md, BACKLOG.md, TEST_SCENARIOS.md, FRENCH_REVIEW.md, `docs/runs/`, `Tests/Pickle/` read or checked. Absent and justified: LICENSE (silent licence), PUBLICATION.md (due before `prepublished`), NOTES.md, BUGS.md (never needed).
