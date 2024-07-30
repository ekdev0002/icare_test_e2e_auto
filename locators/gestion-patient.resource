*** Variables ***
${LIEN_MODULE_PATIENTS_XPATH}                                   //a[contains(.,'Patients')]
${LIEN_MODULE_CAPACITE}                                         //h6[contains(.,"capacité")]
${MESSAGE_ACCUEIL_XPATH}                                        //h4[contains(.,'Liste des patients')]
${BOUTON_CRER_UN_PATIENT_XPATH}                                 //button[contains(.,'Créer un nouveau patient')]


${ONGLET_PATIENT_XPATH}                                         //h6[contains(.,'Soumissions')]
${BOUTON_AJOUTER_PATIENT_XPATH}                                 //button[contains(.,'Ajouter un soumissionnaire')]

${CHAMP_NOM_PATIENT_XPATH}                                      //input[@id="firstName"]
${CHAMP_PRENOM_PATIENT_XPATH}                                   //input[@id='lastName']
${CHAMP_PHONE_PATIENT_XPATH}                                    //input[@id='phone']
${CHAMP_PHONE_1_PATIENT_XPATH}                                  //input[@id='phone1']
${CHAMP_QUARTIER_PATIENT_XPATH}                                 //input[@id='address']
${CHAMP_VILLE_PATIENT_XPATH}                                    (//*[@id="city"]//input)[2]

${CHAMP_SEXE_PATIENT_XPATH}                                     //select[@id='sex']
${CHAMP_DATE_NAISSANCE_PATIENT_XPATH}                           //input[@id='doB']
${CHAMP_RUE_PATIENT_XPATH}                                      //input[@id='street']
${CHAMP_REGION_PATIENT_XPATH}                                   //*[@id='state']//input
${CHAMP_PAYS_PATIENT_XPATH}                                     //*[@id='country']//input
${CHAMP_NATIONALITY_PATIENT_XPATH}                              //*[@id='nationality']//input

${BOUTON_ENREGISTRER_PATIENT_XPATH}                             //button[contains(.,'Enregistrer')]
