@gallery @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor
Feature: Megabees Renew, Workshop gallery captures

  # Staged photographs for the Steam page (PUBLISHING.md, rule of 2026-10-02: every gallery capture is a staged
  # photograph, nothing left at defaults, except menus). Pass: wsl-deps.sanctuary.map (Nelim's sanctuary,
  # StageDecor). Not part of passes 1 to 5: they exclude @gallery.
  #
  # The story. First light in the barn of the sanctuary. The queen has laid, the brood has hatched, and the apiary
  # wakes up: she is shown with her brood, then with what the colony gives (wool, tallow, eggs), then with the salve
  # the handlers make from it. Same set for the three pictures: the barn emptied of its own furniture (allowed for a named place, GALERIE.md), six lit torch lamps
  # around the animals ((190, 239), (196, 239), (189, 234), (197, 234), (193, 241), (193, 231)), enough light to
  # replace taking the roof off, put up before the picture and taken down after it;
  # the animals of one picture are taken away before the next. Noon and clear weather (the save is from 23 h).
  # Colour: the megabee is olive yellow and near black, so the warm light of the lamps and the pale goods
  # (cream eggs, cream wool, beige tallow) stand out against the dark earth floor of the barn.
  #   1 the queen (adult) and her brood side by side, lamps all around;
  #   2 the queen with wool, tallow and a clutch of eggs in a row on the floor in front of her;
  #   3 a worker (adult) and the brood, the salve laid at their feet.
  # Gallery order on the page: 0 Preview, 1 queen and brood, 2 harvest, 3 salve. The interface is the game's
  # screenshot mode (studio presentation mode). Open each image before using it: a green run proves the path ran.
  # The step texts for the sanctuary come from PickleTools (docs/SANCTUAIRE-LIEUX.md, "Animaux mis en scène");
  # the animal and framing steps were built 2026-10-05 and have not been run in game yet.

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: the screen is clear
    And I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Pickle Tools: the animals are removed from the sanctuary "barn"
    And Nelim's Pickle Tools: the sanctuary "barn" is emptied
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (190, 239)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (196, 239)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (189, 234)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (197, 234)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 241)
    And Nelim's Pickle Tools: I place the decor "TorchLamp" at (193, 231)
    And Nelim's Pickle Tools: the decor "TorchLamp" at (190, 239) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (196, 239) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (189, 234) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (197, 234) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 241) is lit
    And Nelim's Pickle Tools: the decor "TorchLamp" at (193, 231) is lit

  @review
  Scenario: gallery 1, the queen and her brood in the barn at first light
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (193, 237)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (195, 236) at life stage 0
    When Nelim's Pickle Tools: I frame the animal "Queen" at zoom 11
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-1-queen-and-brood"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 2, the harvest laid out in front of the queen
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (193, 237)
    And Nelim's Pickle Tools: I place the decor "WoolMegabee" at (191, 235)
    And Nelim's Pickle Tools: I place the decor "MegabeeTallow" at (193, 235)
    And Nelim's Pickle Tools: I place the decor "EggMegabeeFertilized" at (195, 235)
    When Nelim's Pickle Tools: I frame the animal "Queen" at zoom 11
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-2-harvest"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 3, the salve at the feet of a worker and the brood
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Worker" is spawned at (193, 237)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (195, 237) at life stage 0
    And Nelim's Pickle Tools: I place the decor "MedicineMegabee" at (194, 235)
    When Nelim's Pickle Tools: I frame the animal "Worker" at zoom 11
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-3-salve"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
