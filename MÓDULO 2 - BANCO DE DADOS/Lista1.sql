
--Criar uma tabela nomeada como vendas e nessa tabela deve conter
--	pedido_id integer
--	produto_id integer
--	nome_produto
--	quantidade integer
--	valor_unidade numeric

CREATE TABLE vendas(
	pedido_id integer,
	produto_id integer,
	nome_produto varchar (40),
	quantidade integer,
	valor_unidade NUMERIC 
	);

INSERT INTO vendas VALUES
	(1,1,'Arroz',1,22.50),
	(1,2,'FeijÃ£o',1,8.90),
	(1,3,'Ã“leo',2,7.50),
	(1,4,'Sal',1,4.20),
	(1,5,'MacarrÃ£o',2,4.50),
	(2,6,'Cerveja',36,2.5),
	(2,7,'Refrigerante',4,9.80),
	(2,8,'Carne',2,45.00),
	(2,9,'LinguiÃ§a',2,15.80),
	(3,1,'Arroz',1,22.50),
	(3,2,'FeijÃ£o',1,8.90),
	(3,5,'MacarrÃ£o',4,4.50),
	(3,10,'Molho',6,2.20),
	(3,7,'Refrigerante',2,9.80),
	(3,11,'Leite',12,4.60),
	(4,11,'Leite',6,4.60),
	(4,12,'Fralda',1,62.50),
	(4,7,'Refrigerante',2,9.80),
	(4,13,'Sorvete',1,25.50),
	(4,5,'MacarrÃ£o',1,4.50),
	(5,1,'Arroz',2,22.50),
	(5,2,'FeijÃ£o',2,8.90),
	(5,4,'Sal',1,4.20),
	(5,14,'AÃ§Ãºcar',1,3.90),
	(5,15,'CafÃ©',2,8.90),
	(5,11,'Leite',12,4.60),
	(5,16,'Bolacha',4,2.40),
	(6,17,'Morango',1,6.20),
	(6,18,'Banana',1,4.99),
	(6,11,'Leite',4,4.60),
	(6,14,'AÃ§Ãºcar',1,3.90),
	(6,1,'Arroz',1,22.50),
	(6,2,'FeijÃ£o',1,8.90),
	(7,19,'Lasanha',1,8.70),
	(7,10,'Molho',4,2.20),
	(7,20,'Presunto',3,8.70),
	(7,21,'Mussarela',3,7.30),
	(7,7,'Refrigerante',1,9.80),
	(7,13,'Sorvete',1,25.50),
	(8,5,'MacarrÃ£o',3,4.50),
	(8,3,'Ã“leo',1,7.50),
	(8,4,'Sal',1,4.20),
	(8,7,'Refrigerante',2,9.80),
	(8,10,'Molho',2,2.20),
	(9,1,'Arroz',1,22.50),
	(9,2,'FeijÃ£o',1,8.90),
	(9,3,'Ã“leo',1,7.50),
	(9,13,'Sorvete',2,25.50),
	(10,5,'MacarrÃ£o',2,4.50),
	(10,10,'Molho',4,2.20),
	(10,7,'Refrigerante',2,9.80),
	(10,6,'Cerveja',12,2.5),
	(10,8,'Carne',1,45.00),
	(10,4,'Sal',1,4.20);
	

--EXERCICIOS:
-- 1) Qual o valor total de cada uma das contas?
SELECT 
	pedido_id,
	sum (quantidade*valor_unidade) AS total_pedido
FROM vendas
GROUP BY 1
ORDER BY 2 DESC;


-- 2) Qual produto mais vendido em quantidades? --- cerveja 48
SELECT 
	nome_produto,
	SUM(quantidade) AS quant_total
FROM vendas
GROUP BY nome_produto
ORDER BY quant_total DESC;


-- 3) Qual produto que mais vendeu em valor? -- leite
SELECT
	nome_produto,
	SUM(quantidade) * valor_unidade AS valor_total
FROM vendas
GROUP BY nome_produto,valor_unidade
ORDER BY valor_total DESC
LIMIT 1;


-- 4) Calcule quantos produtos distintos tem por pedido?
SELECT
	pedido_id,
	COUNT(DISTINCT(produto_id)) AS quant_prod
FROM vendas
grouP BY 1
ORDER BY 2 DESC;
