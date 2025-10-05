*** Settings ***
Library         SeleniumLibrary
Library         String
Resource        common_page.robot
Resource        ../locators/checkout_locators.robot

*** Keywords ***
Get checkout price value
    [Documentation]    Extracts numeric value from price element
    [Arguments]    ${shadow_selector}
    ${price_element}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${shadow_selector}
    ${price_text}=    Get Text    ${price_element}
    # ${price_value}=    Evaluate    float('${price_text}'.replace('$', '').replace(',', '').strip())
    Log To Console       Found price: ${price_text}

    # ลบสกุลเงินและเครื่องหมายที่ไม่ต้องการออก
    ${clean_text}=       Replace String    ${price_text}    THB    ${EMPTY}
    ${clean_text}=       Replace String    ${clean_text}    ฿      ${EMPTY}
    ${clean_text}=       Replace String    ${clean_text}    ,      ${EMPTY}
    ${clean_text}=       Strip String      ${clean_text}

    # แปลงเป็นตัวเลขทศนิยม
    ${price_value}=      Convert To Number    ${clean_text}
    RETURN    ${price_value}

Get checkout price value or zero
    [Arguments]    ${shadow_selector}
    ${status}    ${value}=    Run Keyword And Ignore Error    Get checkout price value    ${shadow_selector}
    Run Keyword If    '${status}' == 'FAIL'    Set Variable    ${0}
    ...    ELSE    Set Variable    ${value}
    RETURN    ${value}

Verify price calculation
    [Documentation]    Verifies that subtotal - discount + shipping = total
    ${subtotal}=    Get checkout price value    ${SHADOW_SELECTOR_SUBTOTAL}
    ${discount}=    Get checkout price value    ${SHADOW_SELECTOR_DISCOUNT}
    # ${discount}=    Get checkout price value or zero    ${SHADOW_SELECTOR_DISCOUNT}
    ${shipping}=    Get checkout price value    ${SHADOW_SELECTOR_SHIPPING}
    ${vat}=    Get checkout price value        ${SHADOW_SELECTOR_VAT}
    ${total}=    Get checkout price value      ${SHADOW_SELECTOR_TOTAL}
    
    ${calculated_total}=    Evaluate    ${subtotal} - ${discount} + ${shipping} + ${vat}
    # ${calculated_total}=    Evaluate    ${subtotal} + ${shipping} + ${vat}
    
    Should Be Equal As Numbers    ${calculated_total}    ${total}    
    ...    msg=Price calculation incorrect: ${subtotal} - ${discount} + ${shipping} + ${vat} should equal ${total}
    # ...    msg=Price calculation incorrect: ${subtotal} + ${shipping} + ${vat} should equal ${total}
    
    Log    Price verification passed: Subtotal=$${subtotal} - Discount=$${discount} + Shipping=$${shipping} +${vat} = Total=$${total}
    # Log    Price verification passed: Subtotal=$${subtotal} + Shipping=$${shipping} +${vat} = Total=$${total}