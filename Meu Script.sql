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
SHOW TABLES;

/*Solicitando ao banco para exibir a estrutura da tabela, utiliza-se o comando 'DESC'.*/
DESC CLIENTE;

/*Mostrando todos os dados da tabela utilizando o (*).*/
SELECT * FROM CLIENTE;

/*Inserindo dados de exemplo na tabela.*/
INSERT INTO CLIENTE VALUES ('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');




















