*** Settings ***
Resource    ..//configuration/variables_resource.robot
Resource    BDDpt-br.robot
Library     SeleniumLibrary


*** Keywords ***

Open the navegador
    Open Browser    browser=${BROWSER} 
    Maximize Browser Window

Close the navegador
    Capture Page Screenshot
    Close Browser

####Given
I am on the homepage
    Go To    ${URL}
    Sleep    2s

####When
I click the "My Account"
    Click Link    ${MY_ACCOUNT}
    Sleep    2s

####And 
I enter into the "Username" field
    Click Element   ${USERNAME} 
    Input Text      ${USERNAME}    text=kaniviki@yandex.ru

####And 
I enter into the "Password" field
    Click Element 	 ${PASSWORD}
    Input Text 	     ${PASSWORD}    text=Twowrongsdon'tmakearight31

####And 
I click the Login button
    Click Button    ${LOGIN} 
    

####Then
I should see the Logout
    Element Should Be Visible 	 locator=${HELLO_TWO}	 message=kaniviki
    Sleep   2s

