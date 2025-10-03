*** Settings ***
Library         SeleniumLibrary
Resource        common_page.robot
Resource        ../locators/common_locators.robot
Resource        ../locators/login_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Navigate to login page
    [Documentation]    Clicks account button and navigates to signin page
    Wait and click element    ${LOC_ACCOUNT_BUTTON}
    Wait and click element    ${LOC_SIGNIN_LINK}

Login with credentials
    [Documentation]    Performs login with email and password through shadow DOM
    [Arguments]    ${email}    ${password}
    ${email_field}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_EMAIL}
    ${password_field}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_PASSWORD}
    ${signin_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    ${SHADOW_SELECTOR_SIGNIN_BTN}
    
    Input Text    ${email_field}    ${email}
    Input Password    ${password_field}    ${password}
    Wait and click element    ${signin_button}
    Sleep    2s    # Wait for login to complete

Login as valid user
    [Documentation]    High-level keyword to perform complete login flow
    Navigate to login page
    Login with credentials    ${VALID_EMAIL}    ${VALID_PASSWORD}