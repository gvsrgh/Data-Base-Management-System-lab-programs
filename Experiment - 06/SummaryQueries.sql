/*Continuation of Company DB from 
Experiment - 03|04 : https://github.com/gvsrgh/Data-Base-Management-System-lab-programs/blob/main/Experiment%20-%2003%7C04/01CompanyDB.sql*/

/*Aggregate Functions: COUNT, SUM, AVG, MAX, MIN*/

/*1. Count the number of employees in each department*/
SELECT dno, COUNT(*) AS Size
FROM EMPLOYEE
GROUP BY dno
ORDER BY dno;

/*2. For each department retrieve the department no, the no of employees
	 in the department and their average salary*/
SELECT dno, COUNT(*) as employees, AVG(salary) as avg_salary
FROM EMPLOYEE
GROUP BY dno
ORDER BY dno;

/*3 For each project retrieve the project no, project name and the no of 
	employees working on that project*/
SELECT pnumber, pname, count(essn) as workers
FROM PROJECT, WORKS_ON
WHERE pnumber = pno
GROUP BY pnumber
ORDER BY pnumber;

/*4 For each Project on which more than 2 employees work, retrieve 
	project no, project name and the no of employees who work on the project*/
SELECT pnumber, pname, COUNT(essn) AS workers
FROM PROJECT P
JOIN WORKS_ON W ON P.pnumber = W.pno
GROUP BY pnumber, pname
HAVING COUNT(essn) > 2
ORDER BY pnumber;

/*5 For each project retrive the project no, name and the no of employees from
	department no = 5 who work on the project*/
SELECT pnumber, pname, count(essn) as workers
FROM PROJECT P, WORKS_ON W
WHERE dnum = 5 and pnumber = pno
GROUP BY pnumber
ORDER BY pnumber;

/*6 Count the total number of employees whose salary exceed 40,000 in each
	department but only for the department where more than 5 employees work*/
SELECT dno, COUNT(*) AS employees
FROM EMPLOYEE
WHERE salary > 25000
GROUP BY dno
HAVING COUNT(*) > 2;
