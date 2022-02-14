*** Keywords ***
Deletar Carrinho
    [Documentation]             kw utilizada para deletar carrinho.
    
   
    ${header}=                      Create Dictionary
    ...                             content-type=application/json
    ...                             authorization=${TOKEN}
   
    Create Session  carrinhos       ${URL_LOCAL}   
    ${response}=                    DELETE request         carrinhos   /carrinhos/concluir-compra
    ...                             headers=${header}
        
    Log                             ${response}
    Set Test Variable               ${response}