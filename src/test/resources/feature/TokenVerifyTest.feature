@Smoke @Regression
Feature: Token Verify Test
Background: Setup Test URL
 Given url "https://tek-insurance-api.azurewebsites.net"
Scenario: Verify Valid Token
And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    #send request
    When method post
    #validate response
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "supervisor"
    When method get
    Then status 200
    And print response
    And assert response == "true"
    
    Scenario: Negative test valodate token verify with wrong username 
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    #send request
    When method post
    #validate response
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "wronguser"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"
    
    Scenario: Negative test verify Token with invalid token and valid username
    Given path "api/token/verify"
    And param token = "invalid-token"
    And param username = "supervisor"
    And method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"