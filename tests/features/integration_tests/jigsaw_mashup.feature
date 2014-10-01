@integration
Feature: Jigsaw mashup

  Scenario:Assign resources from Jigsaw

    Given I raise request for resources from SalesForce
    When I  assign the resources from Jigsaw
    Then I should see those resources assigned in SalesForce
