USE COMERCIO_OLTP
GO

DROP VIEW RELATORIO_VENDAS
GO

CREATE VIEW RELATORIO_VENDAS AS
SELECT C.IDCLIENTE AS IDCLIENTE,
	   V.IDVENDEDOR AS IDVENDEDOR,
	   P.IDPRODUTO AS IDPRODUTO,
	   FO.IDFORNECEDOR AS IDFORNECEDOR,
	   N.IDNOTA AS IDNOTA,
	   IDFORMA AS IDFORMA,
	   I.QUANTIDADE AS QUANTIDADE,
	   (I.QUANTIDADE * P.CUSTO_MEDIO) AS CUSTO_TOTAL,
	   (I.TOTAL - (I.QUANTIDADE * P.CUSTO_MEDIO)) AS LUCRO_TOTAL,
	   I.TOTAL AS TOTAL_ITEM,
	   N.DATA AS DATA
FROM NOTA_FISCAL N 
INNER JOIN ITEM_NOTA I ON ( N.IDNOTA = I.ID_NOTA_FISCAL )
INNER JOIN CLIENTE C ON ( C.IDCLIENTE = N.ID_CLIENTE )
INNER JOIN VENDEDOR V ON ( V.IDVENDEDOR = N.ID_VENDEDOR )
INNER JOIN PRODUTO P ON ( P.IDPRODUTO = ID_PRODUTO )
INNER JOIN FORMA_PAGAMENTO F ON ( F.IDFORMA = N.ID_FORMA )
INNER JOIN FORNECEDOR FO ON (FO.IDFORNECEDOR = P.ID_FORNECEDOR) 
GO

SELECT * FROM RELATORIO_VENDAS
ORDER BY IDNOTA
GO

