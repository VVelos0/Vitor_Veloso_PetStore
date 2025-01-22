*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivosLogin/login.robot

*** Variables ***
${BASE_URL}                   https://petstore.swagger.io
${ENDPOINT}                    /users




*** Test Cases ***

caso de cenario 01: Validar GET usuario
    Criar novo usuario
    Get User /usuarios
    Validar Status Code 

caso de cenario 02: Validar POST usuario
    Criar sessão na petstore
     POST User /usuarios
    Validar Status Code



caso de cenario 03: Validar PUT usuario
    Criar sessão na petstore
    PUT User /usuarios
    Validar Status Code "400"

caso de cenario 04: Validar DELETE usuario
     Criar sessão na petstore
    DELETE User /usuarios
    Validar Status Code "400" 


caso de cenario 05:      




   