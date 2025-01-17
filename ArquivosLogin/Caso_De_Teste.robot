*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivosLogin/login.robot

*** Variables ***
${SERVER_URL}                 petstore




*** Test Cases ***

caso de cenario 01: Validar GET
    Criar novo usuario
    Get Endpoint /usuarios
    Validar Status Code "200"

caso de cenario 02: Validar POST
  Criar novo usuario
   POST Endpoint /usuarios
   Validar Status Code "200"


caso de cenario 03: Validar DELETE
    Criar novo usuario
    DELETE Endpoint /usuarios
    Validar Status Code "200"    




   