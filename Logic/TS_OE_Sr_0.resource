*** Settings ***
Library              SeleniumLibrary
Resource             /Users/USER1/.jenkins/workspace/DGL/Resource/dglforsme.resource

*** Variables ***

*** Keywords ***

Oe Check Search 0
    [Arguments]            ${username}    ${password}       ${image_name}       ${data}
    Set Suite Variable       ${logic}       Dharmniti Genaral Ledger
    Set Selenium Speed     0.3
    Set Directory          ${image_name}
    Capture Screen
    Input User             ${username}    
    Input Password         ${password}
    Capture Screen
    Login Submit                 
    Wait Until Page Contains     ${logic}
    Capture Screen
    Click Tab Buy
    Capture Screen
    Click Tab OtherExpense
    Capture Screen
    Click Btn Search
    ${column}=       Get Element Count        //*[contains(@id, 'sl-oe-detail')]
    Set Suite Variable      ${column}
    Log To Console       ${column}
    Input Data Search    ${data}
    Log To Console       ${data}
    Click Btn Search
    ${column}=       Get Element Count        //*[contains(@id, 'sl-oe-detail')]
    Set Suite Variable      ${column}
    Log To Console       ${column}
    Run Keyword If       ${column} > 0        Fail
    Page Should Contain Element     //table-body/div/div/label
    Capture Screen