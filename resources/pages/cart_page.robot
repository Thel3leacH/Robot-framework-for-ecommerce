*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        common_page.robot
Resource        ../locators/cart_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Navigate to cart
    [Documentation]    Clicks cart button to open cart page
    Wait Until Element Is Visible    ${LOC_CART_BUTTON}    timeout=5s
    Click Element    ${LOC_CART_BUTTON}
    Sleep    1s

Select cart item checkbox
    [Documentation]    Selects checkbox for cart item at given index
    [Arguments]    ${index}=0
    ${checkbox}=    Get shadow root element    ${LOC_SHADOW_HOST}    input[type="checkbox"][aria-label="cart-input-${index}"]
    Wait Until Element Is Not Visible    input[type="checkbox"][aria-label="cart-input-${index}"]    timeout=5s
    Click Element    ${checkbox}

Select all cart items
    [Documentation]    Selects the first item checkbox (modify if multiple items needed)
    Select cart item checkbox    0

Select coupon
    [Documentation]    Select coupon to discount
    ${select}=    Get shadow root element    ${LOC_SHADOW_HOST}    svg[aria-label="cart-svg-1"]
    Click Element    ${select}

Choose coupon
    [Arguments]    ${index}=0
    ${coupon}=    Get shadow root element    ${LOC_SHADOW_HOST}    li[aria-label="cart-li-${index}"]
    Click Element    ${coupon}
    ${apply_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    button[id="btn-apply-coupon"]
    Wait Until Element Is Visible    ${apply_button}    timeout=2s
    Click Element    ${apply_button}

Proceed to checkout
    [Documentation]    Clicks proceed button to go to checkout page
    ${proceed_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_PROCEED_BTN}
    Sleep    1s
    Click Element    ${proceed_button}