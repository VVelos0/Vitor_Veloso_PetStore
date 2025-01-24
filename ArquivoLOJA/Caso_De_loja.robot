*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivoLOJA/Loja.robot

*** Variables ***
${BASE_URL}       https://petstore.swagger.io
${ENDPOINT}                    /users

*** Test Cases ***

caso de cenario 07: Validar POST loja
  Criar sessão na petstore
  POST Loja /loja
  Validar Status Code


caso de cenario 08: Validar GET loja
    Criar sessão na petstore
    GET Loja /loja
    Validar Status Code

