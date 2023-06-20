USE guvi;

SELECT * FROM customers;
SELECT * FROM category;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM shippers;
SELECT * FROM suppliers;

#1
SELECT CustomerID, 
concat(FirstName,' ', LastName) as Full_name_of_customer, 
timestampdiff(YEAR,Date_of_Birth,CURDATE()) as Present_age_of_customer 
FROM CUSTOMERS;

#2
SELECT FirstName, LENGTH(FirstName) as Num_of_char_in_FN, count(FirstName) as N0_of_customers 
FROM customers
group by FirstName;

#3
SELECT count(distinct C.CustomerID) as Total_customer
FROM customers C JOIN orders O on C.CustomerID = O.CustomerID
WHERE country= 'United States' AND orderdate >= '2021-04-01' AND orderdate <='2021-06-30';

#4
SELECT year(OrderDate) as Years,
week(OrderDate) as Weeks,
count(*) as Total_orders
FROM orders
WHERE year(OrderDate) in (2020,2021)
GROUP BY year(Orderdate),week(orderDate)
ORDER BY year(Orderdate) ASC ,week(orderDate) ASC;

#5
SELECT c.CustomerID ,substring_index(Email,"@",-1) as Email_domain,
concat(c.FirstName," ",c.LastName," ","was born on"," ",date_format(c.Date_of_Birth,"%D %M %Y")) as Descriptions 
FROM customers c
JOIN orders o on c.CustomerID
ORDER BY OrderDate desc,CustomerID ASC;

#6
SELECT dayname(OrderDate) as Days,
count(*) as total_orders 
FROM orders
GROUP BY dayname(OrderDate)
ORDER BY count(*) desc;

#7
SELECT o.OrderID,
o.CustomerID,
avg(Total_order_amount) as average_revenue 
FROM orders o
WHERE datediff(ShipDate,OrderDate)=3
GROUP BY o.orderID,o.CustomerID
ORDER BY o.orderID asc;

#8
SELECT Country,
	case
		when count(*)>1 then concat("There are"," ",count(*)," ","suppliers from"," ",Country)
        else concat("There is 1 Supplier from"," ",Country)
	end as Details
FROM suppliers
GROUP BY country
ORDER BY country asc;