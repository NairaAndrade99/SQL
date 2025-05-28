CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(128),
    last_name VARCHAR(128),
    email VARCHAR(128),
    birth_date DATE,
    start_date DATE
);
	   
CREATE TABLE lecturer (
 	id int PRIMARY KEY,
	first_name VARCHAR(128),
	last_name VARCHAR(128),
	degree VARCHAR(32),
	email VARCHAR(128)
);
CREATE TABLE course_edition (
	id INT PRIMARY KEY NOT NULL,
	course_id INT NOT NULL, 
	academic_semester_id INT NOT NULL,
	lecturer_id INT NOT NULL,
	FOREIGN KEY (id) REFERENCES course_edition (id),
	FOREIGN KEY (academic_semester_id) REFERENCES academic_semester (id),
	FOREIGN KEY (lecturer_id) REFERENCES lecturer (id)
);
CREATE TABLE academic_semester(
    id INT PRIMARY KEY NOT NULL,
	calendar_year INT,
	term  VARCHAR (128),
	start_date DATE,
	end_date DATE
);
-------------
/*Exercício 1: Listar todos os alunos
Exercício

Selecione todos os dados dos alunos no banco de dados.*/

SELECT * FROM student;

/*Exercício 2: Listar todos os nomes de alunos
Exercício


Selecione o primeiro nome e o sobrenome de todos os alunos.*/

SELECT first_name, last_name 
 FROM student;

/*Exercício 3: Selecionar um professor específico por ID
Exercício

Selecione o e-mail do professor com o ID 5 no banco de dados.*/

SELECT email
 FROM lecturer
WHERE ID = 5;

/*Exercício 4: Selecionar alunos pelo sobrenome
Exercício

Selecione todos os dados de qualquer aluno cujo sobrenome seja Durrand.*/

SELECT *
 FROM student 
WHERE last_name = 'Durrand';

/*Exercício 5: Selecionar alunos cujo sobrenome começa com D
Exercício

Selecione o primeiro e o último nome dos alunos cujo sobrenome começa com a letra D.*/

SELECT first_name, last_name
 FROM student 
WHERE last_name LIKE 'd%';

/*Exercício 6: Usar várias condições para selecionar um semestre acadêmico
Exercício

Selecione todos os dados dos semestres acadêmicos em que estas duas condições são atendidas: o ano é 2020 e o período é primavera*/

SELECT * 
 FROM academic_semester
 WHERE calendar_year = 2020 AND term = 'Primavera';
 
 /*Exercício 7: Classificar alunos por sobrenome
Exercício

Selecione o sobrenome e a data de nascimento dos alunos nascidos em 2003
ou depois e classifique-os pelo sobrenome em ordem decrescente (de Z a A).*/

SELECT last_name, birth_date
 FROM student 
WHERE birth_date >=  '2002-01-01'
ORDER BY last_name DESC;

/*Exercício 8: Alunos nascidos entre 2003 e 2004
Exercício

Selecione o nome, o sobrenome e a data de nascimento dos alunos nascidos entre 2003 e 2004 no banco de dados.*/

SELECT first_name, last_name, birth_date
  FROM student 
WHERE birth_date  '2003-01-01' BETWEEN '2004-12-31' ;


/*Exercício 9: Contar alunos para cada data de início
Exercício

Selecione a data de início de todos os alunos e mostre quantos alunos têm a mesma data de início.*/

SELECT first_name, SUM (start_date) AS mesma_data
 FROM student 
GROUP BY mesm_data

/*Exercício 10: Selecionar, agrupar e filtrar os resultados
Exercício

Localize as datas de início em que havia mais de 15 alunos. 
Exiba a data de início e o número de alunos que começaram nessa data.*/

SELECT SUM(start_date) AS date_inicio
 FROM student 
WHERE date_inicio > 15
GROUP BY date_inicio;

/*SELECT start_date, COUNT(*)
FROM student
GROUP BY start_date
HAVING COUNT(*) > 15;*/

/*Exercício 11: Quantos cursos cada professor ministra?
Exercício

Para cada professor, descubra quantos cursos ele ministra em cada semestre acadêmico. 
Exiba o nome e o sobrenome do professor, o ano civil, o período e o número de cursos ministrados pelo professor nesse semestre.*/

SELECT lecturer.first_name, 
       lecturer.last_name, 
	   academic_semester.calendar_year,
	   academic_semester.term,
	   SUM (course_id)
FROM lecturer
INNER JOIN academic_semester
 ON lecturer.id = academic_semester.id
INNER JOIN course_edition
 ON course_edition.id =  lecturer.id
GROUP BY lecturer.id, academic_semester.id

	   