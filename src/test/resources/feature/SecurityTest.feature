
Feature: API Test Security Section
  
  @Test
  Scenario: Create token with valid username and password
    #prepare request
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    #send request
    When method post
    #validate response
    Then status 200
    And print response
    
 Scenario: Validate Token with Invalid username
 
 Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "WrongUser","password": "tek_supervisor"}
    #send request
    When method post
    #validate response
    Then status 400
    And print response
    And assert response.errorMessage == "User not found"
    
    
    Scenario: Validate Token with valid username and Invalid Password
     Given url "https://tek-insurance-api.azurewebsites.net"
 And path "/api/token"
 And request {"username": "supervisor","password": "teksupervisor"}
    #send request
    When method post
    #validate response
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"
    And assert response.httpStatus == "BAD_REQUEST"