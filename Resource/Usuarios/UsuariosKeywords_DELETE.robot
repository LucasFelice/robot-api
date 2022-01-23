*** Keywords ***
Deletar Usuário
    [Documentation]             kw utilizada para deletar usuários.
    
    [Arguments]                 ${_ID}
   
    ${header}=                  Create Dictionary
    ...                         content-type=application/json
   
    Create Session  usuarios    ${URL_LOCAL}   
    ${response}=                DELETE request         usuarios   /usuarios/${_ID}
    ...                         headers=${header}
        
    Log                         ${response}
    Set Test Variable           ${response}