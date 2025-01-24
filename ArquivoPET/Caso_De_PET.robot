*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivoPET/Pet.robot

*** Variables ***
${BASE_URL}       https://petstore.swagger.io
${ENDPOINT}                    /users


*** Test Cases ***
caso de cenario 05: Validar POST pet   
    Criar sessão na petstore
    POST Pet /pet
    Validar Status Code 

caso de cenario 06: Validar GET pet
    Criar sessão na petstore
    GET Pet /pet
    Validar Status Code 