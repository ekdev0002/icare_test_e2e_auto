*** Settings ***
Resource                                        ${EXECDIR}${/}locators${/}global.resource
Resource                                        ${EXECDIR}${/}locators${/}gestion-patient.resource

Library    SeleniumLibrary
Library    String
*** Keywords ***
Connexion
    [Arguments]                                 ${PLATEFORM}                               ${USERNAME}                ${HICODE}                ${MDP}    
    IF    "${PLATEFORM}" == "ICARE"
        Open Browser                            https://icare-nestlabs-test.net:8090            googlechrome                                   options=add_argument('--window-size=1920,1080'); add_argument("--headless"); add_argument('--no-sandbox');     # options=add_argument("--start-maximized");  add_argument('--disable-dev-shm-usage') 
        Saisir Text Dans Element                ${CHAMP_USERNAME_XPATH}                    ${USERNAME}
        Saisir Text Dans Element                ${CHAMP_HICODE_XPATH}                      ${HICODE}
        Saisir Text Dans Element                ${CHAMP_MDP_XPATH}                   ${MDP}
        Cliquer Sur Element                     ${BOUTON_SE_CONNECTER_XPATH}
        Wait Until Element Is Visible           ${LIEN_MODULE_PATIENTS_XPATH}            15s
        Wait Until Element Is Enabled           ${LIEN_MODULE_PATIENTS_XPATH}
        Cliquer Avec JS                         ${LIEN_MODULE_PATIENTS_XPATH}
        Wait Until Element Is Visible           ${MESSAGE_ACCUEIL_XPATH}
    ELSE IF    "${PLATEFORM}" == "RENDEZ-VOUS"
        Cliquer Sur Element                       ${LIEN_MODULE_PATIENTS_XPATH}  
    END


Cliquer Sur Element
    [Arguments]                                 ${ELEMENT_XPATH}
    Wait Until Element Is Visible               ${ELEMENT_XPATH}       15
    Wait Until Element Is Enabled               ${ELEMENT_XPATH}       15
    Click Element                               ${ELEMENT_XPATH}


Cliquer Avec JS
    [Arguments]                                 ${locator}
    Execute Javascript                          document.evaluate(`${locator}`,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

Saisir Text Dans Element
    [Arguments]                                 ${ELEMENT_XPATH}                            ${TEXT_A_SAISIR}
    Wait Until Element Is Visible               ${ELEMENT_XPATH}
    Input Text                                  ${ELEMENT_XPATH}                            ${TEXT_A_SAISIR}

Confirmer Modale
    [Arguments]                                 ${TEXT}
    ${BOUTON_XPATH}                             Replace String                             ${BOUTON_CONFIRM_XPATH}                __1__                 ${TEXT}
    Cliquer Sur Element                         ${BOUTON_XPATH}