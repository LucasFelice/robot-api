*** Settings ***
Documentation   Teste de Produtos

Resource    ../baseProject.robot
Resource    ../Resource/Commons/commons.robot
Resource    ../Resource/Produtos/baseProdutos.robot

Force Tags  @produtos

Test Setup  Pegar Token


*** Test Cases ***
Cadastrar Produto com Sucesso
    [Tags]  @regression
    Produto Faker
    Criar produtos                      ${PRODUTO.nome}   ${PRODUTO.preco}   ${PRODUTO.descricao}  ${PRODUTO.quantidade}
    Should Be Equal As Numbers          ${response.status_code}                         201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_CADASTRO_SUCESSO}
    Set Global Variable                 ${_ID_PRODUTO}   ${response.json()['_id']}
    Log                                 ${_ID_PRODUTO}

Cadastrar Produto com Nome Existente
       # [Tags]  @regression
    Criar produtos                      ${PRODUTO.nome}  ${PRODUTO.preco}  ${PRODUTO.descricao}  ${PRODUTO.quantidade}
    Should Be Equal As Numbers          ${response.status_code}                         400
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_EXISTENTE} 

Cadastrar Produto com Token Ausente, inválido ou expirado
       # [Tags]  @regression
    Criar produtos sem token            ${PRODUTO.nome}  ${PRODUTO.preco}  ${PRODUTO.descricao}  ${PRODUTO.quantidade}
    Should Be Equal As Numbers          ${response.status_code}                         401
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_NAO_AUTORIZADO}

Buscar todos os Produtos em Estoque
    [Tags]  @regression
    Buscar Todos os Produtos
    Should Be Equal As Numbers          ${response.status_code}                         200        

Buscar Produto por 1 Parâmetro
    # [Tags]  @regression     
    Buscar Produtos por Parâmetros      descricao=${PRODUTO.descricao}                                           
    Should Be Equal As Numbers          ${response.status_code}                         200
    

Buscar Produto por mais de 1 Parâmetro
    # [Tags]  @regression    
    Buscar Produtos por Parâmetros          quantidade=${PRODUTO.quantidade}    _id=${_ID_PRODUTO}                                           
    Should Be Equal As Numbers              ${response.status_code}                     200

Buscar Produto por ID na URL
    [Tags]  @regression    
    Buscar Produtos por ID na URL                                          
    Should Be Equal As Numbers              ${response.status_code}                     200

Baixar Produto do Estoque
    [Tags]  @regression
    Deletar Produto                     ${_ID_PRODUTO}
    Should Be Equal As Numbers          ${response.status_code}                         200
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_EXCLUIDO}