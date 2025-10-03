*** Settings ***
Library         SeleniumLibrary
Resource        common_page.robot
Resource        ../locators/product_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Select product color
    [Documentation]    Selects product color option in shadow DOM
    [Arguments]    ${color}
    ${color_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_COLOR_${color.upper()}}
    Click Element    ${color_button}

Set product quantity
    [Documentation]    Increases quantity by clicking increment button multiple times
    [Arguments]    ${quantity}
    ${qty_increase_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_QTY_INCREASE}
    ${times_to_click}=    Evaluate    ${quantity} - 1
    Repeat Keyword    ${times_to_click} times    Wait and click element    ${qty_increase_button}

Add product to cart
    [Documentation]    Clicks add to cart button and waits for confirmation
    ${add_cart_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_ADD_TO_CART}
    Click Element    ${add_cart_button}
    Wait for notification to appear
    Wait for notification to disappear

Configure and add product to cart
    [Documentation]    Complete flow: select color, set quantity, and add to cart
    [Arguments]    ${color}    ${quantity}
    Select product color    ${color}
    Set product quantity    ${quantity}
    Add product to cart