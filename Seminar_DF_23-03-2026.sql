SELECT * FROM northwind.`order details`;

USE Northwind;

SELECT OrderId, year(OrderDate)
FROM Orders;

#1
SELECT
	ProductName, UnitPrice, UnitsInStock
FROM
	Products
WHERE	
	UnitPrice > 30 AND UnitsInStock < 10;

#2
SELECT	
	OrderId, OrderDate, RequiredDate, ShippedDate
FROM
	orders
WHERE
	ShippedDate IS NULL;


#3
SELECT
	C.CustomerID, C.CompanyName, C.Address, C.City
FROM
	customers AS C
WHERE	
	C.City NOT IN ('London', 'Paris');

#4
SELECT
	P.ProductName, C.CategoryName
FROM 
    Products AS P
INNER JOIN 
    Categories AS C ON P.CategoryID = C.CategoryID
ORDER BY
	C.CategoryName ASC;

#5
SELECT 
    O.OrderID, DATE_FORMAT(ShippedDate, '%d.%m.%Y') AS ShippedDate, C.CompanyName, O.ShipCountry
FROM
    Orders AS O
        INNER JOIN
    Customers AS C ON O.CustomerID = C.CustomerID
WHERE
	O.ShipCountry = 'France'
AND
	O.ShippedDate IS NOT NULL
ORDER BY
	ShippedDate DESC;
    
#6
SELECT
	O.OrderID, O.OrderDate, C.CompanyName
FROM
	Orders AS O
INNER JOIN 
	Customers AS C ON O.CustomerId = C.CustomerId
WHERE
	YEAR (O.OrderDate) = 1997;
    
#7
SELECT
	OrderID, OrderDate, RequiredDate, ShippedDate, CustomerID
FROM 
	Orders
WHERE
	ShippedDate BETWEEN '1997-03-25' AND CURDATE();
	
#8
SELECT 
	*
FROM 
	Orders
WHERE 
	Order_Date >= '2026-01-10'
    
#9
SELECT
	product_code, product_name, unit_price
FROM 
	products
WHERE 
	product_name IN ('Tomatoes', 'Potatoes', 'Onions');
    
#10
SELECT DISTINCT
	city
FROM
	employees
ORDER BY
	City ASC;
	