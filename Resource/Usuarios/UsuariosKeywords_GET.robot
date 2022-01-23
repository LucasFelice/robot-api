*** Keywords ***
Buscar Todos os Usuários
    [Documentation]             kw utilizada para pesquisar por todos os usuários existentes.
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                GET request         usuarios   /usuarios
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Buscar Usuários por Parâmetros
    [Documentation]             kw utilizada para pesquisar usuários através de parâmetros (ID, nome ou e-mail).

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                GET request         usuarios   /usuarios
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}

Buscar Usuários por ID na URL
    [Documentation]             kw utilizada para pesquisar usuários através do ID inserido na URL.

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                GET request         usuarios   /usuarios/${_ID}
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}