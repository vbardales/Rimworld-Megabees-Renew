# What only a save and a reload can show: that the megabee, at both an adult and a brood life stage, is
# written to a save and read back as itself. The animal is wild, unnamed by the game, so it is given a
# nickname when it is spawned, and found again by it after the reload: every object kept from before a
# reload belongs to the game that was replaced (Pickle authoring guide, section 5).
Feature: the megabee survives a save and a reload

  Background:
    Given the save "test-colony" is loaded

  Scenario: an adult megabee and a brood come back as what they were
    Given Megabees Renew: a megabee named "Buzzy" is spawned at x=140 z=153
    And Megabees Renew: a megabee brood named "Larva" is spawned at x=143 z=153
    When I save and reload
    Then def "Megabee" of type "ThingDef" exists
    And Megabees Renew: the animal "Larva" is a brood
    And no errors were logged
