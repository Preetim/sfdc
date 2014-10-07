@seed
Feature: In order to create an opportunity
  as a SalesForce user I should be  able to add an opportunity
  to verify successful creation

  Scenario Outline: Create new opportunity for project
  Given I am logged in as a <Role>
  When I create a new opportunity of <Type>
  Then opportunity should get created

Examples:
| Role                      |  Type    |
| ProfessionalServices User |   ps     |
| Studios                   |   studios|
#| Administrator             |   studios|
#| Administrator             |   ps     |