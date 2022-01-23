*** Keywords ***
Buscar Todos os Produtos
    [Documentation]             kw utilizada para pesquisar por todos os produtos existentes.
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                GET request         produtos   /produtos
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Buscar Produtos por Parâmetros
    [Documentation]             kw utilizada para pesquisar produtos através de parâmetros (ID, nome ou e-mail).

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                GET request         produtos   /produtos
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}

Buscar Produtos por ID na URL
    [Documentation]             kw utilizada para pesquisar produtos através do ID inserido na URL.

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                GET request         produtos   /produtos/${_ID_PRODUTO}
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}