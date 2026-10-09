# Make Honey EVEN MORE Compatible (TSP.zal.patchhoney2, Workshop 2959585309).
# That mod supports the megabee by defName: its root patch puts MegabeeTallow in a "Mega Bees" category under Honey, and
# its honey syrup recipe takes the Honey category. A control run WITHOUT any patch of this port (2026-10-09, a5027b1)
# showed the recipe accepts the tallow anyway, so the first two scenarios are integration checks, not tests of a patch.
#
# WHAT THIS PORT FIXES. That patch gives the new category the icon of a texture the ORIGINAL Megabees ships
# (Things/Pawn/Animal/Megabee/oldmegabee_east) and this port does not: the game logs "Could not load Texture2D" and the
# category shows the red square. Mod/Patches/Compat_MakeHoneyEvenMoreCompatible.xml repoints it at megabee_east; the third
# scenario reads the icon the game holds. It fails without the patch (control run, same day).
#
# THE CONTROL. TSP_HoneyWort sits in the recipe's own lists, behind a MayRequire on that mod's own packageId, which is
# loaded. If the recipe refused it, the recipe or the mod would not have loaded and a missing tallow would prove nothing.
#
# Skipped by requirement in the passes that do not mount that mod: counted there, not hidden. No save is loaded:
# everything below reads definitions, which exist from the main menu on.
@requires:TSP.zal.patchhoney2
Feature: Make Honey EVEN MORE Compatible accepts the megabee tallow in its honey syrup

  Scenario: control, the honey syrup recipe accepts the honey wort of that mod
    Then Megabees Renew: the recipe "KYD_HoneySyrup" accepts the thing "TSP_HoneyWort"

  Scenario: the honey syrup recipe accepts the megabee tallow
    Then Megabees Renew: the recipe "KYD_HoneySyrup" accepts the thing "MegabeeTallow"

  Scenario: the category that mod gives the tallow has an icon that loaded
    Then Megabees Renew: the thing category "TSP_ZOURA_MegaBee_Honey_Category" has an icon that loaded
