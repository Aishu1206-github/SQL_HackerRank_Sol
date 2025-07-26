CREATE DATABASE hackerrank;
use hackerrank;
show tables;
                        -- STATION NAME TABLE --
CREATE TABLE STATION (
	ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N INT,
    LONG_W INT
);
INSERT INTO STATION VALUES
(1, 'SATARA','MH',40, 20),
(2, 'PUNE','MH',50, 70),
(3, 'HYDERABAD','AP',20, 15),
(4, 'BHOPAL','MP',70, 10),
(5, 'JAIPUR','RA',30, 20),
(6, 'INDORE','MP',20, 20),
(7, 'AKOLA','MH',50, 10);


                          -- Basic SELECT --
                          
-- Q1] Query a list of CITY and STATE from the STATION table.
-- The STATION table is described as follows:
SELECT CITY, STATE FROM STATION;

-- Q2] Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION 
WHERE MOD (ID,2) = 0;

-- Q3] Find the difference between the total number of STATE entries in the table and the number of distinct STATE entries in the table.
-- The STATION table is described as follows:
SELECT COUNT(STATE) - COUNT(DISTINCT STATE) 
FROM STATION;

-- Q4] Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
--  If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) ASC, CITY ASC 
LIMIT 1)
UNION
(SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY length_city DESC, CITY DESC
LIMIT 1);

-- Q5] Query the list of CITY names starting with vowels ( a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
-- Input Format
-- The STATION table is described as follows
SELECT * FROM STATION;
SELECT DISTINCT CITY FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) IN ('a','e','i','o','u');

-- Q6] Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION 
WHERE RIGHT(CITY,1) IN('a','e','i','o','u');

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(CITY) LIKE '%a'
   OR LOWER(CITY) LIKE '%e'
   OR LOWER(CITY) LIKE '%i'
   OR LOWER(CITY) LIKE '%o'
   OR LOWER(CITY) LIKE '%u';

-- Q7] Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
-- Your result cannot contain duplicates.
-- The STATION table is described as follows:

SELECT DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) IN ('a', 'e', 'i', 'o', 'u')
  AND LOWER(SUBSTR(CITY, -1, 1)) IN ('a', 'e', 'i', 'o', 'u');
  
-- Q8] Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN('a','e','i','o','u');

-- Q9] Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION
WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN('a','e','i','o','u');

SELECT * FROM STATION;

-- Q11] Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION
WHERE LOWER(SUBSTR(CITY,-1,1)) NOT IN('a','e','i','o','u')
OR LOWER(SUBSTR(CITY,1,1)) NOT IN('a','e','i','o','u');

-- Q12] Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
-- The STATION table is described as follows:
SELECT DISTINCT CITY FROM STATION
WHERE LOWER(SUBSTR(CITY,1,1)) NOT IN('a','e','i','o','u')
AND LOWER(SUBSTR(CITY,-1,1)) NOT IN('a','e','i','o','u');



CREATE TABLE STUDENTS(
	ID INT,
    Name VARCHAR(20),
    Marks INT
);

INSERT INTO STUDENTS VALUES(1,'Ashley','81'),
(2,'Samantha','75'),
(3,'Julia','76'),
(4,'Belvet','84');
SELECT * FROM STUDENTS;

-- Q13] Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
-- The STUDENTS table is described as follows:
SELECT Name FROM STUDENTS 
WHERE Marks>75
ORDER BY RIGHT(Name,3), ID;

-- Q14] Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT Name 
FROM STUDENTS
ORDER BY Name ASC;

-- Q15] Write a query that prints a list of employee names for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
-- SELECT name FROM Employee
-- WHERE salary>2000 and months<10
-- ORDER BY employee_id ASC;

