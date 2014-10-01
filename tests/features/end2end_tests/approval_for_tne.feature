Feature: In order to Spike out SFDC automation
  As a QA I should be able to Login
  to verify Successful logon


@smoke
Scenario: Verify removal of Approvals for Onshore Opportunities

  Given I have a Onshore Opportunity of Time & Material type in Proposal Stage
  When I change the state to Contract Negotiation stage
  Then I should not be asked for the approvals




