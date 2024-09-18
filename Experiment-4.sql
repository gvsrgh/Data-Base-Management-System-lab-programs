-- Selecting Data from EMPLOYEE Table

/** Select all records from the EMPLOYEE table */
SELECT * FROM EMPLOYEE;

/** Select records from the EMPLOYEE table where Salary is greater than 30000 */
SELECT * FROM EMPLOYEE WHERE Salary > 30000;

/** Select records from the EMPLOYEE table where:
    - Gender is 'M' and Salary is greater than 30000
    - OR Gender is 'F' and Salary is greater than 40000 */
SELECT * FROM EMPLOYEE WHERE (Gender = 'M' AND Salary > 30000) OR (Gender = 'F' AND Salary > 40000);

/** Select records from the EMPLOYEE table where Dno is not equal to 5 */
SELECT * FROM EMPLOYEE WHERE NOT Dno = 5;

/** Select records from the EMPLOYEE table where Dno is either 1 or 4 */
SELECT * FROM EMPLOYEE WHERE Dno IN (1, 4);

/** Select records from the EMPLOYEE table where Bdate is between '1960-01-01' and '1970-12-31' */
SELECT * FROM EMPLOYEE WHERE Bdate BETWEEN '1960-01-01' AND '1970-12-31';

/** Select records from the EMPLOYEE table where Lname starts with 'S' */
SELECT * FROM EMPLOYEE WHERE Lname LIKE 'S%';

/** Select all records from the EMPLOYEE table and order them by Salary in ascending order */
SELECT * FROM EMPLOYEE ORDER BY Salary ASC;

/** Select all records from the EMPLOYEE table and order them by Lname in descending order */
SELECT * FROM EMPLOYEE ORDER BY Lname DESC;

/** Select the first 5 records from the EMPLOYEE table */
SELECT * FROM EMPLOYEE LIMIT 5;

/** Select the top 3 records from the EMPLOYEE table ordered by Salary in descending order */
SELECT * FROM EMPLOYEE ORDER BY Salary DESC LIMIT 3;
