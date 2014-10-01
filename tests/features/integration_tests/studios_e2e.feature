

Feature: verify lead downloading studios product is captured in Marketo and SFDC with correct details

  Scenario Outline: Verify Lead details in SFDC
  Given user downloads <product> from thoughtworks.com
  When I view marketo
    Then I should see the correct lead values captured in Marketo
    And I view sfdc
    Then I should see the correct lead values captured in Sfdc

Examples:

    |product     |
    | twist      |
#    | Go         |
#    | Mingle     |