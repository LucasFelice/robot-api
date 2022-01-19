*** Settings ***
Documentation   Teste de Usuários
Resource    ../baseProject.robot

*** Test Cases ***
Cadastrar Usuário com Sucesso
    # [Tags]  @regression
    [Tags]  @usuarios
       
    Criação de dados fake para usuários  
    Cadastrar Usuário                       ${USUARIO.nome}   ${USUARIO.email}  ${USUARIO.password}
    Should Be Equal As Numbers              ${response.status_code}             201
    Should Be Equal As Strings              ${response.json()["message"]}       ${MSG_CADASTRO_SUCESSO}
    Set Global Variable                     ${_ID}   ${response.json()['_id']}
    Log                                     ${_ID}
    
Cadastrar Usuário credencial Email Existente
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Cadastrar Usuário                       ${USUARIO.nome}  ${USUARIO.email}  ${USUARIO.password}
    Should Be Equal As Numbers              ${response.status_code}            400
    Should Be Equal As Strings              ${response.json()["message"]}      ${MSG_CADASTRO_EMAIL_EXISTENTE}

Cadastrar Usuário Credenciais não Preenchidas
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Cadastrar Usuário                       ${EMPTY}        ${EMPTY}            ${EMPTY}                       
    Should Be Equal As Numbers              ${response.status_code}             400
    Should Be Equal As Strings              ${response.json()["nome"]}          ${MSG_NOME_EM_BRANCO}
    Should Be Equal As Strings              ${response.json()["email"]}         ${MSG_EMAIL_EM_BRANCO}
    Should Be Equal As Strings              ${response.json()["password"]}      ${MSG_SENHA_EM_BRANCO}

Cadastrar Usuário Credenciais vazias
    # [Tags]  @regression
    [Tags]  @usuarios

    Cadastrar Usuário Credenciais Vazias  
    Should Be Equal As Numbers              ${response.status_code}             400
    Should Be Equal As Strings              ${response.json()["nome"]}          ${MSG_NOME_OBRIGATÓRIO}
    Should Be Equal As Strings              ${response.json()["email"]}         ${MSG_EMAIL_OBRIGATÓRIO}
    Should Be Equal As Strings              ${response.json()["password"]}      ${MSG_SENHA_OBRIGATÓRIO}

Cadastrar Usuário Credencial Email Inválido
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Cadastrar Usuário                       ${NOME}        ${EMAIL_INVALIDO}            ${PASSWORD}                       
    Should Be Equal As Numbers              ${response.status_code}                     400
    Should Be Equal As Strings              ${response.json()["email"]}                 ${MSG_EMAIL_INVÁLIDO}

Buscar Todos os Usuários
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Buscar Todos os Usuários                                       
    Should Be Equal As Numbers              ${response.status_code}                     200

Buscar Usuário por 1 Parâmetro
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Buscar Usuários por Parâmetros          nome=${NOME}                                           
    Should Be Equal As Numbers              ${response.status_code}                     200

Buscar Usuário por mais de 1 Parâmetro
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Buscar Usuários por Parâmetros          nome=${NOME}    _id=${_ID}                                           
    Should Be Equal As Numbers              ${response.status_code}                     200

Buscar Usuário por ID na URL
    # [Tags]  @regression
    [Tags]  @usuarios
        
    Buscar Usuários por ID na URL                                          
    Should Be Equal As Numbers              ${response.status_code}                     200

Deletar Usuário
     # [Tags]  @regression
    [Tags]  @usuarios
        
    Deletar Usuário                         ${_ID}                                          
    Should Be Equal As Numbers              ${response.status_code}                     200
    Should Be Equal As Strings              ${response.json()["message"]}               ${MSG_USUARIO_EXCLUÍDO}