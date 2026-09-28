# The other half of the patch: without ADS 2, it changes nothing and logs nothing. The offline test applies
# the patch file to the real Core definitions with the mod absent and shows the document unchanged; that is
# a proof on a document the test built itself. This feature is the same claim on the defs the engine
# loaded, in the pass that mounts nothing beyond the bare set.
#
# No save is loaded: everything below reads definitions.
@sans-facultatifs
Feature: without A Dog Said... Animal Prosthetics 2, nothing is patched

  Scenario: the optional mod is absent
    Then mod "A Dog Said... Animal Prosthetics 2" is not loaded

  Scenario: no prosthetic surgery for animals has been defined
    Then no def "InstallPegLegAnimal" exists
    And no def "InstallSimpleProstheticLegAnimal" exists
    And no def "InstallBionicEyeAnimal" exists
