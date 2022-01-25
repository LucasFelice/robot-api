*** Keywords ***

Criar Carrinho
    [Documentation]             kw utilizada para cadastrar carrinhos.

    [Arguments]                 ${IDPRODUTO}
    ...                         ${QTD_CARRINHO}
                   
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    ...                         authorization=${TOKEN}

    ${body}=                    Create List
    ...                         idproduto=${_ID_PRODUTO}
    ...                         quantidade=${QTD_PRODUTO}

    Create Session  carrinhos   ${URL_LOCAL}   
    ${response}=                POST request     carrinhos   /carrinhos
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}