/* Exiba a placa e o nome dos donos de todos os veículos. */

SELECT V.placa, C.nome
 FROM veiculo V
INNER JOIN cliente C
 ON V.cliente_cpf = C.cpf

/*Exiba o CPF e o nome do cliente que possui o veiculo de placa “JJJ-2020”.  */

SELECT C.cpf,C.nome,V.placa
 FROM Cliente C 
INNER JOIN Veiculo V
 ON  C.cpf = V.cliente_cpf
WHERE placa = 'JJJ-2020'

/*Exiba a placa e a cor do veículo que possui o código de estacionamento 1.*/

SELECT V.placa,V.cor, E.cod
  FROM veiculo V 
INNER JOIN estacionamento E 
  ON V.placa = E.veiculo_placa
WHERE E.cod = 1;

/* Exiba a placa e o ano do veículo que possui o código de estacionamento 1. */

SELECT V.placa,V.ano
 FROM veiculo V 
INNER JOIN estacionamento E 
  ON V.placa = E.veiculo_placa
WHERE E.cod = 1;

/* Exiba a placa, o ano do veículo e a descrição de seu modelo, se ele possuir ano a partir de 
2000. */

SELECT V.placa, V.an, M.desc_2
 FROM Veiculo V
INNER JOIN Modelo M
  ON M.codMod = V.modelo_codMod
WHERE ano >= 2000

/*Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa 
“JEG-1010”.*/

SELECT P.ender,E.dtEntrada,E.dtSaida
 FROM Patio P
INNER JOIN Estacionamento E
 ON P.num = E.patio_num
INNER JOIN Veiculo V
 ON V.placa = E.veiculo_placa
WHERE placa = 'JEG-1010'

/*Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2. */

SELECT C.nome
 FROM Cliente C 
INNER JOIN Veiculo V
  ON C.cpf = V.cliente_cpf
INNER JOIN Estacionamento E
  ON V.placa = E.veiculo_placa
WHERE E.cod = 2

/*Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.*/

SELECT C.cpf
 FROM Cliente C
INNER JOIN Veiculo V 
 ON C.cpf = V.cliente_cpf
INNER JOIN Estacionamento E 
 ON V.placa = E.veiculo_placa
WHERE E.cod = 3

/* Exiba a descrição do modelo do veículo cujo código do estacionamento é 2.  */

SELECT M.desc_2
 FROM Modelo M 
INNER JOIN Veiculo V
 ON M.codMod = V.modelo_codMod
INNER JOIN Estacionamento E
 ON E.veiculo_placa = V.placa
 WHERE E.cod = 2

 /* Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos. */

 SELECT V.placa, C.nome, M.desc_2
  FROM Veiculo V 
INNER JOIN Cliente C 
  ON V.cliente_cpf = C.cpf
INNER JOIN Modelo M 
  ON M.codMod = V.placa