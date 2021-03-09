/* Criando um banco de dados de exemplo (Neste caso o nome do banco de dados é PROJETO */
CREATE DATABASE PROJETO;

/* Conectando-se a um banco específico */
USE PROJETO;

/* Solicita ao banco para mostrar as tabelas existentes */
SHOW TABLES FROM PROJETO; /*Como não houve ainda criação de tabelas, o banco mostra que não há tabelas criadas.*/

/*Criando a primeira tabela do banco de dados PROJETO.*/
CREATE TABLE CLIENTE (
	NOME VARCHAR(30),
    SEXO CHAR (1),
    EMAIL VARCHAR (30),
    CPF INT (11),
    TELEFONE VARCHAR (30),
    ENDERECO VARCHAR (100)
);

/*Solicitando ao banco para mostrar as tabelas existentes.*/
/*O comando SHOW TABLES só funciona no MySQL*/
SHOW TABLES;

/*Solicitando ao banco para exibir a estrutura da tabela, utiliza-se o comando 'DESC'.*/
DESC CLIENTE;

/*Mostrando todos os dados da tabela utilizando o (*).*/
SELECT * FROM CLIENTE;

/*Inserindo dados de exemplo na tabela omitindo a especificação da tebala. Neste caso os dados devem seguir a ordem das colunas da tabela.*/
INSERT INTO CLIENTE VALUES ('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/*Inserção de dados informando quais colunas devem receber os dados informados.*/
/* INSERT INTO CLIENTE (COL1, COL2, COL3, COL4, COL5, ..., COLn) VALUES (insira os dados aqui, separados por vírgula.);*/
INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES ('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856); 
/*No caso acima não foi informado dados referente ao email, e nem a coluna foi especificada.*/
INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');

/*As linhas abaixo apresentarão erros na inserção por conta do execesso de caracteres no campo do CPF*/
INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES ('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);
INSERT INTO CLIENTE (NOME, SEXO, ENDERECO, TELEFONE, CPF) VALUES ('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);

/*Exs. de projeção de dados no banco com uso de 'alias' com a palavra reservada AS.*/
SELECT NOW() AS DATA_HORA;
SELECT 'MARCIA GAMELEIRA' AS NOME;

/*Filtrando dados com a cláusula WHERE e LIKE*/
SELECT NOME, SEXO FROM CLIENTE; /*Selecionando colunas específicas.*/
SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'F';
SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'M';

/*Utilizando o operador LIKE com o caracter coringa %.*/
SELECT * FROM CLIENTE WHERE ENDERECO LIKE '%MG';
/*+-------+------+---------------------+-----------+----------+-----------------------------------------------+
 | NOME  | SEXO | EMAIL               | CPF       | TELEFONE | ENDERECO                                      |
 +-------+------+---------------------+-----------+----------+-----------------------------------------------+
 | JORGE | M    | NULL                | 885755896 | 58748895 | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
 | CARLA | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458 | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
 +-------+------+---------------------+-----------+----------+-----------------------------------------------+*/
 
 SELECT NOME, SEXO, EMAIL FROM CLIENTE WHERE ENDERECO LIKE '%SP';
/*+------+------+---------------+
| NOME | SEXO | EMAIL         |
+------+------+---------------+
| ANA  | F    | ANA@GLOBO.COM |
+------+------+---------------+*/

SELECT * FROM CLIENTE WHERE ENDERECO LIKE '%CENTRO%';
/*+-------+------+---------------------+-----------+-----------+-----------------------------------------------+
| NOME  | SEXO | EMAIL               | CPF       | TELEFONE  | ENDERECO                                      |
+-------+------+---------------------+-----------+-----------+-----------------------------------------------+
| CELIA | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| ANA   | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+-------+------+---------------------+-----------+-----------+-----------------------------------------------+*/

/*Filtros com operadores lógicos: AND e OR.*/
USE PROJETO;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE
SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/*Funções COUNT and GROUP BY.*/
SELECT COUNT(*) AS 'QTDE DE REGISTROS' FROM CLIENTE;

SELECT SEXO, COUNT(*) AS 'QTDE' FROM CLIENTE GROUP BY SEXO;
/* +------+------+
   | SEXO | QTDE |
   +------+------+
   | M    |    2 |
   | F    |    4 |
   +------+------+*/
   
/*Filtrando valores Nulos*/
USE PROJETO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL = NULL; /*Esse tipo de consulta utilizando o operador de igualdade retornará um set de dados vazios, pois o NULL é dado do sys.*/

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/*Update para atualização de valores nas tabelas.+*/
SELECT NOME, EMAIL FROM CLIENTE WHERE EMAIL IS NULL;
/*+------+------+---------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL               | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM      | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | NULL                | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | NULL                | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| ANA    | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA  | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+*/

UPDATE CLIENTE SET EMAIL = 'JORGE@GMAIL.COM' WHERE NOME = 'JORGE';

SELECT * FROM CLIENTE;
/*/------+------+---------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL               | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM      | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM     | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | NULL                | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| ANA    | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA  | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+*/

UPDATE CLIENTE SET EMAIL = 'LILIAL@GMAIL.COM' WHERE NOME = 'LILIAN';
/*+--------+------+-------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL               | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM      | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM     | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAL@GMAIL.COM    | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| ANA    | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA  | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+*/

/*Deleção de dados sempre utilizando a cláusula WHERE.*/
SELECT * FROM CLIENTE;
/*+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL               | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM      | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM     | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM     | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAN@GMAIL.COM    | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
| ANA    | F    | ANA@GLOBO.COM       |  85548962 | 548556985 | PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP |
| CARLA  | F    | CARLA@TERATI.COM.BR |   7745828 | 66587458  | SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG   |
+--------+------+---------------------+-----------+-----------+-----------------------------------------------+
6 rows in set. A tabela possui 6 registros. Ou...*/
SELECT COUNT(*) FROM CLIENTE; /*A consulta retorna um total de 6 registros.*/
SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'ANA'; /*A consulta retorna um total de 1 registro.*/
DELETE FROM CLIENTE WHERE NOME = 'ANA';
SELECT COUNT(*) FROM CLIENTE; /*A consulta agora retorna um total de 5 registros.*/

INSERT INTO CLIENTE VALUES ('CARLA','F','C.LOPES@UOL.COM',45638854,'4575-0048',
'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT * FROM CLIENTE;

SELECT * FROM CLIENTE WHERE NOME = 'CARLA' OR EMAIL = 'JOAO@GMAIL.COM';

DELETE FROM CLIENTE WHERE NOME = 'CARLA' OR EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT * FROM CLIENTE;
/*+--------+------+------------------+-----------+-----------+---------------------------------------------+
| NOME   | SEXO | EMAIL            | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM   | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM  | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM  | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAN@GMAIL.COM | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
+--------+------+------------------+-----------+-----------+-----------------------------------------------+*/

DELETE FROM CLIENTE WHERE NOME = 'CELIA' AND EMAIL = 'LILIAN@HOTMAIL.COM';
SELECT * FROM CLIENTE; /*Observe que não houve exclusão de nenhum registro pois não há registro que atenda às duas condições acima.*/
/*+------+------+------------------+-----------+-----------+-----------------------------------------------+
| NOME   | SEXO | EMAIL            | CPF       | TELEFONE  | ENDERECO                                      |
+--------+------+------------------+-----------+-----------+-----------------------------------------------+
| JOAO   | M    | JOAO@GMAIL.COM   | 988638273 | 22923110  | MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ  |
| CELIA  | F    | CELIA@GMAIL.COM  | 541521456 | 25078869  | RIACHUELO - CENTRO - RIO DE JANEIRO - RJ      |
| JORGE  | M    | JORGE@GMAIL.COM  | 885755896 | 58748895  | OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG |
| LILIAN | F    | LILIAN@GMAIL.COM | 887774856 | 947785696 | SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ |
+--------+------+------------------+-----------+-----------+-----------------------------------------------+*/

CREATE DATABASE COMERCIO;
USE COMERCIO

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,/*primary key serve para identificar a coluna que possuidora da chave primária. AUTO_INCREMENTE é uma função de inserção automatica da chave primária.*/
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,/*A função ENUM só existe no MySQL.*/
	EMAIL VARCHAR(50) UNIQUE,/*A função unique não aceita outro campo dentro da coluna que sejam iguais.*/
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)/*Criando a chave estrangeira.*/
);
CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

select nome, email, cidade from cliente, endereco where idcliente = id_cliente;/*Fazendo a junção das tabelas.*/

select nome, cidade from cliente, endereco where idcliente = id_cliente and sexo = 'f';

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',15);

SELECT NOME, SEXO, BAIRRO, CIDADE FROM CLIENTE INNER JOIN ENDERECO ON IDCLIENTE = ID_CLIENTE;/*Junção de tabelas: INNER JOIN com o ON.*/

select nome, sexo, email, tipo, numero from cliente inner join telefone on idcliente = id_cliente;

/*Inner Join de mais de duas tabelas com técnica de apontamento de tabela em cada coluna informada na query.*/
select c.nome, c.sexo, e.bairro, e.cidade, t.tipo, t.numero from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;



























