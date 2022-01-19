*** Settings ***
Documentation   Teste de Produtos

Resource    ../baseProject.robot

*** Test Cases ***
Cadastrar Carrinho com Sucesso
    # [Tags]  @regression
    [Tags]  @carrinhos
    Login gerado
    Criar Carrinho                      ${_ID_PRODUTO}  ${QTD_CARRINHO}                          
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_CARRINHO_CADASTRADO_SUCESSO}
    Set Global Variable                 ${_ID_CARRINHO}   ${response.json()['_id']}
    Log                                 ${_ID_CARRINHO}