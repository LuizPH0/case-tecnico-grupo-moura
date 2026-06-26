WITH vendas AS (
    SELECT
        s.companyname,
        YEAR(o.orderdate) AS ano,
        SUM(od.unitprice * od.quantity * (1 - od.discount)) AS faturamento
    FROM orders o
    JOIN order_details od ON o.orderid = od.orderid
    JOIN products p      ON p.productid = od.productid
    JOIN suppliers s     ON s.supplierid = p.supplierid
    GROUP BY s.companyname, YEAR(o.orderdate)
)
SELECT
    companyname,
    SUM(CASE WHEN ano = 2020 THEN faturamento ELSE 0 END) AS faturamento_2020,
    SUM(CASE WHEN ano = 2021 THEN faturamento ELSE 0 END) AS faturamento_2021,
    SUM(CASE WHEN ano = 2021 THEN faturamento ELSE 0 END) - 
    SUM(CASE WHEN ano = 2020 THEN faturamento ELSE 0 END) AS diferenca
FROM vendas
GROUP BY companyname
ORDER BY diferenca DESC;