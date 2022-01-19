*** Settings ***
Documentation   Teste de Produtos

Resource    ../baseProject.robot

*** Test Cases ***
Cadastrar Produto com Sucesso
    # [Tags]  @regression
    [Tags]  @produtos
    Login gerado
    Criar produtos                      ${NOMEPRODUTO}  ${PRECO}  ${DESCRICAO}  ${QUANTIDADE}
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_CADASTRO_SUCESSO}
    Set Global Variable                 ${_ID_PRODUTO}   ${response.json()['_id']}
    Log                                 ${_ID_PRODUTO}

Cadastrar Produto com Nome Existente
       # [Tags]  @regression
    [Tags]  @produtos
    Login gerado
    Criar produtos                      ${NOMEPRODUTO}  ${PRECO}  ${DESCRICAO}  ${QUANTIDADE}
    Should Be Equal As Numbers          ${response.status_code}             400
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_EXISTENTE} 

Cadastrar Produto com Token Ausente, inválido ou expirado
       # [Tags]  @regression
    [Tags]  @produtos
    Criar produtos sem token            ${NOMEPRODUTO}  ${PRECO}  ${DESCRICAO}  ${QUANTIDADE}
    Should Be Equal As Numbers          ${response.status_code}             401
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_NAO_AUTORIZADO}

Buscar todos os Produtos em Estoque
   # [Tags]  @regression
    [Tags]  @produtos
    Buscar Todos os Produtos
    Should Be Equal As Numbers          ${response.status_code}             200        

Buscar Produto por 1 Parâmetro
    # [Tags]  @regression
    [Tags]  @produtos
        
    Buscar Produtos por Parâmetros      descricao=${DESCRICAO}                                           
    Should Be Equal As Numbers          ${response.status_code}                     200
    Should Be Equal As Strings          ${response.json()["produtos"]["nome"]}       ${NOMEPRODUTO}

Buscar Produto por mais de 1 Parâmetro
    # [Tags]  @regression
    [Tags]  @produtos
        
    Buscar Produtos por Parâmetros          quantidade=${QUANTIDADE}    _id=${_ID_PRODUTO}                                           
    Should Be Equal As Numbers              ${response.status_code}                     200

Buscar Produto por ID na URL
    # [Tags]  @regression
    [Tags]  @produtos
        
    Buscar Produtos por ID na URL                                          
    Should Be Equal As Numbers              ${response.status_code}                     200

Baixar Produto do Estoque
   # [Tags]  @regression
    [Tags]  @produtos
    Deletar Produto                     ${_ID_PRODUTO}
    Should Be Equal As Numbers          ${response.status_code}             200
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_EXCLUIDO}