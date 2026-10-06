@gallery @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Megabees Renew, Workshop gallery captures

  # Staged photographs for the Steam page (PUBLISHING.md, rules of 2026-10-02 and 2026-10-06: every gallery capture is
  # a staged photograph, nothing at defaults, except menus; a capture is opened and its anomalies are reported).
  # Pass: wsl-deps.sanctuary.map (Nelim's sanctuary, StageDecor, ColonistRace). Not part of passes 1 to 5: they
  # exclude @gallery.
  #
  # The story. First light in the barn of the sanctuary. Nelim, the handler (Virginie's colonist, the only one on the
  # map), comes to the apiary: she greets the queen and her brood, then takes what the colony gives (wool, tallow,
  # eggs), then dresses a wound with the salve made from it. Same set for the three pictures: the barn emptied of its
  # own furniture (allowed for a named place), six lit torch lamps, a shelf and two plant pots against the walls and a
  # stool by the animals, put up before the picture and taken down after it; the animals of one picture are taken
  # away before the next. Noon and clear weather.
  # Colour: the megabee is olive yellow and near black on an earth floor. Nelim wears a teal shirt and olive trousers
  # (the accent and the secondary ink of the Preview) and has auburn hair, so she reads against the floor and does
  # not blend with the bee's stripes; the pale goods (cream wool, eggs, beige tallow) stand out on the dark floor.
  #   1 Nelim kneels by the queen and her brood, a lamp on each side;
  #   2 Nelim stands by the queen with wool, tallow and eggs laid out between them (heaps of 1 on adjacent cells
  #     until NPT builds a stack-size step);
  #   3 Nelim beside a worker and the brood, the salve on the floor between them.
  # Gallery order on the page: 0 Preview, 1, 2, 3. The interface is the game's screenshot mode (studio presentation
  # mode). KNOWN ANOMALY, reported to PickleTools 2026-10-06: stack counters ("1") stay drawn under items despite the
  # presentation mode; a picture that shows it is not used until NPT answers (PUBLISHING.md, 2026-10-06 rule).
  # Nelim is already in NPT's fixture with her body and face (Virginie, 2026-10-06): this suite only dresses her.

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
    And Nelim's Pickle Tools: I place the decor "Shelf" at (189, 241)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (189, 232)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (197, 232)
    And Nelim's Pickle Tools: I place the decor "Stool" at (196, 236)
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (26, 140, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (104, 112, 48)
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (150, 70, 40)

  @review
  Scenario: gallery 1, Nelim greets the queen and her brood at first light
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (193, 237)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (195, 236) at life stage 0
    And Nelim's Pickle Tools: "Nelim" stands at (191, 235) facing East
    When Nelim's Pickle Tools: I am at the sanctuary "barn"
    And Nelim's Pickle Tools: I frame the cell (192, 237) at zoom 7
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-1-queen-and-brood"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 2, Nelim takes the harvest: wool, tallow and eggs
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (194, 238)
    And Nelim's Pickle Tools: I place the decor "WoolMegabee" at (191, 236)
    And Nelim's Pickle Tools: I place the decor "WoolMegabee" at (192, 236)
    And Nelim's Pickle Tools: I place the decor "MegabeeTallow" at (191, 237)
    And Nelim's Pickle Tools: I place the decor "MegabeeTallow" at (192, 237)
    And Nelim's Pickle Tools: I place the decor "EggMegabeeFertilized" at (191, 238)
    And Nelim's Pickle Tools: I place the decor "EggMegabeeFertilized" at (192, 238)
    And Nelim's Pickle Tools: "Nelim" stands at (190, 237) facing East
    When Nelim's Pickle Tools: I am at the sanctuary "barn"
    And Nelim's Pickle Tools: I frame the cell (192, 237) at zoom 7
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-2-harvest"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 3, Nelim dresses a wound with the salve beside a worker and the brood
    Given Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Worker" is spawned at (194, 237)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (195, 235) at life stage 0
    And Nelim's Pickle Tools: I place the decor "MedicineMegabee" at (192, 237)
    And Nelim's Pickle Tools: "Nelim" stands at (190, 237) facing East
    When Nelim's Pickle Tools: I am at the sanctuary "barn"
    And Nelim's Pickle Tools: I frame the cell (192, 237) at zoom 7
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-3-salve"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
