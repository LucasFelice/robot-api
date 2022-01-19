*** Keywords ***
    
Realizar Login
    [Documentation]         kw utilizada para login

    [Arguments]             ${EMAIL}
    ...                     ${PASSWORD}
          
    
    ${header}=              Create Dictionary
    ...                     content-type=application/json

    ${body}=                Create Dictionary
    ...                     email=${EMAIL}
    ...                     password=${PASSWORD}

    Create Session  login   ${URL_LOCAL}
    ${response}=            POST request         login   /login
    ...                     headers=${header}
    ...                     json=${body}
    
    Log                     ${response}
    Set Test Variable       ${response}
    
