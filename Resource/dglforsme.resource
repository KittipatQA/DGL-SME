*** Settings ***
Library              SeleniumLibrary    run_on_failure=Nothing
Library              DateTime

*** Variables ***
${open_url}          https://dgl-acct.addtechhub.com
${login_url}         ${open_url}/login            
${Output_url}        /jar/home/jenkins/jenkins/workspace/DGL-SME/Screen
${Type of file}      png
${path_jenkins}      /jar/home/jenkins/jenkins/workspace/DGL-SME
           
*** Keywords ***
Open the web page
    Open Browser    ${open_url}     chrome
    Maximize Browser Window
    Set Selenium Speed  1

Go to login page
    Go to           ${login_url}

Get DateTime
     ${date current}=     Get Current Date      result_format=%Y-%m-%d %H-%M-%S
     [Return]     ${date current}    
    
Set Directory
    [Arguments]         ${image_name}
    ${Date}=  Get DateTime
    Log To Console      ${Date}                    
    Set Suite Variable     ${Path}     ${Output_url}/${image_name} ${Date}

Capture Screen
    Capture Page Screenshot         ${Path}/${TEST_NAME}{index}.${Type of file}


