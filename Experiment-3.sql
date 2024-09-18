-- Inserting Values into Tables

/** Use the database 22501A0557 */
USE 22501A0557;

-- Insert values into EMPLOYEE table
/** Insert multiple records into the EMPLOYEE table */
INSERT INTO EMPLOYEE 
VALUES 
('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

/** Select all records from the EMPLOYEE table */
SELECT * FROM EMPLOYEE;

-- Insert values into DEPARTMENT table
/** Insert multiple records into the DEPARTMENT table */
INSERT INTO DEPARTMENT
VALUES
('Research',5,333445555,'1988-05-22'),
('Administration',4,987654321,'1995-01-01'),
('Headquarters',1,888665555,'1981-06-19');

/** Select all records from the DEPARTMENT table */
SELECT * FROM DEPARTMENT;

-- Insert values into PROJECT table
/** Insert multiple records into the PROJECT table */
INSERT INTO PROJECT
VALUES
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);

/** Select all records from the PROJECT table */
SELECT * FROM PROJECT;

-- Modify WORKS_ON table
/** Modify the Hours column in WORKS_ON table to allow NULL values */
ALTER TABLE WORKS_ON MODIFY Hours Decimal(3,1) NULL;

-- Insert values into WORKS_ON table
/** Insert multiple records into the WORKS_ON table */
INSERT INTO WORKS_ON
VALUES
(123456789,1,32.5),
(123456789,2,7.5),
(666884444,3,40.0),
(453453453,1,20.0),
(453453453,2,20.0),
(333445555,2,10.0),
(333445555,3,10.0),
(333445555,10,10.0),
(333445555,20,10.0),
(999887777,30,30.0),
(999887777,10,10.0),
(987987987,10,35.0),
(987987987,30,5.0),
(987654321,30,20.0),
(987654321,20,15.0),
(888665555,20,NULL);

/** Select all records from the WORKS_ON table */
SELECT * FROM WORKS_ON;

-- Insert values into DEPENDENT table
/** Insert multiple records into the DEPENDENT table */
INSERT INTO DEPENDENT
VALUES
(333445555,'Alice','F','1986-04-04','Daughter'),
(333445555,'Theodore','M','1983-10-25','Son'),
(333445555,'Joy','F','1958-05-03','Spouse'),
(987654321,'Abner','M','1942-02-28','Spouse'),
(123456789,'Michael','M','1988-01-04','Son'),
(123456789,'Alice','F','1988-12-30','Daughter'),
(123456789,'Elizabeth','F','1967-05-05','Spouse');

/** Select all records from the DEPENDENT table */
SELECT * FROM DEPENDENT;

-- Insert values into DEPT_LOCATIONS table
/** Insert multiple records into the DEPT_LOCATIONS table */
INSERT INTO DEPT_LOCATIONS
VALUES
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston');

/** Select all records from the DEPT_LOCATIONS table */
SELECT * FROM DEPT_LOCATIONS;

-- Insert values into EMPLOYEE1 table
/** Insert all records from EMPLOYEE table into EMPLOYEE1 table */
INSERT INTO EMPLOYEE1 SELECT * FROM EMPLOYEE;

-- Update EMPLOYEE1 table
/** Update the Salary of all employees in EMPLOYEE1 table to 50000 */
UPDATE EMPLOYEE1 
SET Salary='50000';

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

/** Update the Address of the employee with SSN 123456789 in EMPLOYEE1 table */
UPDATE EMPLOYEE1
SET Address='7345 Venice Bellaire TX' 
WHERE Ssn=123456789;

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

/** Update the Salary of employees in EMPLOYEE1 table where Super_ssn is 333445555 */
UPDATE EMPLOYEE1 
SET Salary='55000' 
WHERE Super_ssn=333445555;

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

-- Delete records from EMPLOYEE1 table
/** Delete the record from EMPLOYEE1 table where Fname is 'Alicia' */
DELETE 
FROM EMPLOYEE1
WHERE Fname = 'Alicia'; 

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

/** Delete records from EMPLOYEE1 table where Gender is 'F' */
DELETE
FROM EMPLOYEE1 
WHERE Gender = 'F';

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

/** Delete all records from EMPLOYEE1 table */
DELETE
FROM EMPLOYEE1;

/** Select all records from the EMPLOYEE1 table */
SELECT * FROM EMPLOYEE1;

-- Transactions
/** Start a transaction to update the Salary of an employee */
START TRANSACTION;

/** Update the Salary of the employee with SSN 123456789 */
UPDATE EMPLOYEE
SET Salary = Salary + 5000 
WHERE ssn = '123456789';

/** Commit the transaction */
COMMIT;

/** Select the record of the employee with SSN 123456789 */
SELECT * FROM EMPLOYEE WHERE ssn = '123456789';

/** Start a transaction to insert a new employee */
START TRANSACTION;

/** Insert a new employee into the EMPLOYEE table */
INSERT INTO EMPLOYEE
VALUES ('Sarah', 'M', 'Green', 777889999, '1975-09-17', '456 Oak, Houston TX', 'F', 32000, 987654321, 4);

/** Select the record of the new employee */
SELECT * FROM EMPLOYEE WHERE Ssn = 777889999;

/** Rollback the transaction */
ROLLBACK;

/** Select the record of the new employee to confirm rollback */
SELECT * FROM EMPLOYEE WHERE Ssn = 777889999;

/** Start a transaction to insert multiple employees */
START TRANSACTION;

/** Insert a new employee into the EMPLOYEE table */
INSERT INTO EMPLOYEE
VALUES ('Lucas', 'W', 'White', 666777888, '1990-02-23', '789 Pine, Houston TX', 'M', 31000, 333445555, 5);

/** Save the transaction state */
SAVEPOINT sp1;

/** Select the record of the new employee */
SELECT * FROM EMPLOYEE WHERE ssn = 666777888;

/** Insert another new employee into the EMPLOYEE table */
INSERT INTO EMPLOYEE
VALUES ('Olivia', 'D', 'Davis', 111223344, '1985-06-14', '135 Elm, Houston TX', 'F', 29000, 987654321, 4);

/** Select all records from the EMPLOYEE table */
SELECT * FROM EMPLOYEE; 

/** Rollback to the savepoint */
ROLLBACK TO sp1;

/** Select all records from the EMPLOYEE table to confirm rollback */
SELECT * FROM EMPLOYEE;

/** Commit the transaction */
COMMIT;
