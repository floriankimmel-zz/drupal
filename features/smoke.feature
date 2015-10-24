Feature: Some simple smoke tests to see if environment is working just fine
  
  Scenario: Go to the home page
    When I go to the homepage
    Then the response status code should be 200
  Scenario: Login as admin
    When i go to the homepage
    And I fill in "edit-name" with "admin"
    And I fill in "edit-pass" with "shMdQmrdWE"
    And I click "edit-submit"
    Then I should see the link "Log out"
    
