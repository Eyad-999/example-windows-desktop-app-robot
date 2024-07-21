*** Settings ***
Documentation     Spotify Windows desktop application robot. Opens the Spotify
...               desktop application, searches for the given song, and plays
...               the song. Demonstrates the basic Windows automation
...               capabilities of the RPA Framework.
Library           RPA.Windows
Library           RPA.Windows
Library           RPA.Robocorp.Vault
*** Variables ***
${APP_NAME}       EGX X-stream Workstation    


*** Tasks ***
Open EGX X-stream Workstation and Login
    [Documentation]    Open the EGX X-stream Workstation app and login.
    Open Application    ${APP_NAME}
    Wait Until Application Is Ready    ${APP_NAME}    timeout=10s
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
    Send Keys    win    text=${app_name}
    Press Keys    enter
    Sleep    3s  # Adjust the sleep time as necessary
        