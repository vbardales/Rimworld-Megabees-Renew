# Make Honey EVEN MORE Compatible (TSP.zal.patchhoney2, Workshop 2959585309).
# Mod/Patches/Compat_MakeHoneyEvenMoreCompatible.xml points the two MayRequire attributes of its honey syrup recipe
# (KYD_HoneySyrup) at this mod: they name the original Megabees (zoura3025.megabees), which this port is not.
#
# WHAT ONLY A RUN SHOWS. The offline reading proves the xpath selects the two <li> in that mod's file. It cannot
# prove the game keeps them after MayRequire is resolved, nor that the recipe the player sees accepts the tallow.
# So the check is on the recipe the game built: the ingredient filter of its only ingredient, and its
# fixedIngredientFilter, which is what the bill dialog offers.
#
# THE CONTROL. TSP_HoneyWort sits in the same two lists, behind a MayRequire on that mod's own packageId, which is
# loaded. If the recipe refused it, the recipe or the mod would not have loaded and a missing tallow would prove
# nothing about this patch.
#
# Skipped by requirement in the passes that do not mount that mod: counted there, not hidden. No save is loaded:
# everything below reads definitions, which exist from the main menu on.
@requires:TSP.zal.patchhoney2
Feature: Make Honey EVEN MORE Compatible accepts the megabee tallow in its honey syrup

  Scenario: control, the honey syrup recipe accepts the honey wort of that mod
    Then Megabees Renew: the recipe "KYD_HoneySyrup" accepts the thing "TSP_HoneyWort"

  Scenario: the honey syrup recipe accepts the megabee tallow
    Then Megabees Renew: the recipe "KYD_HoneySyrup" accepts the thing "MegabeeTallow"
