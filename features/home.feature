Feature: View Home Page 
Scenario: View Home page as Anonymous
  Given I am on the home page
  # assume And I am not logged in
  Then I should see /Please sign up/
  
@javascript
Scenario: View Home page as a new user following creating your first goal
    Given I am on the sign up page
    And I sign up as "dogface"
    And I am on the home page
    And show me the page
  Then I should see "I can't wait to get started"
  When I follow "Set your first Goal"
    And I fill in "Title" with "test this thing"
    And I press "Create Goal"
    And I am on the home page
  Then I should see "test this thing"
