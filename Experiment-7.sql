-- Using the database 22501A0557
USE 22501A0557;

-- Inner Join
/** Select first name, last name, and department name by joining EMPLOYEE and DEPARTMENT tables using INNER JOIN */
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON E.Dno = D.Dnumber;

-- Left Join
/** Select first name, last name, and department name by joining EMPLOYEE and DEPARTMENT tables using LEFT JOIN */
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
LEFT JOIN DEPARTMENT D ON E.Dno = D.Dnumber;

-- Right Join
/** Select first name, last name, and department name by joining EMPLOYEE and DEPARTMENT tables using RIGHT JOIN */
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
RIGHT JOIN DEPARTMENT D ON E.Dno = D.Dnumber;

-- Alter Table
/** Change the column name Dnumber to Dno in the DEPARTMENT table */
ALTER TABLE DEPARTMENT CHANGE COLUMN Dnumber Dno INT;

-- Inner Join using USING clause
/** Select first name, last name, and department name by joining EMPLOYEE and DEPARTMENT tables using INNER JOIN with USING clause */
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D USING (Dno);

-- Natural Join
/** Select first name, last name, and department name by joining EMPLOYEE and DEPARTMENT tables using NATURAL JOIN */
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
NATURAL JOIN DEPARTMENT D;
