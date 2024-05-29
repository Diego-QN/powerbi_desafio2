# Desafio 2 - Processando e Transformando Dados com Power BI

O presente documento tem como objetivo relatar as transformações feitas na base de dados utilizada para realização do Desafio 2 - Criando um Dashboard corporativo com integração com MySQL e Azure.

No desafio foi solicitado que criasse uma instância na Azure para MySQL que está disponível por algum tempo, enquanto for gratuitona Azure(desafio-projeto-companydio.mysql.database.azure.com).
Eu também fiz os scripts para MySQL e estão anexos no presente repositório.

# Transformação dos Dados

Após a criação do banco e integração com o Power BI foram efetuados os seguintes passos buscando a tranformação e adequação dos mesmo:

1. Os cabeçalhos e tipos de dados foram verificados.

2. Os valores monetários foram modificados para o tipo double preciso.

3. Não havia valores nulos relevantes somente as colunas criadas pelo power BI que foram removidas.

4. Separação as colunas complexas. A coluna complexa address localizada na tabela employee foi dividida, a divisão teve como base o delimitador "-", após a divisão as colunas foram renomeadas para number, street, city e state. No endereço em que o nome da rua é composto Fire Oak, foi necessário fazer alguns ajustes nos nomes e a remoção de uma coluna que continha apenas o estado deste endereço que foi realocado na coluna state.

5. Mescla por consulta entre as tabelas employee e departament para criação de uma nova tabela employee com o nome dos departamentos associados aos colaboradores. A mescla teve como base a tabela employee utilizando os campos Dno e Dnumber como referência. Após a criação da mescla as colunas Dnumber e todas a outras de departament foram excluídas exceto Dname que foi renomeada para Departament.

6. Junção dos colaboradores e respectivos nomes dos gerentes. A junção foi realizada no Power BI e Utilizou-se a tabela employee para criação da mescla de tabelas. A mesma tabela foi utilizada para obter a junção fazendo a ligação de Super_Ssn com Ssn.

7. Junção das colunas de Nome e Sobrenome foram mescladas para ter apenas uma coluna definindo o nome dos colaboradores. Foi utilizada a opção de mesclar colunas com o sperador espaço selecionado, após a mescla a coluna foi renomeada para Name.

8. Mescla por consulta entre as tabelas departament e dept_locations utilizando o campo Dnumber de ambas as tabelas como parâmetro. Foi gerada uma nova tabela renomeada como dept_namelocation. Os campos repetidos e desnecessários foram removidos e realizada uma mescla de colunas entre as colunas Dname e Dlocation. Nesta etapa foi utilizado uma mescla e não uma atribuição porque havia um campo em comum nas duas tabelas envolvidas.

9. Agrupamento das colunas Manager e employee a fim de saber quantos colaboradores existem por gerente.

10. Mescla por consulta entre as tabelas employee e project para criação da tabela project_employee com as informações do número de horas que cada funcionário trabalhou  em algum projeto.

11. O resultado do trabalho está no arquivo relatorio_company_dio.

