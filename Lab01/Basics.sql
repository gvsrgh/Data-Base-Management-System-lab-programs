CREATE database 557Student;
USE 557Student;
CREATE table Personal_Info(Roll_Number int, Student_Name varchar(30),Address varchar(30),Date_of_birth date, Marks decimal(6,2));
desc Personal_Info;
INSERT into Personal_Info values (557, 'G. Venkata Sai Ram', 'Hyderabad','2004-05-26', 75.66);
SELECT * FROM Personal_Info;
INSERT into Personal_Info values (513, 'A. Greeshwanth','Ganavaram','2004-04-05', 100.25);
INSERT into Personal_Info values (559, 'G. Pranith', 'Guntur', '2004-10-11',100.44);
INSERT into Personal_Info values (502, 'A. Abdul', 'PVP','2004-01-10',100.55);
INSERT into Personal_Info values (503, 'J. Abdul', 'Kan','2004-11-11',123.12);
SELECT * FROM Personal_Info;
ALTER TABLE Personal_Info add(Phone_Number bigint);
desc Personal_Info;
