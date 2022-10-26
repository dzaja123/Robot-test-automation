*** Settings ***
Documentation  Login page will work depending on the user credentials.
Resource          ../functions/login_functions.robot 
Test Teardown     Close Browser

*** Variables ***
${CORRECT_USERNAME}   standard_user
${CORRECT_PASSWORD}   secret_sauce
${BLOCKED_USERNAME}   locked_out_user

*** Test Cases ***
Successful Login
    [documentation]  This test case verifies that user is able to successfully Login 
    A user is at the saucelabs login page
    A user enters the username  ${CORRECT_USERNAME}
    A user enters the password  ${CORRECT_PASSWORD}
    A user clicks on the login button
    A user is logged in

Blocked Login
    [documentation]  This test case verifies that user is not able to successfully Login if he is blocked 
    A user is at the saucelabs login page
    A user enters the username  ${BLOCKED_USERNAME}
    A user enters the password  ${CORRECT_PASSWORD}
    A user clicks on the login button
    The error message is displayed  Epic sadface: Sorry, this user has been locked out.

Incorrect Username Login
    [documentation]  This test case verifies that user is not able to successfully Login with wrong username 
    A user is at the saucelabs login page
    A user enters the username  testUsername
    A user enters the password  ${CORRECT_PASSWORD}
    A user clicks on the login button
    The error message is displayed  Epic sadface: Username and password do not match any user in this service

Incorrect Password Login
    [documentation]  This test case verifies that user is not able to successfully Login with wrong password
    A user is at the saucelabs login page
    A user enters the username  ${CORRECT_USERNAME}
    A user enters the password  testPassword
    A user clicks on the login button
    The error message is displayed  Epic sadface: Username and password do not match any user in this service
