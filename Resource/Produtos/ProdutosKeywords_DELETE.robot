*** Keywords ***
Deletar Produto
    [Documentation]             kw utilizada para deletar produtos.
    
    [Arguments]                 ${_ID_PRODUTO}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
    ...                         authorization=${TOKEN}
   
    Create Session  produtos    ${URL_LOCAL}   
    ${response}=                DELETE request         produtos   /produtos/${_ID_PRODUTO}
    ...                         headers=${header}
        
    Log                         ${response}
    Set Test Variable           ${response}