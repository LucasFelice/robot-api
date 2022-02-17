## ROBOT-API

Repositório com exemplo de teste para api utilizando o framework: Robot Framework


## Pré requisitos:
- Instalar Node e NPM (https://nodejs.org/en/)
- Instalar o Visual Studio Code (https://code.visualstudio.com/)

## Frameworks/Linguagem:
- Robot Framework
- Python

## Configuração:
- Robot Framework (v4.1)
- Python (v3.10.1)

## Requerimentos:
- robotframework-requests (v0.6.2)
- robotframework-faker (v21.3.1)

## Instalação:
- Recomenda-se instalar a estrutura do robot em Python via terminal através do camando
(pip install robotframework)

## Como testar:
- Via terminal de comando:
  Rodar de maneira local o servidor "serverest" (npx serverest@latest -p 3000)

  Fornecer o caminho para o arquivo ou diretório de teste. (robot @(TAG desejada) (local do arquivo)/(nome do arquivo).robot)

    Exemplo: robot -d logs -i @carrinhos Tests/CarrinhosTest.robot 

## Suporte:
- @LucasFelice no Github
- lucasfelice92@gmail.com
