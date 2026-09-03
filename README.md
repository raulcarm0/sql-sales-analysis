# SQL Sales Analysis

Projeto simples de analise de dados de vendas de um e-commerce ficticio usando SQL.
Obs.: Estrutura Python foi desenvolvida junto à uma IA.

## Objetivo
Analisar dados de vendas para responder perguntas como:
- Faturamento total e ticket medio
- Produtos e categorias mais vendidos
- Clientes que mais compram
- Evolucao das vendas mes a mes

## O que foi usado
- Banco de dados usado: SQLITE
- Consultas basicas e intermediarias: GROUP BY, JOINs, CTEs e Window Functions

## Como usar

Diretamente no RDBMS:

1. git clone https://github.com/raulcarm0/sql-sales-analysis.git

2. Abra o seu gerenciador de banco

3. Execute os scripts na seguinte ordem:
   - Criacao das tabelas (schema)
   - Insercao dos dados (seed/data)
   - Consultas analiticas (queries/analysis)
     
## No python:

1. git clone https://github.com/raulcarm0/sql-sales-analysis.git

2. Abra sua IDE (Vscode, netbeans...)

3. Execute os arquivos na seguinte ordem:
   - database.py
   - main.py

## Análise final:

1. Faturamento total : 10.620,00
2. Pode-se notar que alguns produtos apesar de serem comprados em menor quantidade, geram uma receita muito grande como é o caso do notebook.
3. Tivemos clientes com gastos com uma diferença bem notável, onde o primeiro gastou muito e o último relativamente pouco, indicando um público com poder econômico diverso.
4. A categoria de maior faturamente foi de eletrônico indo muito bem de encontro com a alta crescente do mercado em tecnologia;
5. Tivemos entre os meses de janeiro a março, uma igualdade muito forte nas vendas de produtos, 2 vendas para cada mês, onde todos se sairam bem em quantidade mas talvez não em receita.
6. O produto mais vendido foi o mouse, com um total de 6 vendas, um produto de baixo custo, que vende mais que os outros porém gera pouca receita, dependendo bastante do volume para isso.
7. O cliente que mais comprou foi a Ana Silva, com um total de 2 pedidos. 
8. Identificamos que o ticket médio dos pedidos gira em torno de 1700, mas temos alguns dados outliers que inflam esses números.

## Autor
Raul Carmo - github.com/raulcarm0