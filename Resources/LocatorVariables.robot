*** Settings ***
Documentation  This file contains all the locators and variables

*** Variables ***
${BROWSER} =  ff
${URL} =  https://manage.plivo.com/accounts/login/
${LANDING_PAGE_TEXT} =  Login
${LOGIN_USER_ID_TEXTBOX} =  id=id_username
${LOGIN_USER_PSW_TEXTBOX} =  id=id_password
${LOGIN_NAV_BAR} =  xpath=//ul[@class='loginnav']
${ACCOUNT_LINK} =  xpath=//div[@id='wrapper']//a[contains(text(),'Account')]
${SUB_ACC_LINK_TEXT} =  New Sub Account
${USER_ID} =         plivoiview@gmail.com
${USER_PSW} =        Plivo@123
${LOGIN_BUTTON} =    id=login-sub
${DASHBOARD_TEXT} =  Dashboard
#${REDEEM_COUPON_LINK} =  xpath=//div[@class='redeem-no-card']/a
${REDEEM_COUPON_LINK} =  xpath=//div[@class='redeem-no-card']/a[contains(text(),'Redeem a coupon code instead')]
${COUPON_ALERT_TEXT} =  Redeem your coupon
${COUPON_INPUT_BOX} =  id=coupon
${PAYMENT_LINK} =  xpath=//a[@href='/payments/recharge/']
${PAYMENT_NAV_BAR_TEXT} =  Recharge
${ADD_CARD_MSG} =  Add a card
${COUPON_TEXT_BOX} =  //*[@id="coupon"]
${COUPONCODE} =  ZMVINDE5MJCXNW
${COUPON_SUBMIT_BUTTON} =  xpath=//a[@onclick='activate_coupon()']
${COUPON_VALID_TEXT} =  This coupon code is valid.
${COUPON_INVALID_TEXT} =  This coupon code is invalid.
${COUPON_ERROR_ELEMENT} =  xpath=//div[@id='coupon_error']