*** Settings ***
Documentation    Test Case 02: Login, search with direct button click, add to cart, and verify checkout
Library          SeleniumLibrary
Resource         ../resources/pages/common_page.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/search_page.robot
Resource         ../resources/pages/search_results_page.robot
Resource         ../resources/pages/product_page.robot
Resource         ../resources/pages/cart_page.robot
Resource         ../resources/pages/checkout_page.robot

Test Setup       Open application
Test Teardown    Close application

*** Test Cases ***
Verify user can complete purchase flow with direct search button
    [Documentation]    User logs in, searches by clicking search button, selects product from results, adds to cart, and verifies pricing
    [Tags]        e2e    direct-search
    Transfer to thai
    Login as valid user
    Search with direct button click        ${SEARCH_KEYWORD_TC02}
    Select ceramic mug from search results
    Configure and add product to cart      ${PRODUCT_COLOR_TC02}        ${PRODUCT_QUANTITY_TC02}
    Navigate to cart
    Select all cart items
    Select coupon
    Choose coupon
    Sleep    3s
    Proceed to checkout
    Wait Until Element Is Not Visible      ${LOC_ORDER_CONFIRM}        timeout=10s
    Verify price calculation
    Sleep    10s