SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS SaleMonth, 
    ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalSales
FROM Orders o
JOIN `Order Details` od ON o.OrderID = od.OrderID  -- Fixed the join logic here
GROUP BY SaleMonth
ORDER BY TotalSales DESC
LIMIT 1;