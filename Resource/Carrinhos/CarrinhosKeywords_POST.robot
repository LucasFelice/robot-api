*** Keywords ***

Criar Carrinho
    [Documentation]             kw utilizada para cadastrar carrinhos.

    [Arguments]                 ${IDPRODUTO}
    ...                         ${QTD_CARRINHO}
                   
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    ...                         authorization=${TOKEN}

    ${produto}  Create Dictionary
    ...     idProduto=${_ID_PRODUTO}
    ...     quantidade=${QTD_CARRINHO}
    ${produto_list} =  Create List      ${produto}

    ${body}  Create Dictionary
    ...  produtos=${produto_list}

    Create Session  carrinhos   ${URL_LOCAL}   
    ${response}=                POST request     carrinhos   /carrinhos
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}