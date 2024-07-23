*** Settings ***
Documentation     EGX X-stream Workstation desktop application robot. Opens the EGX X-stream Workstation and performs tasks.
Library           RPA.Windows
Library           RPA.Desktop

*** Variables ***
${APP_NAME}               EGX X-stream Workstation
${USER_NAME}              01001a
${TABLE_AUTOMATION_ID}    id:59648
${SECURITY_NAME}          name:EGMFC002DM19

*** Test Cases ***
Open EGX X-stream Workstation desktop application and perform actions
    Open the EGX X-stream Workstation desktop application
    Test login 
    Select security from dynamic table


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

Select security from dynamic table
    Wait For Element    ${TABLE_AUTOMATION_ID}    
    RPA.Desktop.Click   ${TABLE_AUTOMATION_ID}
    Sleep    1s
    ${element}  Find Element    ${SECURITY_NAME}
    RPA.Desktop.Click   ${element}
    Sleep    3s  # Wait for the selection to take effect

Element Should Be Present
    [Arguments]    ${locator}
    @{elements}    Find Element    ${locator}
    Run Keyword Unless    ${len(${elements})} > 0    Fail    Element not found with locator '${locator}'