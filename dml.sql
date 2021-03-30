#DML Operations
-- The INSERT statement allows you to insert one or more rows into a table. The following illustrates the syntax of the INSERT statement:

 /*INSERT INTO table(c1,c2,...)
VALUES (v1,v2,...); */

DESC departments;

#insert demo without specifying column names

INSERT INTO departments VALUES(100,'technical');
INSERT INTO departments VALUES(101,'sales');
INSERT INTO departments VALUES(102,'HR');
INSERT INTO departments VALUES(103,'production');
INSERT INTO departments VALUES(104,'travel');

SELECT * FROM departments;
DESC departments;

#insert demo with specifying column names

INSERT INTO user (NAME,email) VALUES ('andy','andy@abc.com');
INSERT INTO user (NAME,email) VALUES ('john','john@abc.com');
INSERT INTO user (NAME,email) VALUES ('mike','mike@abc.com');
INSERT INTO user (NAME,email) VALUES ('adam','adam@abc.com');
INSERT INTO user (NAME,email) VALUES ('arvan','arvan@abc.com');

SELECT * FROM user;

DESC emp;

INSERT INTO emp(first_name,last_name,DOB,STATUS,description,DOJ,dept_id) VALUES ('swapna','rani','1998-07-09',
1,'java JDBC',100);


SELECT * FROM emp;

DESC people;

INSERT INTO people(last_name,DATE_of_joining,middle_name,first_name,salary,birthday,phone_number,gender)
VALUES('Gosling','2021-01-08','james','java',10000.00,'1998-09-07','+91 123456789','male');

INSERT INTO people(last_name,DATE_of_joining,middle_name,first_name,salary,birthday,phone_number,gender)
VALUES('Gosling','2021-01-08','james','java',9000.00,'1998-09-07','123456789','bhu');



SELECT * FROM people;

DESC user;

INSERT INTO user(id,NAME,email,doj)VALUES(1,'joe','joe@abc.com','1998-09-07');

SELECT * FROM user;

#Update Statement

 

/*
The UPDATE statement updates data in a table. 
It allows you to change the values in one or more columns of a single row or multiple rows.

 

 syntax of the UPDATE statement:

 

UPDATE  table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];
*/
 SELECT * FROM user;
UPDATE user SET email='joe@abc.com'  WHERE id=2;

UPDATE user SET  NAME='karvy' , email='karvy@abc.com'  WHERE id=2;

USE classicmodels;

-- Using MySQL UPDATE to update rows returned by a SELECT statement example

-- Using MySQL UPDATE to update rows returned by a SELECT statement example

 

SELECT customername,salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IS NULL;

update customers set salesRepEmployeeNumber=(SELECT employeeNumber FROM employees
WHERE jobtitle = 'Sales Rep' ORDER BY RAND()
LIMIT 1) WHERE salesRepEmployeeNumber=null;

SELECT * FROM customers;

# DELETE statement
 /*To delete data from a table, you use the MySQL DELETE statement. 
 syntax of the DELETE statement:
 
DELETE FROM table_name
WHERE condition;  */

SELECT * FROM employees_copy;

DELETE FROM employees_copy WHERE officeCode=4;

-- using limit in  delete

SELECT * FROM customers_copy;

DELETE FROM customers_copy WHERE ORDER BY  customername LIMIT 10;

DELETE FROM customers_copy WHERE countryname='france'ORDER BY creditLimit LIMIT=10;

#Truncate
/* MYSQL TRUNCATE statement removes the complete data without 
removing its structure.

The TRUNCATE TABLE statement is used when you want to delete the complete data from a 
table without removing the table structure. */

TRUNCATE TABLE employees_copy;

SELECT * FROM employees_copy;





ALTER TABLE people
MODIFY  phone_number VARCHAR(50) NOT NULL UNIQUE
AFTER birthday;

peopleSELECT * FROM people;



























