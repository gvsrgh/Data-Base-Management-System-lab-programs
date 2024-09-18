-- Database Creation
/** Create a new database named 22501A0557 */
CREATE DATABASE 22501A0557;

/** Use the newly created database */
USE 22501A0557;

-- Table Creation: EMPLOYEE
/** Create a table named EMPLOYEE with various attributes */
CREATE TABLE EMPLOYEE (	
    Fname varchar(20) NOT NULL,  -- First name of the employee
    Minit varchar(20),           -- Middle initial of the employee
    Lname varchar(20),           -- Last name of the employee
    ssn bigint primary key,      -- Social Security Number, primary key
    Bdate date,                  -- Birth date of the employee
    Address varchar(40),         -- Address of the employee
    Gender char,                 -- Gender of the employee
    Salary bigint,               -- Salary of the employee
    super_ssn bigint references EMPLOYEE(ssn),  -- Supervisor's SSN, foreign key referencing EMPLOYEE
    Dno int references DEPARTMENT(Dnumber)      -- Department number, foreign key referencing DEPARTMENT
);

/** Describe the structure of the EMPLOYEE table */
DESC EMPLOYEE;

-- Table Creation: DEPARTMENT
/** Create a table named DEPARTMENT with various attributes */
CREATE TABLE DEPARTMENT(
    Dname varchar(30) NOT NULL,  -- Department name
    Dnumber int primary key NOT NULL,  -- Department number, primary key
    Mgr_ssn bigint NOT NULL references EMPLOYEE(ssn),  -- Manager's SSN, foreign key referencing EMPLOYEE
    Mgr_start_date date          -- Manager's start date
);

/** Describe the structure of the DEPARTMENT table */
DESC DEPARTMENT;

-- Table Creation: DEPT_LOCATIONS
/** Create a table named DEPT_LOCATIONS with various attributes */
CREATE TABLE DEPT_LOCATIONS(
    Dnumber int NOT NULL references DEPARTMENT(Dnumber),  -- Department number, foreign key referencing DEPARTMENT
    Dlocation varchar(30) NOT NULL,  -- Department location
    primary key(Dnumber, Dlocation)  -- Composite primary key
);

/** Describe the structure of the DEPT_LOCATIONS table */
DESC DEPT_LOCATIONS;

-- Table Creation: PROJECT
/** Create a table named PROJECT with various attributes */
CREATE TABLE PROJECT(
    Pname varchar(30) NOT NULL,  -- Project name
    Pnumber int NOT NULL primary key,  -- Project number, primary key
    Plocation varchar(30),       -- Project location
    Dnum int NOT NULL references DEPARTMENT(Dnumber)  -- Department number, foreign key referencing DEPARTMENT
);

/** Describe the structure of the PROJECT table */
DESC PROJECT;

-- Table Creation: WORKS_ON
/** Create a table named WORKS_ON with various attributes */
CREATE TABLE WORKS_ON(
    Essn bigint NOT NULL references EMPLOYEE(ssn),  -- Employee's SSN, foreign key referencing EMPLOYEE
    Pno int NOT NULL references PROJECT(Pnumber),   -- Project number, foreign key referencing PROJECT
    Hours Decimal(3,1) NOT NULL,  -- Hours worked on the project
    primary key(Essn, Pno)        -- Composite primary key
);

/** Describe the structure of the WORKS_ON table */
DESC WORKS_ON;

-- Table Creation: DEPENDENT
/** Create a table named DEPENDENT with various attributes */
CREATE TABLE DEPENDENT(
    Essn bigint NOT NULL references EMPLOYEE(ssn),  -- Employee's SSN, foreign key referencing EMPLOYEE
    Dependent_name varchar(30) NOT NULL,  -- Dependent's name
    Gender char,                 -- Dependent's gender
    Bdate date,                  -- Dependent's birth date
    Relationship varchar(8),     -- Relationship to the employee
    primary key(Essn, Dependent_name)  -- Composite primary key
);

/** Describe the structure of the DEPENDENT table */
DESC DEPENDENT;

-- Show All Tables
/** Show all tables in the current database */
SHOW TABLES;
