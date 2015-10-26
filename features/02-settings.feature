Feature: Some simple test to ensure that settings are synced correctly
  
  Scenario: Page Title is synced
    When I go to the homepage
    Then I should see title "Welcome to Versicherung | Versicherung"
    
    
