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
the user is on the registration page
     Go To 	 url=${URL}     
     Sleep    2s
     Click Element 	 ${MY_ACCOUNT}
     sleep     2s

####When
the user enters their email "user@example.com"
     Click Element 	 ${EMAIL_ADDRESS}
     Input Text 	 ${EMAIL_ADDRESS} 	 text=josephe@gmail.com
     sleep     2s


####And 
the user enters their password "Password123"
     Click Element 	 ${PASSWORD_TWO}
     Input Text 	 ${PASSWORD_TWO}    text=Josh@@@78855874444
     sleep     2s


####And 
the user submits the registration form
     Click Element 	 ${REGISTRER}
     sleep     2s


####Then 
the user should be registered successfully
     SeleniumLibrary.Element Should Be Visible 	 locator=${HELLO} 	 message=josephe
     sleep     2s