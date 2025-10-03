*** Settings ***
Library         SeleniumLibrary
Resource        ../locators/common_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Open application
    [Documentation]    Opens the browser and navigates to the application URL
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Selenium Speed    ${SELENIUM_SPEED}

Close application
    [Documentation]    Closes all browser instances
    Close All Browsers

Wait and click element
    [Documentation]    Waits for element to be visible and enabled, then clicks it
    [Arguments]    ${locator}    ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Wait Until Element Is Enabled    ${locator}    timeout=${timeout}
    Sleep    ${IMPLICIT_WAIT}
    Click Element    ${locator}

Get shadow root element
    [Documentation]    Returns a shadow DOM element using JavaScript
    [Arguments]    ${shadow_host_locator}    ${shadow_selector}
    Wait Until Element Is Visible    ${shadow_host_locator}    timeout=${DEFAULT_TIMEOUT}
    ${shadow_host}=    Get WebElement    ${shadow_host_locator}
    ${shadow_element}=    Execute Javascript
    ...    return arguments[0].shadowRoot.querySelector('${shadow_selector}')
    ...    ARGUMENTS    ${shadow_host}
    RETURN    ${shadow_element}

Wait for notification to appear
    [Documentation]    Waits for success notification to appear
    Wait Until Element Is Visible    ${LOC_NOTIFICATION_ROOT}    timeout=${DEFAULT_TIMEOUT}

Wait for notification to disappear
    [Documentation]    Waits for notification to completely disappear before proceeding
    Wait Until Element Is Not Visible    ${LOC_NOTIFICATION_STATUS}    timeout=${LONG_TIMEOUT}