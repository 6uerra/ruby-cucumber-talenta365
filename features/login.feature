Feature: login user
        @sign_in
        Scenario: Login session
            Given I want to log in
             Then I enter my username and password
              And I validate that the account is correct
     
        Scenario: Login session send data
            Given I enter in advantage
              And I want to log in
             Then I enter my username "QATEST " and password "Abc12345"
              And I validate that the account is correct

              
  
