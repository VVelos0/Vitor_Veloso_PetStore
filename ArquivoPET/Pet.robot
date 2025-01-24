*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivoPET/Caso_De_PET.robot



*** Variables ***


${BASE_URL}       https://petstore.swagger.io/v2
${BASE_URL2}       https://petstore.swagger.io/v2
${ARQUIVO_JSON}               users.json
${URL}                    https://jsonplaceholder.typicode.com/posts/1


*** Keywords ***

Get Request Test
      Create Session    petstore     https://petstore.swagger.io/v2 

      ${resp_servrest}=   GET On Session  petstore  /  expected_status=200
      ${resp_json}=     GET On Session  jsonplaceholder  /posts/1

      Should Be Equal As Strings          ${resp_servrest.reason}  OK
      Dictionary Should Contain Value     ${resp_json.json()}  sunt aut facere repellat provident



POST Pet /pet

    ${payload}=      Create Dictionary   
    ...           id=4
    ...           name=Plutão    
    ...           status=Avaliable
  
    
         Create Session    petstore    ${BASE_URL2}
         ${resposta}=      POST On Session    petstore    /user    json=${payload}
         Log To Console        resposta: ${resposta.content}    
         Set Global Variable      ${resposta}



 GET Pet /pet
        Create Session    petstore           ${BASE_URL}
        ${resposta}=    GET On Session       petstore        ${BASE_URL}      
        Should Be Equal As Strings    ${resposta.status_code}    200
        Log To Console    Resposta: ${resposta.text}   
        Set Global Variable    ${resposta}
        


Criar sessão na petstore
     ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=petstore    url=https://petstore.swagger.io/v2  headers=${headers}



Validar Status Code "200"       
             Log    ${resposta.status_code}
             Log    ${resposta.json()}


Validar Code "${statuscode}"    
    ${resposta}=    Create Dictionary    status_code=200    


Validar Status Code     
              Create Session    my_session    ${URL}
    ${resposta}       Get Request   my_session    /
    Log               Status Code: ${resposta.status_code}
    Should Be Equal As Numbers    ${resposta.status_code}    200
    Log               JSON Body: ${resposta.json()}
