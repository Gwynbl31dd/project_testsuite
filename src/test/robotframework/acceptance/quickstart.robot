*** Variables ***
${URL}  http://127.0.0.1:8080
${USERNAME}  admin
${PASSWORD}  cisco123

*** Setting ***
Documentation     
...    NSO controller test quickstart 

Metadata    Version            1.0

Library   com.apaulin.nso_controller.NSOController

Suite Setup      Start Session
Suite TearDown   Logout

*** Test Cases ***

Quickstart API
    Show devices config
    Show Schema
    Create User
    List Keys
    Delete User
    Sync From
    
*** Keywords ***

Start Session
    Init   ${URL}  ${USERNAME}  ${PASSWORD} 
    Start Transaction  running  read_write  private  test  reuse
    
Show devices config
    ${config}   Show config   /devices
    Log To Console  ${config}
    
Show Schema
    ${schema}  Get Model  /aaa/authentication/users/user
    Log To Console  ${schema}
    
Create User
    Create     /aaa/authentication/users/user{test}
    Set Value  /aaa/authentication/users/user{test}/uid         5
    Set Value  /aaa/authentication/users/user{test}/gid         5
    Set Value  /aaa/authentication/users/user{test}/password    cisco
    Set Value  /aaa/authentication/users/user{test}/ssh_keydir  /home/test/.ssh
    Set Value  /aaa/authentication/users/user{test}/homedir     /home/test
    Commit
    
List Keys
    ${list_key}  getListKeys  /aaa/authentication/users/user
    Log To Console  ${list_key}
    
Delete User
    Delete    /aaa/authentication/users/user{test}
    Commit
    
  
