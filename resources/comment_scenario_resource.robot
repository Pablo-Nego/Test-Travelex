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
That I am on the product page for 'HTML5 WebApp Development'
    Go To 	 url=${URL}     
    Sleep    2s
    Wait Until Element Is Visible   ${HTML5_WEBAPP}
    Scroll Element Into View        ${HTML5_WEBAPP}
    Click Element                   ${HTML5_WEBAPP}
    Sleep    3s

####When 
I select a 3 -star rating
    Click Element    css:[href='#tab-reviews']
    Sleep    3s
    Wait Until Element Is Visible   ${STAR} 
    Scroll Element Into View        ${STAR} 
    Click Element      ${STAR} 

####And 
I write a review
    Input Text    id=comment    Nice book!
    Input Text    id=author     Shakur
    Input Text    id=email      kaniviki@yandex.ru

####And 
I submit the review
    Click Element    id=submit
    Sleep    3s

####
I should see a confirmation message
    Wait Until Element Is Visible    ${AWAITING_APPROVAL} 
    
   