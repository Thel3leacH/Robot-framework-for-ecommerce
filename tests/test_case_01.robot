*** Settings ***
Documentation    Test Case 01: Login, search with autocomplete, add to cart, and verify checkout
Library          SeleniumLibrary
Resource         ../resources/pages/common_page.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/search_page.robot
Resource         ../resources/pages/product_page.robot
Resource         ../resources/pages/cart_page.robot
Resource         ../resources/pages/checkout_page.robot

Test Setup       Open application
Test Teardown    Close application

*** Test Cases ***
Verify user can complete purchase flow with autocomplete search
    [Documentation]    User logs in, searches using autocomplete, adds product to cart, and verifies pricing
    [Tags]        e2e    autocomplete
    Transfer to thai
    Login as valid user
    Search and select from suggestions    ${SEARCH_KEYWORD}
    Configure and add product to cart    ${PRODUCT_COLOR}    ${PRODUCT_QUANTITY}
    Navigate to cart
    Select all cart items
    Select coupon
    Choose coupon
    Sleep    3s
    Proceed to checkout
    Wait Until Element Is Not Visible   ${LOC_ORDER_CONFIRM}        timeout=10s
    Verify price calculation
    Sleep    6s