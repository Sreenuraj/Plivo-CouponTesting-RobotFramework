*** Settings ***
Documentation  This suite is for testing the Redeem Coupon Functionality

Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/Plivo_app.robot  # necessary for lower level keywords in test cases

Suite Setup     Common.Begin Web Test  #open the browser to start test with
Suite Teardown  Common.End Web Test  #Closes the browser when all tests finishes


# Copy/paste any of the below line to Terminal window to execute
# robot -d results tests/Plivo-CouponTesting-Positive.robot
# robot -d results --reporttitle "Plivo-CouponTesting-Positive Report" --logtitle "Plivo-CouponTesting-Positive log" tests
# robot -d results -T tests/Plivo-CouponTesting-Positive.robot
# robot -d results -L debug tests/Plivo-CouponTesting-Positive.robot

*** Test Cases ***
User should be able to "login"
    [Tags]  Smoke
    Plivo_app.Login to the website

User should be able to able to go to "Account" page
    [Tags]  Smoke
    Plivo_app.Navigate to Account Page

User should be able to go to "Payments" page
    [Tags]  Smoke
    Plivo_app.Navigate to Payment Page

User should be able to "Redeem a Coupon"
    [Tags]  Smoke
    Plivo_app.Select redeem a coupon option

User should be able to "Enter the coupon and submit"
    [Tags]  Smoke
    Plivo_app.Redeem the coupon


