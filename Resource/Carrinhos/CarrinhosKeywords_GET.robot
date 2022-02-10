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

Buscar Carrinho por ID na URL
    [Documentation]             kw utilizada para pesquisar carrinhos através do ID inserido na URL.

    [Arguments]                 ${PARAMS}=${EMPTY}
    ...                         ${ANOTHER_PARAMS}=${EMPTY}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  carrinhos    ${URL_LOCAL}   
    ${response}=                GET request         carrinhos   /carrinhos/${_ID_CARRINHO}
    ...                         headers=${header}
    ...                         params=${PARAMS}&${ANOTHER_PARAMS}
    
    Log                         ${response}
    Set Test Variable           ${response}
