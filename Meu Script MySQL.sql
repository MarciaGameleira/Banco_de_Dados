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

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/*Função ALTER TABLE:
	- Change: altera o nome de uma coluna
    - Modify: altera apenas o tipo do dado da coluna.*/
use comercio;
desc produto;
/*-------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| IDPRODUTO    | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| PRECO        | int(11)     | YES  |     | NULL    |                |
| FRETE        | float(10,2) | NO   |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+*/
alter table produto change preco valor_unitario int not null;
/*+----------------+-------------+------+-----+---------+--------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+*/
alter table produto change valor_unitario valor_unitario int;
desc produto;
/*+----------------+-------------+------+-----+---------+--------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| valor_unitario | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+*/
alter table produto modify valor_unitario int not null;/*Modify altera apenas o tipo.*/
alter table produto add peso float(10,2) not null;/*Add adiciona uma coluna.*/
alter table produto drop column peso;/*Drop exclui uma coluna.*/
alter table produto add column peso float(10,2) not null after valor_unitario;
alter table produto add column peso float(10,2) not null first;

/* EXERCICIOS DML */
INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */
INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */
INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',21);

/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */
select c.nome, c.sexo, c.email, c.cpf, 
	   e.rua, e.bairro, e.cidade, e.estado, 
       t.tipo, t.numero 
from cliente c 
inner join endereco e 
on c.idcliente = e.id_cliente 
inner join telefone t 
on c.idcliente = t.id_cliente;
/*+-------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
| CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
| ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
| ANA     | F    | ANA@IG.COM        | 456545678   | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
| CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
| GIOVANA | F    | NULL              | 0876655     | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
| KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
| DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
| EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
| ANTONIO | F    | ANTONIO@IG.COM    | 12436767    | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
| ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
| ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
| ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
| JOICE   | F    | JOICE@GMAIL.COM   | 55412256    | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+*/

/* RELATORIO DE HOMENS */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf, 
	   e.rua, e.bairro, e.cidade, e.estado, 
       t.tipo, t.numero 
from cliente c 
inner join endereco e 
on c.idcliente = e.id_cliente 
inner join telefone t 
on c.idcliente = t.id_cliente 
where c.sexo = 'M';
/*+-------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| nome    | sexo | email             | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
| JOAO    | M    | JOAOA@IG.COM      | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
| CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
| CARLOS  | M    | CARLOSA@IG.COM    | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
| JORGE   | M    | JORGE@IG.COM      | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
| FLAVIO  | M    | FLAVIO@IG.COM     | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
| KARLA   | M    | KARLA@GMAIL.COM   | 545676778   | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
| DANIELE | M    | DANIELE@GMAIL.COM | 43536789    | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
| EDUARDO | M    | NULL              | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
| ANTONIO | M    | ANTONIO@UOL.COM   | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
| ELAINE  | M    | ELAINE@GLOBO.COM  | 32567763    | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
| CARMEM  | M    | CARMEM@IG.COM     | 787832213   | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
+---------+------+-------------------+-------------+--------------------+------------+----------------+--------+------+----------+*/
/* 12, 13, 18, 19 são registros cadastrados com o campo sexo trocado.*/
select * from cliente where idcliente in (12,13,18,19);

update cliente 
set sexo = 'F' 
where idcliente = '12' or idcliente = '13' or idcliente = '18' or idcliente = '19';

/*----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+
| idcliente | nome    | sexo | email           | cpf         | rua                | bairro     | cidade         | estado | tipo | numero   |
+-----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 87866896 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 99667587 |
|         1 | JOAO    | M    | JOAOA@IG.COM    | 76567587887 | RUA CAPITAO HERMES | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 66687899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | COM  | 54768899 |
|         2 | CARLOS  | M    | CARLOSA@IG.COM  | 5464553466  | RUA ALFANDEGA      | ESTACIO    | RIO DE JANEIRO | RJ     | CEL  | 88687909 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | CEL  | 78458743 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 56576876 |
|         5 | JORGE   | M    | JORGE@IG.COM    | 8756547688  | RUA URUGUAIANA     | CENTRO     | VITORIA        | ES     | RES  | 89986668 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | RES  | 68976565 |
|         9 | FLAVIO  | M    | FLAVIO@IG.COM   | 4657765     | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | CEL  | 99656675 |
|        15 | EDUARDO | M    | NULL            | 54376457    | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | CEL  | 89966809 |
|        17 | ANTONIO | M    | ANTONIO@UOL.COM | 3423565     | ALAMEDA SAMPAIO    | BOM RETIRO | CURITIBA       | PR     | CEL  | 99655768 |
+-----------+---------+------+-----------------+-------------+--------------------+------------+----------------+--------+------+----------+*/

/* RELATORIO DE MULHERES */
select c.idcliente, c.nome, c.sexo, c.email, c.cpf,
       e.rua, e.bairro, e.cidade, e.estado,
       t.tipo, t.numero 
from cliente c 
inner join endereco e 
on c.idcliente = e.id_cliente 
inner join telefone t 
on c.idcliente = t.id_cliente 
where c.sexo = 'f';
/*+---------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+
| idcliente | nome    | sexo | email             | cpf       | rua                | bairro     | cidade         | estado | tipo | numero   |
+-----------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        16 | ANTONIO | F    | ANTONIO@IG.COM    | 12436767  | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | COM  | 88679978 |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
+-----------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+*/
/* 16 são registros cadastrados com o campo sexo trocado.*/
update cliente 
set sexo = 'M' where idcliente = '16';
/*+---------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+
| idcliente | nome    | sexo | email             | cpf       | rua                | bairro     | cidade         | estado | tipo | numero   |
+-----------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 78989765 |
|         3 | ANA     | F    | ANA@IG.COM        | 456545678 | RUA PRES VARGAS    | JARDINS    | SAO PAULO      | SP     | CEL  | 99766676 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 33567765 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | CEL  | 88668786 |
|        11 | GIOVANA | F    | NULL              | 0876655   | RUA VISCONDESSA    | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 55689654 |
|        12 | KARLA   | F    | KARLA@GMAIL.COM   | 545676778 | RUA NELSON MANDELA | COPACABANA | RIO DE JANEIRO | RJ     | COM  | 88687979 |
|        13 | DANIELE | F    | DANIELE@GMAIL.COM | 43536789  | RUA ARAUJO LIMA    | CENTRO     | VITORIA        | ES     | COM  | 88965676 |
|        18 | ELAINE  | F    | ELAINE@GLOBO.COM  | 32567763  | RUA DA LAPA        | LAPA       | SAO PAULO      | SP     | RES  | 89955665 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77455786 |
|        19 | CARMEM  | F    | CARMEM@IG.COM     | 787832213 | RUA GERONIMO       | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 89766554 |
|        20 | ADRIANA | F    | ADRIANA@GMAIL.COM | 88556942  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | RES  | 77755785 |
|        21 | JOICE   | F    | JOICE@GMAIL.COM   | 55412256  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | COM  | 44522578 |
+-----------+---------+------+-------------------+-----------+--------------------+------------+----------------+--------+------+----------+*/

/* QUANTIDADE DE HOMENS E MULHERES */
select sexo, count(*) as quantidade from cliente 
group by sexo;
/*+----+------------+
| sexo | quantidade |
+------+------------+
| M    |          9 |
| F    |         11 |
+------+------------+*/

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR */
use comercio;

select idcliente, email, sexo, 
	   bairro, estado 
       tipo, numero 
from cliente c
inner join endereco e 
on c.idcliente = e.id_cliente 
inner join telefone t 
on c.idcliente = t.id_cliente;

























       
/* PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME, EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO 
VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR */
select c.nome, c.email, c.sexo, 
       t.tipo, t.numero, 
       e.estado 
from cliente c 
inner join telefone t
on c.idcliente = t.id_cliente
inner join endereco e
on c.idcliente = e.id_cliente
where sexo = 'F' 
and tipo = 'CEL' and estado = 'SAO PAULO';

SELECT C.IDCLIENTE, C.EMAIL, C.NOME, C.SEXO, T.TIPO, E.BAIRRO, E.CIDADE
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'F'
AND BAIRRO = 'CENTRO' AND CIDADE = 'SAO PAULO'
AND (TIPO = 'RES' OR TIPO = 'COM');
