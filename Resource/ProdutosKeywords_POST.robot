*** Keywords ***

Criar produtos
    [Documentation]             kw utilizada para cadastrar produtos.

    [Arguments]                 ${NOMEPRODUTO}
    ...                         ${PRECO}
    ...                         ${DESCRICAO}
    ...                         ${QUANTIDADE}                
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    ...                         authorization=${TOKEN}

    ${body}=                    Create Dictionary
    ...                         nome=${NOMEPRODUTO}
    ...                         preco=${PRECO}
    ...                         descricao=${DESCRICAO}
    ...                         quantidade=${QUANTIDADE}

    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                POST request     produtos   /produtos
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}

Criar produtos sem token
    [Documentation]             kw utilizada para cadastrar produtos.

    [Arguments]                 ${NOMEPRODUTO}
    ...                         ${PRECO}
    ...                         ${DESCRICAO}
    ...                         ${QUANTIDADE}                
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    
    ${body}=                    Create Dictionary
    ...                         nome=${NOMEPRODUTO}
    ...                         preco=${PRECO}
    ...                         descricao=${DESCRICAO}
    ...                         quantidade=${QUANTIDADE}

    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                POST request     produtos   /produtos
    ...                         headers=${header}
    ...                         json=${body}
    
    Log                         ${response}
    Set Test Variable           ${response}    