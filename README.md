## **__BANCO DE DADOS SQL__** 

## Criar banco de dados 

  ####     <center>    TABELA <center>

 COLUNA 1|COLUNA 2| COLUNA N..  
 -----|-------|-----
linhas|linhas|linhas
linhas|linhas|linhas
linhas|linhas|linhas 

#### Sintaxe 
~~~~ sql 
CREATE tipo_objeto nome_objeto;
~~~~
#### Comando 
~~~~ sql 
CREATE DATABASE banco_de_dados;
~~~~
~~~~ sql 
CREATE TABLE banco_de_dados;
~~~~
## Adicionar coluna em uma tabela já existente 
~~~~sql 
ALTER TABLE tabela
ADD COLUMN nome_coluna tipo 
~~~~
## Atualizar registro de uma tabela 
~~~~sql 
UPDATE tabela 
SET nome_coluna = valor;
~~~~
## Consultar banco de dados 
#### Sintaxe 
~~~~ sql
SELECT colunas FROM tabelas
~~~~
#### *Consultar todas as colunas da tabela (*)
~~~~ sql 
SELECT * FROM tabelas;
~~~~
#### *Consultando mais de uma coluna da tabela*
~~~~ sql 
SELECT colunas1,coluna2,colunaN... FROM tabela;
~~~~
## Filtro de consulta com o WHERE 
#### Operadores de comparção em consulta : Compara dois valores e retorna 

Sinal |  valor 
----|----
(>) | maior 
(<) | menor 
(=) | igual
(<=)| menor e igual
(>=)| maior e igual
(<> ou !=)| diferente (não igual)

#### Sintaxe 
~~~~ sql 
SELECT coluna 
  FROM tabela 
WHERE coluna condição valor;
~~~~
#### Comando 
~~~~ sql 
SELECT preco 
  FROM produto 
WHERE preco < 10.00;
~~~~
## Ordenação com a cláusula ORDER BY
#### **_O ORDER BY é sempre depois do filtro_**

Tipo | Descrição
----|----
DESC| decrescente 
ASC | crescente 

#### Sintaxe 
~~~~sql 
SELECT coluna 
 FROM tabela 
ORDER BY coluna;
~~~~
#### Comando
~~~~sql 
SELECT nome_produto, preco 
 FROM produto 
ORDER BY preco ASC;
~~~~
#### *Mostrar valores nulls (tanto no começo ou no final da tabela)*
Tipo| descrição
----| -----
First| começo
Last| final

#### Sintaxe 
~~~~sql 
SELECT coluna 
 FROM tabela 
ORDER BY coluna NULL FIRST ;
~~~~
## LIMIT E OFFSET 
#### *Permitem obter uma parte especificada das linhas retornadas por uma consulta SQL.*

Tipo| decrição 
----|-----
Contagem| Quantidade de linhas a exibir 
ALL | Mostra todas as linhas 
Deslocamento| Quantas linhas devem ser puladas antes de iniciar a contagem do LIMIT 

### Sintaxe 
~~~~ sql
SELECT colunas 
 FROM  tabela 
LIMIT 3;
~~~~
~~~~ sql
SELECT colunas 
 FROM  tabela 
OFFSET 5;
~~~~
~~~~ sql
SELECT colunas 
 FROM  tabela
ORDER BY coluna 
LIMIT 3 OFFSET 2;
~~~~
##  Operador BETWEEN 
#### *Comparação que faz a filtragem com intervalo de dados*

#### Sintaxe 
~~~~sql 
SELECT coluna 
FROM tabela 
 WHERE coluna 
BETWEEN  valor1 oprador_logico valor2;
~~~~
~~~sql 
SELECT coluna 
FROM tabela 
  WHERE coluna 
BETWEEN        valor1 operador_logico valor2 operador_logico 
        coluna valor1 oprador_logico  valor2;
~~~
~~~~ sql 
SELECT coluna 
FROM tabela 
  WHERE coluna 
BETWEEN  valor1 operador_logico valor2 
        coluna operador_condição;
~~~~
~~~sql
SELECT coluna 
FROM tabela 
  WHERE coluna 
NOT BETWEEN  valor1 operador_logico valor2;     
~~~
## Clausula UPDATE 
#### *Atualizar registro em tabelas*

#### Sintaxe 
~~~~sql 
UPDATE tabela 
 SET coluna =  novo_valor 
WHERE coluna = valor_indice;
~~~~
## Apagar registros de uma tabela (linhas) DELETE FROM e TRUNCATE TABLE 

Tipo| descrição 
----|-----
DELETE FROM | Exclui linhas especificas de uma tabela 
TRUNCATE TABLE | Limpa todos os registros de uma tabela 

#### *Usar o WHARE para não excluir todos os registros da tabela*

#### Sintaxe 
~~~~sql 
DELETE FROM tabela 
WHERE condição;
~~~~
~~~~sql 
TRUNCATE TABLE tabela;
~~~~
## Funções de agregação 
#### *Computar um valor único a partir de um conjunto de valores de entrada*
#### Funções básicas 

Tipo| Descrição 
----|-----
COUNT | Contagem 
MAX| valor máximo 
MIN| valor minimo
AVG| média 
SUM| somatório 

Tipo| descrição 
----|-----
(*)|contar tudo
DISTINCT| diferente 
ROUND | Arrendondar o valor 

#### Sintaxe 
~~~sql 
SELECT COUNT (coluna) from tabela;
~~~
~~~~sql 
SELECT COUNT (coluna) from tabela 
WHERE condição;
~~~~
~~~~sql 
SELECT COUNT (*) from tabela;
~~~~
~~~~sql 
SELECT ROUND (COUNT (coluna), valor_das_casas) from tabela 
WHERE condição;
~~~~
~~~~sql 
SELECT COUNT (DISTINCT coluna) from tabela;
~~~~
## FUNÇÕES COM **_INNER JOIN_**
#### Cláusula JOIN (junções)são usadas para combinar dados proveninetes de duas ou mais tabelas em um único conjunto de resultados baseado em codições de JOIN especificadas 

## Alias com AS 
#### Podemos dar um nome diferente a uma coluna ou tabela ao realizar uma consulta usando uma alias 
#### Sintaxe 

~~~sql
SELECT coluna1 AS "alias_coluna1",
       coluna2 AS "alias_coluna2",
       colunaN AS "alias_colunaN"
FROM tabela AS  "alias_tabela";
~~~

#### JOINS 

categorias | descição 
-----|------
INNER JOIN | Retorna linhas quando houver peelo menos uma correspondencia em ambas as tabelas 
OUTER JOIN |Retorna linhas mesmo quando não houver pelo menos uma correspondencia em uma das tabelas (ou ambas ). O OUTER JOIN divide-se em _LEFT JOIN_, _RIGHT JOIN_ E _CROOS JOIN_.

### INNER JOIN -> Interserção 

## Cláusula ON 
#### Cláusula ON determina a condição de JOIN, que indica como as tabelas devem ser comparadas
#### No geral , a comparação ocorre por meio de um relacionamento entre chave primária na primeira tabela e chave estrangeira na segunda tabela 
#### Umma condição de join nomeia uma coluna, emm cada tabela envolvida no JOIN e indica como as colunas devem ser comparadas 
#### No geral, usamos o operador para obter linhas como colunas correspondentes. É comum usar o relacionamento do PK de uma tabela com FK de  outra tabela 

## Nomes de coluna qualificados 
#### Nome de coluna qualificados: Nome da coluna precedido pelo nome da tabela à qual pertence, separados por um ponto. Usamos nomes de colunas qualificados para identificar a tal tabela cada campo envolvido pertence isso evita erro de ambiguidade caso uma coluna tem o mesmo nome em duas tabelas diferentes

#### Sintaxe 

~~~~sql 
ON  tabela1.cod_coluna = tabela2.cod_coluna;
~~~~ 
~~~~SQL 
SELECT coluna 
 FROM tabela1
INNER JOIN tabela2 
 ON tabela1.coluna = tabela2.coluna
INNER JOIN tabelaN 
 ON tabela1.coluna = tabelaN.coluna
WHERE condição_filtragem;
~~~~

#### Usando ILIAS 
~~~~ sql 
SELECT ilias_tabela1.coluna,ilias2_tabela1.coluna
 FROM tabela1 ilias_tabela1
INNER JOIN tabela2 ilias_tabela2
ON  ilias_tabela1.coluna = ilias_tabela2.coluna;
~~~~
## VIEWS (exibições/visão)
#### É uma tabela virtual estruturada de dados baseado em conjuto de resultados de uma consulta SQL, criada a partir de um  conjunto de tabelas ou outros VIEWS presentes no banco que serve como tabelas base. Mostra sempre resultados de dados atualizados pois o modo do banco de dados  toda vez que um usuario consultar a visão.
### Aplicação da views 
#### -> Simplificar o acesso a dados quen estão armazenados em multiplas tabelas relacionadas 
#### -> Implementar segurança nos dados de uma tabela por exemplo criando uma visão que limite os dados que podemos ser acessados, por meio de uma clausula WHERE 
#### -> Prover isolamento de uma aplicação da estrutura especifica de tabela do banco acessado

#### Sintaxe 
~~~~sql
CREATE OR REPLACE VIEW nome_view AS 
~~~~
#### Realizar consulta com a view 
~~~sql
SELECT coluna FOR nome_view 
~~~
#### Alterar propriedade da view 
~~~~sql 
ALTER VIEW nome_view RENAME TO novo_nome_view
~~~~
#### Excluir view 
~~~sql
DROP VIEW nome_view 
~~~
~~~~sql
DROP VIEW IF EXISTIR nome_view
~~~~
## ARRAY 
#### Sintaxe 
~~~~sql 
nome_coluna tipo [];
~~~~
#### Buscar valor a partir da posição do indice do vetor 
#### * No SQL o valor do indice começa pelo 1 
~~~~sql 
SELECT nome_coluna [posição]
 FROM tabela;
 ~~~~
 #### Filtrar atraves de uma array 
 ~~~sql 
 SELECT coluna FROM tabela
 WHERE 'busca' ANY (coluna_array);
 ~~~
## OPERADORES ARITMÉTICOS 
Operador| Significado|Sintaxe 
-----|-----|-----
-| menos unário| - valor
^| exponenciação| valor1 ^ valor2
(*)|multiplicação|valor1(*)valor2
/ | divisão|valor1/valor2
% |modulo| valor1 % valor2
(+) |soma| valor1+valor2
(-) |subtração | valor1 - valor2
(|/)| raiz quadrada | (|/valor)
(||/) |raiz cubica | (||/valor)
@ | valor absoluto| @valor

#### Sintaxe 
~~~~sql
SELECT oluna operador valor 
FROM tabela 
~~~~
## Herança de tabla no PostegreSQL 
#### Eu posso herdar coluna de outras tabelas 
#### Sintaxe 
~~~~sql 
CREATE TABLE nome(
    nome_coluna inherits(tabela_pai)
)
~~~~
~~~~sql 
INSERT INTO tabela (coluna_tabela_herdada,coluna_tabela)
~~~~
## JSON 
#### Acrônimo de Java Script Object Notin
#### Formato aberto e popular para apresentação e troca de dados, assim como XML e YAML porem mais leve e simples 
#### É fácil para humanos ler e editar esse formato, e simples para os computadores processarem e gerarem dados JSON 
#### É indepedente de linguagem de programção 
### * Documento JSON 
#### Um documento (Objeto) JSON é um conjunto não cordenado de dados armazenados em um par _nome: valor(campo)_ que inicia e ttermina com chaves {}
#### Todos os nomes-chaves são englobados em aspas duplas e são separados de seus valores por dois-pontos:,
#### Os pares (campos) são separados um do outro por virgulas 
#### "chave": valor
### Criar ttabela com o campo JASON 
#### Sintaxe 
~~~~sql 
CREATE TABLE nome (
     nome_coluna JSON 
)
~~~~
#### Inserindo valor 
~~~~sql
INSERT INTO tabela (coluna)
VALUES ('{" chava " : "valor", " chave " : {"valor" : "valor" : "valor"}}');
~~~~
###  Sintaxe 
#### Consultar 
~~~~sql
SELECT coluna -> 'chave'
FROM tabela;
~~~~
#### Formato de texto  
~~~~sql
SELECT coluna ->> 'chave'
FROM tabela;
~~~~
#### Formato de texto  e filtragem (where)
~~~~sql
SELECT coluna ->> 'chave'
FROM tabela
WHERE coluna ->  'chave' ->>  'chave' = valor;
~~~~
## Materialized Views 
####  Tabela virtual (lógico) cujo conteudo é baseado no retorno de uma consulta pre-definida, realizada em uma ou mais tabelas ou outras views mais que não contem os dados em si 
#### Materialized Views é um objeto de banco de dados que armazena o resultado de uma consulta de forma persistente 
#### É uma tabela auxiliar que permite mais performance no acesso aos dados 
TIPO| SIGNIFICADO 
----|------
no data | view vazia 
data| matealizada 

#### Sintaxe 
~~~~sql 
CREATE MATERIALIZED VIEW nome_view 
AS 
.....
WITH NO DATA 
~~~~
#### -> Consultar view 
~~~~sql
SELECT * FROM nome_view 
~~~~
#### -> Carregar dados na view 
~~~~sql 
REFRESH MATERIALIZED VIEW nome_view 
~~~~
#### -> Alterações 
~~~~sql 
ALTER MATEALIZED VIEW nome_view 
RENAME COLUMN coluna TO novo_nome_da_coluna 
~~~~
#### ->  Excluir view 
~~~~sql 
DROP MATERIALIZED VIEW nome_view 
~~~~
#### BACKUP E RESTAURAÇÃO DE BANCO DE DADOS 
#### -> Backup
~~~~ cmd 
pg_dump nome_banco > nome_backup
~~~~
#### -> Excluir banco 
~~~~cmd 
DROP database nome_banco
~~~~
#### -> Revogar conexão 
~~~~cmd 
REVOKE CONNECT ON DATABASE nome_banco FROM PUBLIC 
~~~~
#### ->  Restaurar o banco 
##### Criar um novo banco vazio
~~~~cmd 
CREATE DATABASE nome_banco 
~~~~
##### Adicionar o backup ao banco 
~~~~cmd
nome_banco < nome_backup
~~~~
## Subconsulta 
#### Consulta embutida dentro de oura consulta de forma aninhada passando os resultados da consulta mais interna para a consulta mais externa por meio de uma clausula WHERE ou de uma clausula HAVING 
#### Sintaxe 
~~~~sql 
SELECT coluna 
 FROM tabela 
FROM coluna operador (SELECT coluna 
                         FROM tabela 
                      WHERE condição);
~~~~
## Funções de manipulação de strings no postgreSQL 
#### Concatenação de string : Operador  || 
##### Retorna uma valor de texto (String) 
#### Sintaxe 
~~~sql
String ou não-string || ' ' || string ou não-string 
~~~
~~~sql 
SELECT coluna1 || ' ' || coluna2
 FROM tabela 
ORDER BY coluna;
~~~
#### Função CONCAT()
#### Sintaxe 
~~~~sql 
CONCAT(String1,....StringN)
~~~~
~~~~sql
SELECT CONCAT(coluna1,'',coluna2) AS " "
  FROM tabela 
ORDER BY coluna1;
~~~~
#### Função BIT_LENGTH()
#### Retorna o numero de bits em uma string 
#### Sintaxe 
~~~~sql 
BIT_LENGTH(string)
~~~~
~~~~sql
SELECT coluna, BIT_LENGTH(coluna)
 FROM tabela 
~~~~
#### Função CHAR_LENGTH()
#### Retorna o numero de caracteres em uma string 
#### Sintaxe 
~~~~sql
CHAR_LENGTH(string)
~~~~
~~~sql
SELECT CHAR_LENGTH('');
~~~
~~~~sql
SELECT coluna, CHAR_LENGTH(coluna)
 FROM tabela 
~~~~
#### Função LENGTH ()
#### Retorna o numero de caracteres em uma string 
#### Sintaxe 
~~~sql
LENGTH(string)
~~~
~~~sql
SELECT LENGTH(string)
~~~
~~~~SQL
SELECT coluna, LENGTH(coluna)
FROM tabela;
~~~~
#### Função LOWER()
#### Retorna a string convertido em caixa baixa (caracteres minusculos)
#### Sintaxe 
~~~~sql 
LOWER(string)
~~~~
~~~sql
SELECT LOWER('')
~~~
~~~~SQL
SELECT LOWER(coluna)
 FROM tabela;
~~~~
#### Função Upper 
#### Retorna a string convertido em caixa alta (caracteres mausculos)
#### Sintaxe 
~~~~sql
UPPER('')
~~~~
~~~SQL
SELECT UPPER(coluna)
FROM tabela;
~~~
#### Funçao OVERLAY()
#### Substitui uma substring (sequencia de caracteres que é parte da string)
#### Sintaxe 
~~~~sql 
OVERLAY (string PLACING string FROM INT [FOR INT]) --FOR É A QUANTIDADE DE CARACTERES DESEJADOS
~~~~
~~~~SQL 
SELECT OVERLAY('  'PLACING FROM 3 FOR 4) --- A PARTIR DA 3 POSIÇÃO ESCREVA '' SUBSTITUINDO 4 CARACTERES 
~~~~
#### Função  POSITION
#### Fornece a localização de uma substring especificada 
#### Sintaxe 
~~~~sql
POSITION (substring IN substring)
~~~~
~~~~sql
SELECT POSITION ('' IN ''); ---DIFERENCIA MAUSCULO DE MINISCULA 
~~~~
~~~~sql
SELECT coluna, POSITION ('' in coluna)
FROM tabela;
~~~~
#### Função SUBSTRING 
#### Extrai uma substring (sequencia de caracteres)
#### Sintaxe
~~~~sql
SUBSTRING (string [FROM IN][FOR INT])
~~~~
~~~~SQL
SELECT SUBSTRING ('' FROM valor)
~~~~
~~~~sql
SELECT SUBSTRING ('' FROM valor FOR VALOR)
~~~~
~~~~SQL
SELECT SUBSTRING (coluna FROM valor FOR valor)
FROM tabela;
~~~~
#### COMBINAÇÃO COM FUNÇÕES
~~~~sql
SELECT UPPER(SUBSTRING (coluna FROM valor FOR valor))
FROM tabela;
~~~~
#### Função TRIM 
#### Remove a substring contendo os caracteres informadados no inicio final ou em ambos os eextremos da string por padrão remove espaços
#### Sintaxe 
~~~~sql
TRIM([LEADING|TRAILING|BOTH][CARACTERES] FROM string)
~~~~
~~~~sql
SELECT TRIM (BOTH FROM '');
~~~~
~~~~SQL
INSERT INTO coluna (coluna,coluna)
VALUES (valor,'');
~~~~
## Procedimento  armazenamento no PostgreSQL
#### Sintaxe 
~~~~sql
CREATE OR REPLACE PROCEDURE nome_procedimento (arg1 tipo1,arg2 tipo2....)
RETURNS tipo_dado
LANGUAGE linguagem_usada
AS delimitador
DECLARE 
  ---VARIAVEIS SE HOUVER 
BEGIN  
     --codigo do procedimento
END;
limiador ;
~~~~
#### Executar o processamento 
~~~sql
CALL nome_processamento(dados)
~~~
#### Consultar 
~~~~sql
CREATE OR REPLACE PROCEDURE nome_procedimento(parametro)
LANGUAGE
AS $$
DECLARE nome 
BEGIN  
    FOR nome IN 
     SELECT coluna 
       FROM tabela 
      WHERE coluna operador valor 
    LOOP 
    RAISE NOTICE ''
END ;
