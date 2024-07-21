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
    RPA.Windows.Click    locator=type_in_your_username_locator
    RPA.Windows.Type Text    locator=type_in_your_username_locator    text=your_username
    RPA.Windows.Click    locator=type_in_your_password_locator
    RPA.Windows.Type Text    locator=type_in_your_password_locator    text=your_password
    RPA.Windows.Click    locator=login_button_locator
    RPA.Windows.Wait Until Page Contains Element    locator=dashboard_locator    timeout=10s
    RPA.Desktop.Capture Screenshot    login_successful.png

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
    ${result}    Run Keyword And Return Status    RPA.Windows.Get Window    ${app_name}
    Should Be True    ${result}
