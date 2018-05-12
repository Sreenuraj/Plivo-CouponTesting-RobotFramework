*** Settings ***
Documentation  This page is which connect the Tescases to the actual tests

Resource  ../Resources/PageObjects/LandingPage.robot
Resource  ../Resources/PageObjects/SignIn.robot
Resource  ../Resources/PageObjects/LoginNav.robot
Resource  ../Resources/PageObjects/DashNavAccountPage.robot
Resource  ../Resources/PageObjects/PaymentPage.robot
Resource  ../Resources/PageObjects/CouponAlert.robot


*** Keywords ***
Login to the website
    LandingPage.Load
    LandingPage.Verify Page Loaded
    SignIn.Attempt Login with Valid Credentials
    SignIn.Verify Login Successful

Navigate to Account Page
    LoginNav.Verify Login Nav Present
    LoginNav.Navigate to Account Page

Navigate to Payment Page
    DashNavAccountPage.Verify Dash Nav Present
    DashNavAccountPage.Navigate to Payment Page

Select redeem a coupon option
    PaymentPage.Go to redeem a coupon option

Redeem the coupon
    CouponAlert.Input Coupon and Submit
    CouponAlert.Enter a Valid Coupon
