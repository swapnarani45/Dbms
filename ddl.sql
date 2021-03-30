CREATE DATABASE training;
 USE training;
 
 USE DATABASE training;
 
 CREATE TABLE USER(
 id INT PRIMARY KEY AUTO_INCREMENT,
 NAME VARCHAR(255),
 email VARCHAR(255))
 DOJ DATE IMESTAMP DEFAULT CURRENT_TIMESTAMP;
 
 DESCRIBE USER;
 
 SHOW TABLES;
 
 CREATE TABLE contacts(
 contact_id INT(11) NOT NULL AUTO_INCREMENT,
 last_name VARCHAR(255) NOT NULL,
 first_name VARCHAR(255),
 birthday DATE,
 constraint contacts_pk primary key(contact_id));
 
 
 DESCRIBE  contacts;
 
 
 # ALTER Table
-- The MySQL ALTER TABLE statement is used to add, modify, or drop/delete columns
-- in a table. The MySQL ALTER TABLE statement is also used to rename a table.

/* Syntax:
 ALTER TABLE table_name
  ADD new_column_name column_definition
    [ FIRST | AFTER column_name ];  */

/* Syntax:  Add column in table
 ALTER TABLE table_name
  ADD new_column_name column_definition
    [ FIRST | AFTER column_name ];  */
 
 ALTER TABLE contacts
 ADD middle_name VARCHAR (30) NOT NULL
 AFTER last_name;

DESC contacts;

# Modify Column in a Table
DESC contacts;

# rename column in table

ALTER TABLE contacts
CHANGE COLUMN middle_name mid_name VARCHAR(30) NOT null;

DESC contacts;

 ALTER TABLE contacts
 ADD contact_type  VARCHAR (30) NOT NULL
 AFTER first_name;

DESC contacts;

ALTER TABLE contacts
DROP COLUMN contact_type;

DESC contacts;

ALTER TABLE contacts
RENAME TO people;

 ALTER TABLE people
 ADD DATE_of_joining  DATE DEFAULT NOW() NOT NULL
 AFTER last_name;

DESC people;

SHOW TABLES;

--- Creating Foreign Key Relationship
/* The foreign key is used to link one or more than one table
together. It is also known as the referencing key.
A foreign key matches the primary key field of another table.
It means a foreign key field in one table refers to the primary key
field of the other table. */

/*
Syntax: [CONSTRAINT constraint_name]
    FOREIGN KEY [foreign_key_name] (col_name, ...)
    REFERENCES parent_tbl_name (col_name,...)
    ON DELETE referenceOption
    ON UPDATE referenceOption  */

CREATE TABLE emp(
emp_id INT(50)  AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
DOB DATE NOT NULL,
STATUS TINYINT NOT NULL,
description TEXT,
DOJ TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
dept_id INT NOT NULL);

DESC emp;

SHOW TABLES;

CREATE TABLE dept( -- primary table
d_id INT PRIMARY KEY,
dept_name VARCHAR(15)
);

SHOW TABLES;

CREATE TABLE Employee ( -- secondary table
emp_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
dob DATE NOT NULL,
status TINYINT NOT NULL,
description TEXT,
doj TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
dept_id INT NOT NULL,
CONSTRAINT fk_empDepts FOREIGN (trainingdep_id)
REFERENCES departments(d_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

/* CASCADE: It is used when we delete or update any row from the
parent table, the values of the matching rows in the child table
will be deleted or updated automatically.
RESTRICT: It is used when we delete or update any row from the parent
table that has a matching row in the reference(child) table,
MySQL does not allow to delete or update rows in the parent table. */

# Check Constraint
-- CHECK constraint to ensure that values stored in a column or group of
-- columns satisfy a Boolean expression.
 
DESC people;

ALTER TABLE people
    ADD salary DECIMAL(10,2) NOT NULL CHECK (salary>10000)
    AFTER first_name;

DESC people;

ALTER TABLE people
ADD gender CHAR(10) NOT NULL CHECK(gender IN('male','female'))
AFTER birthday;

DESC people;

#ALTER TABLE people
--ADD dor DATE  NOT NULL CHECK (dor BETWEEN CURRENT_DATE AND (CURRENT_DATE-30)) 
-- AFTER gender;

-- Unique Constraint
/* A UNIQUE constraint is an integrity constraint that ensures values in a column or group of columns to be unique.
A UNIQUE constraint can be either a column constraint or a table constraint. */

ALTER TABLE people
MODIFY  phone_number VARCHAR(50) NOT NULL UNIQUE
AFTER birthday;

DESC people;

#insert-














