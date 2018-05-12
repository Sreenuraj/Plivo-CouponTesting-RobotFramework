*** Settings ***
Documentation  Home page object
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot

*** Keywords ***
Load
    Go To  ${URL}

Verify Page Loaded
    Wait Until Page Contains     ${LANDING_PAGE_TEXT}
    Page Should Contain Element  ${LOGIN_USER_ID_TEXTBOX}
    Page Should Contain Element  ${LOGIN_USER_PSW_TEXTBOX}

