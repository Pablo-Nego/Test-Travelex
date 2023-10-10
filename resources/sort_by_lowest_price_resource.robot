*** Settings ***
Resource    ..//configuration/variables_resource.robot
Resource    BDDpt-br.robot
Library     SeleniumLibrary
Library     ..//configuration/my_library.py
Library           Collections

*** Keywords ***

Open the navegador
    Open Browser     browser=${BROWSER}
    Maximize Browser Window

Close the navegador
    Capture Page Screenshot
    Close Browser

####Given 
that I am on the products page
  Go To 	 url=${URL}     
  Sleep    2s
  Wait Until Page Contains Element    ${PRODUCTS_CATEGORYS}
    

####When 
I choose the option to sort by ascending price
   Click Element   ${ORDER_BY}
   Wait Until Page Contains Element    xpath=//*[@id="content"]/form/select/option[5]
   Click Element      xpath=//*[@id="content"]/form/select/option[5]    
   Sleep    2s

Get Prices
    ${xpaths} =  Create List
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹150.00')]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹180.00')]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹250.00')]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹280.00')]
    ...    (//span[@class='woocommerce-Price-amount amount'][contains(.,'₹450.00')])[2]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹350.00')]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹400.00')]
    ...    //span[@class='woocommerce-Price-amount amount'][contains(.,'₹500.00')]
  
####Then 
Prices Should Be in Ascending Order 
  execute javascript  window.scrollTo(0,200)
  scroll element into view         //a[@href='/shop/?orderby=price&add-to-cart=169']
  Sleep   2s
 ${values} =    Get Prices
    ${is_sorted} =    Evaluate    all(x <= y for x, y in zip(@{values}[0:-1], @{values}[1:]))
    Should Be True    ${is_sorted}



# Este cenário não está retornando conforme o esperado!!


