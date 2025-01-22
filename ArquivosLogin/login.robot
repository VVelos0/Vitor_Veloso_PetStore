*** Settings ***
Library        RequestsLibrary
Library        String
Library        JSONLibrary
Library        Collections
Resource      ../ArquivosLogin/Caso_De_Teste.robot



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

Criar novo usuario
    ${random}=    Generate Random String    length=4    chars=[LETTERS]
    ${random}=    Convert To Lower Case    ${random}
    Set Test Variable    ${nome_de_usuario}    ${random}paulo_ferreira
    Log    Nome de usuário gerado: ${nome_de_usuario}

Get User /usuarios
        Create Session    petstore           ${BASE_URL}
        ${resposta}=    GET On Session       petstore        ${BASE_URL}      
        Should Be Equal As Strings    ${resposta.status_code}    200
        Log To Console    Resposta: ${resposta.text}   
        Set Global Variable    ${resposta}




POST User /usuarios
    ${payload}=      Create Dictionary   
    ...           id=4
    ...           username=Hype
    ...           firstName=Juninho
    ...           lastName=Silva
    ...           email=showwww@gmail.com
    ...           password=show123
    ...           phone=2122223754    
    ...           userStatus=0
  
    
         Create Session    petstore    ${BASE_URL2}
        ${resposta}=      POST On Session    petstore    /user    json=${payload}
         Log To Console        resposta: ${resposta.content}    
         Set Global Variable      ${resposta}



 PUT User /usuarios
         ${payload}=      Create Dictionary   
    ...           id=5
    ...           username=Hype
    ...           firstName=Juninho
    ...           lastName=Silva
    ...           email=showwwwwww@gmail.com
    ...           password=show123333
    ...           phone=2122223754    
    ...           userStatus=0
  
    
         Create Session    petstore    ${BASE_URL2}
        ${resposta}=      PUT On Session    petstore    /user    json=${payload}
         Log To Console        resposta: ${resposta.content}    
         Set Global Variable      ${resposta}
 



 DELETE User /usuarios
       Create Session    petstore    ${BASE_URL2}
         ${resposta}    DELETE On Session       petstore         /user  
         Log To Console        resposta: ${resposta.content}    
          Set Global Variable      ${resposta}

    



Criar sessão na petstore
     ${headers}=    Create Dictionary    Accept=application/json    Content-Type=application/json
    Create Session    alias=petstore    url=https://petstore.swagger.io/v2  headers=${headers}


Validar Status Code "200"       
             Log    ${resposta.status_code}
             Log    ${resposta.json()}


Validar Status Code "400"       
             Log    ${resposta.status_code}
             Log    ${resposta.json()}




Validar Code "${statuscode}"    
    ${resposta}=    Create Dictionary    status_code=200    


Validar Code 400 "${statuscode}"    
    ${resposta}=    Create Dictionary    status_code=400  





Validar Status Code     
              Create Session    my_session    ${URL}
    ${resposta}       Get Request   my_session    /
    Log               Status Code: ${resposta.status_code}
    Should Be Equal As Numbers    ${resposta.status_code}    200
    Log               JSON Body: ${resposta.json()}


Validar Status Code "400"    
              Create Session    my_session    ${URL}
    ${resposta}       Get Request   my_session    /
    Log               Status Code: ${resposta.status_code}
    Should Be Equal As Numbers    ${resposta.status_code}    400
    Log               JSON Body: ${resposta.json()}


Validar Status Code "${StatusCode}"
    Should Be True  ${resposta.status_code} == ${StatusCode}


      

      






