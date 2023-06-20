SELECT * FROM customers;
SELECT * FROM category;
SELECT * FROM orderdetails;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM shippers;
SELECT * FROM suppliers;

SELECT CustomerID as CUS FROM CUSTOMERS;
SELECT CustomerID, concat(FirstName,' ', LastName) as Full_name_of_customer, timestampdiff(YEAR,Date_of_Birth,CURDATE()) as Present_age_of_customer FROM CUSTOMERS;

SELECT LENGTH(FirstName) as Num_of_char_in_FN FROM customers;
SELECT count(FirstName) as N0_of_customers FROM customers;
SELECT FirstName, LENGTH(FirstName) as Num_of_char_in_FN, count(FirstName) as N0_of_customers 
FROM customers
group by FirstName;
