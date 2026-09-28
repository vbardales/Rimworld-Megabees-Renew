# The claim megabee.xml makes twice: the megabee needs Core only, and its two DLC guards
# (<willNeverEat><li MayRequire="Ludeon.RimWorld.Royalty">Plant_TreeAnima</li> and the Ideology line for
# Plant_TreeGauranlen) are safe without the DLC they name. The offline reference check supports the first
# half (every def this mod points at exists in Core) but that check reads the files; this one is the
# game's, with Royalty and Ideology left out of ModsConfig.
#
# Only these two DLC are dropped (wsl-deps.dlc-absent.map): Biotech, Anomaly and Odyssey are named only in
# loadAfter and nothing in this mod reads anything of theirs, so dropping them would prove nothing this
# content declares. `-Filter '06-dlc-absent,08-load-is-clean'`.
#
# Excluded from every other pass, where Royalty and Ideology ARE active and the first step would fail.
# No save is loaded for the definition checks.
@dlc-absent
Feature: without Royalty or Ideology, the megabee still loads and is read the same

  Scenario: Royalty and Ideology are out of the game
    Then mod "ludeon.rimworld.royalty" is not loaded
    And mod "ludeon.rimworld.ideology" is not loaded

  Scenario: the megabee and its products are defined, and the wildness is read
    Then def "Megabee" of type "ThingDef" exists
    And def "Megabee" of type "PawnKindDef" exists
    And def "WoolMegabee" of type "ThingDef" exists
    And Megabees Renew: the race "Megabee" has wildness 0.80

  Scenario: the willNeverEat guards resolved cleanly without their DLC
    Then no errors were logged
