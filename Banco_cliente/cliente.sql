---criando o banco de dados
CREATE DATABASE Store;

--- criar tabela product 
CREATE TABLE Product(
   id_nf INT NOT NULL,
   id_item INT NOT NULL,
   cod_prod SERIAL PRIMARY KEY,
   valor_unit FLOAT  NOT NULL,
   quantidade INT NOT NULL,
   desconto INT NULL
);

INSERT INTO Product (id_nf,id_item,valor_unit,quantidade,desconto)
VALUES               (1    ,1      ,25.0     ,10         ,5),
		             (1    ,2      ,13.5     ,3          ,NULL),
		             (1    ,3      ,15.00    ,2          ,NULL);
					 
select * from Product


/* Pesquise os itens que foram vendidos sem desconto. 
As colunas presentes no resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT.*/

SELECT id_nf,id_item,cod_prod,valor_unit, desconto
 FROM Product 
WHERE desconto IS NULL ;

/*Pesquise os itens que foram vendidos com desconto. As colunas presentes no 
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR 
VENDIDO. 
OBS: O valor vendido é igual ao VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). */

SELECT id_nf,id_item,cod_prod,valor_unit - (valor_unit *(desconto/100)) AS valor_Vendido
 FROM product 
WHERE DESCONTO > 0;

/*Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo*/

UPDATE Product
 SET desconto = 0
WHERE desconto IS NULL;

select * from product;

/*Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta 
são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO, 
VALOR_VENDIDO. OBS:  O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE * 
VALOR_UNIT. 
O VALOR_VENDIDO é igual a VALOR_UNIT - 
(VALOR_UNIT*(DESCONTO/100)).*/

SELECT  
       id_nf,
	   id_item,
	   cod_prod,
	   valor_unit,
	   quantidade * valor_unit AS valor_total,
       valor_unit - (valor_unit *(desconto/100)) AS VALOR_VENDIDO,
	   desconto
FROM product;

/*Pesquise o valor total das NF e ordene o resultado do maior valor para o menor.
As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL.
OBS:  O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. 
Agrupe o resultado da consulta por ID_NF.*/

SELECT   id_nf AS valor_total_nf,
        sum(quantidade * valor_unit) AS valor_total
FROM product
GROUP BY valor_total_nf
ORDER BY valor_total DESC;

/*Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor.
As colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS:  
O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. 
O VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). 
Agrupe o resultado da consulta por ID_NF. */

SELECT id_nf,
       SUM(quantidade * valor_unit) AS valor_total,
	   SUM(valor_unit - (valor_unit *(desconto/100))) AS valor_vendido
FROM product 
GROUP BY id_nf
ORDER BY valor_total,valor_vendido DESC;

/*Consulte o produto que mais vendeu no geral. 
As colunas presentes no resultado da consulta são: 
COD_PROD, QUANTIDADE. 
Agrupe o resultado da consulta por COD_PROD. */

SELECT cod_prod, MIN(quantidade) AS mais_vendido
 FROM product
GROUP BY cod_prod
ORDER BY mais_vendido DESC LIMIT 1;

/*Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto. 
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE. 
Agrupe o resultado da consulta por ID_NF, COD_PROD*/

SELECT id_nf, cod_prod, quantidade 
 FROM product
WHERE quantidade >= 10
GROUP BY id_nf,cod_prod;

/*Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o 
resultado do maior valor para o menor. 
As colunas presentes no resultado da consulta são: ID_NF, VALOR_TOT. 
OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. 
Agrupe o resultado da consulta por ID_NF. */

SELECT id_nf, 
        SUM(quantidade * valor_unit ) AS valor_total
 FROM product
GROUP BY id_nf
HAVING 
       SUM(quantidade * valor_unit) > 500
ORDER BY valor_total ASC;

/*Qual o valor médio dos descontos dados por produto.
As colunas presentes no resultado da consulta são: COD_PROD, MEDIA.
Agrupe o resultado da consulta por COD_PROD. */

SELECT cod_prod,AVG(desconto) AS medi_desconto
FROM product 
GROUP BY cod_prod;

/*Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas 
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe 
o resultado da consulta por COD_PROD. */

SELECT cod_prod, 
      MIN(desconto) AS menor_valor, 
	  MAX(desconto) AS maior_valor, 
	  AVG(desconto) AS media_valor
 FROM product
GROUP BY cod_prod;

/*Quais as NF que possuem mais de 3 itens vendidos.
As colunas presentes no resultado da consulta são: ID_NF, QTD_ITENS.
OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL.
Agrupe o resultado da consulta por ID_NF. */

SELECT id_nf, COUNT(*) AS qtd_itens
 FROM product
GROUP BY id_nf
HAVING COUNT(*) > 3;

