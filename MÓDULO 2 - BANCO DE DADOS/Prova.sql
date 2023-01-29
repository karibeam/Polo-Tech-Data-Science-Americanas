-- PROVA
-- BANCO DE DADOS: PIZZARIA

-- 1) CRIAÇÃO DAS TABELAS
-- RODE OS CODIGOS ABAIXO PARA A CRIAÇÃO DAS TABELAS

CREATE TABLE menu_pizzas(
	pizza_id integer PRIMARY KEY,
	nome_produto varchar(40),
	tipo_produto varchar(40),
	preco numeric(6,2));

CREATE TABLE ref_entregador(
	entregador_id integer PRIMARY KEY,
	nome_entregador varchar(40));

CREATE TABLE ref_pagamento(
	pagamento_id integer PRIMARY KEY,
	forma_pagamento varchar(40));

CREATE TABLE entrega(
	entrega_id integer,
	pizza_id integer REFERENCES "menu_pizzas" (pizza_id),
	quantidade integer);

CREATE TABLE pagamento(
	entrega_id integer,
	pagamento_id integer REFERENCES "ref_pagamento" (pagamento_id));

CREATE TABLE entregador(
	entrega_id integer,
	entregador_id integer REFERENCES "ref_entregador" (entregador_id));


-- 2) INSERT DAS TABELAS
-- RODO OS INSERTS PARA PREENCHER AS TABELAS

INSERT INTO menu_pizzas (pizza_id, nome_produto, tipo_produto, preco)
	VALUES  (1,'Margherita','Salgadas',89.10),
			(2,'Calabresa','Salgadas',84.50),
			(3,'Frango com Catupiry','Salgadas',99.20),
			(4,'Portuguesa','Salgadas',98.30),
			(5,'Pepperoni','Salgadas',99.10),
			(6,'4 Queijos','Salgadas',90.20),
			(7,'Prestígio','Doces',79.70),
			(8,'M&Ms com Nutella','Doces',99.80),
			(9,'Romeu e Julieta','Doces',79.60),
			(10,'Cola','Refrigerantes',8.90),
			(11,'Limão','Refrigerantes',10.90);
		
		
INSERT INTO ref_entregador (entregador_id, nome_entregador)
	VALUES  (1,'Robson'),
			(2,'Julio'),
			(3,'Gabriela');
		

INSERT INTO ref_pagamento (pagamento_id, forma_pagamento)
	VALUES (1,'App'),
           (2,'Na Entrega');
          
          
INSERT INTO entrega (entrega_id, pizza_id, quantidade)
	VALUES  (1,6,2),
			(1,10,2),
			(2,4,1),
			(2,7,2),
			(2,11,1),
			(3,5,2),
			(3,1,2),
			(3,9,2),
			(3,10,1),
			(4,6,2),
			(4,4,1),
			(4,7,2),
			(5,2,1),
			(5,11,1),
			(6,5,2),
			(6,6,1),
			(6,9,2),
			(6,10,2),
			(7,5,1),
			(7,2,1),
			(7,7,2),
			(7,10,2),
			(8,1,2),
			(8,8,2),
			(8,11,1),
			(9,2,1),
			(9,7,2),
			(10,4,2),
			(10,1,1),
			(10,8,1),
			(10,11,1),
			(11,6,2),
			(11,7,1),
			(12,6,2),
			(12,3,2),
			(12,10,2),
			(13,4,2),
			(13,11,1),
			(14,1,1),
			(14,2,2),
			(14,11,1),
			(15,6,2),
			(15,11,2),
			(16,4,1),
			(16,3,1),
			(16,7,1),
			(16,11,2),
			(17,4,2),
			(17,6,2),
			(17,10,1),
			(18,7,1),
			(18,10,2),
			(19,1,2),
			(19,5,1),
			(19,7,2),
			(20,3,1),
			(20,10,1),
			(21,5,2),
			(21,3,1),
			(21,10,1),
			(22,2,2),
			(22,6,2),
			(22,4,1),
			(22,8,1),
			(23,8,2),
			(23,7,2),
			(24,5,2),
			(24,8,1),
			(24,10,1),
			(25,1,1),
			(25,10,2),
			(26,4,2),
			(26,7,1),
			(26,10,2),
			(27,5,1),
			(27,11,2),
			(28,6,2),
			(28,4,2),
			(28,10,1),
			(29,4,1),
			(29,10,1),
			(30,4,2),
			(30,6,2),
			(30,8,1),
			(30,11,1),
			(31,3,2),
			(31,11,1),
			(32,1,1),
			(32,9,2),
			(32,11,2),
			(33,3,2),
			(33,10,1),
			(34,5,2),
			(34,7,1),
			(34,11,1),
			(35,1,2),
			(35,10,1),
			(36,5,2),
			(36,2,1),
			(36,10,2),
			(37,4,1),
			(37,6,2),
			(37,2,2),
			(37,8,2),
			(38,3,1),
			(38,10,1),
			(39,4,1),
			(39,8,1),
			(39,11,2),
			(40,6,1),
			(40,9,2),
			(41,5,1),
			(41,4,1),
			(41,6,2),
			(42,7,1),
			(42,9,1),
			(43,1,2),
			(43,7,2),
			(43,11,2),
			(44,7,2),
			(44,10,2),
			(45,1,2),
			(45,4,2),
			(45,3,1),
			(45,10,2),
			(46,3,2),
			(46,9,1),
			(47,6,2),
			(47,9,2),
			(47,10,2);
		
		
INSERT INTO pagamento (entrega_id, pagamento_id)
	VALUES  (1,1),
			(2,2),
			(3,1),
			(4,2),
			(5,1),
			(6,2),
			(7,1),
			(8,1),
			(9,1),
			(10,2),
			(11,1),
			(12,2),
			(13,1),
			(14,1),
			(15,2),
			(16,2),
			(17,2),
			(18,1),
			(19,1),
			(20,1),
			(21,1),
			(22,1),
			(23,1),
			(24,1),
			(25,1),
			(26,1),
			(27,1),
			(28,1),
			(29,1),
			(30,1),
			(31,1),
			(32,2),
			(33,1),
			(34,2),
			(35,2),
			(36,1),
			(37,2),
			(38,2),
			(39,2),
			(40,2),
			(41,1),
			(42,2),
			(43,1),
			(44,2),
			(45,1),
			(46,2),
			(47,2);
		
		
INSERT INTO entregador (entrega_id, entregador_id)
	VALUES  (1,1),
			(2,1),
			(3,1),
			(4,3),
			(5,1),
			(6,2),
			(7,2),
			(8,3),
			(9,1),
			(10,1),
			(11,2),
			(12,3),
			(13,2),
			(14,2),
			(15,1),
			(16,2),
			(17,2),
			(18,1),
			(19,2),
			(20,2),
			(21,2),
			(22,3),
			(23,3),
			(24,2),
			(25,1),
			(26,2),
			(27,1),
			(28,2),
			(29,3),
			(30,2),
			(31,3),
			(32,2),
			(33,1),
			(34,2),
			(35,1),
			(36,1),
			(37,2),
			(38,3),
			(39,3),
			(40,3),
			(41,1),
			(42,2),
			(43,2),
			(44,2),
			(45,3),
			(46,2),
			(47,3);


-- 3) Quantos pedidos teve cada um dos tipos de produto (salgadas, doces e refrigerantes)?

SELECT
	M.tipo_produto,
	count(DISTINCT(D.entrega_id)) AS total_entregas
FROM entrega D
LEFT JOIN menu_pizzas M ON M.pizza_id = D.pizza_id
GROUP BY 1
ORDER BY 1;


-- 4) Monte uma tabela com o total gasto em cada um dos pedidos --------CHECK


SELECT
	D.entrega_id,
	sum(M.preco*D.quantidade) AS total
FROM entrega D
LEFT JOIN menu_pizzas M ON M.pizza_id = D.pizza_id
GROUP BY 1
ORDER BY 1;



-- 5) Monte uma tabela com ranqueamento dos produtos mais vendidos em valor (utilize os nomes!)----------CHECK

SELECT
	M.nome_produto,
	sum(M.preco*D.quantidade) AS total
FROM menu_pizzas M
LEFT JOIN entrega D ON D.pizza_id = M.pizza_id
GROUP BY 1
ORDER BY 2 DESC;


-- 6) Quanto foi arrecadado em cada tipo de pagamento em valor (App e na entrega)?

SELECT 
	P.forma_pagamento,
	sum(D.quantidade * M.preco) AS valor_total
FROM entrega D
LEFT JOIN menu_pizzas M ON M.pizza_id = D.pizza_id 
LEFT JOIN pagamento A ON A.entrega_id = D.entrega_id 
LEFT JOIN ref_pagamento P ON P.pagamento_id = A.pagamento_id 
GROUP BY 1
ORDER BY 2 DESC;
	

-- 7) Monte uma tabela com o nome dos entregadores(as) e a quantidade de pedidos
-- entregues por cada um ---------SOMA 47 PEDIDOS TEM QUE SER MENOR QUE ISSO!!!!!!

SELECT
	E.nome_entregador,
	count(DISTINCT (D.entrega_id)) AS total_entregas
FROM entrega D
LEFT JOIN entregador N ON N.entrega_id = D.entrega_id
LEFT JOIN ref_entregador E ON E.entregador_id = N.entregador_id
GROUP BY 1
ORDER BY 2;


-- 8) Quais são as principais pizzas salgadas vendidas pelo App em quantdade?
-- Monte uma tabela com o ranqueamento delas pela quantidade

SELECT
	M.nome_produto,
	SUM(D.quantidade) AS t_salgadas 
FROM entrega D
LEFT JOIN menu_pizzas M ON M.pizza_id = D.pizza_id 
LEFT JOIN pagamento A ON A.entrega_id = D.entrega_id 
LEFT JOIN ref_pagamento P ON P.pagamento_id = A.pagamento_id 
WHERE M.tipo_produto = 'Salgadas' AND P.forma_pagamento = 'App'
GROUP BY 1
ORDER BY 2 DESC;



-- 9) Quantos pedidos teve em cada forma de pagamento (pelo App e na entrega)?
-------------------------- 47------

SELECT 
	P.forma_pagamento,
	count(DISTINCT D.entrega_id) AS total_pedidos
FROM entrega D
LEFT JOIN pagamento A ON A.entrega_id = D.entrega_id 
LEFT JOIN ref_pagamento P ON P.pagamento_id = A.pagamento_id 
GROUP BY 1
ORDER BY 2 DESC;



-- 10) Monte uma tabela de comissão para os entregadores, onde as colunas serão
-- nome do entregador, forma de pagamento e comissão (que será paga ao entregador)
-- Regra da comissão: pagamento pelo App: 10% comissão, na entrega: 5% comissão
-- ARREDONDE PARA DUAS CASAS DECIMAIS
-------6 linhas 3 entregadores

SELECT 
	E.nome_entregador,
	P.forma_pagamento,
	round(sum(CASE WHEN P.forma_pagamento = 'App' THEN D.quantidade * (M.preco*10/100) ELSE D.quantidade * (M.preco*5/100) END),2) AS comissao_entrega
FROM entrega D
LEFT JOIN menu_pizzas M ON M.pizza_id = D.pizza_id 
LEFT JOIN entregador N ON N.entrega_id = D.entrega_id 
LEFT JOIN ref_entregador E ON E.entregador_id = N.entregador_id 
LEFT JOIN pagamento A ON A.entrega_id = D.entrega_id 
LEFT JOIN ref_pagamento P ON P.pagamento_id = A.pagamento_id 
GROUP BY 1,2
ORDER BY 1;


