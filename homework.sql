SHOW DATABASES;

USE classicmodels;

 SELECT YEAR (orderDate) AS YEAR, COUNT(orderNumber) FROM orders GROUP BY orderNumber;
 
 SELECT * FROM payments  LIMIT 10;
 
  
 SELECT
   firstname,lastName 
FROM
    employees
WHERE
    officeCode=1 AND jobTitle='sales rep';
    
 SELECT CONCAT (contactlastname,',',contactfirstName) AS 'fullName' FROM customers; 
 
 SELECT UPPER (CONCAT (contactFirstName,' ',contactLastName) AS 'fullname',REVERSE (country),REPLACE(state,'' FROM customers; 
    
    