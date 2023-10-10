*** Settings ***
Documentation    Verify the functionality to sort products by the lowest price and ensure they are displayed in ascending price order.
Resource         ../resources/sort_by_lowest_price_resource.robot
Test Setup       Open the navegador
Test Teardown    Close the navegador


*** Test Cases ***

Test Case 01 - Sort Products by Lowest Price and Verify Correct Order
    [Documentation]    This test case verifies the functionality to sort products by the lowest price and ensure they are displayed in ascending price order.
    [Tags]             sorting  price-order

    Given that I am on the products page
    When I choose the option to sort by ascending price
    ${prices} =    Get Prices    
    Then Prices Should Be in Ascending Order