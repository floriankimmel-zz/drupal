Feature: Some simple smoke tests to see if environment is working just fine
  
  Scenario: Go to the home page
    When I go to the homepage
    Then the response status code should be 200
  Scenario: Login as admin
    When I go to the homepage
    And I fill in "edit-name" with "versicherung"
    And I fill in "edit-pass" with "shMdQmrdWE"
    And I press the "edit-submit" button
    Then I should not see the text "User login"
    
