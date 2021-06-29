*** Variables ***
${URL}  http://127.0.0.1:8080
${USERNAME}  admin
${PASSWORD}  cisco123

*** Setting ***
Documentation     
...    NSO controller Logout examples

Metadata    Version            1.0

Library   com.apaulin.nso_controller.NSOController

Suite Setup      Start Session

*** Test Cases ***

Sessions
    Show something
    Show something
    
*** Keywords ***
    
Start Session
    Init   ${URL}  ${USERNAME}  ${PASSWORD} 
    Start Transaction  running  read_write  private  test  reuse
    Logout
    
Show something
    Start Session
    ${config}   Show config   /aaa
    Log To Console  ${config}
    Logout

    
  
