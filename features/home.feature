Feature: View Home Page as Anonymous

Scenario: View Home Page
  Given I am on the home page
  # assume And I am not logged in
  Then I should see /Please sign up/
