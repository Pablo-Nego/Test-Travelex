*** Settings ***
Resource         ../resources/login_resource.robot
Test Setup       Open the navegador
Test Teardown    Close the navegador

*** Test Cases ***
Login and Logout Test
    Given I am on the homepage
    When I click the "My Account"
    And I enter into the "Username" field
    And I enter into the "Password" field
    And I click the Login button
    Then I should see the Logout