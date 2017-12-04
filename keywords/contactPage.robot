*** Settings ***
Library           Selenium2Library

*** Keywords ***
Open contact form
    Wait Until Page Contains Element    xpath=//a[@href="http://automationpractice.com/index.php?controller=contact"]
	Click Element	xpath=//div[@id="contact-link"]
	Wait Until Page Contains Element    xpath=//footer[@id="footer"]
	Page Should Contain	Customer service - Contact us

Select subject form
    Click element   xpath=//select[@id="id_contact"]
    Click element   xpath=//select[@id="id_contact"]/option[2]

Input nonValid mail
    [Arguments]     ${nonValidEmail}
    Wait Until Page Contains Element	xpath=//input[@id="email"]
    Input Text	xpath=//input[@id="email"]	${nonValidEmail}


Input valid mail
    [Arguments]     ${validEmail}
    Wait Until Page Contains Element	xpath=//input[@id="email"]
    Input Text	xpath=//input[@id="email"]	${validEmail}


Input message
    [Arguments]     ${message}
    Wait Until Page Contains Element	xpath=//textarea[@id="message"]
    Input Text	xpath=//textarea[@id="message"]	${message}
