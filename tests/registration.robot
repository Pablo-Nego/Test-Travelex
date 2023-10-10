*** Settings ***
Documentation    Verify the functionality to register a user with email and password.
Resource         ../resources/registration_resource.robot
Test Setup       Open the navegador
Test Teardown    Close the navegador

*** Test Cases ***

Feature: Registration for a User
    [Documentation]    This scenario tests the registration process by entering an email and password.
    [Tags]             tests the registration
    Given the user is on the registration page
    When the user enters their email "user@example.com"
    And the user enters their password "Password123"
    And the user submits the registration form
    Then the user should be registered successfully