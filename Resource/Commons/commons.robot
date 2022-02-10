*** Keywords ***
Pegar Token
    Realizar Login                      ${EMAIL_CORRETO}  ${PASSWORD_CORRETO}
    Should Be Equal As Numbers          ${response.status_code}            200
    Should Be Equal As Strings          ${response.json()["message"]}      ${MSG_LOGIN_SUCESSO}
    Should Not Be Empty                 ${response.json()["authorization"]}
    Set Global Variable                 ${TOKEN}         ${response.json()["authorization"]}
    Log                                 ${TOKEN}


Produto Faker
    [Documentation]             kw utilizada para implementação de dados faker

    ${PRODUTOFAKER}             FakerLibrary.Word
    ${SUFIXOFAKER}              FakerLibrary.Company
    ${PRECOFAKER}               FakerLibrary.Building Number
    
    &{PRODUTO}                  Create Dictionary
    ...                         nome=${PRODUTOFAKER}${SUFIXOFAKER}
    ...                         preco=${PRECOFAKER}
    ...                         descricao=NFT
    ...                         quantidade=1

    Log                         ${PRODUTO}
    Set Global Variable         ${PRODUTO}

Pegar ID do Produto
    Produto Faker
    Criar produtos                      ${PRODUTO.nome}   ${PRODUTO.preco}   ${PRODUTO.descricao}  ${PRODUTO.quantidade}
    Should Be Equal As Numbers          ${response.status_code}             201
    Should Be Equal As Strings          ${response.json()["message"]}       ${MSG_PROD_CADASTRO_SUCESSO}
    Set Global Variable                 ${_ID_PRODUTO}   ${response.json()['_id']}
    Log                                 ${_ID_PRODUTO}


    