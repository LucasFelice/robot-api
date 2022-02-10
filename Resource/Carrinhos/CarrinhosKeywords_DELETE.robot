*** Keywords ***
Deletar Carrinho
    [Documentation]             kw utilizada para deletar carrinho.
    
    # [Arguments]                 ${_ID_CARRINHO}
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json
    ...                             authorization=${TOKEN}
   
    Create Session  carrinhos       ${URL_LOCAL}   
    ${response}=                    DELETE request         carrinhos   /carrinhos
    ...                             headers=${header}
        
    Log                             ${response}
    Set Test Variable               ${response}