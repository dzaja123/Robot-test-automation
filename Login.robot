*** Settings ***
Documentation  Login page will work depending on the user credentials.
Library  SeleniumLibrary

*** Variables ***
${SERVER URL}         https://www.saucedemo.com/
${BROWSER}            Firefox
${CORRECT_USERNAME}   standard_user
${CORRECT_PASSWORD}   secret_sauce
${BLOCKED_USERNAME}   locked_out_user
${USERNAME_FIELD}     id:user-name
${PASSWORD_FIELD}     id:password
${LOGIN_BUTTON}       id:login-button
${TITLE}              xpath:/html/body/div/div/div/div[1]/div[2]/span
${BLOCKED_ERROR}      xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[3]/h3

*** Test Cases ***
Successful Login
    [documentation]  This test case verifies that user is able to successfully Login 
    Open Browser  ${SERVER URL}  ${BROWSER}
    Wait Until Element Is Visible  ${USER_NAME_FIELD}  timeout=5
    Input Text  ${USERNAME_FIELD}  ${CORRECT_USERNAME}
    Input Password  ${PASSWORD_FIELD}  ${CORRECT_PASSWORD}
    Click Element  ${LOGIN_BUTTON} 
    Element Should Be Visible  ${TITLE}  timeout=5
    Close Browser

Blocked Login
    [documentation]  This test case verifies that user is not able to successfully Login if he is blocked 
    Open Browser  ${SERVER URL}  ${BROWSER}
    Wait Until Element Is Visible  ${USERNAME_FIELD}  timeout=5
    Input Text  ${USERNAME_FIELD}  ${BLOCKED_USERNAME}
    Input Password  ${PASSWORD_FIELD}  ${CORRECT_PASSWORD}
    Click Element  ${LOGIN_BUTTON}
    Element Should Be Visible  ${BLOCKED_ERROR}  timeout=5
    Close Browser

Incorrect Username Login
    [documentation]  This test case verifies that user is not able to successfully Login with wrong username 
    Open Browser  ${SERVER URL}  ${BROWSER}
    Wait Until Element Is Visible  ${USERNAME_FIELD}  timeout=5
    Input Text  ${USERNAME_FIELD}  ${CORRECT_USERNAME}
    Input Password  ${PASSWORD_FIELD}  test_password
    Click Element  ${LOGIN_BUTTON}
    Element Should Be Visible  ${BLOCKED_ERROR}  timeout=5
    Close Browser

Incorrect Password Login
    [documentation]  This test case verifies that user is not able to successfully Login with wrong password
    Open Browser  ${SERVER URL}  ${BROWSER}
    Wait Until Element Is Visible  ${USERNAME_FIELD}  timeout=5
    Input Text  ${USERNAME_FIELD}  test_username
    Input Password  ${PASSWORD_FIELD}  ${CORRECT_PASSWORD}
    Click Element  ${LOGIN_BUTTON}
    Element Should Be Visible  ${BLOCKED_ERROR}  timeout=5
    Close Browser

*** Keywords ***
A user enters the username  ${username}
    [Arguments]    ${username}
    Wait Until Element Is Visible  ${USER_NAME_FIELD}  timeout=5
    Input Text  ${USER_NAME_FIELD}   ${username}