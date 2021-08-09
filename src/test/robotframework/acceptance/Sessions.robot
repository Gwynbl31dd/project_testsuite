*** Variables ***
${URL}  http://127.0.0.1:80
${USERNAME}  admin
${PASSWORD}  admin

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
    
Show something
    Start Session
    ${config}   Show config   /aaa
    Log To Console  ${config}
    Logout