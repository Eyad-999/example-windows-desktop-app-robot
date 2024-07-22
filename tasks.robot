*** Settings ***
Documentation     Spotify Windows desktop application robot. Opens the Spotify
Library           RPA.Windows
Library           RPA.application     
*** Variables ***
${USER_NAME}=     01001a
${SECURITY_LOCATOR}    name:"EGMFC001MM19"
*** Tasks ***
Open EGX X-stream Workstation desktop application
    Open the EGX X-stream Workstation desktop application
    Test login 
    Select the secuirity


*** Keywords ***
Open the EGX X-stream Workstation desktop application
    Windows Search    EGX X-stream Workstation
    Sleep    3s


Test login 
    Send Keys    keys={CTRL}l
    Send Keys    keys=${USER_NAME}
    Send Keys    keys={enter}
    Sleep    3s

Select the secuirity 
    Wait Until Keyword Succeeds   10x   2s   ${SECURITY_LOCATOR}
    Click    name:"EGMFC001MM19"
    Sleep    3s
