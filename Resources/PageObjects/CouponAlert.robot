*** Settings ***
Library  SeleniumLibrary
Resource  ../LocatorVariables.robot


*** Keywords ***
Input Coupon and Submit
    select window
    sleep  3s    # This is set because selenium failed to find the element faster
    Input Text  ${COUPON_INPUT_BOX}  ${COUPONCODE}
    Click Link  ${COUPON_SUBMIT_BUTTON}
    sleep  3s   # This was set because the screenshot was getting taken before submit button click was success

Enter a Valid Coupon
    page should not contain element  ${COUPON_ERROR_ELEMENT}
