/*Listar os nomes dos assinantes, seguido dos dados do endereço e os telefones 
correspondentes.  */

SELECT  * 
FROM Assinate
INNER JOIN endereco
ON  Assinatura.ass_end = Endereco.ass_end
INNER JOIN telefone
ON Enderco.end_fone = Telefone.end_fone

/* Listar os nomes dos assinantes, seguido do seu ramo, ordenados por ramo e 
posteriormente por nome.  */

SELECT nome, ds_ramo
FROM assinante
INNER JOIN rammo_atividade 
ON assinante.ass_ramo = ramo.ass_ramo
ORDER BY ramo ASC,nome ASC;

/*Listar os assinantes do município de Pelotas que são do tipo residencial.*/

SELECT A.nome,M.cd_municio,E.complemento
 FROM Assinante A
INNER JOIN Endereco E
	ON   A.ass_end = E.ass_end
INNER JOIN Municipio M
	ON  E.end_munic = M.end_munic
WHERE   cd_municio = 'Pelotas' 
    AND complemento = 'Residencial'
	
/*Listar os nomes dos assinantes que possuem mais de um telefone.  */

SELECT A.nm_assinante,E.cd_endereco,COUNT(T.n_fone) AS maior
  FROM Assinate A
INNER JOIN Endereco E
  ON A.ass_end = E.ass_end
INNER JOIN Telefone T
  ON E.end_fone = T.end_fone
GROUP BY 
   A.ass_end, T.end_fone
HAVING 
  COUNT(T.n_fone) > 1

/*Listar os nomes dos assinantes seguido do número do telefone, tipo de assinante 
comercial, com endereço em Natal ou João Câmara.*/

SELECT A.nm_assiante,
       T.nm_telefone,
	   TP.tipo_assinante,
	   E.cd_endereco
FROM Assinante A
INNER JOIN Tipo_assinante TP
 ON A.ass_tipo = TP.ass_tipo
INNER JOIN Endereco E 
 ON A.ass_end = E.ass_tipo
INNER JOIN Telefone T
 ON E.end_fone = T.end_fone
WHERE
      TP.tipo_assinatura = 'Comercial' 
  AND E.cd_endereco = 'Natal' 
  OR  E.cd_endereco = 'Joao camara'
GROUP BY 
   A.nm_assinante