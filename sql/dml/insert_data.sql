INSERT INTO clientes (nome, cidade) VALUES
('Ana Silva', 'São Paulo'),
('Bruno Costa', 'Rio de Janeiro'),
('Carlos Souza', 'São Paulo'),
('Mariana Lima', 'Belo Horizonte'),
('João Santos', 'Curitiba');

INSERT INTO produtos (nome_produto, categoria, preco) VALUES
('Notebook', 'Eletrônicos', 3500.00),
('Mouse', 'Acessórios', 120.00),
('Teclado', 'Acessórios', 250.00),
('Monitor', 'Eletrônicos', 1500.00),
('Headset', 'Acessórios', 300.00);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2026-01-10'),
(2, '2026-01-15'),
(1, '2026-02-05'),
(3, '2026-02-20'),
(4, '2026-03-01'),
(5, '2026-03-10');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES

(1, 1, 1),
(1, 2, 2),

(2, 3, 1),
(2, 5, 1),

(3, 4, 1),
(3, 2, 1),

(4, 1, 1),

(5, 5, 2),
(5, 3, 1),

(6, 2, 3);
