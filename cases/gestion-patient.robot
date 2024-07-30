*** Settings ***
Library                                                                SeleniumLibrary
Resource                                                               ${EXECDIR}${/}keywords${/}global.resource
Resource                                                               ${EXECDIR}${/}keywords${/}gestion-patient.resource

*** Test Cases ***
Creation D_Un Dossier Patient
    Connexion                                                         ICARE           secretaire@gmail.com         NEST             BcIsX7V&ZRh7
    Creer Un Patient

Ajout D_Une Personne A Contacter
    Fail            Not implemented

Ajout D_Une Prise En Charge
    Fail            Not implemented