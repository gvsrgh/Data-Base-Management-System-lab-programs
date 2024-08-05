
/*-----------------Aggregate Functions----------------------------------*/
SELECT CONCAT('My','S','QL');
SELECT INSERT('Quadratic',3,4,'What');
SELECT INSTR('foobarbar','bar');
SELECT LOWER('QUADRATICALLY');
SELECT LENGTH("text");
SELECT LPAD('hi',4,'??');
SELECT RPAD('hi',4,'??');
SELECT LTRIM('  barbar');
SELECT RTRIM('barbar   ');
SELECT REVERSE('abcd');
SELECT STRCMP('MOHD', 'MOHD');
SELECT STRCMP('AMOHD', 'MOHD');
SELECT SUBSTRING('Quadratically',5);
SELECT SUBSTRING('Quadratically',5,6);

#------------------Date & Time Functions---------------------------------
SELECT CURDATE();
SELECT CURTIME();
SELECT DAYOFMONTH('1998-02-03');
SELECT DAYOFWEEK('1998-02-03');
SELECT DAYOFYEAR('1998-02-03');

SELECT
    DATE_FORMAT('2024-07-31 15:45:00', '%a %M %D') AS formatted_date;

SELECT
    DATE_FORMAT('2024-07-31 15:45:00', '%m-%d-%Y') AS formatted_date;

SELECT
    DATE_FORMAT('2024-07-31 15:45:00', '%j %W %u') AS formatted_date;

SELECT
    CONCAT(
        WEEK('2024-07-31 15:45:00'), ' ',
        WEEKDAY('2024-07-31 15:45:00'), ' ',
        HOUR('2024-07-31 15:45:00')
    ) AS formatted_date;

SELECT
    CONCAT(
        YEAR('2024-07-31 15:45:00'), ' ',
        MONTHNAME('2024-07-31 15:45:00'), ' ',
        YEARWEEK('2024-07-31 15:45:00')
    ) AS formatted_date;

/*------------------------Maths Functions---------------------*/
SELECT GREATEST(10000,2);
SELECT LEAST(10000,123,-123123);
SELECT FLOOR(10/3);
SELECT CEILING(10/3);
SELECT ROUND(10.523132);
SELECT truncate(1.785927343,3);
SELECT ABS(-124);
SELECT SQRT(64);
SELECT POW(2,2);
SELECT EXP(0);
SELECT MOD(5,2);
