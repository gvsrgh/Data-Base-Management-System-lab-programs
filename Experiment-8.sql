-- Find the employee with the highest salary
/** Select first name, last name, and salary of the employee with the highest salary */
SELECT Fname, Lname, Salary,
    (SELECT MAX(Salary) FROM EMPLOYEE) AS Highest_Salary
FROM EMPLOYEE;

-- Find employees who work on project number 1
/** Select first name and last name of employees who work on project number 1 */
SELECT Fname, Lname
FROM EMPLOYEE
WHERE ssn IN (
    SELECT Essn
    FROM WORKS_ON
    WHERE Pno = 1
);

-- Find the average salary of employees in departments located in 'Houston'
/** Select the average salary of employees in departments located in 'Houston' */
SELECT AVG(Salary) AS Avg_Salary57
FROM EMPLOYEE
WHERE Dno IN (
    SELECT Dno
    FROM DEPT_LOCATIONS DL
    WHERE DL.Dlocation = 'Houston' AND DL.Dnumber = EMPLOYEE.Dno
);

-- Find departments where the total number of employees exceeds the average number of employees across all departments
/** Select department names where the total number of employees exceeds the average number of employees across all departments */
SELECT Dname, COUNT(*) AS Number_Of_Employees
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.Dno = DEPARTMENT.Dno
GROUP BY Dname
HAVING COUNT(*) > (
    SELECT AVG(Number_Of_Employees)
    FROM (
        SELECT Dno, COUNT(*) AS Number_Of_Employees
        FROM EMPLOYEE
        GROUP BY Dno
    ) AS Department_Employee_Count
);

-- Find employees who work on projects located in 'Houston'
/** Select first name and last name of employees who work on projects located in 'Houston' */
SELECT Fname, Lname
FROM EMPLOYEE
WHERE ssn IN (
    SELECT Essn
    FROM WORKS_ON
    WHERE Pno IN (
        SELECT Pnumber
        FROM PROJECT
        WHERE Plocation = 'Houston'
    )
);

-- Find employees with a salary greater than any employee working on project number 10
/** Select first name, last name, and salary of employees with a salary greater than any employee working on project number 10 */
SELECT Fname, Lname, Salary
FROM EMPLOYEE
WHERE Salary > ANY (
    SELECT Salary
    FROM EMPLOYEE E
    JOIN WORKS_ON W ON E.ssn = W.Essn
    WHERE W.Pno = 10
);

-- Find employees with a salary greater than some employees in department 5
/** Select first name, last name, and salary of employees with a salary greater than some employees in department 5 */
SELECT Fname, Lname, Salary
FROM EMPLOYEE
WHERE Salary > SOME (
    SELECT Salary
    FROM EMPLOYEE
    WHERE Dno = 5
);

-- Find employees with a salary greater than all employees in department 5
/** Select first name, last name, and salary of employees with a salary greater than all employees in department 5 */
SELECT Fname, Lname, Salary
FROM EMPLOYEE
WHERE Salary > ALL (
    SELECT Salary
    FROM EMPLOYEE
    WHERE Dno = 5
);

-- Find employees who have dependents
/** Select first name and last name of employees who have dependents */
SELECT Fname, Lname
FROM EMPLOYEE E
WHERE EXISTS (
    SELECT 1
    FROM DEPENDENT D
    WHERE E.ssn = D.Essn
);

-- Find employees who do not have dependents
/** Select first name and last name of employees who do not have dependents */
SELECT Fname, Lname
FROM EMPLOYEE E
WHERE NOT EXISTS (
    SELECT 1
    FROM DEPENDENT D
    WHERE E.ssn = D.Essn
);
