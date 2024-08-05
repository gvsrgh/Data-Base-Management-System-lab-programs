CREATE DATABASE 22501A0557;
USE 22501A0557;
CREATE TABLE EMPLOYEE (	
	Fname varchar(20) NOT NULL,
    Minit varchar(20),
    Lname varchar(20) NOT NULL,
    ssn bigint primary key,
    Bdate date,
    Address varchar(40),
    Gender char,
    Salary bigint,
    super_ssn bigint references EMPLOYEE(ssn),
    Dno int references DEPARTMENT(Dnumber)
);
DESC EMPLOYEE;
CREATE TABLE DEPARTMENT(
	Dname varchar(30) NOT NULL,
    Dnumber int primary key NOT NULL,
    Mgr_ssn bigint NOT NULL references EMPLOYEE(ssn) ,
    Mgr_start_date date
);
DESC DEPARTMENT;
CREATE TABLE DEPT_LOCATIONS(
	Dnumber int NOT NULL references DEPARTMENT(Dnumber) ,
    Dlocation varchar(30) NOT NULL,
    primary key(Dnumber,Dlocation)
);
DESC DEPT_LOCATIONS;
CREATE TABLE PROJECT(
	Pname varchar(30) NOT NULL,
    Pnumber int NOT NULL primary key,
    Plocation varchar(30),
    Dnum int NOT NULL references DEPARTMENT(Dnumber)
);
DESC PROJECT;
CREATE TABLE WORKS_ON(
	Essn bigint NOT NULL references EMPLOYEE(ssn),
    Pno int NOT NULL references PROJECT(Pnumber),
    Hours Decimal(3,1) NOT NULL,
    primary key(Essn, Pno)
);
DESC WORKS_ON;
CREATE TABLE DEPENDENT(
	Essn bigint NOT NULL references EMPLOYEE(ssn) ,
    Dependent_name varchar(30) NOT NULL,
    Gender char,
    Bdate date,
    Relationship varchar(8),
    primary key(Essn, Dependent_name)
);
DESC DEPENDENT;
SHOW TABLES;
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
SELECT * FROM EMPLOYEE;

INSERT INTO DEPARTMENT
VALUES
('Research',5,333445555,'1988-05-22'),
('Administration',4,987654321,'1995-01-01'),
('Headquarters',1,888665555,'1981-06-19');
SELECT * FROM DEPARTMENT;

INSERT INTO PROJECT
VALUES
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',4),
('Reorganization',20,'Houston',1),
('Newbenefits',30,'Stafford',4);
SELECT * FROM PROJECT;

ALTER TABLE WORKS_ON MODIFY Hours Decimal(3,1) NULL;

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
SELECT * FROM WORKS_ON;

INSERT INTO DEPENDENT
VALUES
(333445555,'Alice','F','1986-04-04','Daughter'),
(333445555,'Theodore','M','1983-10-25','Son'),
(333445555,'Joy','F','1958-05-03','Spouse'),
(987654321,'Abner','M','1942-02-28','Spouse'),
(123456789,'Michael','M','1988-01-04','Son'),
(123456789,'Alice','F','1988-12-30','Daughter'),
(123456789,'Elizabeth','F','1967-05-05','Spouse');
SELECT * FROM DEPENDENT;

INSERT INTO DEPT_LOCATIONS
VALUES
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston');
SELECT * FROM DEPT_LOCATIONS;

#1st Query-----------------------------------------------------------
SELECT 
	P.Pnumber, D.Dnumber, D.Dname
FROM 
	PROJECT P
JOIN DEPARTMENT D ON D.Dnumber = Dnum
WHERE 
	Plocation = 'Stafford';
#2nd Query (Check)---------------------------------------------------
SELECT 
	P.Pnumber, P.Dnum, E.Lname, E.Address, E.Bdate 
FROM 
	PROJECT P
JOIN WORKS_ON W ON P.Pnumber = W.Pno
JOIN EMPLOYEE E ON W.Essn = E.ssn
WHERE 
	P.Plocation = 'Houston';
#3rd Query-----------------------------------------------------------
SELECT 
	D.Dname, CONCAT(E.Fname, ' ', E.Minit, ' ', E.Lname) AS Manager_Name
FROM 
	DEPARTMENT D
JOIN EMPLOYEE E ON D.Mgr_ssn = E.ssn;
#4th Query-----------------------------------------------------------
SELECT (Salary + (Salary*(10/100)))
FROM
	EMPLOYEE E
JOIN PROJECT P ON Pname = "ProductX"
JOIN WORKS_ON W ON Pno = P.Pnumber
WHERE W.Essn = ssn;
#5th Query-----------------------------------------------------------
SELECT
    CONCAT(E.Fname, ' ', E.Minit, ' ', E.Lname) AS Employee_Name,
    CONCAT(S.Fname, ' ', S.Minit, ' ', S.Lname) AS Supervisor_Name
FROM
    EMPLOYEE E
LEFT JOIN EMPLOYEE S ON E.super_ssn = S.ssn;
#6th Query-----------------------------------------------------------
SELECT 
    CONCAT(E.Fname, ' ', E.Minit, ' ', E.Lname) AS Employee_Name, 
    P.Pname, 
    P.Dnum
FROM 
    EMPLOYEE E
JOIN WORKS_ON W ON E.ssn = W.Essn
JOIN PROJECT P ON W.Pno = P.Pnumber
ORDER BY 
    P.Dnum;
"TASK 1";
#7th Query-----------------------------------------------------------
SELECT 
    Bdate, Address
FROM
    EMPLOYEE
WHERE
    CONCAT(Fname, " ", Minit, ". ", Lname) = 'John B. Smith';

#8th Query------------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Dno = 5;

#9th Query------------------------------------------------------------
SELECT DISTINCT Salary
FROM EMPLOYEE;

#10th Query----------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Address LIKE '%Houston TX';

#11th Query----------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Bdate BETWEEN '1950-01-01' AND '1959-12-31';

#12th Query----------------------------------------------------------
ALTER TABLE DEPT_LOCATIONS ADD phone_no VARCHAR(15);

#13th Query----------------------------------------------------------
ALTER TABLE EMPLOYEE
ADD CONSTRAINT fk_super_ssn
FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn);

#14th Query----------------------------------------------------------
ALTER TABLE EMPLOYEE
MODIFY Address VARCHAR(30);
DESC EMPLOYEE Address;

#15th Query----------------------------------------------------------
UPDATE EMPLOYEE
SET Salary = 35000
WHERE CONCAT(Fname, " ", Minit, " ", Lname) = 'Franklin T Wong';
SELECT Salary FROM EMPLOYEE WHERE CONCAT(Fname, " ", Minit, " ", Lname) = 'Franklin T Wong';

#16th Query----------------------------------------------------------
UPDATE PROJECT
SET Plocation = 'Bellaire', Dnum = 5
WHERE Pnumber = 10;
SELECT * FROM PROJECT WHERE Pnumber = 10;


#17th Query----------------------------------------------------------
UPDATE EMPLOYEE
SET Salary = Salary * 1.10
WHERE Dno = 5;
SELECT Fname,Salary FROM EMPLOYEE WHERE Dno = 5;

#18th Query----------------------------------------------------------
SELECT Fname, Lname, Salary
FROM EMPLOYEE
WHERE Salary BETWEEN 30000 AND 40000;

#19th Query----------------------------------------------------------
SELECT Fname, Lname, Salary
FROM EMPLOYEE
WHERE Salary >= 35000;

#20th Query----------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Address LIKE '%Houston%' AND Salary > 30000;

#21st Query----------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Sex = 'F' AND (Dno = 4 OR Dno = 1);

#22nd Query----------------------------------------------------------
SELECT *
FROM PROJECT
WHERE Dnum = 10;

#23rd Query----------------------------------------------------------
DELETE FROM EMPLOYEE
WHERE Fname = 'Joyce';

#24th Query----------------------------------------------------------
SELECT *
FROM EMPLOYEE
WHERE Sex = 'M';

#25th Query----------------------------------------------------------
SELECT *
FROM DEPARTMENT
WHERE Dname LIKE '_e%';