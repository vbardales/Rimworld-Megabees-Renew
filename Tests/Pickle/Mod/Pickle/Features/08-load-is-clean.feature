# The criterion every mod shares: the load is clean. Nothing in the game's log that comes from this mod: no
# error, no exception, no warning tagged with its id, no definition or reference that did not resolve, no
# message five times over.
#
# WHY THIS IS THE CHECK THAT MATTERS HERE. The fault this port repaired was silent, and a class of the same
# family is still possible: a field a later game version renames is not an error the player sees. The game
# logs it as "doesn't correspond to any field", which `no errors were logged` (scoped to what happens after
# a scenario starts) would never see, and which does not say WHICH mod it came from. PickleTools' load
# audit reads the log from the start of the game and attributes each line to a mod.
#
# It also runs in the pass with the optional mod, which is where a patch could leave an unresolved
# reference, and in the DLC-absent pass.
#
# NO SAVE IS LOADED, and the feature is numbered last so that it runs last: the audit reads the log of the
# WHOLE run so far, so it holds everything the earlier features made this mod do. Loading a colony first
# would add nothing to it.
#
# Excluded from the incompatibility pass, on purpose: the original mod's duplicate definitions are
# attributed to this mod there, and that is the symptom feature 07 asserts. The load audit stays a step of
# the pass matrix, not of that pass.
@requires:nelim.pickletools.loadaudit
@clean-load
Feature: nothing in the game's log comes from this mod

  Scenario: the load of the mod is clean
    Then Nelim's Pickle Tools: the load of the mod "nelim.megabeesrenew" is clean
