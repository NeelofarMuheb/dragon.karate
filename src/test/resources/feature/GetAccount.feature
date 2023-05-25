Feature: Get Account Section

@GetAccount
Given url "https://tek-insurance-api.azurewebsites.net"
And path "api/accounts/get-all-accounts"
And header Authorization = "Bearer " + generatedToken
And request 
"""
{
 "email": "EmailAddressData",
  "title": "Mrs.",
  "firstName": "Neelofar",
  "lastName": "Muheb",
  "gender": "FAMALE",
  "maritalStatus": "MARRIED",
  "employmentStatus": "Tester",
  "dateOfBirth": "1992-01-01",
  "user": {
    "fullName": "NeelofarMuheb",
    "username": "Username",
    "accountType": "CSR",
    "authorities": [
      {
        "id": 0,
        "role": "string",
        "users": [
          "string"
        ]
      }
    ],
    "accountNonExpired": true,
    "accountNonLocked": true,
    "credentialsNonExpired": true,
    "enabled": true,
    "primaryPerson": "string"
}
