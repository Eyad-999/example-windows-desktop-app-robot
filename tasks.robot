*** Settings ***
Documentation     Spotify Windows desktop application robot. Opens the Spotify
...               desktop application, searches for the given song, and plays
...               the song. Demonstrates the basic Windows automation
...               capabilities of the RPA Framework.
Library           RPA.Windows

*** Variables ***
${SONG_NAME}=     EL nayya

*** Tasks ***
EL nayya    Open the Spotify desktop application
    Search for the song
    Select the song
    Play the song

*** Keywords ***
Open the Spotify desktop application
    Windows Search    Spotify
    Sleep    5s

    Search for the song
    Send Keys    keys={CTRL}l
    Send Keys    keys=${SONG_NAME}
    Sleep    5s

Select the song
    Send Keys    keys={ENTER}{TAB}{ENTER}
    Sleep    5s

Play the song
    Send Keys    keys={ENTER}
