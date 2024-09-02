CREATE DATABASE university;

USE university;

CREATE TABLE student(
 Roll varchar(20),
 Name varchar(20),
 Dept varchar(20),
 Year varchar(20),
 Semester varchar(20),
 PRIMARY KEY(Roll)
 );

 INSERT INTO student VALUES
('06543201', 'Rahim', 'BBA', '2nd', '1st'),
('06543202', 'Karim', 'ICE', '2nd', '1st'),
('06543203', 'Motin', 'CSE', '1st', '2nd'),
('05654456', 'Swadhin', 'CSE', '1st', '2nd'),
('05654457', 'Hena', 'BBA', '4th', '2nd'),
('05654458', 'Shohag', 'CSE', '3rd', '1st');

CREATE TABLE studentInfo(
 Roll varchar(20),
 Name varchar(20),
 Father_Name varchar(20),
 Address varchar(20),
 Mobile varchar(20),
 PRIMARY KEY(Roll)
 );

 INSERT INTO studentInfo VALUES
('06543201', 'Rahim', 'Ataur', 'Rajshahi', '01719201233'),
('06543202', 'Karim', 'Tareq', 'Dhaka', '01719202020'),
('06543203', 'Motin', 'Rahman', 'Khulna', '01719202678'),
('05654456', 'Swadhin', 'Fazlu', 'Rajshahi', '01719204564'),
('05654457', 'Hena', 'Rahman', 'Rajshahi', '01119212020'),
('05654458', 'Shohag', 'Fazlu', 'Natore', '01719202222');

SELECT Name FROM student WHERE Semester = '1st';
SELECT Name FROM student WHERE Year = '2nd';
SELECT Name FROM student WHERE Dept = 'CSE';
SELECT Name FROM student WHERE Roll = '06543201';
SELECT Name, Address, Mobile FROM studentInfo WHERE Father_Name = 'Rahman';
SELECT Name, Address, Mobile FROM studentInfo WHERE Mobile = '01719202020';
SELECT Name, Address, Mobile FROM studentInfo WHERE Address = 'Rajshahi';
SELECT Name, Address, Mobile FROM studentInfo WHERE Address = 'Rajshahi' AND 
Father_Name = 'Rahman';

SELECT Name, Address, Mobile FROM studentInfo WHERE Roll = '05654456';
CREATE TABLE employee(
 Employee_Name varchar(20),
 Street varchar(20),
 City varchar(20)
 );

INSERT INTO employee VALUES
('Arif', '51 upashahar', 'Rajshahi'),
('Sumon', '52 east', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 north', 'Chittagong');

CREATE TABLE works(
 Employee_Name varchar(20),
 Company_Name varchar(20),
 Salary int(8)
 );

 INSERT INTO works VALUES
('Sumon', 'Agrani', 12000),
('Abdul', 'Sonali', 13000),
('Himesh', 'Agrani', 6000),
('Amirul', 'Sonali', 20000),
('Sagor', 'Sonali', 8000),
('Arif', 'Janata', 13000),
('Sajib', 'Janata', 9000);

SELECT Employee_Name FROM employee WHERE City = 'Rajshahi';
SELECT Employee_Name, Street FROM employee WHERE City = 'Rajshahi';
SELECT Employee_Name FROM works WHERE Company_Name = 'Sonali';
SELECT Employee_Name FROM works WHERE Company_Name = 'Agrani';
SELECT Employee_Name FROM works WHERE Company_Name = 'Janata';
SELECT Employee_Name, Salary FROM works WHERE Company_Name = 'Sonali';
SELECT Employee_Name, Salary FROM works WHERE Company_Name = 'Agrani';
SELECT Employee_Name, Salary FROM works WHERE Company_Name = 'Janata';
SELECT Employee_Name FROM works WHERE Salary = 12000;
SELECT Employee_Name FROM works WHERE Salary >= 12000;
SELECT Employee_Name FROM works WHERE Salary < 12000;
SELECT Employee_Name, Company_Name FROM works WHERE Salary = 12000;
SELECT Employee_Name, Company_Name FROM works WHERE Salary >= 12000;
SELECT Employee_Name, Company_Name FROM works WHERE Salary < 12000;

SELECT employee.Employee_Name, employee.Street, employee.City
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE works.Company_Name = 'Agrani';

SELECT employee.Employee_Name, employee.Street, employee.City
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE works.Salary >= 10000;

SELECT employee.Employee_Name, works.Company_Name, works.Salary
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE employee.City = 'Rajshahi';

SELECT employee.Employee_Name, employee.Street, employee.City, 
works.Company_Name
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE works.Salary >= 10000;

SELECT employee.Employee_Name, employee.Street, employee.City
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE works.Company_Name = 'Sonali' AND works.Salary > 12000;

SELECT employee.Employee_Name, employee.Street, employee.City
FROM employee
JOIN works ON employee.Employee_Name = works.Employee_Name
WHERE NOT works.Company_Name = 'Sonali';

UPDATE employee SET City = 'Natore' WHERE Employee_Name = 'Arif';
UPDATE works SET Salary = Salary+(Salary/100*10);
DELETE FROM employee WHERE Employee_Name = 'Sagor';
ALTER TABLE employee ADD Manager varchar(20);

CREATE TABLE employee(
    Employee_Name VARCHAR(50) NOT NULL,
    Street VARCHAR(50),
    City VARCHAR(50),
    PRIMARY KEY(Employee_Name)
    );

INSERT INTO employee VALUES
('Arif', '51 upashahar', 'Rajshahi'),
('Sumon', '52 east', 'Moynamati'),
('Sagor', 'Neemgachhi', 'Sirajgong'),
('Abdul', 'Binodpur', 'Rajshahi'),
('Himesh', 'Nazrul avenue', 'Dhaka'),
('Amirul', 'Chawk bazar', 'Sylhet'),
('Sajib', '99 north', 'Chittagong');

CREATE TABLE works(
    Employee_Name varchar(50) NOT NULL,
    Company_Name varchar(50) NOT NULL,
    Salary INT NOT NULL,
    PRIMARY KEY(Employee_Name),
    FOREIGN KEY(Employee_Name) REFERENCES employee(Employee_Name)
    );

