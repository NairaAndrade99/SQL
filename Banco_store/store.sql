/*Exercício 1: Todos os produtos
Exercício: Exibir todos os dados presentes na tabela product tabela.*/

SELECT * FROM Product;

/*Exercício 2: Produtos com preço unitário maior que 3,5
Exercício: Exibir os nomes dos produtos com um preço unitário maior ou igual a 3,5.*/
SELECT product_name, unit_price
FROM Product 
WHERE unit_price  > 3.5;

/*Exercício 3: Produtos com condições específicas para categoria e preço
Exercício: Exibir dados de todos os produtos em categorias com ID 1 (Alimentos) ou 5 (Frutas e legumes) e com preço unitário acima de 3,5.*/
SELECT *
FROM Product 
WHERE category_id = 1 OR category_id = 5 
AND unit_price > 3.5;

/*Exercício 4: Produtos e categorias
Exercício: Selecione os nomes dos produtos junto com suas categorias. Exiba duas colunas: product_name e category_name.*/
SELECT PE.product_name, CA.category_name AS category_name
FROM Product PE 
INNER JOIN Category PE
ON PE.product_id = CA.product_id;

/*Exercício 5: Compras e produtos
Exercício: Para cada compra, exiba o ID da compra, o nome do produto, o preço unitário no momento da compra e a quantidade de itens de cada produto.*/
SELECT PU.purchase_id,
       PR.product_name,
	   PU.purchase_item.unit_price, 
	    quantity
	   --PR.unit_price,
	   --PR.unita_in_stock
 FROM Purchase_item PU
INNER JOIN Product PR 
ON PU.product_id = PR.product_id;

/*Exercício 6: Compras e categorias
Exercício: Para cada compra, exiba todas as categorias de produtos comprados nessa compra. 
Mostre cada categoria apenas uma vez para cada compra.*/

SELECT purchase_id,category.name AS category_name 
 FROM purchase_item
INNER JOIN Category 
ON purchase_item.category_id = category.category_id;
/* 
INNER JOIN Product 
ON Product.product_id = purchase_item.product_id;
*/

/*Exercício 7: Categorias ordenadas
Exercício: Exiba os dados de todas as categorias. 
Classifique as categorias por nome em ordem crescente (A a Z).*/
SELECT * FROM Category 
ORDER BY name ASC;

/*Exercício 8: Funcionários classificados por data de nascimento
Exercício: Mostre os sobrenomes, os nomes e as datas de nascimento dos funcionários. 
Classifique os resultados por idade do funcionário em ordem crescente(Dica: use a coluna birth_date ).*/
SELECT last_name,first_name,birth_date
FROM employee
ORDER BY birth_date DESC 

/*Exercício 9: Produtos classificados pelo número de unidades
Exercício: Exibir dados de todos os produtos, classificando os resultados pelo número de unidades em ordem decrescente e pelo nome do produto em ordem crescente.*/
SELECT * FROM Product 
ORDER BY units_in_stock DESC,product_name ASC;

/*Exercício 10: O preço médio unitário de cada categoria
Exercício: Para cada categoria de produto, mostre seu nome e encontre o preço unitário médio.
Exiba duas colunas: nome e average_unit_price.*/

SELECT /*category.name */ product_name, AVG (unit_price) AS average_unit_price
FROM product 
/*
INNER JOIN category 
ON Category.category_id= Product.category_id
GROUP BY category.name

*/
/*Exercício 11: O número de clientes nas cidades
Exercício: Conte quantos clientes vivem em cada cidade, exceto em Knoxville e Stockton. 
Classifique os resultados pelo nome da cidade em ordem crescente.
Exiba duas colunas: city e customers_quantity.*/
SELECT city, COUNT (customer_id) AS customers_quantity
 FROM Customer 
WHERE city != 'Knoxville' AND city != 'Stockton'
GROUP BY City
GROUP BY City;

/*Exercício 12: O número de produtos descontinuados
Exercício: Para cada categoria, encontre o número de produtos descontinuados. 
Mostre apenas as categorias com pelo menos três produtos descontinuados.
Classifique as linhas pelo número de produtos descontinuados em ordem decrescente. 
Exiba duas colunas: name (o nome da categoria) e discontinued_products_number.*/

SELECT name, COUNT(product_id) AS discontinued_products_number
 FROM Category
INNER JOIN Product 
 ON Category.category_id = Product.category_id
WHERE discontinued IS TRUE 
/*GROUP BY category.name 
HAVIN COUNT(product_id) > 3
ORDER BY COUNT (product_id) DESC;
*/
ORDER BY name,discontinued_products_number DESC 
GROUP BY name;