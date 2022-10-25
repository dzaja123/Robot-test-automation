*** Settings ***
Documentation  Login page will work depending on the user credentials.
Resource          cart_functions.robot 
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
User is able to add item to cart
    [documentation]  This test case verifies that user is able to successfully add item to the cart 
    A user has successfully logged in
    A user clicks on the button  Add
    A user clicks on the button  Cart
    A item will be added to the cart

User is able to remove item from the cart
    [documentation]  This test case verifies that user is able to successfully remove item from the cart 
    A user has successfully logged in
    A user clicks on the button  Add
    A user clicks on the button  Cart
    A user clicks on the button  Remove
    A item will be removed from the cart

User is able to Checkout 
    [documentation]  This test case verifies that user is able to successfully complete the Checkout        
    A user has successfully logged in
    A user clicks on the button  Add
    A user clicks on the button  Cart
    A user clicks on the button  Checkout
    A user types his first name  Petar
    A user types his last name  Lazic
    A user types his zip code  34000
    A user clicks on the button  Continue
    A user clicks on the button  Finish
    A item checkout will be successfull 

User is not able to Checkout 
    [documentation]  This test case verifies that user is not able to successfully complete the Checkout if he doesnt fill the checkout form correctly
    A user has successfully logged in
    A user clicks on the button  Add
    A user clicks on the button  Cart
    A user clicks on the button  Checkout
    A user types his first name  Petar
    A user types his last name  Lazic
    A user clicks on the button  Continue
    The error message is displayed   Error: Postal Code is required