-- Procedures for Employee Management

-- Procedure to Insert an Employee
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

-- Procedure to Update Employee Salary
/**
 * This procedure updates the salary of an employee based on their SSN.
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

-- Procedure to Delete an Employee
/**
 * This procedure deletes an employee based on their SSN.
 * It takes one parameter: empSSN.
 */
DELIMITER //
CREATE PROCEDURE DeleteEmployee(IN empSSN BIGINT)
BEGIN
    DELETE FROM EMPLOYEE WHERE ssn = empSSN;
END //
DELIMITER ;

-- Procedure to Retrieve Employee Salary Details
/**
 * This procedure retrieves the first name, last name, and salary of an employee based on their SSN.
 * It takes empSSN as input and returns the details using OUT parameters.
 */
DELIMITER //
CREATE PROCEDURE GetEmployeeSalary(IN empSSN BIGINT, OUT firstName VARCHAR(30), OUT lastName VARCHAR(30) , OUT empSalary BIGINT)
BEGIN
    SELECT Fname, Lname, Salary INTO firstName, lastName, empSalary
    FROM EMPLOYEE
    WHERE ssn = empSSN;
END //
DELIMITER ;

-- Procedure to Increase Employee Salary by a Percentage
/**
 * This procedure increases the salary of an employee by a given percentage.
 * It takes empSSN and the percentage as input and returns the updated details.
 */
DELIMITER //
CREATE PROCEDURE IncreaseEmployeeSalary(INOUT empSSN BIGINT, IN percentage DOUBLE)
BEGIN
    DECLARE currentSalary BIGINT;
    
    -- Get current salary of the employee
    SELECT Salary INTO currentSalary
    FROM EMPLOYEE
    WHERE SSN = empSSN;
    
    -- Update salary by the given percentage
    UPDATE EMPLOYEE
    SET Salary = currentSalary + (currentSalary * percentage / 100)
    WHERE SSN = empSSN;

    -- Return the updated employee details
    SELECT Fname, Lname, Salary 
    FROM EMPLOYEE 
    WHERE SSN = empSSN;
END //
DELIMITER ;

-- Procedure to Check and Update Salary Below a Threshold
/**
 * This procedure checks if an employee's salary is below a given threshold and updates it if necessary.
 * It takes empSSN and the threshold as input, and returns the updated salary details.
 */
DELIMITER //
CREATE PROCEDURE CheckAndUpdateSalary(IN empSSN BIGINT, IN threshold BIGINT)
BEGIN
    DECLARE currentSalary BIGINT;

    -- Get the current salary of the employee
    SELECT Salary INTO currentSalary
    FROM EMPLOYEE
    WHERE SSN = empSSN;

    -- Check if salary is below the threshold, update if necessary
    IF currentSalary < threshold THEN
        UPDATE EMPLOYEE
        SET Salary = threshold
        WHERE SSN = empSSN;
    END IF;

    -- Return the updated salary details
    SELECT Fname, Lname, Salary 
    FROM EMPLOYEE 
    WHERE SSN = empSSN;
END //
DELIMITER ;

-- Cursors for Salary Management

-- Procedure Using a Cursor to Increase Salary Below 35,000
/**
 * This procedure uses a cursor to loop through employees with a salary below 35,000.
 * It increases their salary by 10%.
 */
DELIMITER //
CREATE PROCEDURE tt35()
BEGIN
    DECLARE sal BIGINT;  -- Variable to store the salary
    DECLARE eid BIGINT;  -- Variable to store the employee SSN
    DECLARE salary_status VARCHAR(30) DEFAULT 'Updated';  -- Variable to store status
    DECLARE r_f TINYINT DEFAULT FALSE;  -- Flag to check end of cursor

    -- Declare a cursor to fetch employees with salary less than 35,000
    DECLARE cur_sal CURSOR FOR 
    SELECT SSN, Salary FROM EMPLOYEE WHERE Salary < 35000;

    -- Declare a handler to set the flag when no more rows are available
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET r_f = TRUE;

    -- Open the cursor
    OPEN cur_sal;

    -- Loop through each row from the cursor
    WHILE r_f = FALSE DO
        -- Fetch the SSN and Salary of the employee
        FETCH cur_sal INTO eid, sal;

        -- If the employee exists, update their salary by 10%
        IF r_f = FALSE THEN
            UPDATE EMPLOYEE SET Salary = sal + (sal * 0.1) WHERE SSN = eid;
            SELECT eid AS Employee_SSN, sal AS Old_Salary, sal + (sal * 0.1) AS New_Salary, salary_status AS Salary_Status;
        END IF;
    END WHILE;

    -- Close the cursor
    CLOSE cur_sal;
END //
DELIMITER ;

-- Functions for Employee and Project Management

-- Function to Get Total Salary of a Department
/**
 * This function calculates the total salary of all employees in a given department.
 * It takes the department number as input and returns the total salary.
 */
DELIMITER //
CREATE FUNCTION get_sal(deptno INT) RETURNS DECIMAL(9,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE sum_sal DECIMAL(9,2);
    SELECT SUM(Salary) INTO sum_sal FROM EMPLOYEE WHERE dno = deptno;
    RETURN sum_sal;
END //
DELIMITER ;

-- Function to Get Project Count for an Employee
/**
 * This function calculates the number of projects an employee is working on.
 * It takes the employee SSN as input and returns the count of projects.
 */
DELIMITER //
CREATE FUNCTION get_proj(eno BIGINT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE ecount INT;
    SELECT COUNT(pno) INTO ecount FROM WORKS_ON WHERE Essn = eno;
    RETURN ecount;
END //
DELIMITER ;

-- Triggers for Employee Management

-- Trigger Before Inserting an Employee
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

-- Trigger to Ensure Non-Negative Salary
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
