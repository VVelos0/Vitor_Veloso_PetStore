*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivosLogin/Caso_De_Teste.robot



*** Variables ***
${password_para_login}        teste
${nome_de_usuario}            string
${SERVER_URL}                 petstore
${ARQUIVO_JSON}               usuarios.json




*** Keywords ***
Get Request Test
      Create Session    petstore     https://petstore.swagger.io

      ${resp_servrest}=   GET On Session  petstore  /  expected_status=200
      ${resp_json}=     GET On Session  jsonplaceholder  /posts/1

      Should Be Equal As Strings          ${resp_servrest.reason}  OK
      Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident

Criar novo usuario
    ${string}    Generate Random String    length=4   chars=[LETTERS]
    ${string}    Convert To Lower Case    ${string}   
    Set Test Variable    ${nome_de_usuario}  ${string}string
    Log    ${nome_de_usuario} 


Get Endpoint /usuarios
        Create Session    petstore        https://petstore.swagger.io
        ${resposta}=    GET On Session       petstore       /usuarios   
        Set Global Variable    ${resposta}




POST Endpoint /usuarios
        &{payload}  Create Dictionary        nome=string      email=string   password=string   
        ${resposta}    POST On Session       petstore     /usuarios    data=${payload}
        Log To Console        resposta: ${resposta.content}    
        Set Global Variable      ${resposta}
            

Criar sessão
    Create Session        petstore        https://petstore.swagger.io


Validar Status Code "200"       
             Log    ${resposta.status_code}
            Log    ${resposta.json()}



    



      






