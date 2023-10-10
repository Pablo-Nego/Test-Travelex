*** Variables ***
${BROWSER}                  chrome 
${URL}                      https://practice.automationtesting.in/shop/
${BOOK_SELENIUM_RUBY}       xpath=(//a[@rel='nofollow'][contains(.,'Add to basket')])[7]
${CLICK_SHOPPING_CART}      xpath=//span[contains(@class,'cartcontents')]
${PROCEED_TO_CHECK}         css:.wc-proceed-to-checkout
${FIRST_NAME}               id=billing_first_name
${LAST_NAME}                id=billing_last_name 
${EMAIL}                    id=billing_email
${PHONE_NUMBER}             id=billing_phone
${COUNTRY}                  id=select2-chosen-1
${SEARCH_COUNTRY}           id=s2id_autogen1_search
${CHOOSE_COUNTRY}           class=select2-match
${ADDRRESS}                 id=billing_address_1
${CITY}                     id=billing_city 
${STATE}                    id=billing_state
${POST_CODE}                id=billing_postcode
${CASH_ON_DELIVERY}         id=payment_method_cod
${PLACE_ORDER}              id=place_order
${THANKYOU_ORDER_RECEIVED}  class=woocommerce-thankyou-order-received
${HEADLESS}                 ${false}
${HOME_SHOP}                class=.woocommerce-breadcrumb
${ORDER_BY}                 xpath=//select[contains(@name,'orderby')]
${ADD_TO_BASKET}            ex="Add to basket"
${WAIT TIMEOUT}             timeout=5s
${PRODUCTS_CATEGORY}        xpath=//h4[@class='widgettitle'][contains(.,'Product Categories')]
${HTML5_WEBAPP}             xpath=(//img[contains(@width,'300')])[4]
${REVIEW}                   xpath=//a[@href='#tab-reviews'][contains(.,'Reviews (0)')]
${STAR}                     xpath=(//a[@href='#'])[5]
${COMMENT}                  xpath=//textarea[contains(@id,'comment')]
${NAME}                     xpath=//input[contains(@id,'author')]
${EMAIL}                    xpath=//input[contains(@id,'email')]
${SUBMIT}                   xpath=//input[contains(@id,'submit')]
${AWAITING_APPROVAL}        xpath=//em[contains(.,'Your comment is awaiting approval')]
${PRODUCTS_CATEGORYS}       xpath=//h4[@class='widgettitle'][contains(.,'Product Categories')]
${MY_ACCOUNT}               xpath=//a[@href='https://practice.automationtesting.in/my-account/']
${CLOSE}                    xpath=//span[@class='ns-6bsso-e-7'][contains(.,'Close')]
${USERNAME}                 xpath=//input[contains(@id,'username')]
${PASSWORD}                 xpath=//input[@id='password']
${EMAIL_ADDRESS}            xpath=//input[contains(@id,'reg_email')]
${PASSWORD_TWO}             xpath=//input[contains(@id,'reg_password')]
${LOGIN}                    xpath=//input[contains(@value,'Login')]
${REGISTRER}                xpath=//input[contains(@value,'Register')]
${HELLO}                    //strong[contains(.,'joseph')]
${HELLO_TWO}                //strong[contains(.,'kaniviki')]

*** Keywords ***
Dado ${keyword}
    Run keyword   ${keyword}

Quando ${keyword}
    Run keyword   ${keyword}

Então ${keyword}
    Run keyword   ${keyword}

E ${keyword}
    Run keyword   ${keyword}      

Remove Ad with JavaScript
    Open Browser    https://example.com/page-with-ad    Chrome
    Execute JavaScript    document.querySelector('div.ad').style.display = 'none';
    Close Browser

Remove Ad by "Close" Button
    Open Browser    https://example.com/page-with-ad    Chrome
    Wait Until Page Contains Element    xpath=//div[@class='ad']    timeout=10s
    Click Element    xpath=//div[@class='ad']//button[@class='close']
    Wait Until Page Does Not Contain Element    xpath=//div[@class='ad']    timeout=10s
    Close Browser        