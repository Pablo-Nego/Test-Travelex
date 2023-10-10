*** Settings ***
Resource    ../configuration/variables_resource.robot
Resource    BDDpt-br.robot
Library     SeleniumLibrary
 

*** Keywords ***
Open the navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Close the navegador
    Capture Page Screenshot
    Close Browser

#### GIVEN
I am on the homepage shop
   Go To 	 url=${URL}     
   Sleep    2s
   Wait Until Page Contains Element    ${PRODUCTS_CATEGORY}  timeout=10s
#### When 
I search for the product "Selenium Ruby"
   Execute JavaScript    window.scrollBy(0,400)
   Wait Until Element Is Visible    ${BOOK_SELENIUM_RUBY}
   Scroll Element Into View  ${BOOK_SELENIUM_RUBY}
   Click Element 	 locator=${BOOK_SELENIUM_RUBY} 
   Sleep    3s

#### And 
I add the product to my cart

    Click Element    ${CLICK_SHOPPING_CART}

#### Then 
the "Selenium Ruby" product should be in my cart

    Wait Until Element Is Enabled      ${PROCEED_TO_CHECK}>a    

#### And 
I am in my cart

    Click Element    ${PROCEED_TO_CHECK}>a

#### When 
I choose the cash on delivery payment option

    Click Element 	 locator=${FIRST_NAME}         
    Input Text       ${FIRST_NAME}       Test
    Input Text       ${LAST_NAME}        Trest
    Input Text       ${EMAIL}            test@gmail.com
    Input Text       ${PHONE_NUMBER}     +7(999)999-99-99
    Click Element    ${COUNTRY} 
    Input Text       ${SEARCH_COUNTRY}    Ukraine
    Click Element    ${CHOOSE_COUNTRY} 
    Input Text       ${ADDRRESS}          Bolshaya Monetnaya
    Input Text       ${CITY}              Saint Petersburg
    Input Text       ${STATE}             Russia
    Input Text       ${POST_CODE}         197101
    Execute JavaScript    window.scrollBy(0,600)
    Sleep    3s
    Click Element    ${CASH_ON_DELIVERY} 

#### And 
I complete the order

    Click Element    ${PLACE_ORDER} 
    sleep   10s

#### Then 
I should see an order confirmation with cash on delivery    

    Should Be Equal    ${THANKYOU_ORDER_RECEIVED}     
    Take Screenshot    purchase_confirmation.png 




