*** Settings ***
Documentation    Place an order for the 'Selenium Ruby' product with cash on delivery
Resource         ../resources/comment_scenario_resource.robot
Test Setup       Open the navegador
Test Teardown    Close the navegador

*** Test Cases ***

Test Case 01 - Write a 3-star review for the 'HTML5 WebApp Development' product
    [Documentation]    This scenario verifies the process of writing a 3-star review for the 'HTML5 WebApp Development' product.
    [Tags]             review  3-stars

    Given that I am on the product page for 'HTML5 WebApp Development'
    When I select a 3-star rating
    And I write a review
    And I submit the review
    Then I should see a confirmation message
