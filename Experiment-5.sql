-- String Functions

/** Concatenate 'My', 'S', and 'QL' */
SELECT CONCAT('My','S','QL') AS CONCAT;

/** Insert 'What' into 'Quadratic' starting at position 3 and replacing 4 characters */
SELECT INSERT('Quadratic', 3, 4, 'What') ISRT;

/** Find the position of 'bar' in 'foobarbar' */
SELECT INSTR('foobarbar', 'bar') INSTR;

/** Convert 'QUADRATICALLY' to lowercase */
SELECT LOWER('QUADRATICALLY') LOWER;

/** Get the length of the string 'text' */
SELECT LENGTH('text') LEN;

/** Left-pad 'hi' with '??' to a total length of 4 */
SELECT LPAD('hi', 4, '??') LPAD;

/** Right-pad 'hi' with '??' to a total length of 4 */
SELECT RPAD('hi', 4, '??') RPAD;

/** Trim leading spaces from '  barbar' */
SELECT LTRIM('  barbar') LTRIM;

/** Trim trailing spaces from 'barbar   ' */
SELECT RTRIM('barbar   ') RTRIM57;

/** Reverse the string 'abcd' */
SELECT REVERSE('abcd') REVERSE57;

/** Compare 'MOHD' with 'MOHD' */
SELECT STRCMP('MOHD', 'MOHD') STRCMP57;

/** Compare 'AMOHD' with 'MOHD' */
SELECT STRCMP('AMOHD', 'MOHD') STRCMP57;

/** Get the substring of 'Quadratically' starting from position 5 */
SELECT SUBSTRING('Quadratically', 5) SUBSTRING57;

/** Get the substring of 'Quadratically' starting from position 5 with length 6 */
SELECT SUBSTRING('Quadratically', 5, 6) SUBSTRING57;

-- Date and Time Functions

/** Get the current date */
SELECT CURDATE() CURDATE57;

/** Get the current time */
SELECT CURTIME() CURTIME57;

/** Get the day of the month for '2005-07-25' */
SELECT DAYOFMONTH('2005-07-25') DAYOFMONTH57;

/** Get the day of the week for '2005-07-25' */
SELECT DAYOFWEEK('2005-07-25') DAYOFWEEK57;

/** Get the day of the year for '2005-07-25' */
SELECT DAYOFYEAR('2005-07-25') DAYOFYEAR57;

/** Format the date '2005-07-25 08:45:00' as 'Mon July 25th' */
SELECT DATE_FORMAT('2005-07-25 08:45:00', '%a %M %D') DATE_FORMAT57;

/** Format the date '2024-07-31 15:45:00' as '07-31-2024' */
SELECT DATE_FORMAT('2024-07-31 15:45:00', '%m-%d-%Y') DATE_FORMAT57;

/** Format the date '2024-07-31 15:45:00' as '212 Wednesday 31' */
SELECT DATE_FORMAT('2024-07-31 15:45:00', '%j %W %u') DATE_FORMAT57;

/** Concatenate the week, weekday, and hour of '2024-07-31 15:45:00' */
SELECT CONCAT(WEEK('2024-07-31 15:45:00'), ' ', WEEKDAY('2024-07-31 15:45:00'), ' ', HOUR('2024-07-31 15:45:00')) Time57;

/** Concatenate the year, month name, and year-week of '2024-07-31 15:45:00' */
SELECT CONCAT(YEAR('2024-07-31 15:45:00'), ' ', MONTHNAME('2024-07-31 15:45:00'), ' ', YEARWEEK('2024-07-31 15:45:00')) Time57;

-- Numeric Functions

/** Get the greatest value among 10000 and 2 */
SELECT GREATEST(10000, 2) GREATEST57;

/** Get the least value among 10000, 123, and -123123 */
SELECT LEAST(10000, 123, -123123) LEAST57;

/** Get the floor value of 10 divided by 3 */
SELECT FLOOR(10/3) FLOOR57;

/** Get the ceiling value of 10 divided by 3 */
SELECT CEILING(10/3) CEILING57;

/** Round the number 10.523132 */
SELECT ROUND(10.523132) ROUND57;

/** Truncate the number 1.785927343 to 3 decimal places */
SELECT TRUNCATE(1.785927343, 3) TRUNCATE57;

/** Get the absolute value of -124 */
SELECT ABS(-124) ABS57;

/** Get the square root of 64 */
SELECT SQRT(64) SQRT57;

/** Get 2 raised to the power of 2 */
SELECT POW(2, 2) POW57;

/** Get the exponential value of 0 */
SELECT EXP(0) EXP57;

/** Get the remainder of 5 divided by 2 */
SELECT MOD(5, 2) MOD57;
