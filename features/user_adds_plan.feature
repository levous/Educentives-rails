@javascript
Feature: User adds a plan

  Scenario: User creates a new plan
    Given I am on the plans page
      And I log in
    #And show me the page
    When I follow "New Plan"
      And I select "2012" from "plan_targetDate_1i"
      And I select "June" from "plan_targetDate_2i"
      And I select "2" from "plan_targetDate_3i"
      And I fill in "Title" with "sugar pants"
      And I press "Create Plan"
    Then I should see "sugar pants"
      And I should see "Plan was successfully created"
      And I should see "Fred Flintstone"
    When I am on the plans page
      Then I should see "sugar pants"
      And show me the page
