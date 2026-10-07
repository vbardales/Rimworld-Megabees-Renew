@gallery @requires:nelim.sanctuarybacklot @requires:nelim.pickletools.screenshotstudio @requires:nelim.pickletools.stagedecor @requires:nelim.pickletools.colonistrace
Feature: Megabees Renew, Workshop gallery captures

  # Staged photographs for the Steam page (PUBLISHING.md, rules of 2026-10-02 to 2026-10-06). Pass: wsl-deps.sanctuary.map
  # (Nelim's sanctuary, StageDecor, ColonistRace). Excluded from passes 1 to 5 by @gallery.
  #
  # THE STORY, "Noon at the apiary". One day, one place: the lower enclosure of the sanctuary (enclosure-south, the
  # place Virginie advises for large animals; its laying boxes are the nest). The game starts at noon and lets time pass
  # between pictures, as the series rule asks: image 1 is the set-up only, image 2 is 5 game minutes later (208 ticks),
  # image 3 is 10 minutes later (417). Everything alive is placed after the wait, so nothing has left the frame.
  # The megabee is diurnal, so it is awake at noon. Nelim (Virginie's colonist, the only one on the map) is the handler;
  # she is undressed, then wears a teal shirt and olive trousers (accent and secondary ink of the Preview) and has
  # auburn hair, to read against the earth and not melt into the stripes.
  #
  # SHOOTING PLAN (place; moment; subject; composition; living thing; what the image says)
  #   1 enclosure-south; noon, set-up only; the queen settled near the laying boxes, her brood beside her; wide and
  #     off-centre: the queen right of centre, fence and gate behind, Nelim small at the gate in the lower left
  #     (foreground: a stool and a plant pot); Nelim arrives; "this is the animal, and the young one".
  #   2 enclosure-south; noon + 5 min; the queen's wool, taken; medium, the queen on the right, Nelim left of her
  #     carrying a tuft of megabee wool, an egg and a tallow lump on the ground at her feet, a plant pot at the edge;
  #     Nelim; "what the colony gives".
  #   3 enclosure-south; noon + 10 min; the salve; close, a worker on the right with the brood tucked at its flank, Nelim
  #     on the left holding the salve; Nelim; "what is made from it", the craftable item.
  # CELLS (NPT read the fixture, 2026-10-07): the placed items stand on plant-free cells, the block x 155-162, z 209-210 (the
  # plants are drawn over anything on their cell, which hid the egg and the tallow in run 5924); the pots stand on the free
  # strip z = 206; the living things stand anywhere, a pawn is not covered by a plant. Not yet seen on a photo.
  # NOT SHOWN, written: the ADS 2 surgeries (needs a pass that mounts the place and ADS 2 together, and the health tab),
  # and the body plan (inspection tab). Cells of enclosure-south are not known: this run reads them (BACKLOG.md).
  # Time runs (fast) during the wait and is paused before the picture, so nothing moves in the frame.
  # Stack counters and names are hidden by the studio presentation mode (NPT patch, 2026-10-06).

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is fast
    And Nelim's Pickle Tools: the screen is clear
    And I set the hour to 12
    And I set the weather to "Clear"
    And Nelim's Sanctuary: the animals are removed from the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (154, 206)
    And Nelim's Pickle Tools: I place the decor "PlantPot" at (161, 206)
    And Nelim's Pickle Tools: I place the decor "Stool" at (162, 209)
    And Nelim's Pickle Tools: "Nelim" is undressed
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_BasicShirt" dyed rgb (26, 140, 140)
    And Nelim's Pickle Tools: "Nelim" wears "Apparel_Pants" dyed rgb (104, 112, 48)
    And Nelim's Pickle Tools: "Nelim" hair colour is rgb (150, 70, 40)

  @review
  Scenario: gallery 1, noon at the apiary: Nelim arrives, the queen and her brood by the laying boxes
    When Nelim's Pickle Tools: I let 60 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (160, 212)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (162, 211) at life stage 0
    And Nelim's Pickle Tools: "Nelim" stands at (156, 208) facing East
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: I frame the cell (158, 211) at zoom 9
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-1-noon-arrival"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 2, five minutes later: Nelim takes the wool, an egg and tallow lie at her feet
    When Nelim's Pickle Tools: I let 268 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Queen" is spawned at (161, 213)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (162, 216) at life stage 0
    And Nelim's Pickle Tools: I place the decor "EggMegabeeFertilized" at (156, 209)
    And Nelim's Pickle Tools: I place the decor "MegabeeTallow" at (158, 210)
    And Nelim's Pickle Tools: "Nelim" stands at (158, 212) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "WoolMegabee"
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: I frame the cell (158, 211) at zoom 8
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-2-the-harvest"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged

  @review
  Scenario: gallery 3, ten minutes later: Nelim holds the salve beside a worker and the brood
    When Nelim's Pickle Tools: I let 477 ticks pass
    And Nelim's Pickle Tools: an adult animal of kind "Megabee" named "Worker" is spawned at (161, 212)
    And Nelim's Pickle Tools: an animal of kind "Megabee" named "Brood" is spawned at (162, 210) at life stage 0
    And Nelim's Pickle Tools: "Nelim" stands at (158, 212) facing East
    And Nelim's Pickle Tools: "Nelim" carries the item "MedicineMegabee"
    And game speed is paused
    And Nelim's Sanctuary: I am at the sanctuary "enclosure-south"
    And Nelim's Pickle Tools: I frame the cell (158, 211) at zoom 7
    And Nelim's Pickle Tools: studio presentation mode is enabled
    And I take a screenshot "gallery-3-the-salve"
    And Nelim's Pickle Tools: the decor is removed
    Then no errors were logged
