*** Settings ***
Documentation   Teste de Produtos

Resource    ../baseProject.robot
Resource    ../Resource/Commons/commons.robot
Resource    ../Resource/Carrinhos/baseCarrinhos.robot
Resource    ../Resource/Produtos/baseProdutos.robot

Force Tags  @carrinhos

Test Setup  Pegar Token

*** Test Cases ***
Cadastrar Carrinho com Sucesso
    [Tags]  @regression
    Pegar ID do Produto
    Criar Carrinho                      ${_ID_PRODUTO}                      1                          
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_CARRINHO_CADASTRADO_SUCESSO}
    Set Global Variable                 ${_ID_CARRINHO}   ${response.json()['_id']}
    Log                                 ${_ID_CARRINHO}

Buscar todos os Carrinhos em Estoque
    [Tags]  @regression
    Buscar Todos os Carrinhos
    Should Be Equal As Numbers          ${response.status_code}                      200       

Buscar Carrinho por ID na URL
    # [Tags]  @regression   
    Buscar Carrinho por ID na URL                                          
    Should Be Equal As Numbers           ${response.status_code}                     200

Finalizar Compra
    [Tags]  @regression
    Deletar Carrinho                       
    Should Be Equal As Numbers           ${response.status_code}                     200
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_CARRINHO_EXCLUIDO_SUCESSO}