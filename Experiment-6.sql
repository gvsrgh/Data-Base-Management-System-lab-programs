-- Aggregate Functions

/** Calculate the total salary of all employees */
SELECT SUM(salary) AS Total_Salary57 FROM EMPLOYEE;

/** Calculate the average salary of all employees */
SELECT AVG(salary) AS Average_Salary57 FROM EMPLOYEE;

/** Count the total number of employees */
SELECT COUNT(ssn) AS Total_Employees57 FROM EMPLOYEE;

/** Find the maximum salary among all employees */
SELECT MAX(salary) AS Max_Salary57 FROM EMPLOYEE;

/** Find the minimum salary among all employees */
SELECT MIN(salary) AS Min_Salary57 FROM EMPLOYEE;

-- Group By and Aggregate Functions

/** Calculate the average salary for each department */
SELECT Dno, AVG(Salary) AS AvgSalary57
FROM EMPLOYEE 
GROUP BY Dno;

/** Count the number of employees in each department */
SELECT Dno, COUNT(*) AS Size57
FROM EMPLOYEE
GROUP BY Dno
ORDER BY Dno;

/** Count the number of employees and calculate the average salary for each department */
SELECT Dno, COUNT(*) AS employees57, AVG(Salary) AS avg_salary57
FROM EMPLOYEE
GROUP BY Dno
ORDER BY Dno;

-- Join and Group By

/** Count the number of workers for each project */
SELECT Pnumber, Pname, COUNT(Essn) AS workers57
FROM PROJECT, WORKS_ON
WHERE Pnumber = Pno
GROUP BY Pnumber
ORDER BY Pnumber;

/** Count the number of workers for each project in department 5 */
SELECT Pnumber, Pname, COUNT(Essn) AS workers57
FROM PROJECT P, WORKS_ON W
WHERE Dnum = 5 AND Pnumber = Pno
GROUP BY Pnumber
ORDER BY Pnumber;

-- Group By with HAVING Clause

/** Calculate the average salary for each department where the average salary is greater than 32000 */
SELECT Dno, AVG(Salary) AS AvgSalary57
FROM EMPLOYEE 
GROUP BY Dno 
HAVING AVG(Salary) > 32000;

/** Count the number of workers for each project where the number of workers is greater than 2 */
SELECT Pnumber, Pname, COUNT(Essn) AS workers57
FROM PROJECT P
JOIN WORKS_ON W ON P.Pnumber = W.Pno
GROUP BY Pnumber, Pname
HAVING COUNT(Essn) > 2
ORDER BY Pnumber;

/** Count the number of employees in each department where the salary is greater than 25000 and the count is greater than 2 */
SELECT Dno, COUNT(*) AS employees57
FROM EMPLOYEE
WHERE Salary > 25000
GROUP BY Dno
HAVING COUNT(*) > 2;

-- Group By with ROLLUP

/** Count the number of employees by department and gender, with rollup */
SELECT Dno, Gender, COUNT(*) AS NumEmployees57
FROM EMPLOYEE
GROUP BY Dno, Gender WITH ROLLUP;

/** Calculate the total salary for each department, with rollup */
SELECT Dno, SUM(Salary) AS Total_Salary57
FROM EMPLOYEE
GROUP BY Dno WITH ROLLUP;

/** Calculate the total salary for each department and employee, with rollup */
SELECT Dno, Ssn, SUM(Salary) AS Total_Salary
FROM EMPLOYEE
GROUP BY Dno, Ssn WITH ROLLUP;
