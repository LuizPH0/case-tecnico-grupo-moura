SELECT
    p.productname,
    od.quantity,
    od.unitprice AS preco_venda,
    p.unitprice AS preco_tabela,
    (p.unitprice - od.unitprice) AS diferenca
FROM order_details od
INNER JOIN products p
    ON od.productid = p.productid
WHERE od.unitprice < p.unitprice
ORDER BY diferenca DESC;