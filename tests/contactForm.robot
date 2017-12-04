*** Settings ***
Library     Selenium2Library

Resource	../variables/variables.robot
Resource	../keywords/mainPage.robot
Resource    ../keywords/contactPage.robot

Test Setup	Open store main page
Test Teardown	Close All Browsers

*** Test Cases ***
Odeslani_Kontaktniho_Formulare_s_nevalidnim_emailem
    Open contact form
    Input nonValid mail     ${nonValidEmail}
    Click Button	xpath=//button[@id="submitMessage"]
    Page Should Contain	 Invalid email address.

Odeslani_kontaktniho_Formulare_s_validnim_emailem_bezZpravy
    Open contact form
    Input valid mail        ${validEmail}
    Click Button	xpath=//button[@id="submitMessage"]
    Page Should Contain	 The message cannot be blank.

Odeslani_kontakniho_formulare_vseValid
    Open contact form
    Select subject form
    Input valid mail        ${validEmail}
    Input message       ${message}
    Click Button	xpath=//button[@id="submitMessage"]
    Page Should Contain	 Your message has been successfully sent to our team.

*** Keywords ***
Provided precondition
    Setup system under test