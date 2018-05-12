*** Settings ***
Documentation  Payment page actions
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot


*** Keywords ***
Go to redeem a coupon option
    sleep  3s  # This is set for firefox as it is taking some time to load
    Click Link  ${REDEEM_COUPON_LINK}
    Wait Until Page Contains  ${COUPON_ALERT_TEXT}
    Page Should Contain Element  ${COUPON_INPUT_BOX}
