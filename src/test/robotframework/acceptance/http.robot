*** Settings ***

Library    HttpRequestLibrary
Library    Collections
Library    String
Library    OperatingSystem

*** Test Cases ***

Get Requests
    Create Session  google  https://www.google.com
    ${resp}=  Get Request  google  /
    Should Be Equal As Strings  ${resp.status_code}  200
  