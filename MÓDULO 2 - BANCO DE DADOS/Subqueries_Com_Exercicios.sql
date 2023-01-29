-- SUBQUERIES

-- Monte uma tabela com o saldo atual e as atualizacoes de saldo (entrada e saida)
-- tabela entradas
DROP TABLE tb_entrada;
DROP TABLE tb_saida;


CREATE TABLE tb_entrada AS
SELECT 
	A.cliente_id,
	SUM(A.valor) AS entrada
FROM transacoes A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
WHERE B.nome_transacao = 'PixIn'
GROUP BY 1
ORDER BY 1;


CREATE TABLE tb_saida AS
SELECT 
	A.cliente_id,
	-SUM(A.valor) AS saida
FROM transacoes A
LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
WHERE B.nome_transacao != 'PixIn'
GROUP BY 1
ORDER BY 1;


SELECT 
	A.cliente_id,
	A.saldo,
	B.entrada,
	C.saida
FROM saldo A
LEFT JOIN tb_entrada B ON A.cliente_id = B.cliente_id 
LEFT JOIN tb_saida C ON A.cliente_id = C.cliente_id ;


-- USANDO A SUBQUERIES
SELECT 
	A.cliente_id,
	A.saldo,
	B.entrada,
	C.saida
FROM saldo A
LEFT JOIN (SELECT 
		   	  A.cliente_id,
			  SUM(A.valor) AS entrada
		   FROM transacoes A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao = 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) B ON A.cliente_id = B.cliente_id 
LEFT JOIN (SELECT 
			  A.cliente_id,
			  -SUM(A.valor) AS saida
		   FROM transacoes A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao != 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) C ON A.cliente_id = C.cliente_id ;


-- CASE WHEN

SELECT 
	A.cliente_id,
	A.saldo,
	CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END AS entrada,
	CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END AS saida
FROM saldo A
LEFT JOIN tb_entrada B ON A.cliente_id = B.cliente_id 
LEFT JOIN tb_saida C ON A.cliente_id = C.cliente_id ;


SELECT 
	A.cliente_id,
	A.saldo,
	CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END AS entrada,
	CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END AS saida,
	A.saldo + (CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END) + (CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END) AS saldo_atual
FROM saldo A
LEFT JOIN tb_entrada B ON A.cliente_id = B.cliente_id 
LEFT JOIN tb_saida C ON A.cliente_id = C.cliente_id ;	      
	   



SELECT 
	A.cliente_id,
	A.saldo,
	CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END AS entrada,
	CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END AS saida,
	A.saldo + (CASE WHEN B.entrada IS NULL THEN 0 
					ELSE B.entrada END) + (CASE WHEN C.saida IS NULL THEN 0 
												ELSE C.saida END) AS saldo_atual
FROM saldo A
LEFT JOIN (SELECT 
		   	  A.cliente_id,
			  SUM(A.valor) AS entrada
		   FROM transacoes A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao = 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) B ON A.cliente_id = B.cliente_id 
LEFT JOIN (SELECT 
			  A.cliente_id,
			  -SUM(A.valor) AS saida
		   FROM transacoes A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao != 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) C ON A.cliente_id = C.cliente_id;
		  
		  
SELECT
	cliente_id,
	idade,
	CASE WHEN idade <= 30 THEN 'Faixa 1 - AtÃ© 30 anos'
		 WHEN idade <= 40 THEN 'Faixa 2 - 30 - 40 anos'
		 WHEN idade <= 50 THEN 'Faixa 3 - 40 - 50 anos'
		 WHEN idade <= 60 THEN 'Faixa 4 - 50 - 60 anos' ELSE 'Faixa 5 - > 60 anos' END AS fx_idade
FROM clientes;

SELECT 
	fx_idade,
	COUNT(*) AS qntde_clientes
FROM (SELECT
		cliente_id,
		idade,
		CASE WHEN idade <= 30 THEN 'Faixa 1 - AtÃ© 30 anos'
			 WHEN idade <= 40 THEN 'Faixa 2 - 30 - 40 anos'
			 WHEN idade <= 50 THEN 'Faixa 3 - 40 - 50 anos'
			 WHEN idade <= 60 THEN 'Faixa 4 - 50 - 60 anos' ELSE 'Faixa 5 - > 60 anos' END AS fx_idade
		FROM clientes) A
GROUP BY 1
ORDER BY 1;


-- MANIPULANDO DATAS E TEXTOS

-- TEXTOS
-- MINUSCULAS
SELECT 
	('BOA NOITE TURMA COMO ESTAO'),
	LOWER('BOA NOITE TURMA COMO ESTAO');


-- MAIUSCULAS
SELECT 
	('boa noite turma como estao'),
	UPPER('boa noite turma como estao');


-- FunÃ§Ã£o LIKE
-- Exemplo que dÃ¡ false
SELECT 
	'SANDRO SAORIN' LIKE 'SANDRO';

-- Exemplo que da true
SELECT 
	'SANDRO SAORIN' LIKE 'SANDRO SAORIN';


-- %: valida trecho de palavras
-- % a direita = pode ter mais coisa a direita da palavra
SELECT 
	'SANDRO SAORIN' LIKE 'SANDRO%';
		

-- % a esquerda = pode ter mais coisa a esquerda da palavra
SELECT 
	'SANDRO SAORIN' LIKE '%SAORIN';		
		

-- % em ambos os lados: valida se existe aquele trecho dentro da string
SELECT 
	'SANDRO SAORIN' LIKE '%AND%';	

SELECT 
	'SANDRO SAORIN' LIKE '%E%';	
		

-- CONCAT
SELECT CONCAT('SANDRO', 'SAORIN', 'DA', 'SILVA');

SELECT CONCAT('SANDRO ', 'SAORIN ', 'DA ', 'SILVA');
		

--SUBSTRING (SUBSTR)
-- COMO FUNCIONA SUBSTR(PALAVRA, POSIÃ‡ÃƒO DE INICIO NA PALAVRA, E O COMPRIMENTO QUE VAI PERCORRER)
SELECT SUBSTRING('SANDRO SAORIN DA SILVA', 1, 6);

SELECT SUBSTRING('SANDRO SAORIN DA SILVA', 4, 12);
		


-- DATAS
-- Customizando datas
SELECT 
	data_pedido
FROM sales s 
LIMIT 10;

SELECT 
	data_pedido,
	TO_CHAR(data_pedido, 'dd/mm/yyyy') AS nova_data_pedido
FROM sales s 
LIMIT 10;
		
SELECT 
	data_pedido,
	TO_CHAR(data_pedido, 'dd mon YY') AS nova_data_pedido
FROM sales s 
LIMIT 10;		


--EXTRAINDO INFORMAÃ‡Ã•ES DAS DATAS

SELECT 
	data_pedido,
	EXTRACT(DAY FROM data_pedido) AS dia,
	EXTRACT(MONTH FROM data_pedido) AS mes,
	EXTRACT(YEAR FROM data_pedido) AS ano,
	EXTRACT(WEEK FROM data_pedido) AS semana,
	TO_CHAR(data_pedido, 'MONTH') AS nome_mes,
	TO_CHAR(data_pedido, 'Month') AS nome_mes2,
	TO_CHAR(data_pedido, 'month') AS nome_mes3,
	TO_CHAR(data_pedido, 'MON') AS nome_mes4,
	TO_CHAR(data_pedido, 'Mon') AS nome_mes5,
	TO_CHAR(data_pedido, 'mon') AS nome_mes6
FROM sales s 
LIMIT 10;

		
-- Data de hoje
SELECT current_date AS hoje;

SELECT current_time AS hora;

SELECT current_timestamp AS timestamp;

SELECT EXTRACT(MONTH FROM current_date) AS mes_hoje;



-- EXERCICIOS


-- 1) Usando a tabela sales, crie uma tabela onde teremos uma coluna categorica
-- com as semanas e uma coluna nÃºmerica com o lucro total para cada semana.

SELECT
	EXTRACT(WEEK FROM data_pedido) AS semana,
	sum((venda_garrafa - custo_garrafa)*garrafas_vendidas) AS lucro
FROM sales
GROUP BY 1
ORDER BY 2 ;

SELECT
	CASE WHEN data_pedido < '2022-11-05' THEN '1 Semana'
		WHEN data_pedido < '2022-11-12' THEN '2 Semana'
		WHEN data_pedido < '2022-11-19' THEN '3 Semana'
		WHEN data_pedido < '2022-11-26' THEN '4 Semana' ELSE '5 Semana' END AS semanas,
	sum((venda_garrafa - custo_garrafa)*garrafas_vendidas) AS lucro
FROM sales
GROUP BY 1
ORDER BY 1 ;



-- 2) Usando a tabela sales, identifique todas as cidades que tem no nome
--as letras DE juntas, e calcule a quantidade de cidades
SELECT
	count(DISTINCT(cidade)) AS qtd_cidades
FROM sales
WHERE cidade LIKE '%DE%'

SELECT
	DISTINCT cidade
FROM sales
WHERE cidade LIKE '%DE%'




-- 3) Utilizando o exercicio sobre o mercado, categorize os pedidos de acordo
-- com o valor total gasto (sugira uma separaÃ§aÃµ entre 6 categorias)
SELECT
	CASE WHEN total_pedido <= 100 THEN 'F1 -  até 100  reais'
		WHEN total_pedido <= 200 THEN 'F2 -  100 - 200 reais'
		WHEN total_pedido <= 300 THEN 'F3 -  200 - 300 reais'
		WHEN total_pedido <= 400 THEN 'F4 -  300 - 400 reais'
		WHEN total_pedido <= 500 THEN 'F5 -  400 - 500 reais' ELSE 'F6 - > 500 reais' END AS faixa,
	sum(total_pedido) AS total
FROM (SELECT
		A.pedido_id,
		sum(A.quantidade*B.valor_unitario) AS total_pedido
	FROM pedidos A
	LEFT JOIN produtos B ON A.produto_id = B.produto_id
	GROUP BY 1
	ORDER BY 1)A
GROUP BY 1
ORDER BY 1;



-- 4) Usando o exercicio sobre correntistas, monte uma tabela com saldo e saldo_atual (parecido com o que foi feito em aula),
-- mas agora utilizando as 100 transaÃ§Ãµes, usando subqueries

DROP TABLE transacoes_total IF EXISTS;

CREATE TABLE transacoes_total AS		  
SELECT * FROM transacoes t 
UNION ALL
SELECT * FROM transacoes2 t2;


SELECT
	A.cliente_id,
	A.saldo,
	CASE WHEN B.entrada IS NULL THEN 0 ELSE B.entrada END AS entrada,
	CASE WHEN C.saida IS NULL THEN 0 ELSE C.saida END AS saida,
	A.saldo + (CASE WHEN B.entrada IS NULL THEN 0 
					ELSE B.entrada END) + (CASE WHEN C.saida IS NULL THEN 0 
												ELSE C.saida END) AS saldo_atual
FROM saldo A
LEFT JOIN (SELECT 
			   A.cliente_id,
			   SUM(A.valor) AS entrada
		   FROM transacoes_total A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao = 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) B ON A.cliente_id = B.cliente_id
LEFT JOIN (SELECT 
			   A.cliente_id,
			   -SUM(A.valor) AS saida
		   FROM transacoes_total A
		   LEFT JOIN tipo_transacao B ON A.tipo_transacao_id = B.tipo_transacao_id 
		   WHERE B.nome_transacao != 'PixIn'
		   GROUP BY 1
		   ORDER BY 1) C ON A.cliente_id = C.cliente_id;







