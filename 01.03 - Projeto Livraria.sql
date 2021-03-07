/* Após a criação da tabela, deveremos entregar algumas queries prontas para que sejam enviadas para o programador. As queries são as seguintes:
1 – Trazer todos os dados.*/
SELECT * FROM LIVRO;
/*
+---------------------+-------------------+------+--------------+-----------------+--------+---------------+-------------------+
| NOME_DO_LIVRO       | NOME_DO_AUTOR     | SEXO | N_DE_PAGINAS | NOME_DA_EDITORA | PRECO  | UF_DA_EDITORA | ANO_DE_PUBLICACAO |
+---------------------+-------------------+------+--------------+-----------------+--------+---------------+-------------------+
| Cavaleiro Real      | Ana Claudia       | F    | 465          | Atlas           |  49.90 | RJ            | 2009              |
| SQL para leigos     | João Nunes        | M    | 450          | Addison         |  98.00 | SP            | 2018              |
| Receitas Caseiras   | Celia Tavares     | F    | 210          | Atlas           |  45.00 | RJ            | 2008              |
| Pessoas Efetivas    | Eduardo Santos    | M    | 390          | Beta            |  78.00 | RJ            | 2018              |
| Habitos Saudáveis   | Eduardo Santos    | M    | 630          | Beta            | 150.00 | RJ            | 2019              |
| A Casa Marrom       | Hermes Macedo     | M    | 250          | Bubba           |  60.00 | MG            | 2016              |
| Estacio Querido     | Geraldo Francisco | M    | 310          | Insignia        | 100.00 | ES            | 2015              |
| Pra sempre amigas   | Leda Silva        | F    | 510          | Insignia        |  78.00 | ES            | 2011              |
| Copas Inesqueciveis | Marco Alcantara   | M    | 200          | Larson          | 130.00 | RS            | 2018              |
| O poder da mente    | Clara Mafra       | F    | 120          | Continental     |  56.00 | SP            | 2017              |
+---------------------+-------------------+------+--------------+-----------------+--------+---------------+-------------------+*/

/*2 – Trazer o nome do livro e o nome da editora*/
SELECT NOME_DO_LIVRO, NOME_DA_EDITORA FROM LIVRO;
/*
+---------------------+-----------------+
| NOME_DO_LIVRO       | NOME_DA_EDITORA |
+---------------------+-----------------+
| Cavaleiro Real      | Atlas           |
| SQL para leigos     | Addison         |
| Receitas Caseiras   | Atlas           |
| Pessoas Efetivas    | Beta            |
| Habitos Saudáveis   | Beta            |
| A Casa Marrom       | Bubba           |
| Estacio Querido     | Insignia        |
| Pra sempre amigas   | Insignia        |
| Copas Inesqueciveis | Larson          |
| O poder da mente    | Continental     |
+---------------------+-----------------+*/

/*3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino.*/
SELECT NOME_DO_LIVRO, UF_DA_EDITORA FROM LIVRO GROUP BY SEXO = 'M';
/*
+-----------------+---------------+
| NOME_DO_LIVRO   | UF_DA_EDITORA |
+-----------------+---------------+
| Cavaleiro Real  | RJ            |
| SQL para leigos | SP            |
+-----------------+---------------+*/
    
/*4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino.*/
SELECT NOME_DO_LIVRO, N_DE_PAGINAS FROM LIVRO GROUP BY SEXO = 'F';
/*
+-----------------+--------------+
| NOME_DO_LIVRO   | N_DE_PAGINAS |
+-----------------+--------------+
| Cavaleiro Real  | 465          |
| SQL para leigos | 450          |
+-----------------+--------------+*/

/*5 – Trazer os valores dos livros das editoras de São Paulo.*/
SELECT NOME_DO_LIVRO, PRECO FROM LIVRO WHERE UF_DA_EDITORA = 'SP';
/*
+------------------+-------+
| NOME_DO_LIVRO    | PRECO |
+------------------+-------+
| SQL para leigos  | 98.00 |
| O poder da mente | 56.00 |
+------------------+-------+*/

/*6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio).*/
SELECT NOME_DO_AUTOR, SEXO FROM LIVRO 
WHERE SEXO = 'M' AND (UF_DA_EDITORA = 'SP' OR UF_DA_EDITORA = 'RJ');
/*
+-------------------+------+
| NOME_DO_LIVRO     | SEXO |
+-------------------+------+
| SQL para leigos   | M    |
| Pessoas Efetivas  | M    |
| Habitos Saudáveis | M    |
+-------------------+------+*/

/*Criação do banco*/
CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVRO(
	NOME_DO_LIVRO VARCHAR(30),
	NOME_DO_AUTOR VARCHAR(20),
	SEXO CHAR(1),
    N_DE_PAGINAS VARCHAR(4),
    NOME_DA_EDITORA VARCHAR(10),
    PRECO FLOAT(10,2),
    UF_DA_EDITORA CHAR(2),
    ANO_DE_PUBLICACAO CHAR(4)
);

INSERT INTO LIVRO VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVRO VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVRO VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVRO VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVRO VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVRO VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVRO VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVRO VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVRO VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVRO VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);


