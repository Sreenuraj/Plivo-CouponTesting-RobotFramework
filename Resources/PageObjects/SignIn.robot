*** Settings ***
Documentation  SignIn page actions
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot


*** Keywords ***
Attempt Login with Valid Credentials
    Input Text      ${LOGIN_USER_ID_TEXTBOX}  ${USER_ID}
    Input Password  ${LOGIN_USER_PSW_TEXTBOX}  ${USER_PSW}
    Click Button    ${LOGIN_BUTTON}

Verify Login Successful
    Wait Until Page Contains     ${DASHBOARD_TEXT}
    Page Should Contain  ${DASHBOARD_TEXT}


