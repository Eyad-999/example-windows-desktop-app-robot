*** Settings ***
Library           RPA.Desktop
Library           RPA.Windows
Library           RPA.Robocorp.Vault

*** Variables ***
${APP_NAME}       EGX X-stream Workstation

*** Tasks ***
Open EGX X-stream Workstation and Login
    [Documentation]    Open the EGX X-stream Workstation app and login.
    Open Application    ${APP_NAME}
    Wait Until Window Is Ready    ${APP_NAME}
    Click    locator=type_in_your_username_locator
    Type Text    locator=type_in_your_username_locator    text=your_username
    Click    locator=type_in_your_password_locator
    Type Text    locator=type_in_your_password_locator    text=your_password
    Click    locator=login_button_locator
    Wait Until Page Contains Element    locator=dashboard_locator    timeout=10s
    Capture Screenshot    login_successful.png

*** Keywords ***
Open Application
    [Arguments]    ${app_name}
    Press Keys    win    text=${app_name}
    Press Keys    enter
    Sleep    3s  # Adjust the sleep time as necessary

Wait Until Window Is Ready
    [Arguments]    ${app_name}
    Wait Until Keyword Succeeds    retry=10x    interval=1s    Window Should Exist    ${app_name}

Window Should Exist
    [Arguments]    ${app_name}
    ${result}    Run Keyword And Return Status    Get Window    ${app_name}
    Should Be True    ${result}
