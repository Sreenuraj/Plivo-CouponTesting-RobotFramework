*** Settings ***
Documentation  DashNavigaton action page
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot


*** Keywords ***
Verify Dash Nav Present
    Page Should Contain  ${SUB_ACC_LINK_TEXT}

Navigate to Payment Page
    Click Link  ${PAYMENT_LINK}
    Wait Until Page Contains  ${PAYMENT_NAV_BAR_TEXT}
    sleep  3s
    Page Should Contain  ${ADD_CARD_MSG}



