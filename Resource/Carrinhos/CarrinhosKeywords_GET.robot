*** Keywords ***
Buscar Todos os Carrinhos
    [Documentation]             kw utilizada para pesquisar por todos os carrinhos existentes.
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  carrinhos   ${URL_LOCAL}   
    ${response}=                GET request         carrinhos   /carrinhos
    ...                         headers=${header}
    
    Log                         ${response}
    Set Test Variable           ${response}

Buscar Carrinhos por Parâmetros
    [Documentation]             kw utilizada para pesquisar carrinhos através de parâmetros (ID, nome ou e-mail).

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

Buscar Carrinhos por ID na URL
    [Documentation]             kw utilizada para pesquisar carrinhos através do ID inserido na URL.

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                GET request         produtos   /produtos/${_ID_CARRINHO}
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}
