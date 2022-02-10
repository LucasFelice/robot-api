*** Keywords ***

Criação de dados fake para usuários
    [Documentation]             kw utilizada para implementação de dados fake

    ${NOMEFAKER}                FakerLibrary.Name
    ${EMAILFAKER}               FakerLibrary.Email
    ${PASSWORDFAKER}            FakerLibrary.Password

    &{USUARIO}                  Create Dictionary
    ...                         nome=${NOMEFAKER}
    ...                         email=${EMAILFAKER}
    ...                         password=${PASSWORDFAKER}

    Log                         ${USUARIO}
    Set Global Variable         ${USUARIO}
    

Cadastrar Usuário
    [Documentation]             kw utilizada para usuários

    [Arguments]                 ${NOME}
    ...                         ${EMAIL}
    ...                         ${PASSWORD}                
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    ${body}=                    Create Dictionary
    ...                         nome=${NOME}
    ...                         email=${EMAIL}
    ...                         password=${PASSWORD}
    ...                         administrador=true

    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                POST request     usuarios   /usuarios
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}

Cadastrar Usuário Credenciais Vazias
    [Documentation]             kw utilizada para realizar cadastro de usuário
    ...                         com credenciais (nome, email ou password) vazias.               
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json

    ${body}=                    Create Dictionary                       
    ...                         administrador=true

    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                POST request     usuarios   /usuarios
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}
        