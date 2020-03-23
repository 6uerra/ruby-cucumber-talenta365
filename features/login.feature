Feature: login user
        @sign_in
        Scenario: Login session
            Given I want to log in
             Then I enter my username and password
              And I validate that the account is correct
              
  

