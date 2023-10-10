Projeto de Automação de Testes em Robot Framework
Este projeto tem como objetivo demonstrar a automação de testes utilizando Robot Framework para o site https://practice.automationtesting.in/shop/. Ele inclui cenários de teste escritos em Gherkin que abordam as seguintes funcionalidades:

Realizar a ordem do produto "Selenium Ruby" com pagamento na entrega.
Ordenar pelo menor preço e garantir que o retorno está correto.
Realizar um comentário de 3 estrelas para o "HTML5 WebApp Development".
Pré-requisitos





Documentação do Projeto de Automação de Testes
Visão Geral
Este projeto de automação de testes utiliza o Robot Framework para testar o site https://practice.automationtesting.in/shop/. Os cenários de teste são escritos em Gherkin, um formato de linguagem natural, e os testes são executados usando a biblioteca SeleniumLibrary do Robot Framework.

Configuração do Ambiente
Para executar os testes deste projeto, você precisará ter o Robot Framework e a SeleniumLibrary instalados em seu ambiente de desenvolvimento. Além disso, é necessário ter um navegador web instalado e configurado para uso com o Selenium.

Estrutura do Projeto
A estrutura do projeto é a seguinte:

markdown
Copy code
- TEST-TRAVELEX/
  - configuration/
        - variables_resource.robot
  - tests/
        - comment_scenario.robot
        - login.robot
        - registration.robot
        - sort_by_lowest_price.robot
        - purchase_with_payment_on_delivery.robot
    - resources/
        - BDDpt-br.robot
        - comment_scenario_resource.robot
        - login_resource.robot
        - registration_resource.robot
        - sort_by_lowest_price_resource.robot
        - purchase_with_payment_on_delivery_resource.robot
    - README.md
tests/: Este diretório contém os testes em Robot Framework.
resources/: Este diretório contém arquivos de recursos, 
configuration/: Este diretório contém arquivos de variáveis de configuração.

Execução dos Testes
Para executar os testes, siga os seguintes passos:

Python  3.10.6
Robot Framework    6.0.2
pip install robotframework robotframework-seleniumlibrary
Você pode instalar o Robot Framework e as bibliotecas necessárias usando o gerenciador de pacotes Python pip.
Clone o repositório do GitHub para o seu ambiente de desenvolvimento.
Abra um terminal na raiz do projeto.
Execute os testes usando o comando robot tests/.
Os resultados dos testes serão exibidos no terminal e também serão gerados relatórios detalhados em HTML para análise.

Sinta-se à vontade para contribuir com melhorias neste projeto. Basta seguir os passos abaixo:

Faça um fork deste repositório.
Crie uma nova branch com sua contribuição: git checkout -b minha-contribuicao
Faça o commit de suas mudanças: git commit -m 'Adicionando nova funcionalidade'
Faça um push para sua branch: git push origin minha-contribuicao
Abra um Pull Request neste repositório.
Autor:
Pablo Moreira - Software Test Engineering

Conclusão
Este projeto de automação de testes em Robot Framework oferece uma estrutura organizada para testar o site https://practice.automationtesting.in/shop/. Os cenários de teste em Gherkin são escritos de forma clara e podem ser facilmente estendidos para cobrir mais funcionalidades do site, se necessário. Certifique-se de manter o projeto e a documentação atualizados à medida que novos cenários de teste são adicionados ou o site é alterado.