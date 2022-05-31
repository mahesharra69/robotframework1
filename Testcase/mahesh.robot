*** Settings ***
Library  SeleniumLibrary
Library     XML
Library     OperatingSystem

*** Variables ***
${url}  https://www.google.co.in
${browser}  Chrome
${file}   Textfile.text
*** Test Cases ***
Browser Search
    Open Browser     ${url}   ${browser}
    Input Text      name:q      robotframework
    Submit Form
    ${M}=  Get WebElements    //div[@class="yuRUbf"]
    Create File     ${file}
    FOR   ${i}    IN  @{m}
       ${msg}=  Get Text    ${i}
       Log To Console   ${msg}
       Append To File  ${file}     ${msg}
    END

    Capture Page Screenshot    Snapshot.png
    Close Browser