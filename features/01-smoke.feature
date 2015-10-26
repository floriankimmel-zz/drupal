Feature: Simple test to ensure basic functionality 
  
  Scenario: Go to the home page
    When I go to the homepage
    Then the response status code should be 200
    
  Scenario: User Login 
    When I go to the homepage
    And I fill in "edit-name" with "versicherung"
    And I fill in "edit-pass" with "shMdQmrdWE"
    And I press the "edit-submit" button
    Then I should not see the text "User login"
    
