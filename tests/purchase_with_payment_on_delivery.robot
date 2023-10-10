*** Settings ***
Documentation    Place an order for the 'Selenium Ruby' product with cash on delivery payment
Resource         ../resources/purchase_with_payment_on_delivery_resource.robot
Test Setup       Open the navegador
Test Teardown    Close the navegador


*** Test Cases ***
Test Case 01 - Add "Selenium Ruby" to Cart and Select Cash on Delivery Payment
    [Documentation]    This test verifies the addition of the "Selenium Ruby" product to the cart
    ...                and selecting the cash on delivery payment option.
    [Tags]             shopping  cash-on-delivery

    Given I am on the homepage shop
    When I search for the product "Selenium Ruby"
    And I add the product to my cart
    Then the "Selenium Ruby" product should be in my cart

    And I am in my cart
    When I choose the cash on delivery payment option
    And I complete the order
    Then I should see an order confirmation with cash on delivery