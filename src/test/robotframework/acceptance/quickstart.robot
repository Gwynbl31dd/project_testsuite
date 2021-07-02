*** Variables ***
${URL}  http://127.0.0.1:8080
${USERNAME}  admin
${PASSWORD}  cisco123

*** Setting ***
Documentation     
...    NSO controller Tests

Metadata    Version            1.0

Library   com.apaulin.nso_controller.NSOController

Test Setup      Start Session
Test TearDown   Logout

*** Test Cases ***

Users
    Create User
    List Keys
    Delete User
    
Schema
	${schema}  Get Model  /aaa/authentication/users/user
    Log To Console  ${schema}
    
Show devices config
    ${config}   Show config   /devices
    Log To Console  ${config
    
Load Data
    Load  /devices  target/test-classes/device.json
    ${out}  Dry Run
    Log To Console  ${out}

*** Keywords ***
    
Start Session
	Init   ${URL}  ${USERNAME}  ${PASSWORD} 
    Start Transaction  running  read_write  private  test  reuse
    
Create User
    Create     /aaa/authentication/users/user{test3}
    Set Value  /aaa/authentication/users/user{test3}/uid         5
    Set Value  /aaa/authentication/users/user{test3}/gid         5
    Set Value  /aaa/authentication/users/user{test3}/password    cisco
    Set Value  /aaa/authentication/users/user{test3}/ssh_keydir  /home/test3/.ssh
    Set Value  /aaa/authentication/users/user{test3}/homedir     /home/test3
    Commit
    
List Keys
    ${list_key}  getListKeys  /aaa/authentication/users/user
    Log To Console  ${list_key}
    
Delete User
    Delete    /aaa/authentication/users/user{test3}
    ${out}  Dry Run
    Log To Console  ${out}
    Commit