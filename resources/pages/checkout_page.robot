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
    ${price_text}=       Get Text    ${price_element}
    Log To Console       Found price: ${price_text}

    # 1) ลบช่องว่างทั้งหมดก่อน (จัดการกรณี "- 85.00")
    ${clean}=    Replace String    ${price_text}    ${SPACE}    ${EMPTY}

    # 2) เปลี่ยน Unicode minus ถ้ามี (มักจะไม่บ่อย แต่ปลอดภัย)
    ${clean}=    Replace String    ${clean}    -    -

    # 3) เอาเครื่องหมายสกุลเงินและคำว่า THB, ฿, comma ออก
    ${clean}=    Replace String    ${clean}    THB    ${EMPTY}
    ${clean}=    Replace String    ${clean}    ฿      ${EMPTY}
    ${clean}=    Replace String    ${clean}    ,      ${EMPTY}

    # 4) แปลงเป็นตัวเลข (Convert To Number จะจัดทั้ง int/float ให้)
    ${price_value}=    Convert To Number    ${clean}
    RETURN    ${price_value}

Verify price calculation
    [Documentation]    Verifies that subtotal - discount + shipping = total
    ${subtotal}=    Get checkout price value    ${SHADOW_SELECTOR_SUBTOTAL}
    ${discount}=    Get checkout price value    ${SHADOW_SELECTOR_DISCOUNT}
    ${shipping}=    Get checkout price value    ${SHADOW_SELECTOR_SHIPPING}
    ${vat}=         Get checkout price value    ${SHADOW_SELECTOR_VAT}
    ${total}=       Get checkout price value    ${SHADOW_SELECTOR_TOTAL}
    ${calculated_total}=    Evaluate            ${subtotal} + ${discount} + ${shipping} + ${vat}
    Should Be Equal As Numbers                  ${calculated_total}    ${total}
    ...    msg=Price calculation incorrect: ${subtotal} + ${discount} + ${shipping} + ${vat} should equal ${total}
    Log    Price verification passed: Subtotal=฿${subtotal} + Discount=฿${discount} + Shipping=฿${shipping} + Vat=฿${vat} = Total=฿${total}