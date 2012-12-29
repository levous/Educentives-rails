Feature: User completes a milestone
  
@javascript
  Scenario: a milestone is completed 
    Given I sign up as Jerry with a goal having a milestone
    And I am on the home page
    And debug
    And I am on the goal overview page
    And debug
  When I press "finish"
  Then I should see 'Milestone completed'
  # and the milestone record should reflect that .. need test steps

