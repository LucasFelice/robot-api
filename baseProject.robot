*** Settings ***

Library     RequestsLibrary
Library     FakerLibrary

Resource    Resource/Usuarios/UsuariosKeywords_POST.robot
Resource    Resource/Usuarios/UsuariosKeywords_GET.robot
Resource    Resource/Usuarios/UsuariosKeywords_DELETE.robot

Resource    Resource/Login/LoginKeywords.robot
Resource    Resource/Login/baseLogin.robot

Resource    Resource/Carrinhos/CarrinhosKeywords_POST.robot
Resource    Resource/Carrinhos/CarrinhosKeywords_GET.robot
Resource    Resource/Carrinhos/CarrinhosKeywords_DELETE.robot

Resource    Resource/Produtos/ProdutosKeywords_POST.robot
Resource    Resource/Produtos/ProdutosKeywords_DELETE.robot
Resource    Resource/Produtos/ProdutosKeywords_GET.robot

*** Variables ***
${URL_LOCAL}        http://localhost:3000
${URL_DEV}          http://serverest.dev

${NOME}             Fulano da Silva
${EMAIL}            fulano@qa.com
${PASSWORD}         teste
${_ID}              uqmaBOeWmmViz5bX

${_ID_CARRINHO}     N7yR4sWg4VOKxWpl