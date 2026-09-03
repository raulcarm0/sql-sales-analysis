-- 1. Qual foi o faturamento total da empresa?
-- Objetivo: Identificar faturamento bruto de todas as vendas efetuadas.
select sum(itens_pedido.quantidade * produtos.preco) as faturamento_total from itens_pedido inner join produtos on itens_pedido.id_produto = produtos.id_produto;
-- 2. Quais produtos geraram mais receita?
-- Objetivo: Mapear os produtos "curva A" (maior impacto financeiro) para gestão de estoque.
select produtos.nome_produto as produto, sum(itens_pedido.quantidade) as qtd_vendido, sum(itens_pedido.quantidade * produtos.preco) as receita from itens_pedido inner join produtos on itens_pedido.id_produto = produtos.id_produto group by 1 order by 3 desc limit 3;
-- 3. Quais clientes mais gastaram?
-- Objetivo: Identificar os clientes mais valiosos para ações de fidelização.
select pedidos.id_cliente as cliente, sum(itens_pedido.quantidade * produtos.preco) as gasto_total from pedidos inner join itens_pedido on pedidos.id_pedido = itens_pedido.id_pedido inner join produtos on itens_pedido.id_produto = produtos.id_produto group by 1 order by 2 desc; 
-- 4. Qual categoria teve maior faturamento?
-- Objetivo: Analisar o desempenho de vendas agrupado por segmento de produto.
select produtos.categoria, sum(itens_pedido.quantidade * produtos.preco) as faturamento from produtos inner join itens_pedido on itens_pedido.id_produto = produtos.id_produto inner join pedidos on pedidos.id_pedido = itens_pedido.id_pedido group by 1 order by 2 desc;
-- 5. Como o volume das vendas evoluíram mensalmente?
-- Objetivo: Identificar sazonalidade e os meses de maior/menor movimento de pedidos.
select strftime('%m',data_pedido) as mes, count(*) as vendas_totais from pedidos group by strftime('%m',data_pedido) order by 2 asc; 
-- 6. Qual foi o produto mais vendido?
-- Objetivo: Identificar produtos que tendem atrair mais o público para investir em novos estoques.
select produtos.nome_produto as produto, sum(itens_pedido.quantidade) as quantidade from produtos inner join itens_pedido on produtos.id_produto = itens_pedido.id_produto group by 1 order by 2 desc limit 1;
-- 7. Qual cliente realizou mais pedidos?
-- Objetivo: Mapear o cliente que faz mais pedidos para poder fidelizá-lo.
select clientes.nome, count(pedidos.id_pedido) as quantidade_pedidos from clientes inner join pedidos on clientes.id_cliente = pedidos.id_cliente group by 1 order by 2 desc limit 1;
-- 8. Qual é o ticket médio dos pedidos?
-- Objetivo: Entender a faixa de valor gasto.
select avg(total_pedido) as ticket_medio from (select pedidos.id_pedido, sum(quantidade*preco) as total_pedido from pedidos inner join itens_pedido on pedidos.id_pedido = itens_pedido.id_pedido inner join produtos on itens_pedido.id_produto = produtos.id_produto group by 1) as pedidos_totais;



--1 Faturamento total : 21240
--2 Pode-se notar que alguns produtos apesar de serem comprados em menor quantidade, geram uma receita muito grande como é o caso do notebook.
--3 Tivemos clientes com gastos com uma diferença bem notável, onde o primeiro gastou muito e o último relativamente pouco, indicando um público com poder econômico diverso.
--4 A categoria de maior faturamente foi de eletrônico indo muito bem de encontro com a alta crescente do mercado em tecnologia;
--5 Tivemos entre os meses de janeiro a março, uma igualdade muito forte nas vendas de produtos, onde todos se sairam bem em quantidade mas talvez não em receita.
--6 O produto mais vendido foi o mouse, com um total de 12 vendas, um produto de baixo custo, que vende mais que os outros porém gera pouca receita, dependendo bastante do volume para isso.
--7 O cliente que mais comprou foi a Ana Silva, com um total de 4 pedidos. 
--8 Identificamos que o ticket médio dos pedidos gira em torno de 3000, mas temos alguns dados outliers que inflam esses números.