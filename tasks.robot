*** Settings ***
Documentation     Spotify Windows desktop application robot. Opens the Spotify
Library           RPA.Windows

*** Variables ***
${USER_NAME}=     01001a

*** Tasks ***
Open EGX X-stream Workstation desktop application and play a song
    Open the EGX X-stream Workstation desktop application
    Test login 
    Select the secuirity
    Play the song

*** Keywords ***
Open the EGX X-stream Workstation desktop application
    Windows Search    EGX X-stream Workstation
    Sleep    3s


Test login 
    Send Keys    keys={CTRL}l
    Send Keys    keys=${USER_NAME}
    Sleep    3s

Select the secuirity 
    Send Keys    id:ListViewSubItem-2
    Click        id:ListViewSubItem-2
    Sleep    3s

Play the song
    Send Keys    keys={ENTER}