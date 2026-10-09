using System;
using System.Collections.Generic;
using System.Linq;
using RimWorks.Pickle;
using RimWorld;
using Verse;

namespace MegabeesRenew.PickleSteps
{
    /// <summary>
    /// What Pickle's own steps cannot say about this mod.
    ///
    /// Every step text starts with "Megabees Renew:". Pickle loads the steps of every active suite into
    /// one namespace, and two suites declaring the same text make healthy scenarios fail with "Ambiguous
    /// step". No text uses parentheses or slashes, which Cucumber expressions read as optional text and
    /// alternatives: cells are spelled x=.. z=...
    ///
    /// WHY THERE IS AN ASSEMBLY AT ALL. Two limits of the built-in steps, read from the installed Pickle
    /// 4.9.1 (2026-09-28), the same ones Funny Creatures Renew's suite documents:
    ///
    ///   - Its pawn steps resolve a pawn by NICKNAME among FREE COLONISTS only (PawnLookup.FindLiving).
    ///     The megabee is never a colonist, so a spawned animal needs its own lookup.
    ///   - Its def steps that resolve a bare defName (`def {string} field ...`) THROW when it names more
    ///     than one def (DefLookup.RequireAny). Megabee is both a ThingDef and a PawnKindDef, so this
    ///     suite reads `def {string} of type {string} exists` instead, which is unambiguous.
    ///
    /// NOTHING HERE REFERENCES THE OPTIONAL MOD. A Dog Said... Animal Prosthetics 2 is read only through
    /// its recipe defNames, which are its own public API, not through a type reference: this assembly
    /// compiles against the game alone.
    /// </summary>
    [PickleSteps]
    public class MegabeesSteps
    {
        private const float TicksPerYear = 3600000f;

        // -------------------------------------------------------------------------------------
        // The megabee in the scene
        // -------------------------------------------------------------------------------------

        [Given("Megabees Renew: a megabee named {string} is spawned at x={int} z={int}")]
        public void SpawnAdult(PickleContext ctx, string nickname, int x, int z)
        {
            Spawn(ctx, nickname, x, z, brood: false);
        }

        [Given("Megabees Renew: a megabee brood named {string} is spawned at x={int} z={int}")]
        public void SpawnBrood(PickleContext ctx, string nickname, int x, int z)
        {
            Spawn(ctx, nickname, x, z, brood: true);
        }

        /// <summary>
        /// A wild megabee of a fixed age, so that the life stage is not left to chance. Life stage 0 is the
        /// brood: its own texture and color differ from the adult (megabee.xml PawnKindDef lifeStages),
        /// which is the point of the review capture in feature 01.
        /// </summary>
        private static void Spawn(PickleContext ctx, string nickname, int x, int z, bool brood)
        {
            Map map = Find.CurrentMap;
            ctx.Require(map != null, "no current map: load a save first");
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamedSilentFail("Megabee");
            ctx.Require(kind != null, "no PawnKindDef named 'Megabee'");
            IntVec3 cell = new IntVec3(x, 0, z);
            ctx.Require(cell.InBounds(map), $"cell ({x}, {z}) is outside the map, which is {map.Size.x} by {map.Size.z}");

            Pawn pawn = PawnGenerator.GeneratePawn(kind, null, (RimWorld.Planet.PlanetTile?)null);
            List<LifeStageAge> stages = kind.RaceProps.lifeStageAges;
            float years = brood
                ? Math.Min(0.1f, stages[1].minAge * 0.5f)
                : stages[stages.Count - 1].minAge + 0.25f;
            pawn.ageTracker.AgeBiologicalTicks = (long)(years * TicksPerYear);
            pawn.ageTracker.AgeChronologicalTicks = (long)(years * TicksPerYear);
            pawn.Name = new NameSingle(nickname);
            GenSpawn.Spawn(pawn, cell, map);
            int stage = pawn.ageTracker.CurLifeStageIndex;
            ctx.Require(brood ? stage == 0 : stage == stages.Count - 1,
                $"{nickname} was given age {years:0.###} and is at life stage {stage} of {stages.Count} instead of the "
                + (brood ? "first" : "last"));
        }

        [Then("Megabees Renew: the animal {string} is a brood")]
        public void AnimalIsBrood(PickleContext ctx, string nickname)
        {
            Pawn pawn = RequireAnimal(ctx, nickname);
            ctx.Assert(pawn.ageTracker.CurLifeStageIndex == 0,
                $"{nickname} is at life stage {pawn.ageTracker.CurLifeStageIndex}, a brood is stage 0");
        }

        private static Pawn RequireAnimal(PickleContext ctx, string nickname)
        {
            Map map = Find.CurrentMap;
            ctx.Require(map != null, "no current map: load a save first");
            List<Pawn> spawned = map.mapPawns.AllPawnsSpawned.ToList();
            Pawn found = spawned.FirstOrDefault(p =>
                string.Equals(p.Name?.ToStringShort, nickname, StringComparison.OrdinalIgnoreCase));
            ctx.Require(found != null, "no spawned pawn named '" + nickname + "'. named pawns on the map: "
                + string.Join(", ", spawned.Where(p => p.Name != null).Select(p => p.Name.ToStringShort)));
            return found;
        }

        // -------------------------------------------------------------------------------------
        // What the engine reads
        // -------------------------------------------------------------------------------------

        /// <summary>
        /// The reason for the port: under 1.6 the old `<wildness>` field of RaceProperties is not read at
        /// all, and the computed stat then falls back to its own default (-1, clamped to 0). Only the
        /// engine's own StatWorker, asked here, can tell the fix from the silent fallback.
        /// </summary>
        [Then("Megabees Renew: the race {string} has wildness {float}")]
        public void RaceHasWildness(PickleContext ctx, string raceDefName, float expected)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            float actual = race.GetStatValueAbstract(StatDefOf.Wildness);
            ctx.Assert(Math.Abs(actual - expected) < 0.001f, $"{raceDefName} wildness is {actual}, expected {expected}");
        }

        /// <summary>
        /// A Dog Said... Animal Prosthetics 2 copies its category lists onto its recipe bases ONCE, at its
        /// own last patch, so the result depends on this mod's patch having run first. The race's own
        /// recipe list is what the health tab offers, built from the recipes' recipeUsers, so this asks the
        /// list the player's screen is drawn from.
        /// </summary>
        [Then("Megabees Renew: the race {string} offers the recipe {string}")]
        public void RaceOffersRecipe(PickleContext ctx, string raceDefName, string recipeDefName)
        {
            ThingDef race = RequireRace(ctx, raceDefName);
            ctx.Require(DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName) != null,
                $"no RecipeDef named '{recipeDefName}': is the mod that defines it loaded?");
            ctx.Assert(race.AllRecipes.Any(r => r.defName == recipeDefName),
                $"{raceDefName} does not offer {recipeDefName}. it offers {race.AllRecipes.Count} recipes");
        }

        /// <summary>
        /// Make Honey EVEN MORE Compatible names the megabee tallow in its honey syrup recipe behind a MayRequire on
        /// the ORIGINAL mod's packageId, so a port with another packageId is left out unless this mod's patch
        /// repoints it. The recipe the game built is asked, both ways a player meets it: the filter of its
        /// ingredient (what the cook may use) and its fixedIngredientFilter (what the bill dialog offers).
        /// </summary>
        [Then("Megabees Renew: the recipe {string} accepts the thing {string}")]
        public void RecipeAcceptsThing(PickleContext ctx, string recipeDefName, string thingDefName)
        {
            RecipeDef recipe = DefDatabase<RecipeDef>.GetNamedSilentFail(recipeDefName);
            ctx.Require(recipe != null, $"no RecipeDef named '{recipeDefName}': is the mod that defines it loaded?");
            ThingDef thing = DefDatabase<ThingDef>.GetNamedSilentFail(thingDefName);
            ctx.Require(thing != null, $"no ThingDef named '{thingDefName}'");
            ctx.Assert(recipe.fixedIngredientFilter != null && recipe.fixedIngredientFilter.Allows(thing),
                $"{recipeDefName} does not offer {thingDefName} in its fixed ingredient filter");
            ctx.Assert(recipe.ingredients.Any(i => i.filter.Allows(thing)),
                $"{recipeDefName} has no ingredient that accepts {thingDefName}");
        }

        /// <summary>
        /// Make Honey EVEN MORE Compatible gives the megabee tallow a category whose icon is a texture of the
        /// ORIGINAL Megabees. A category icon is loaded when the game finishes loading, and a missing texture
        /// leaves the red error square (BaseContent.BadTex) in place and logs an error, so the icon the game
        /// holds is what a player sees.
        /// </summary>
        [Then("Megabees Renew: the thing category {string} has an icon that loaded")]
        public void CategoryIconLoaded(PickleContext ctx, string categoryDefName)
        {
            ThingCategoryDef category = DefDatabase<ThingCategoryDef>.GetNamedSilentFail(categoryDefName);
            ctx.Require(category != null, $"no ThingCategoryDef named '{categoryDefName}': is the mod that adds it loaded?");
            ctx.Assert(category.icon != null && category.icon != BaseContent.BadTex,
                $"the icon of {categoryDefName} did not load (iconPath {category.iconPath})");
        }

        private static ThingDef RequireRace(PickleContext ctx, string defName)
        {
            ThingDef race = DefDatabase<ThingDef>.GetNamedSilentFail(defName);
            ctx.Require(race != null && race.race != null, "no animal ThingDef named '" + defName + "'");
            return race;
        }

        // -------------------------------------------------------------------------------------
        // Text in the language of the pass
        // -------------------------------------------------------------------------------------

        /// <summary>
        /// The texts of the megabee, its wool, eggs, salve and brood label, against the language the pass
        /// was launched in. A language is chosen at launch, never inside a scenario, so this asserts
        /// against the active one and refuses a language it has no table for. In developer mode, which
        /// every Pickle run is in, a key missing from the active language shows as the English text in an
        /// accented form, so a missing French entry fails here as a wrong string, not as a clean English one.
        /// </summary>
        [Then("Megabees Renew: the texts of the megabee are those of the active language")]
        public void TextsAreThoseOfTheActiveLanguage(PickleContext ctx)
        {
            string language = LanguageDatabase.activeLanguage?.folderName ?? "(none)";
            bool french = language.StartsWith("French", StringComparison.OrdinalIgnoreCase);
            bool english = language.StartsWith("English", StringComparison.OrdinalIgnoreCase);
            ctx.Require(french || english, $"the active language is '{language}', and this step has a table for English and French only");

            ThingDef megabee = RequireRace(ctx, "Megabee");
            ThingDef wool = DefDatabase<ThingDef>.GetNamed("WoolMegabee");
            ThingDef unfert = DefDatabase<ThingDef>.GetNamed("EggMegabeeUnfertilized");
            ThingDef salve = DefDatabase<ThingDef>.GetNamed("MedicineMegabee");
            PawnKindDef kind = DefDatabase<PawnKindDef>.GetNamed("Megabee");
            PawnKindLifeStage broodKind = kind.lifeStages[0];

            List<string> problems = new List<string>();
            void Expect(string what, string actual, string expected)
            {
                if (actual != expected) problems.Add($"{what}: '{actual}', expected '{expected}'");
            }
            void ExpectStart(string what, string actual, string start)
            {
                if (actual == null || !actual.StartsWith(start, StringComparison.Ordinal))
                    problems.Add($"{what}: '{Shorten(actual)}', expected it to start with '{start}'");
            }
            void ExpectTools(string what, ThingDef def, params string[] labels)
            {
                List<string> actual = def.tools.Select(t => t.label).Where(l => !string.IsNullOrEmpty(l)).ToList();
                if (!labels.All(actual.Contains))
                    problems.Add($"{what} tool labels: [{string.Join(", ", actual)}], expected them to include [{string.Join(", ", labels)}]");
            }

            if (french)
            {
                Expect("megabee label", megabee.label, "mégabeille");
                ExpectStart("megabee description", megabee.description, "Issues d'une ingénierie génétique débridée");
                ExpectTools("megabee", megabee, "mandibules", "tête");
                Expect("megabee wool", wool.label, "laine de mégabeille");
                Expect("unfertilized egg", unfert.label, "œuf de mégabeille (non fécondé)");
                Expect("salve", salve.label, "onguent au suif de mégabeille");
                Expect("brood", broodKind.label, "couvain");
                Expect("brood plural", broodKind.labelPlural, "couvain");
            }
            else
            {
                Expect("megabee label", megabee.label, "megabee");
                ExpectStart("megabee description", megabee.description, "A result of rampant genetic engineering");
                ExpectTools("megabee", megabee, "Mandibles", "head");
                Expect("megabee wool", wool.label, "megabee wool");
                Expect("unfertilized egg", unfert.label, "megabee egg (unfert.)");
                Expect("salve", salve.label, "megabee tallow salve");
                Expect("brood", broodKind.label, "brood");
                Expect("brood plural", broodKind.labelPlural, "brood");
            }

            ctx.Assert(problems.Count == 0, $"in {language}: " + string.Join(" | ", problems));
        }

        private static string Shorten(string text)
        {
            return text == null ? "(null)" : text.Length <= 60 ? text : text.Substring(0, 60) + "...";
        }

        // -------------------------------------------------------------------------------------
        // The game's own log, from the start
        // -------------------------------------------------------------------------------------

        /// <summary>
        /// Text the game wrote to its log at load. Pickle's log steps count what is logged after a scenario
        /// starts, so a load-time message is out of their reach, and Pickle 4.9.1 has no step that asserts
        /// an error was logged. The log FILE is read instead, from the start of the game, as PickleTools'
        /// load audit does.
        /// </summary>
        [Then("Megabees Renew: the game log holds the text {string}")]
        public void LogHoldsText(PickleContext ctx, string fragment)
        {
            string path = UnityEngine.Application.consoleLogPath;
            ctx.Require(!string.IsNullOrEmpty(path) && System.IO.File.Exists(path), "the game log is not readable at '" + path + "'");
            string text;
            using (System.IO.FileStream stream = new System.IO.FileStream(path, System.IO.FileMode.Open,
                System.IO.FileAccess.Read, System.IO.FileShare.ReadWrite | System.IO.FileShare.Delete))
            using (System.IO.StreamReader reader = new System.IO.StreamReader(stream))
            {
                text = reader.ReadToEnd();
            }
            ctx.Assert(text.Contains(fragment),
                $"the game log ({text.Length} characters, read from the start) does not contain '{fragment}'");
        }
    }
}
