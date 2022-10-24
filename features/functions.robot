*** Settings ***
Documentation  Login page will work depending on the user credentials.
Library  SeleniumLibrary

*** Variables ***
${URL}                https://www.saucedemo.com/
${SHOP_PAGE_URL}      https://www.saucedemo.com/inventory.html
${BROWSER}            Firefox
${USERNAME_FIELD}     id:user-name
${PASSWORD_FIELD}     id:password
${LOGIN_BUTTON}       id:login-button
${LOGIN_TITLE}        xpath:/html/body/div/div/div/div[1]/div[2]/span
${ERROR_MESSAGE}      xpath:/html/body/div/div/div[2]/div[1]/div[1]/div/form/div[3]/h3
       

*** Keywords ***
A user is at the saucelabs login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Swag Labs

A user enters the username 
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

A user enters the password 
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

A user clicks on the login button
    Click Button    ${LOGIN_BUTTON} 

A user is logged in
    Location Should Be    ${SHOP_PAGE_URL}

The error message is displayed    
    [Arguments]    ${message}
    Element Should Contain    ${ERROR_MESSAGE}    ${message}

