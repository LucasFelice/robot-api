*** Settings ***

Library     RequestsLibrary
Library     FakerLibrary

Resource    Resource/UsuáriosKeywords_POST.robot
Resource    Resource/UsuáriosKeywords_GET.robot
Resource    Resource/UsuáriosKeywords_DELETE.robot
Resource    baseUsuários.robot

Resource    Resource/LoginKeywords.robot
Resource    baseLogin.robot

Resource    Resource/CarrinhosKeywords_POST.robot
Resource    baseCarrinhos.robot

Resource    Resource/ProdutosKeywords_POST.robot
Resource    Resource/ProdutosKeywords_DELETE.robot
Resource    Resource/ProdutosKeywords_GET.robot
Resource    baseProdutos.robot

*** Variables ***
${URL_LOCAL}        http://localhost:3000
${URL_DEV}          http://serverest.dev

${NOME}             Fulano da Silva
${EMAIL}            fulano@qa.com
${PASSWORD}         teste
${_ID}              uqmaBOeWmmViz5bX

${NOMEPRODUTO}      Reserva é o Muuuundoooo!
${PRECO}            250
${DESCRICAO}        T-shirt
${QUANTIDADE}       200
${TOKEN}            Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjQxODU2MzYxLCJleHAiOjE2NDE4NTY5NjF9.mgS39j9wousVsq4hDXWMnRJTzIKFoWdC9cZX44KBbFo
${_ID_PRODUTO}      1xoT1t77yCd5HXdw

${QTD_CARRINHO}     1
${_ID_CARRINHO}     N7yR4sWg4VOKxWpl


*** Keywords ***
Login gerado
    Realizar Login                      ${EMAIL_CORRETO}  ${PASSWORD_CORRETO}
    Should Be Equal As Numbers          ${response.status_code}            200
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_LOGIN_SUCESSO}
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Global Variable                 ${TOKEN}         ${response.json()["authorization"]}
    Log                                 ${TOKEN}