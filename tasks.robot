*** Settings ***
Documentation     EGX X-stream Workstation desktop application robot. Opens the EGX X-stream Workstation and performs tasks.
Library           RPA.Windows
Library           RPA.Desktop

*** Variables ***
${APP_NAME}       EGX X-stream Workstation
${USER_NAME}      01001a
${SECURITY_LOCATOR}    name:EGMFC001MM19

*** Test Cases ***
Open EGX X-stream Workstation desktop application and perform actions
    Open the EGX X-stream Workstation desktop application
    Test login 
    Select the security

*** Keywords ***
Open the EGX X-stream Workstation desktop application
    Windows Search    ${APP_NAME}
    Sleep    5s  # Increased sleep to ensure the application is fully opened

Test login 
    # Sending Ctrl + L to focus on the login field (adjust if necessary)
    Send Keys    keys={CTRL}l
    Sleep    1s  # Ensure the login field is focused
    Send Keys    keys=${USER_NAME}
    Send Keys    keys={ENTER}
    Sleep    3s  # Wait for the login to complete

Select the security 
    # Wait until the element is present and then click it
    Wait Until Keyword Succeeds    10x    2s    Element Should Be Present    ${SECURITY_LOCATOR}
    RPA.Windows.Click              ${SECURITY_LOCATOR}
    Sleep    3s  # Wait for the selection to take effect

Element Should Be Present
    [Arguments]    ${locator}
    @{elements}    Find Element    ${locator}
    Run Keyword Unless    ${len(${elements})} > 0    Fail    Element not found with locator '${locator}'
