Feature: User completes a milestone
  
  Scenario: a milestone is completed 
    
    Given the following plan:
      | title | Whatever |
    And the following goal:
      | title | Some goal |
      | plan  | Whatever  |
  #  And the following milestone:
   #   | title | Some milestone that is done |
    #  | goal  | Some goal                   |
    And the following reward:
      | title | Whatever |
      | plan  | Whatever |
    And I am on the goal overview page
    And I log in
    And show me the page
  When I press "finish"
  Then I should see 'Milestone completed'
  # and the milestone record should reflect that .. need test steps

