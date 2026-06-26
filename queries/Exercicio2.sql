-- ==================================================
-- EXERCÍCIO 2
SELECT
    e.FirstName,
    e.LastName,
    COUNT(DISTINCT o.OrderID) AS Pedidos,
    ROUND(
        SUM(
            od.UnitPrice *
            od.Quantity *
            (1 - od.Discount)
        ),2
    ) AS Faturamento
FROM employees e
JOIN orders o
    ON e.EmployeeID = o.EmployeeID
JOIN order_details od
    ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 2022
AND e.FirstName='Robert'
AND e.LastName='King'
GROUP BY
e.EmployeeID,
e.FirstName,
e.LastName;