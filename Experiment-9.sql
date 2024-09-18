-- Index Creation
-- Create an index on the 'ssn' column of the EMPLOYEE table
/** This query creates an index named 'idx_ssn' on the 'ssn' column of the EMPLOYEE table to improve query performance. */
CREATE INDEX idx_ssn
ON EMPLOYEE (ssn);

-- Show the indexes of the EMPLOYEE table
/** This query displays the indexes that exist on the EMPLOYEE table. */
SHOW INDEX FROM EMPLOYEE;

-- Create an index on both 'Dno' and 'Salary' columns of the EMPLOYEE table
/** This query creates a composite index named 'idx_dno_salary' on the 'Dno' and 'Salary' columns of the EMPLOYEE table to improve query performance for queries involving these columns. */
CREATE INDEX idx_dno_salary
ON EMPLOYEE (Dno, Salary);

-- Show the indexes of the EMPLOYEE table
/** This query displays the indexes that exist on the EMPLOYEE table. */
SHOW INDEX FROM EMPLOYEE;

-- View Creation
-- Create a view to display employee names and their department names
/** This query creates a view named 'EmployeeDept' that shows the first name, last name, and department name of employees by joining the EMPLOYEE and DEPARTMENT tables. */
CREATE VIEW EmployeeDept AS
SELECT E.Fname, E.Lname, D.Dname
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Dno = D.Dno;

-- Select all records from the EmployeeDept view
/** This query retrieves all records from the 'EmployeeDept' view. */
SELECT * FROM EmployeeDept;

-- Create a view to display the average salary by department
/** This query creates a view named 'DeptAvgSalary' that shows the average salary of employees grouped by department name. */
CREATE VIEW DeptAvgSalary AS
SELECT D.Dname, AVG(E.Salary) AS Avg_Salary
FROM EMPLOYEE E
JOIN DEPARTMENT D ON E.Dno = D.Dno
GROUP BY D.Dname;

-- Select all records from the DeptAvgSalary view
/** This query retrieves all records from the 'DeptAvgSalary' view. */
SELECT * FROM DeptAvgSalary;

-- Create a view based on a single base table
/** This query creates a view named 'EmployeeView' that shows the 'ssn', 'Fname', and 'Salary' columns from the EMPLOYEE table. */
CREATE VIEW EmployeeView AS
SELECT ssn, Fname, Salary
FROM EMPLOYEE;

-- Select all records from the EmployeeView view
/** This query retrieves all records from the 'EmployeeView' view. */
SELECT * FROM EmployeeView;

-- Insert into the view
/** This query inserts a new record into the 'EmployeeView' view. */
INSERT INTO EmployeeView (ssn, Fname, Salary)
VALUES ('888888888', 'Rohith', 60000);

-- Select all records from the EmployeeView view
/** This query retrieves all records from the 'EmployeeView' view after the insertion. */
SELECT * FROM EmployeeView;

-- Delete from the view assuming it's updatable and based on a single table
/** This query deletes the record from the 'EmployeeView' view where the first name is 'Rohith'. */
DELETE FROM EmployeeView
WHERE Fname = 'Rohith';

-- Select all records from the EmployeeDept view
/** This query retrieves all records from the 'EmployeeDept' view. */
SELECT * FROM EmployeeDept;

-- Drop the view
/** This query drops the 'EmployeeView' view. */
DROP VIEW EmployeeView;

-- Select all records from the EmployeeView view
/** This query attempts to retrieve records from the 'EmployeeView' view after it has been dropped, which will result in an error. */
SELECT * FROM EmployeeView;