# Is the declared incompatibility still true? About.xml lists zoura3025.megabees in <incompatibleWith>,
# because both mods define the same defs, Megabee (ThingDef and PawnKindDef), under the same defName. An
# incompatibility ages: the original could be updated, or withdrawn, and one that is never looked at again
# forbids a coexistence that might work.
#
# THE PASS MOUNTS THE ORIGINAL. `wsl-deps.incompat-original.map` stages it by its real Workshop id,
# 2830700043 (installed on this machine's Windows Workshop folder). The game loads a 1.3/1.4 mod in 1.6 as
# an outdated one.
#
# GREEN MEANS THE ORIGINAL IS STILL READ NEXT TO THIS MOD. Funny Creatures Renew's own first run of this
# pattern (2026-09-28) showed the game does NOT log a duplicate-def error for a def two mods share; the
# scenario below asserts what the log does hold instead of expecting a red run, which cannot be told from
# an accidental one.
#
# WHY THE LOG FILE. Pickle's log steps count what is logged after a scenario starts, so a message written
# at load is out of their reach, and Pickle 4.9.1 has no step that asserts an ERROR was logged. The file is
# read from the start of the game instead. The original's own megabee.xml still carries its wildness as a
# flat field of <race>, which 1.6 does not read: `<wildness>0.80</wildness>`.
#
# If this line goes clean instead of red, something changed: the original may have been updated, may have
# renamed its own defs, or this mod may have renamed its own. Corrected, aggravated or displaced, all three
# are a signal to go and look, not a reason to touch the incompatibility declaration without looking first.
#
# @allow-errors: the errors are the point. No save is loaded: the load is what is being read.
@requires:zoura3025.megabees
@allow-errors
Feature: the original mod still conflicts with this one

  Scenario: both mods are loaded
    Then mod "zoura3025.megabees" is loaded
    And mod "nelim.megabeesrenew" is loaded

  Scenario: the original's own defs are read and fail on 1.6, next to this mod's
    Then Megabees Renew: the game log holds the text "<wildness>0.80</wildness> doesn't correspond to any field in type RaceProperties"
