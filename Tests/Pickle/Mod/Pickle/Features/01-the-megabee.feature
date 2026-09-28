# What only a running game can say about the megabee itself.
#
# Everything provable without the game is proved without it, by Tests/test_mod.py: the XML, the def values
# (wildness under statBases, production comps, body plan), the French coverage, the packaging. None of that
# is repeated here. A run confiscates the machine for tens of minutes; a scenario restating a check that
# takes two seconds offline buys nothing with it.
#
# What is left is what the engine does with those values:
#
#   - that the engine READS wildness. Under the 1.6 rules the old `<wildness>` form (which the original mod
#     still carries) is not an error, it is simply never read, and the stat then falls back to its own
#     default, -1, clamped to 0 by its minimum: an animal whose wildness was never read would answer 0 here,
#     and taming would cost almost nothing. Only the computed stat answers, asked below through the game's
#     own StatWorker. This is the one line this port changed.
#   - that both the adult and the brood are drawn: a texture path that resolves on paper can still fail to
#     load, and the brood uses a different texture and a distinct color from the adult (megabee.xml).
Feature: the megabee exists, is read correctly, and is drawn at every stage shown

  Background:
    Given the save "test-colony" is loaded

  Scenario: the megabee is defined as an animal and as a kind, with its products
    Then def "Megabee" of type "ThingDef" exists
    And def "Megabee" of type "PawnKindDef" exists
    And def "WoolMegabee" of type "ThingDef" exists
    And def "EggMegabeeUnfertilized" of type "ThingDef" exists
    And def "EggMegabeeFertilized" of type "ThingDef" exists
    And def "MedicineMegabee" of type "ThingDef" exists

  Scenario: the engine reads the wildness stat, and does not fall back to its default
    # 0.80, from <statBases>. The stat's own default is -1, clamped to 0 by its minimum.
    Then Megabees Renew: the race "Megabee" has wildness 0.80

  @review
  Scenario: an adult megabee and a brood stand side by side and are drawn
    Given Megabees Renew: a megabee named "Buzzy" is spawned at x=140 z=153
    And Megabees Renew: a megabee brood named "Larva" is spawned at x=143 z=153
    Then Megabees Renew: the animal "Larva" is a brood
    When I move the camera to (141, 153)
    And I zoom all the way in
    And I wait 20 ticks
    And I take a screenshot "the-adult-and-the-brood"
    Then no errors were logged
