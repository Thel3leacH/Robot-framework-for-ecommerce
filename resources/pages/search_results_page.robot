*** Settings ***
Library         SeleniumLibrary
Resource        common_page.robot
Resource        ../locators/search_results_locators.robot
Resource        ../variables/test_data.robot

*** Keywords ***
Select product from search results by id
    [Documentation]    Clicks product view button in search results using product ID
    [Arguments]    ${product_id}
    ${product_button}=    Get shadow root element    ${LOC_SHADOW_HOST}    button[id="btn-view-${product_id}"]
    Click Element    ${product_button}

Select ceramic mug from search results
    [Documentation]    Selects Ceramic Mug product from search results (product ID: 11)
    Select product from search results by id    11