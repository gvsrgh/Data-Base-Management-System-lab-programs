-- Procedures for Employee Management

-- Creating a procedure with IN parameters (for inserting a new employee)
/**
 * This procedure inserts a new employee into the EMPLOYEE table.
 * It takes three parameters: ssn, Fname, and Salary.
 */
DELIMITER //
CREATE PROCEDURE InsertEmployee(IN ssn BIGINT, IN Fname VARCHAR(20), IN Salary BIGINT)
BEGIN
    INSERT INTO EMPLOYEE (ssn, Fname, Salary)
    VALUES (ssn, Fname, Salary);
END //
DELIMITER ;

-- Creating a procedure to UPDATE an employee's salary
/**
 * This procedure updates the salary of an existing employee.
 * It takes two parameters: empSSN (employee's SSN) and newSalary.
 */
DELIMITER //
CREATE PROCEDURE UpdateEmployeeSalary(IN empSSN BIGINT, IN newSalary BIGINT)
BEGIN
    UPDATE EMPLOYEE
    SET Salary = newSalary
    WHERE ssn = empSSN;
END //
DELIMITER ;

-- Creating a procedure to DELETE an employee by SSN
/**
 * This procedure deletes an employee from the EMPLOYEE table based on their SSN.
 * It takes one parameter: empSSN.
 */
DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN empSSN BIGINT)
BEGIN
    DELETE FROM EMPLOYEE WHERE ssn = empSSN;
END //
DELIMITER ;

-- Inserting, Updating, and Deleting an Employee

-- Inserting a new employee
/**
 * This statement calls the InsertEmployee procedure to add a new employee with SSN 000000000, name 'Klee', and salary 35000.
 */
CALL InsertEmployee(000000000,'Klee', 35000);
SELECT * FROM EMPLOYEE;

-- Updating salary for a specific employee
/**
 * This statement calls the UpdateEmployeeSalary procedure to update the salary of the employee with SSN 000000000 to 50000.
 */
CALL UpdateEmployeeSalary(000000000, 50000);
SELECT * FROM EMPLOYEE;

-- Deleting an employee
/**
 * This statement calls the DeleteEmployee procedure to remove the employee with SSN 000000000 from the EMPLOYEE table.
 */
CALL DeleteEmployee(000000000);
SELECT * FROM EMPLOYEE;

-- Dropping Procedures
/**
 * These statements drop the procedures if they exist.
 */
DROP PROCEDURE IF EXISTS InsertEmployee; 
DROP PROCEDURE IF EXISTS UpdateEmployeeSalary; 
DROP PROCEDURE IF EXISTS DeleteEmployee;

-- Attempting to delete an employee again
/**
 * This statement calls the DeleteEmployee procedure again to ensure the employee with SSN 000000000 is deleted.
 */
CALL DeleteEmployee(000000000);

-- Function and Triggers for Employee Management

-- Create a function to calculate the yearly bonus (10% of salary)
/**
 * This function calculates the yearly bonus for an employee, which is 10% of their salary.
 * It takes one parameter: emp_id (employee's SSN).
 */
DELIMITER //
CREATE FUNCTION fn_example(emp_id INT) RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE emp_salary DECIMAL(10,2);
    SELECT salary INTO emp_salary FROM EMPLOYEE WHERE ssn = emp_id;
    RETURN emp_salary * 1.1;
END //
DELIMITER ;

-- Calculating yearly bonus
/**
 * This statement calls the fn_example function to calculate the yearly bonus for the employee with SSN 123456789.
 */
SELECT fn_example(123456789) yearly_bonus57;

-- Dropping the function
/**
 * This statement drops the fn_example function if it exists.
 */
DROP FUNCTION IF EXISTS fn_example;

-- Attempting to calculate yearly bonus again
/**
 * This statement calls the fn_example function again to ensure it calculates the yearly bonus for the employee with SSN 123456789.
 */
SELECT fn_example(123456789) yearly_bonus57;

-- Creating triggers for Employee Management

-- Trigger before inserting an employee
/**
 * This trigger adds 1000 to the salary of a new employee before inserting the record into the EMPLOYEE table.
 */
DELIMITER //
CREATE TRIGGER before_insert_employee
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    SET NEW.salary = NEW.salary + 1000;
END //
DELIMITER ;

-- Inserting a test employee
/**
 * This statement inserts a test employee into the EMPLOYEE table.
 */
INSERT INTO EMPLOYEE 
VALUES ('Test','T','User',111111111,'1990-01-01','123 Test St, Test City','M',20000,NULL,1);
SELECT * FROM EMPLOYEE WHERE ssn = 111111111;

-- Trigger to ensure non-negative salary
/**
 * This trigger ensures that the salary of an employee cannot be updated to a negative value.
 * If an attempt is made to set a negative salary, it retains the old salary.
 */
DELIMITER //
CREATE TRIGGER ensure_non_negative_salary
BEFORE UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = OLD.salary;
    END IF;
END //
DELIMITER ;

-- Attempt to update the salary to a negative value
/**
 * This statement attempts to update the salary of the employee with SSN 123456789 to a negative value (-5000).
 */
UPDATE EMPLOYEE SET salary = -5000 WHERE ssn = 123456789;

-- Check the salary to see if it was reset
/**
 * This statement checks the salary of the employee with SSN 123456789 to ensure it was not set to a negative value.
 */
SELECT Fname, Lname, salary FROM EMPLOYEE WHERE ssn = 123456789;

-- Dropping triggers
/**
 * These statements drop the triggers if they exist.
 */
DROP TRIGGER IF EXISTS before_insert_employee;
DROP TRIGGER IF EXISTS ensure_non_negative_salary;
