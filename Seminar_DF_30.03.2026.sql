USE northwind;

## Клиенти без поръчки
select customers.* from customers
left join orders on customers.customerID=orders.customerID
where orders.orderID is null;

## Стоките, които не са били поръчани
select products.* from 
products left join `order details` as od
on products.productID=od.productID
where od.productID is null;

## Добавяне на нова стока с име ProductName: M&M и цена UnitPrice: 2.59
insert into products (ProductName, UnitPrice)
values ('M&M', 2.59);

## Добавяне на нова стока с данни за всичк колони в избраната таблица
insert into products
values (, , , , , , , );

## Клиенти без поръчки (с подзаявка)
## тези клиенти, чието ID  не просъства в таблицата с поръчки
select * from customers
where customerId not in (select customerId from orders);

##	Стоките, които не са били поръчани (с подзаявка)
select * from products
where productId not in (select productId from `order details`);

## Имената на клиентите, които не са правили поръчки през 1998
/*Грешно решение
select customers.* from
customers left join orders
on customers.customerId=orders.customerId
where orders.orderId is null or year(orderDate) != 1998;

select customers.* from
customers left join orders
on customers.customerId=orders.customerId
where orders.orderId is null or year(orderDate) <> 1998;
*/

	# Клиентите, които не присъстват в списъка от клиенти,м които са правили поръчки през 1998
	select * from customers
	where customerId not in
	(select customerId from orders
	where year(orderDate) = 1998);

## Създаване на таблица
/*
create table titles (
име_колона тип_данни,
име_колона тип_данни,
)
*/

CREATE TABLE `northwind`.`titles`
(`titleId` INT prIMAry key	AUTO_INCREMENT ,
 `title` VARCHAR(40) ,
 `description` VARCHAR(250) 
 );

/*
int,
char(5),	r i _ _ always 5 bytes
varchar(10);	r i _ _  3 bytes or depening on the length of the name
*/

## Добавяне на две длъжности
insert into titles (title)
values
('manager'),
('sales rep');


## Обновява длъжностната харектеристика на менджър
update titles
set 
description = 'Длъжностната харектеристика на мениджър'
where title = 'manager';








