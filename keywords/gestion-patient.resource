*** Settings ***
Resource                                                ${EXECDIR}${/}locators${/}global.resource
Resource                                                ${EXECDIR}${/}keywords${/}global.resource
Library  FakerLibrary

*** Keywords ***
Creer Un Patient
    Cliquer Avec JS                                    ${BOUTON_CRER_UN_PATIENT_XPATH}
    Remplir Formulaire Patient 
    Confirmer Modale                                    Confirmer

Remplir Formulaire Patient
    ${nom}                                              FakerLibrary.last_name
    ${prenom}                                           FakerLibrary.first_name 
    ${quartier}                                         FakerLibrary.Address
    ${rue}                                              FakerLibrary.Street Address
    ${phone}                                            Generate Random String                  length=7         chars=[NUMBERS]
    ${phone1}                                           Generate Random String                  length=7        chars=[NUMBERS]
    ${email}                                            Catenate     ${nom}${prenom}@yopmail.com
    Saisir Text Dans Element                            ${CHAMP_NOM_PATIENT_XPATH}               ${nom} 
    Saisir Text Dans Element                            ${CHAMP_PRENOM_PATIENT_XPATH}            ${prenom}
    Saisir Text Dans Element                            ${CHAMP_DATE_NAISSANCE_PATIENT_XPATH}    17/05/1992     
    Saisir Text Dans Element                            ${CHAMP_PHONE_PATIENT_XPATH}             77${phone}
    Saisir Text Dans Element                            ${CHAMP_PHONE_1_PATIENT_XPATH}           78${phone1}
    Saisir Text Dans Element                            ${CHAMP_QUARTIER_PATIENT_XPATH}          ${quartier}       
    Saisir Text Dans Element                            ${CHAMP_VILLE_PATIENT_XPATH}             DAKAR   
    Press Keys                                          ${CHAMP_VILLE_PATIENT_XPATH}             ENTER 
    Select From List By Value                           ${CHAMP_SEXE_PATIENT_XPATH}              1 
    Saisir Text Dans Element                            ${CHAMP_RUE_PATIENT_XPATH}               ${rue}           
    Saisir Text Dans Element                            ${CHAMP_REGION_PATIENT_XPATH}            DAKAR
    Press Keys                                          ${CHAMP_REGION_PATIENT_XPATH}            ENTER
    Saisir Text Dans Element                            ${CHAMP_PAYS_PATIENT_XPATH}              SENEGAL
    Press Keys                                          ${CHAMP_PAYS_PATIENT_XPATH}              ENTER                       
    Saisir Text Dans Element                            ${CHAMP_NATIONALITY_PATIENT_XPATH}       SENEGALAIS(E)                 
    Press Keys                                          ${CHAMP_NATIONALITY_PATIENT_XPATH}       ENTER
    Cliquer Sur Element                                 ${BOUTON_ENREGISTRER_PATIENT_XPATH}  
    Sleep                                               10s
    Capture Page Screenshot   