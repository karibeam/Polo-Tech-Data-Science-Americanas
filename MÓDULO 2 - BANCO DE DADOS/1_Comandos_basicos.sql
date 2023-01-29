
-- Aprendendo consultas em SQL

--Criar uma tabela nomeado como funcionarios e nessa tabela deve conter:
--	funcionario_id (integer)
--	nome
--	departamento
--	cargo
--	senioridade
--	salario numeric



CREATE TABLE funcionarios(  ----- CRIA A TABELA E CADA COLUNA LOGO ABAIXO JUNTAMENTE COM SEU TIPO DE DADO, NUMERICO OU STRING E QUANTIDADE DE CARACTERES
	funcionarios_id integer,
	nome varchar (40),
	departamento varchar (40),
	cargo varchar (40),
	senioridade varchar (40),
	salario NUMERIC
	);



INSERT INTO funcionarios VALUES --------------------------- INSERE VALORES NA TABELA NA ORDEM DAS COLUNAS CRIADAS
	(1,'JoÃ£o Paulo','RH','Analista','Junior',2000),
	(2,'LÃºcia','RH','Analista','Pleno',3000),
	(3,'Rosana','RH','Analista','Senior',4000),
	(4,'Elisabete','RH','Coordenador','LideranÃ§a',5000),
	(5,'Amanda','RH','Gerente','GerÃªncia',7000),
	(6,'Rafael','Analytics','Analista','Junior',3000),
	(7,'Pedro','Analytics','Analista','Pleno',5000),
	(8,'Lucas','Analytics','Analista','Pleno',5000),
	(9,'Luiz AntÃ´nio','Analytics','Analista','Senior',7000),
	(10,'Giovanni','Analytics','Analista','Senior',7000),
	(11,'Nadia','Analytics','Coordenador','LideranÃ§a',9000),
	(12,'Carmen','Analytics','Gerente','GerÃªncia',11000),
	(13,'MaurÃ­cio','Dados','Analista','Pleno',5000),
	(14,'Bruno Silva','Dados','Analista','Senior',8000),
	(15,'Andressa','Dados','Cientista','Junior',5000),
	(16,'JosÃ© de Sousa','Dados','Cientista','Junior',6500),
	(17,'Helena','Dados','Cientista','Pleno',7000),
	(18,'Bruna','Dados','Cientista','Pleno',7000),
	(19,'Bruno Pereira','Dados','Cientista','Pleno',8000),
	(20,'Bianca','Dados','Cientista','Senior',11000),
	(21,'Murilo','Dados','Coordenador','LideranÃ§a',12000),
	(22,'Gisele','Dados','Coordenador','LideranÃ§a',14000),
	(23,'Paulo','Dados','Gerente','GerÃªncia',18000),
	(24,'Wesley','Dados','Engenheiro','Junior',6000),
	(25,'Vagner','Dados','Engenheiro','Pleno',9000),
	(26,'LÃ©ticia','Dados','Engenheiro','Pleno',9000),
	(27,'Sandro','Dados','Engenheiro','Senior',11000),
	(28,'Enzo','Dados','Engenheiro','Senior',12000),
	(29,'Lavinia','Dados','Engenheiro','Senior',12000),
	(30,'Andrei','Dev','Engenheiro de Software','Junior',4000),
	(31,'George','Dev','Engenheiro de Software','Junior',4000),
	(32,'Caio','Dev','Engenheiro de Software','Pleno',5000),
	(33,'Edna','Dev','Engenheiro de Software','Pleno',5000),
	(34,'Debora','Dev','Engenheiro de Software','Pleno',6500),
	(35,'Luiza','Dev','Engenheiro de Software','Pleno',6000),
	(36,'Pedro Henrique','Dev','Engenheiro de Software','Pleno',6000),
	(37,'Willian','Dev','Engenheiro de Software','Senior',7000),
	(38,'Viviane','Dev','Engenheiro de Software','Senior',9000),
	(39,'Mnnuel','Dev','Coordenador','LideranÃ§a',8000),
	(40,'Lurdes','Dev','Coordenador','LideranÃ§a',9500),
	(41,'Hygor','Dev','Gerente','GerÃªncia',10000),
	(42,'Ana Paula','Financeiro','Analista','Junior',2000),
	(43,'Luciana','Financeiro','Analista','Junior',2000),
	(44,'Lorena','Financeiro','Analista','Junior',2500),
	(45,'Sara','Financeiro','Analista','Junior',2500),
	(46,'Cintia','Financeiro','Analista','Pleno',3000),
	(47,'Karina','Financeiro','Analista','Pleno',3000),
	(48,'Camila','Financeiro','Analista','Senior',3500),
	(49,'Afonso','Financeiro','Coordenador','LideranÃ§a',4500),
	(50,'Cibele','Financeiro','Gerente','GerÃªncia',5000);


-- Consulta COMANDO SELECT
SELECT * FROM funcionarios;  -- o * tras todas as colunas da tabela

SELECT 
	nome,
	salario
FROM funcionarios;


-- COMANDO LIMIT
SELECT *
FROM funcionarios
LIMIT 3;  -- tras as 3 primeiras linhas pra não precisar trazer todos os dados da tabela


-- COMANDO ORDER BY
SELECT *
FROM funcionarios
ORDER BY funcionarios_id DESC -- ordena os dados de acordo com a coluna indicada, ordena de forma descrescente com o DESC
LIMIT 3;


-- COMANDO WHERE
SELECT *
FROM funcionarios
WHERE funcionarios_id > 40; -- seleciona apenas os maiores de 40

-- ex.2
SELECT
	departamento,
	salario
FROM funcionarios
WHERE senioridade = 'Junior' -- tras só juniors
ORDER BY salario DESC; -- com salario do maior pro menor


--COMANDO GROUP BY
SELECT
	departamento,
	SUM (salario) AS total_salarios -- o 'AS' cria uma nova coluna e em seguida coloca-se o nome dela
FROM funcionarios
GROUP BY departamento -- separa os departamentos e o total de salario de cada departamento agrupando eles em uma linha
ORDER BY departamento;

-- ex.2
SELECT
	departamento,
	senioridade,
	AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento, senioridade  -- agrupa por dois fatores já que AS duas colunas estão no SELECT
ORDER BY departamento, senioridade;


-- ARREDONDANDO COM O ROUND
SELECT
	departamento,
	senioridade,
	ROUND(AVG(salario),2) AS media_salarial
FROM funcionarios
GROUP BY departamento, senioridade
ORDER BY departamento, senioridade;


--CONTAR SALARIOS
-- fazendo media com o COUNT
SELECT
	departamento,
	SUM(salario) AS total_salarios,
	COUNT(salario) AS qnt_funcionarios,
	ROUND(SUM(salario)/COUNT(salario),2) AS salario_medio
FROM funcionarios
GROUP BY departamento
ORDER BY departamento;


-- COMANDO DISTINCT
SELECT
	DISTINCT senioridade -- tras só o valor da coluna
FROM funcionarios;


------------------------------------- EXERCICIOS ---------------------------------------------
-- Utilize a tabela funcionarios
-- Calcule o total de salario por departamento mas apenas com senioridade Liderança e Gerência
SELECT
	departamento,
	SUM(salario) AS total_salario
FROM funcionarios
WHERE senioridade IN ('LideranÃ§a','GerÃªncia') -- peguei os dados com acento por isso ficou assim
GROUP BY 1
ORDER BY 2 DESC;


-- Calcule quantos funcionarios tem por departamento
SELECT
	departamento,
	count(departamento) AS quant_dep
FROM funcionarios
GROUP BY departamento
ORDER BY quant_dep DESC;


-- Calcule quantos funcionarios tem por senioridade
SELECT
	senioridade,
	count(senioridade)
FROM funcionarios
GROUP BY senioridade;
	