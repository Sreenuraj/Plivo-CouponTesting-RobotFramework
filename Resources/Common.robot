*** Settings ***
Documentation  Common Test where all the setup and teardown exists
Library  SeleniumLibrary
Resource  LocatorVariables.robot


*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser