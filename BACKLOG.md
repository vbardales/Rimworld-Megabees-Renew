# Backlog — Megabees Renew

Mod-local TODO (not the monorepo's). Done items and the gallery history are in `docs/runs/` and git.

## Open
- [x] Non-regression after deploy green 2026-10-09 at 3875ccc (`docs/runs/2026-10-09-3875ccc-non-regression.txt`).
- [ ] Test with Make Honey EVEN MORE Compatible (TSP), Workshop 2959585309 (asked by Virginie, 2026-10-09): read the mod, patch or written reason, then a Pickle pass. After the non-regression.
- [ ] Cleanup that can influence the test, after it: evidence in `Tests/Pickle/Evidence/` (keep the latest report per scenario), WSL mods downloaded for this mod (list first, under the machine lock, keep any item another mod's `wsl-deps` names), then note both in `STATUS.md`.
- [ ] Pull request to the original author: none possible (no repository for `zoura3025.megabees`, searched 2026-09-28 and 2026-10-02). Recheck if the author publishes one; then the PR is systematic (needs Virginie's OK, public).
- [ ] Install lxml and rerun `CompatibilityPatchTests` (7 tests skip in this WSL).

## Ideas (not decided)
- Flight: Odyssey gives flight through the `MaxFlightTime` and `FlightCooldown` stats under `statBases`; the megabee declares neither and its body has no wings. Adding them is a new feature and a balance change, contradicts "wingless" and "no balance value touched". Only if Virginie decides yes: both stats, `CHANGELOG.md` entry, a Pickle step, replay pass 1.
- Gallery series 2 in a garden place (flower, water, plant gardens) once a 1.6 face-parts mod is staged.
