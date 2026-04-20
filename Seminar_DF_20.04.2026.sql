/*5.Display the total number of times products were sold in quantities of 4 kg or more.*/
SELECT COUNT(*) AS total_sales_count
FROM order_details od
JOIN products p on od.product_code=p.product_code
WHERE quantity >= 4 and unit='kg';

/*6.Display the product code and how many times it was sold (new column:
Sales_Count). Sort the result in descending order by Sales_Count.*/
SELECT product_code, COUNT(*) AS sales_count
FROM order_details
GROUP BY product_code
ORDER BY 2 DESC;

SELECT product_code, COUNT(od.product_code) AS sales_count
FROM order_details od RIGHT JOIN Products p ON od.product_code=p.product_code
GROUP BY product_code
ORDER BY 2 DESC;

/*7.Display the daily turnover (total sales revenue) of each employee.*/
SELECT e.employee_name, o.order_date, SUM(D.quantity * P.unit_price) AS daily_turnover
FROM order_details D
JOIN orders o ON D.order_number = o.order_number
JOIN employees e ON o.EGN = e.EGN
JOIN products p ON D.product_code=d.product_code
GROUP BY e.employee_name, o.order_date
ORDER BY daily_turnover DESC;

/*8.Display the product code and the total quantity sold, where the order number is
between 3 and 10 (inclusive).*/
SELECT D.product_code, SUM(D.quantity) AS total_quantity
FROM order_details D
JOIN orders o ON D.order_number = o.order_number
WHERE o.order_number BETWEEN 3 AND 10
GROUP BY D.product_code;

/*9. Display the minimum quantity sold (new column: Minimum_Quantity) for each
product, but only for products with code 11, 14, 15, or 22. Sort the result by
Minimum_Quantity.*/
SELECT product_code, MIN(quantity) AS minimum_quantity
FROM order_details D
WHERE product_code IN (11, 14, 15, 22)
GROUP BY product_code
ORDER BY minimum_quantity ASC;

/*10.Find the product with the highest unit price.*/
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 1;

/*11.Display the customers who have placed more than 18 orders. After obtaining the
result, perform a verification query for one customer – for example FOLKO – to
check the individual orders they placed (count the rows in the result).*/
SELECT C.CustomerID, C.CompanyName, COUNT(OrderID) AS OrderCount
FROM Orders O JOIN Customers C ON O.CustomerId=C.CustomerID
GROUP BY C.CustomerID, C.CompanyName
HAVING OrderCount > 18;

SELECT COUNT(*)
FROM Orders
WHERE CustomerID = 'FOLKO';

/*12.Display the top 15 orders with the highest total order value. Wrap the table name
Order Details in backticks ` `. => `Order Details`.*/
SELECT od.OrderID, o.CustomerID, o.OrderDate, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)),2) AS TotalValue
FROM `Order Details` od
JOIN Orders o ON od.OrderID= o.OrderID
GROUP BY od.OrderID, o.CustomerID, o.OrderDate
ORDER BY TotalValue DESC
LIMIT 15;
 