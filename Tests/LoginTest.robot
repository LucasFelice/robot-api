*** Settings ***
Documentation   Teste de Login

Resource    ../baseProject.robot
Resource    ../Resource/Login/baseLogin.robot

Force Tags  @login

*** Test Cases ***
Realizar Login Sucesso
    [Tags]  @regression         
    Realizar Login                      ${EMAIL_CORRETO}                   ${PASSWORD_CORRETO}      
    Should Be Equal As Numbers          ${response.status_code}            200
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_LOGIN_SUCESSO}
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Global Variable                 ${TOKEN}         ${response.json()["authorization"]}
    Log                                 ${TOKEN}       
                                  
Realizar Login credencial email inválido
    # [Tags]  @regression
    Realizar Login                      ${EMAIL_INCORRETO}                 ${PASSWORD_CORRETO}
    Should Be Equal As Numbers          ${response.status_code}            401
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_EMAIL_OU_SENHA_INCORRETOS}           

Realizar Login credencial password invalido
    # [Tags]  @regression
    Realizar Login                      ${EMAIL_CORRETO}                   ${PASSWORD_INCORRETO}      
    Should Be Equal As Numbers          ${response.status_code}            401
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_EMAIL_OU_SENHA_INCORRETOS}    


Realizar Login credenciais inválidas
    [Tags]  @regression 
    Realizar Login                      ${EMAIL_INCORRETO}                 ${PASSWORD_INCORRETO} 
    Should Be Equal As Numbers          ${response.status_code}            401
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_EMAIL_OU_SENHA_INCORRETOS}        


Realizar Login credenciais não preenchidas
    # [Tags]  @regression
    Realizar Login                      ${empty}                           ${empty}        
    Should Be Equal As Numbers          ${response.status_code}            400
    Should Be Equal As Strings          ${response.json()["email"]}        ${MSG_EMAIL_NÃO_PREENCHIDO}  
    Should Be Equal As Strings          ${response.json()["password"]}     ${MSG_SENHA_NÃO_PREENCHIDA}

Realizar Login email inválidas
    # [Tags]  @regression
    Realizar Login                      ${EMAIL_INVALIDO}                 ${PASSWORD_CORRETO}
    Should Be Equal As Numbers          ${response.status_code}           400
    Should Be Equal As Strings          ${response.json()["email"]}       ${MSG_EMAIL_INVALIDO}