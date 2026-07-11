USE sakila;

-- SUBSTR
SELECT name,
       SUBSTR(name, 2),
       SUBSTR(name, 2, 4),
       SUBSTR(name, 1, 4)
FROM country
WHERE name = 'Colombia';

SELECT name,
       SUBSTR(name, -4)
FROM country
WHERE name = 'Colombia';


-- LENGTH and CHAR_LENGTH
SELECT name,
       LENGTH(name),
       CHAR_LENGTH(name)
FROM country;

-- LENGTH() returns the number of bytes.
-- CHAR_LENGTH() returns the number of characters.


-- REPLACE
SELECT name,
       REPLACE(name, 'a', '@')
FROM country;


-- TRIM
SELECT TRIM('   he llo    ');

-- TRIM removes leading and trailing spaces.
-- Python equivalent: strip()


-- LPAD
SELECT name,
       LPAD(name, 6, '-')
FROM country;

-- RPAD Example
SELECT name,
       RPAD(name, 10, '*')
FROM country;


-- Date Functions
SELECT NOW(),
       ADDDATE(NOW(), 2);

SELECT NOW(),
       ADDDATE(NOW(), -40);

SELECT NOW(),
       ADDDATE(NOW(), 1),
       ADDDATE(NOW(), -1),
       ADDDATE(NOW(), INTERVAL 1 YEAR),
       ADDDATE(NOW(), INTERVAL 1 WEEK);


-- YEAR and MONTH
SELECT NOW(),
       YEAR(NOW()),
       MONTH(NOW());

-- EXTRACT
SELECT EXTRACT(MONTH FROM NOW()) AS Month,
       EXTRACT(MINUTE FROM NOW()) AS Minute;

-- WEEKDAY
SELECT WEEKDAY(NOW());

-- CONCAT
SELECT NOW(),
       CONCAT('Current month is ', MONTH(NOW()));


-- DATE_FORMAT
SELECT NOW(),
       DATE_FORMAT(NOW(), '%d-%m-%Y') AS Date;

SELECT DATE_FORMAT(NOW(), '%W, %M %d, %Y') AS Full_Date;

SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %h:%i:%s %p') AS Date_Time;

