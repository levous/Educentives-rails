Feature: View Goal Page 
Scenario: View goal page as Anonymous
  Given I am not authenticated 
  And I am on the goal overview page
  Then I should see /Please login to access this page/

@javascript
Scenario: View Goal page as a new user following creating your first goal
    Given I am on the sign up page
    And I sign up as "dogface"
    And I follow "Set your first Goal"
    And I fill in "Title" with "My awesome goal"
    And I follow "Create Your Goal"
  Then I should see "What reward will you receive"
    When I am on the home page
  Then I should see "My awesome goal"
