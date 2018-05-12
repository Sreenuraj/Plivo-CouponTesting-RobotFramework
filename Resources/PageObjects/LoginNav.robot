*** Settings ***
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot

*** Keywords ***
Verify Login Nav Present
    wait until page contains element  ${LOGIN_NAV_BAR}
    Page Should Contain Element  ${ACCOUNT_LINK}

Navigate to Account Page
    Click Link  ${ACCOUNT_LINK}
    Wait Until Page Contains  ${SUB_ACC_LINK_TEXT}
    Page Should Contain  ${SUB_ACC_LINK_TEXT}
