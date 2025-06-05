CREATE TABLE Alunos(
     mat VARCHAR(120) PRIMARY KEY,
	 nome VARCHAR(129) NOT NULL,
	 endereco VARCHAR(120),
	 cidade VARCHAR(80)
);
ALTER TABLE  Alunos 
ALTER COLUMN mat TYPE int USING mat::int;

INSERT INTO Alunos 
VALUES  (2015010101, 'JOSE DE ALENCAR',' RUA DAS ALMAS', 'NATAL') ,
		(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO',' JOÃO PESSOA') ,
		(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE') ,
		(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA') ,
		(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL') ,
		(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO',' NATAL');

CREATE TABLE Disciplina (
 		cod_disc SERIAL PRIMARY KEY,
		nome_disc VARCHAR(80) NOT NULL,
		carga_hor INT
		
);
ALTER TABLE  Disciplina
ALTER COLUMN cod_disc TYPE VARCHAR USING  cod_disc::VARCHAR(3);

INSERT INTO Disciplina 
VALUES 	('BD', 'BANCO DE DADOS', 100) ,
		('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100) ,
		('WEB', 'AUTORIA WEB', 50) ,
		('ENG', 'ENGENHARIA DE SOFTWARE', 80);

CREATE TABLE Professor (
    cod_prof int  PRIMARY KEY,
	nome VARCHAR(120) NOT NULL,
	endereco VARCHAR(120),
	cidade VARCHAR(120)
);

INSERT INTO Professor 
VALUES (212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA') ,
       (122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO',' NATAL') ,
       (192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE',' NATAL'); 

CREATE TABLE Turma (
    cod_disc VARCHAR  REFERENCES Disciplina(cod_disc),
	cod_turma INT PRIMARY KEY,
	cod_prof int REFERENCES Professor(cod_prof),
	ano int, 
	horario VARCHAR
);
ALTER TABLE Turma
ADD CONSTRAINT unicas UNIQUE (cod_prof);


SELECT * FROM Turma;


INSERT INTO Turma 
VALUES ('BD', 1, 212131, 2015, '11H-12H') ,
       ('BD', 2, 212131, 2015, '13H-14H') ,
       ('POO', 3, 192011, 2015,'08H-09H') , 
       ('WEB', 4, 192011, 2015, '07H-08H'), 
       ('ENG', 5, 122135, 2015, '10H-11H'); 

CREATE TABLE Historico (
    mat INT NOT NULL,
    cod_disc VARCHAR NOT NULL,
    cod_turma INT NOT NULL,
    cod_prof INT NOT NULL,
    ano INT NOT NULL,
    frequencia INT NOT NULL,
    nota FLOAT,

    FOREIGN KEY (mat) REFERENCES Alunos(mat),
    FOREIGN KEY (cod_disc, cod_turma, cod_prof, ano)
        REFERENCES Turma(cod_disc, cod_turma, cod_prof, ano)
);

/*Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD = 
código da disciplinas). */

SELECT  mat, ano, nota
FROM Historico 
WHERE mat = 'BD' AND  ano = 2015 AND nota < 5;

/*Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO 
em 2015. */

SELECT mat,ano, AVG(notas) AS media_notas
FROM historico 
WHERE mat = 'POO' AND ano = 2015
GROUP BY mat,ano

/*Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO 
em 2015 e que esta média seja superior a 6.*/

SELECT mat, avg(notas) AS media_notas, ano
FROM historico
WHERE mat = 'POO' AND ano = 2015
GROUP BY mat
HAVING 
avg(notas) > 6

/* Encontre quantos alunos não são de Natal.*/

SELECT  cidade, nome
 FROM alunos 
WHERE  cidade != 'Natal'
