*** Settings ***
Documentation  Login page will work depending on the user credentials.
Library  SeleniumLibrary
Resource          login_functions.robot 

*** Variables ***
${CORRECT_USERNAME}   standard_user
${CORRECT_PASSWORD}   secret_sauce

${ADD_BUTTON}         id:add-to-cart-sauce-labs-backpack       
${CART_BUTTON}        xpath:/html/body/div/div/div/div[1]/div[1]/div[3]/a
${ADDED_ITEM}         id:item_4_title_link
${REMOVE_BUTTON}      id:remove-sauce-labs-backpack
${CHECKOUT_BUTTON}    id:checkout
${CONTINUE_BUTTON}    id:continue
${FINISH_BUTTON}      id:finish
${NAME_FIELD}         id:first-name
${LAST_NAME_FIELD}    id:last-name
${ZIP_CODE_FIELD}     id:postal-code
${FINISH_MESSAGE}     xpath:/html/body/div/div/div/div[1]/div[2]/span
${ERROR_MESSAGE}      xpath:/html/body/div/div/div/div[2]/div/form/div[1]/div[4]/h3

*** Keywords ***
A user has successfully logged in
    A user is at the saucelabs login page
    A user enters the username  ${CORRECT_USERNAME}
    A user enters the password  ${CORRECT_PASSWORD}
    A user clicks on the login button
    A user is logged in

A item will be added to the cart
    Element Should Be Visible   ${ADDED_ITEM}

A item will be removed from the cart
    Element Should Not Be Visible   ${ADDED_ITEM}  

A user types his first name
    [Arguments]    ${name}
    Input Text    ${NAME_FIELD}    ${name}

A user types his last name
    [Arguments]    ${last_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}

A user types his zip code
    [Arguments]    ${zip_code}
    Input Text    ${ZIP_CODE_FIELD}    ${zip_code}

A user clicks on the button
    [Arguments]    ${button}
    IF    "${button}" == "Add"
        Click Button    ${ADD_BUTTON}
    ELSE IF    "${button}" == "Cart"
        Click Link    ${CART_BUTTON}
    ELSE IF    "${button}" == "Checkout"
        Click Button    ${CHECKOUT_BUTTON}
    ELSE IF    "${button}" == "Continue"
        Click Button    ${CONTINUE_BUTTON}
    ELSE IF    "${button}" == "Finish"
        Click Button    ${FINISH_BUTTON}
    ELSE IF    "${button}" == "Remove"    
        Click Button    ${REMOVE_BUTTON}
    ELSE
        Log    Unknown button
    END
    
A item checkout will be successfull    
    Element Should Contain    ${FINISH_MESSAGE}    CHECKOUT: COMPLETE!