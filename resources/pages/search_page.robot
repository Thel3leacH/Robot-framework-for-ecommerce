*** Settings ***
Library         SeleniumLibrary
Resource        common_page.robot
Resource        ../locators/search_locators.robot
Resource        ../locators/search_results_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Click search button
    [Documentation]    Clicks the search button in navigation
    Wait and click element    ${LOC_SEARCH_BUTTON}

Search for product
    [Documentation]    Types search keyword in search box
    [Arguments]    ${keyword}
    Click Element    ${LOC_SEARCH_INPUT}
    Input Text    ${LOC_SEARCH_INPUT}    ${keyword}

Search and select from suggestions
    [Documentation]    Searches for product and clicks autocomplete suggestion
    [Arguments]    ${keyword}
    Search for product    ${keyword}
    Wait Until Element Is Visible    ${LOC_SEARCH_SUGGEST}    timeout=${DEFAULT_TIMEOUT}
    Click Element    ${LOC_SEARCH_SUGGEST}
    Sleep    0.5s

Search with direct button click
    [Documentation]    Searches for product by clicking search button (no autocomplete)
    [Arguments]    ${keyword}
    Click search button
    Search for product    ${keyword}
    Wait Until Element Is Visible    ${LOC_SEARCH_SUGGEST}    timeout=${DEFAULT_TIMEOUT}
    Click search button
    Sleep    0.5s