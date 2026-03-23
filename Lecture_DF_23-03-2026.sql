#1
/*(7)
(1) orders.CutsomerIc = cutomers.CustomerId
(2) employees.EmployeeId = orders.EmployeeId
(3) shippers.ShipperId = orders.ShipVia
(4) categories.CategoryId = products.CategoryId
(5) suppliers.SupplierId = products.SupplierId
(6) products.ProductId = orderdetails.ProductsId
(7) orders.OrderId = orderderails.OrderId
*/ 

USE northwind;

#Clients and their orders
SELECT
    c.ContactName,
    o.OrderDate,
    o.OrderId
FROM
    customers c
JOIN 
    orders o ON c.customerId = o.customerId
ORDER BY 
    c.ContactName ASC;

#Clients and their orders from january 1997
select
	*
from
	customers join orders
	on customers.customerId = orders.customerId
where
	year(orders.orderDate) = 1997 and month(orders.orderDate) = 1;

#Employees and their orders from january 1997
select
	*
from
	employees join orders
	on employees.employeeId = orders.employeeId
where
	year(orders.orderDate) = 1997 and month(orders.orderDate) = 1;

#Show company names, names of employees and date order form january 1997
select
	c.companyName, concat(e.firstName, '', e.lastName) as EmployeeName, o.orderDate
from
	employees e join orders o
    on e.employeeId = o.employeeId
    join customers c 
    on c.customerId = o.customerId
where
	year(o.orderDate) = 1997 and month(o.orderDate) = 1;

#Names of the clients, who have ordered product with name "Queso Cabrales"
select distinct
	c.companyName, c.phone
from
	customers c join orders o
	on c.customerId = o.customerId
	join `order details` od
	on o.OrderId = od.OrderId
	join products p
	on p.ProductId = od.ProductId
where
	p.productName = 'Queso Cabrales';