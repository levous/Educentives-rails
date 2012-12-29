Feature: View Home Page 
Scenario: View Home page as Anonymous
  Given I am not authenticated 
  And I am on the home page
  Then I should see "Please Sign up or Log in"
  
@javascript
Scenario: View Home page as a new user following creating your first goal
    Given I am on the sign up page
    And I sign up as "dogface"
    And I am on the home page
  Then I should see "I can't wait to get started"
  When I follow "Set your first Goal"
    And I fill in "Title" with "test this thing"
    And I follow "Create Your Goal"
    And I am on the home page
  Then I should see "test this thing"
