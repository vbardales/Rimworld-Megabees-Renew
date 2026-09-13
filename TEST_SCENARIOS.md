# Functional validation — RimWorld 1.6

Status: NOT RUN. Use the delivered Mod/ revision recorded in Tests/RESULTS.md.
Back up the existing save and test a copy. Do not overwrite the original save.
Record game version, enabled DLC/mods, language, date, results and log path per run.
Baseline: Core + Megabees Renew; upstream Megabees disabled. Repeat UI checks in EN/FR.

| Scenario | Preconditions | Actions | Expected result |
| --- | --- | --- | --- |
| Clean load | Baseline mod list, fresh game log | Start a new temperate-forest colony; spawn a male/female adult, juvenile and brood with development tools | No Def/cross-reference errors; all animals render in four directions and all life stages. |
| Identity and stats | Spawned bees | Open information/training panels | Wildness 80%, body size 5.25, speed 1.4, trainability None; no missing labels. |
| Body and attacks | Adult bee and test combat target | Inspect health body tree; inflict test injuries; observe combat | Body parts and both attacks resolve and display translated labels; no exceptions. |
| Production | Tame adults, animal handler with access, sufficient forage | Observe milk, shear and egg cycles; use development acceleration if recorded | 40 tallow/day from either sex; 50 wool/3 days; 2–3 eggs/1.5 days; both egg types supported. |
| Hatching | Fertilized eggs in safe temperature | Wait/accelerate 11 days | Egg hatches into brood with correct art and name; unfertilized egg never hatches. |
| Salve | Crafting spot and drug lab, 15 tallow + 40 wool per item; pawn Crafting 2, Animals 4, Intellectual 2 | Add bill at each bench and craft; try a pawn below the thresholds; treat an injured pawn | Bill and ingredients display correctly; skills enforced; salve usable, potency 55%, quality cap 75%. |
| Food and fabric | Tallow, eggs, wool and eligible recipes | Eat/cook food, manufacture a wool garment | Items accepted by appropriate vanilla systems; labels/descriptions and generated recipe text translated. |
| Optional DLC | Separate baseline and Royalty/Ideology runs | Load without DLC; then with DLC and both special trees present | No unresolved tree references without DLC; bees do not eat anima/gauranlen trees when DLC enabled. |
| Save persistence | Colony containing bees of both sexes, eggs and resources | Save, quit, restart and load test copy | Animals, resources, production progress and bills retained without errors. |
| Existing colony | Copy of existing save without this mod | Enable mod and load copy; introduce bees, craft, save/reload | Colony loads and added content works; no migration errors. |
| FR/EN interface | Repeat above in each language after restart | Read information, health, bills and item descriptions; inspect mod options and main bar | No raw keys, unintended English fallback in French, clipping or empty settings page/shortcut. |

No settings persistence or RIMMSQOL shortcut scenario applies: this content-only mod
has neither a settings page nor a MainButton. Inspect logs after each scenario.
After fixes, rerun affected scenarios and portable/resource checks; retain failures
alongside subsequent passing results. Passing automated checks is not an in-game pass.
