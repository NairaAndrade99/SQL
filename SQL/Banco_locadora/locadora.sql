CREATE TABLE distribution_companies (
  id SERIAL PRIMARY KEY,
  company_name VARCHAR(100)
);
INSERT INTO distribution_companies (company_name)
VALUES ('Columbia Pictures'), 
       ('Paramount Pictures'),
	   ('Warner Bros. Pictures'),
	   ('United Artists'),
	   ('Universal Pictures'),
	   ('New Line Cinema'),
	   ('Miramax Films'),
	   ('Produzioni Europee Associate'),
	   ('Buena Vista'),
	   ('StudioCanal');


CREATE TABLE movies (
   id  SERIAL PRIMARY KEY,
   movies_title VARCHAR(100),
   imdb_rating  FLOAT,
   year_released INT,
   budget DOUBLE precision,
   box_office DOUBLE precision,
   distribution_company_id INT,
   language_filme VARCHAR (100)
   
);


INSERT INTO movies (movies_title,imdb_rating, year_released,budget,box_office,distribution_company_id,language_filme )
VALUES ('The Shawshank Redemption', 9.2 ,1994,25.00,73.30,1,'English'), 
       ('The Godfather',9.2,1972,7.20,291.00,2,'English'),
	   ('The Dark Knight',9.0,2008,185.00,1.006,2,'English'),
	   ('The Godfather Part II',9.0,1974,13.00,93.00,2,'English, Sicilian'),
	   ('12 Angry Men',9.0,1957,0.34,2.00,4,'English'),
	   ('Schindler s List',8.9,1993,22.00,322.20,5,'English, German, Yiddish' ),
	   ('The Lord of the Rings: The Return of the King',8.9,2003,94.00,1.146,6,'English'),
	   ('Pulp Fiction',8.8,1994,8.50,213.90,7,'English'),
	   ('The Lord of the Rings: The Fellowship of the Ring',8.8,2001,93.00,898.20,6,'English'),
	   ('The Good, the Bad and the Ugly', 8.8,1966,1.20,38.90,8,'English, Italian, Spanish');
	   

/*Exercício 1: Seleção de todas as colunas de uma tabela 
Exercício: Selecionar todos os dados da tabela distribution_companies.*/

SELECT * FROM distribution_companies;


/* Exercício 2: Seleção de algumas colunas em uma tabela
Exercício: Para cada filme, selecione o título do filme, a classificação IMDb e o ano em que o filme foi lançado*/

SELECT 
  movies_title, 
  year_released,
  language_filme
  
FROM movies ;

/* Exercício 3: Seleção de algumas colunas e filtragem de dados numéricos em WHERE 
Exercício: Selecione as colunas movie_title e box_office na tabela movies. 
Mostre somente os filmes com ganhos acima de US$ 300 milhões.*/

SELECT 
  movies_title, 
  year_released,
  language_filme,
  imdb_rating
FROM movies 
 WHERE  year_released < 2000;

/* Exercício 4: Seleção de algumas colunas e filtragem de dados de texto em WHERE 
Exercício: Selecione as colunas movie_title, imdb_rating e year_released da tabela movies. 
Mostre os filmes que têm a palavra "Godfather" no título.*/

SELECT 
  movies_title, 
  year_released,
  language_filme,
  imdb_rating
FROM movies 
 WHERE language_filme LIKE '%English%';

/* Exercício 5: Seleção de algumas colunas e filtragem de dados usando duas condições em WHERE 
Exercício: Selecione as colunas movie_title, imdb_rating e year_released da tabela movies. 
Mostre os filmes que foram lançados antes de 2001 e que tiveram uma classificação acima de 9.*/
SELECT 
  movies_title, 
  year_released,
  language_filme,
  imdb_rating
FROM movies 
 WHERE language_filme = 'English' AND year_released < 2000 ;
 
/* Exercício 6: Filtragem de dados usando WHERE e classificando o resultado
Exercício: Selecione as colunas movie_title, imdb_rating e year_released da tabela movies.
Mostre os filmes lançados depois de 1991. Classifique a saída pelo ano de lançamento em ordem crescente.*/
SELECT 
  movies_title, 
  year_released,
  language_filme,
  imdb_rating
FROM movies 
 WHERE year_released < 2000 
ORDER BY year_released  ASC;
 

/* Exercício 7: Agrupamento de dados em uma coluna 
Exercício: Mostre a contagem de filmes por cada categoria de idioma.*/

SELECT language_filme,  
  COUNT (*) AS total_linguage
FROM movies
GROUP BY language_filme;

/* Exercício 8: Agrupamento de dados por várias colunas 
Exercício: Mostrar a contagem de filmes por ano de lançamento e idioma. 
Classifique os resultados pela data de lançamento em ordem crescente.*/

SELECT language_filme,  year_released,
 COUNT (*) AS total_linguage
FROM movies
GROUP BY year_released, language_filme
ORDER BY year_released ASC;

/*  Exercício 9: Filtragem de dados após o agrupamento
Exercício: Mostre os idiomas falados e o orçamento médio dos
filmes por categoria de idioma. Mostre somente os idiomas com 
um orçamento médio acima de US$ 50 milhões.*/
SELECT 
  language_filme,
  AVG (budget) AS budget_movies
  FROM movies 
 GROUP BY language_filme 
 HAVING AVG(budget) > 50;


/* Exercício 10: Seleção de colunas de duas tabelas 
Exercício: Mostrar títulos de filmes da tabela movies cada um com o nome de sua empresa de distribuição.*/
SELECT
  movies_title,
  company_name
FROM distribution_companies dc
JOIN movies m
ON dc.id = m.distribution_company_id;

