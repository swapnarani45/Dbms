SHOW DATABASES;

USE classicmodels;

SHOW TABLES;

# The SELECT statement allows you to read data from one or more tables
-- Select Statements Syntax

-- SELECT select_list
-- FROM table_name;

SELECT * FROM customers;   /* selection  - select all records */

SELECT * from employees;

SELECT lastname from employees;   /* projection -- select specific coloumns */

SELECT lastname,firstname,jobTitle from employees;

#MySQL WHERE clause
-- The WHERE clause allows you to specify a search condition for the rows 
-- returned by a query.
# Syntax :
/*  SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;  */
    
SELECT lastname,firstname,jobTitle from employees where jobTitle='Sales Rep';

 SELECT * FROM orderdetails WHERE quantityOrdered>=25;
/* The search_condition is a combination of one or more predicates using the 
logical operator AND, OR and NOT. */

-- example uses the WHERE clause to find employees whose job titles are Sales Rep and 
-- office codes are 1
SELECT lastname,firstname,jobTitle,officeCode from employees where 
 jobTitle='Sales Rep' AND officeCode=1;
 
 SELECT * FROM orderdetails WHERE quantityOrdered>=25 AND priceEach>100;
 
#this query finds employees whose job title is Sales Rep or employees who locate the office with office code 1:
 
SELECT lastname,firstname,jobTitle,officeCode from employees where 
 jobTitle='Sales Rep' OR officeCode=1;
 
# The BETWEEN operator returns TRUE if a value is in a range of VALUES#
#Syntax: expression BETWEEN low AND high#

#query finds employees who locate in offices whose office code is from 1 to 3:
SELECT lastname,firstname,jobTitle,officeCode from employees where 
 officeCode BETWEEN 1 AND 3 ORDER BY officeCode;
-- query to list the orders done in first quarter of 2004
 SELECT * from orders  WHERE shippedDate BETWEEN '2004-01-01' AND '2004-03-31';
 
 #MYSQL with the like operator
 [12:45 PM] Raj (Guest)
    # MySQL WHERE with the LIKE operator

 /* The LIKE operator evaluates to TRUE if a value matches a specified pattern.
 To form a pattern, you use % and _ wildcards.
 The % wildcard matches any string of zero or more characters
 while the _ wildcard matches any single character. */

 -- query finds employees whose last names end with the string 'son':
SELECT lastname,firstname,jobTitle from employees WHERE lastname LIKE '%son';

SELECT lastname,firstname,jobTitle from employees WHERE firstname LIKE 'A%';


SELECT lastname,firstname,jobTitle from employees WHERE firstname LIKE 'A%'OR firstname LIKE 'S%';


SELECT lastname,firstname,jobTitle from employees WHERE firstname NOT  LIKE 'A%';

#MySQL WHERE clause with the IN operator

 

-- The IN operator returns TRUE if a value matches any value in a list.
-- Syntax
-- value IN (value1, value2,...)
-- IN condition is used to help reduce the need to use multiple OR conditions in a SELECT, INSERT, UPDATE, or DELETE statement.
 
 SELECT lastname,firstname,jobTitle,officeCode from employees WHERE officeCode IN(1,3,7) orderby officeCode;
 
 
 SELECT * FROM customers WHERE contactLastName IN('young','smith');
 
 SELECT * FROM customers WHERE contactLastName not IN('taylor','brown');
 
#MySQL WHERE  clause with the IS NULL operator
-- Null -> Absence of Data or Data is missing

 

/* To check if a value is NULL or not, you use the IS NULL operator, 
not the equal operator (=). The IS NULL operator returns TRUE if a value is NULL.

 

Syntax: 
value IS NULL  */
 
SELECT lastName,firstName,reportsto FROM employees WHERE reportsto IS NULL;
 
 SELECT * FROM orders WHERE comments="";/*comments is null*/
 
 SELECT * FROM customers WHERE phone=0;  /*phone is null*/
 
 #WHERE clause with comparison operators
-- >, <, >=, <=, =, <> or != (not equals)

SELECT firstName,lastName,jobTitle FROM employees WHERE jobTitle <> 'Sales Rep';

SELECT lastname, firstname, officeCode FROM employees
WHERE officecode > 5; 
 
 #MySQL ORDER BY clause
-- When you use the SELECT statement to query data from a table, 
-- the result set is not sorted. It means that the rows in the result set can 
-- be in any order.
 
-- To sort the result set, you add the ORDER BY clause to the SELECT statement
/* Syntax:
SELECT   select_list FROM    table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DES*/
   
SELECT contactLastName,contactFirstName FROM customers order by contactLastName DESC ;
 
SELECT productCode, productName, buyPrice from products order by buyPrice DESC;
 
 SELECT productCode, productName,quantityInStock,buyPrice from products order BY 3  DESC;
 
 -- multi level sorting
 SELECT contactLastName,contactFirsttName FROM customers ORDER BY contactFirstName IN ASC ,contactLastName IN DESC;
 
 SELECT jobTitle,firstName FROM employees ORDER BY 1,2;
 
 SELECT jobTitle,firstName FROM employees ORDER BY jobTitle,firstName;
 
 #  ORDER BY to sort a result set by an expression   
 
 SELECT orderNumber,orderLineNumber,quantityOrdered * priceEach FROM orderdetails;
 

    -- Expressions with column alias names    
SELECT orderNumber,orderLineNumber,quantityOrdered * priceEach AS subtotal FROM orderdetails ORDER BY subtotal DESC ;
    
 # MySQL DISTINCT clause

 

-- When querying data from a table, you may get duplicate rows. 
-- In order to remove these duplicate rows, 
-- you use the DISTINCT clause in the SELECT statement.

 

/* Syntax: SELECT DISTINCT
    select_list
        FROM
    table_name;  */
	 
	 SELECT lastname FROM employees ORDER BY lastname;   
    
 SELECT  distinct lastname FROM employees ORDER BY lastname;   
    
-- Distinct with multiple columns
    
SELECT state,city FROM customers WHERE state IS not NULL ORDER BY state,city;    
    
 SELECT DISTINCT emp_id,empname,city FROM emp;
 
 # LIMIT clause
-- is used to retrieve records from one or more tables in a database and limit the number
--  of records returned based on a limit value.
    
  SELECT * FROM customers;
  
  SELECT * FROM customers LIMIT 5;
    
     SELECT * FROM customers ORDER BY contactLastName LIMIT 5;
     # The offset keyword allows you to offset the no. of record returned by
-- the LIMIT clause.

      SELECT * FROM customers LIMIT 5 OFFSET 2;
    
SELECT DISTINCT state FROM customers WHERE state IS NOT NULL LIMIT 5;    
    
    # MySQL AND operator
 /* The AND operator is a logical operator that combines two or more Boolean 
 expressions and returns true only if both expressions evaluate to true. 
 The AND operator returns false if one of the two expressions evaluate to false. */

 

 -- Syntax: boolean_expression_1 AND boolean_expression_2
 
 SELECT 1=0 AND 1/0;
 
 SELECT
    customername,
    country,
    state
FROM
    customers
WHERE
    country = 'USA' AND state = 'CA'AND creditLIMIT >=100000;
    
SELECT
    customername,
    country,
    state
FROM
    customers
WHERE
    country = 'USA' AND state = 'CA';  
	 
	 # The MySQL OR operator combines two Boolean expressions and returns true when
# either condition is true. 
-- Operator Precedence OR then AND 
    
SELECT customername,    country
FROM customers
WHERE country = 'USA' OR country = 'France'; 
 
 SELECT customername, country, creditLimit
FROM customers
WHERE(country = 'USA'OR country = 'France')
      AND creditlimit > 100000;
 
 # MySQL alias for columns
-- Sometimes, column names are so technical that make the query’s output very
-- difficult to understand. To give a column a descriptive name, you can use a
-- column alias.
 /* Syntax:
SELECT
   [column_1 | expression] AS descriptive_name
FROM table_name;  */
 
 SELECT CONCAT (lastname,',',firstName) AS 'fullName' FROM employees;
 
 -- Alias names can be used order by , group by & having clauses
 #Alias can be given to tables
 
 SELECT e.firstName,e.lastName FROM employees e ORDER BY e.firstName;
 
# MySQL GROUP BY clause
 -- The GROUP BY clause groups a set of rows into a set of summary rows by values
 -- of columns or expressions. The GROUP BY clause returns one row for each group.
 -- In other words, it reduces the number of rows in the result set.

 /* You often use the GROUP BY clause with aggregate functions such as SUM, AVG,
 MAX, MIN, and COUNT. The aggregate function that appears in the SELECT clause
 provides information about each group. */
 
/* Syntax:
 SELECT c1, c2,..., cn, aggregate_function(ci)
FROM table
WHERE where_conditions
GROUP BY c1 , c2,...,cn; */ 
 
SELECT STATUS FROM orders;

 SELECT STATUS FROM orders GROUP BY STATUS;
 
  SELECT STATUS, COUNT(*)AS total FROM orders GROUP BY STATUS ;
 
 SELECT COUNT(*) AS totalCount FROM orders;
 
 SELECT SUM(quantityInStock) 'totalQuantity' FROM products;
 
SELECT productLine,SUM(quantityInStock) FROM products GROUP BY productLine;

 /* The GROUP BY clause is often used with an aggregate function to perform calculation and
return a single value for each subgroup. */
 
 SELECT YEAR (orderDate) AS YEAR, COUNT(orderNumber) FROM orders GROUP BY YEAR;
 

    -- Design a query to display total no. of customers in each city
SELECT city,COUNT(*) AS 'totalcustomers'  FROM customers GROUP by city;
 
 SELECT COUNT('sales rep') as total FROM employees WHERE jobTitle='sales rep';
 
SELECT productLine ,MAX(buyPrice) FROM products GROUP BY productLine;
 
 # MySQL HAVING clause

 -- The  HAVING clause is used in the SELECT statement to specify filter
 -- conditions for a group of rows or aggregates
 -- The HAVING clause is often used with the GROUP BY clause to filter groups
 -- based on a specified condition.

 /* Syntax :
 SELECT select_list FROM table_name
WHERE search_condition
GROUP BY group_by_expression
HAVING group_condition;  */
 
SELECT city,COUNT (*) TotalCustomers  FROM customers group BY city HAVING totalcustomers >= 4; 
 
 SELECT ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM orderdetails GROUP BY ordernumber
HAVING total > 1000;  
 
 SELECT ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM orderdetails GROUP BY ordernumber
HAVING total > 1000 AND itemsCount>100
 
 
 SELECT productline,SUM(buyprice) FROM products
 GROUP BY productline WITH ROLLUP;  -- rollup for grand total at end

 

SELECT city,COUNT(*) totalCustomers FROM customers
 GROUP BY city WITH ROLLUP;

 


 #ROLLUP
-- ROLLUP” is a modifier that is used with GROUP BY clause.
-- Mainly, it causes the summary output to include extra rows that
-- represent higher-level summary operations.
 
SELECT city,COUNT (*) TotalCustomers  FROM customers GROUP  BY city WITH ROLLUP; 
 
SELECT YEAR (orderDate) AS YEAR, COUNT(orderNumber) FROM orders GROUP BY YEAR WITH ROLLUP; 
 
SELECT YEAR(orderDate) AS Year,STATUS ,COUNT(orderNumber) from orders
             group by Year DESC,STATUS ;
# Scalar Functions
-- MySQL Scalar Functions allow you to perform different calculations
-- on data values.
-- These functions operate on single rows only and produce one result
-- per row.
/* String functions – functions that perform operations on character values.
Numeric functions – functions that perform operations on numeric values.
Date functions – functions that perform operations on date values.
Conversion functions – functions that convert column data types.
NULL-related Functions – functions for handling null values.
*/            
   
-- String Functions   
 SELECT LENGTH('hello world');
 
 SELECT CONCAT('swapna','rani');
 
 SELECT INSTR('jdbc','b'); -- Return location of substring in a string
 
 SELECT LTRIM('    sql'); -- truncates or removes extra spaces

  SELECT RTRIM('sql      '); 
 
 SELECT SUBSTR('JDBC',3,1);
 
 SELECT UPPER (Customername,city) FROM customers;
 
 SELECT LOWER (Customername)Customername, MID(city,3,1) Shortcity FROM customers;
 
 SELECT CONCAT (contactlastname,',',contactfirstName) AS 'fullName' FROM customers; 
 
 SELECT UPPER (CONCAT (contactFirstName,' ',contactLastName) AS 'fullname',REVERSE (country),REPLACE(state,'ny','ka') FROM customers; 
 
 SELECT NOW();
 
 SELECT CURRENT_DATE();
 
 SELECT sysdate();
 
 SELECT productName,buyPrice,NOW() perDate FROM products; 
 
 -- DATEDIFF function calculates the number of days between two dates
 
 SELECT DATEDIFF(CURRENT_DATE,'2021-01-02');
 
 SELECT ordernumber,DATEDIFF(requireddate,shippedDate)daysleft FROM orders ORDER BY daysleft DESC;
 
SELECT ordernumber,DATEDIFF(requireddate,shippedDate)remainingDays FROM orders WHERE STATUS='in Process' ORDER BY remainingDays DESC;
 
 
    -- The DAY() function returns the day of the month of a given date. 

 SELECT DAY(NOW());
 
 SELECT DAY(LAST_DAY('2021-02-01'));
 [10:50 AM] Raj (Guest)
    
-- return the number of orders by day number in 2004.

 SELECT DAY(orderDate) DAYOFMONTH ,COUNT(*) FROM orders WHERE YEAR(orderdate)=2004 GROUP BY DAYOFMONTH 
 
 SELECT DAYNAME(NOW()),weekday(NOW());  -- weekday starts from monday -0
 
 -- numeric functions
 -- The ABS() function is a mathematical function that returns the absolute (positive)
-- value of a number.
 
 SELECT ABS(-10),ABS(10),ABS(-9+4);
 
 SELECT buyPrice-MSRP,ABS(buyPrice-MSRP) FROM products;
 
 -- The ROUND() is a mathematical function that allows you to round a number to a specified
-- number of decimal places.
 -- The number of decimal places ( d) can be positive or negative.
-- If it is negative, then the d digits left of the decimal point of the number n becomes zero.
select ROUND(20.1),ROUND(23.7896,3);
 
 SELECT ROUND (1234.987,-1);
 
SELECT productCode,AVG(quantityordered*priceEach) average_item_value FROM orderdetails GROUP BY productCode;
 
SELECT productCode,round(AVG(quantityordered*priceEach)) average_item_value FROM orderdetails GROUP BY productCode;
  
 -- ceil() and floor()
 -- The CEIL() function takes an input number and returns 
-- the smallest integer greater than or equal to that number.
-- FLOOR() -Returns the largest integer value not greater than the argument

 SELECT CEIL(58.9),FLOOR(58.9);
 
 SELECT productLine,CEIL(AVG(msrp))avgmsrp FROM products GROUP BY productLine ORDER BY avgmsrp;
 

    
# Conversion functions
-- FORMAT() -- Converts number in to a String
-- DATE_FORMAT() -Converts DATE  in to a String
-- CONVERT()  - Converting String to Number

 SELECT DATE_FORMAT(NOW(),'%y-%m -%d');
 
SELECT FORMAT(12344545,1);
 
 SELECT CONVERT('-200',unsigned integer);
 
 SELECT CONVERT('2020-05-05',DATE ),CONVERT('07:53:45',TIME);

 -- IFNULL()  - Return the specified value IF the expression is NULL,
-- otherwise return the expression
 
 SELECT IFNULL(NULL,'hello ');
 
 SELECT customername,city,state FROM customers;
 
 SELECT customername,city,ifnull(state,'KA') FROM customers;
 
 SELECT AVG(buyPrice) FROM products;
 
  SELECT AVG(IFNULL (buyPrice,0)) FROM products;
 
 
 
 
 
 
 
 
 
 
 
 ''classicmodels