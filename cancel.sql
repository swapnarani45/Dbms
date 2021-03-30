SHOW DATABASES;

CREATE DATABASE air_go;

USE air_go;
flightinfo drop TABLE contact;

CREATE TABLE flightInfo
(
  plane_number    INT(5) PRIMARY KEY AUTO_INCREMENT ,
  capacity INT(11)  NOT NULL,
  SOURCE          VARCHAR(10) NOT NULL,
  s_date timestamp NOT NULL,
  destination     VARCHAR(10) NOT NULL,
  d_date timestamp NOT NULL,
  fare            int(10) NOT NULL,
  type            INT NOT NULL, 
  
  
  CONSTRAINT fk_plain_type  FOREIGN KEY(type)  
  REFERENCES planeType(t_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE  
  
);


CREATE TABLE flightType
(
  t_id INT(10) AUTO_INCREMENT PRIMARY KEY ,
  p_type VARCHAR(10) 
);

ALTER TABLE flightInfo
DROP capacity;



SHOW table flightType;


CREATE TABLE passengers
(
  pass_no INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pass_uID INT NOT NULL,
  pass_name VARCHAR(50) NOT NULL,
  pass_age INT NOT NULL,
  pass_gender VARCHAR(20) NOT NULL CHECK(pass_gender IN('male','female','other')),
  pass_phone VARCHAR(20) unique NOT NULL,
  pass_email VARCHAR(20) NOT NULL CHECK(pass_email REGEXP '[^A-Z]*@*[.com]$'),
  pass_address VARCHAR(20) NOT NULL

 
   
);

INSERT INTO passengers(pass_no,pass_uID,pass_name,pass_age,pass_gender,pass_phone,pass_email,pass_address)
VALUES
(12345,234,'swapna',20,'female','12345','abc@air.com','hyd');

SELECT * FROM passengers;





CREATE table payments
(
pass_uID INT NOT NULL,
amount INT NOT null);

INSERT INTO payments (pass_uID,amount)VALUES(234,2000);
SELECT * FROM payments;

CREATE TABLE travelInfo
(
  p_no int NOT NULl,
  f_no INT NOT NULL,
  CONSTRAINT fk_p_no  FOREIGN KEY(p_no)  
  REFERENCES passengers(pass_no)
  ON DELETE CASCADE
  ON UPDATE RESTRICT,
  
  CONSTRAINT fk_f_no  FOREIGN KEY(f_no)  
  REFERENCES flightInfo(plane_number)
  ON DELETE CASCADE
  ON UPDATE RESTRICT 

);
