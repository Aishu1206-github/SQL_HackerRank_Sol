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


                                  -- Advance SELECT --
                            -- Traingle Table 
-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

CREATE TABLE TRIANGLES(
	A Int,
    B Int,
    C Int
);
INSERT INTO TRIANGLES VALUES(20,20,23),
(20,20,20),
(20,21,22),
(13,14,30);
SELECT * FROM TRIANGLES;

-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.
-- The TRIANGLES table is described as follows:

SELECT 
  CASE
    WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS TriangleType
FROM TRIANGLES;


					 -- OCCUPATIONS TABLE
-- Generate the following two result sets:
-- Note: There will be at least two entries in the table for each type of occupation.
-- The OCCUPATIONS table is described as follows:

CREATE TABLE OCCUPATIONS(
	Name VARCHAR(20),
    Occupation VARCHAR(30)
);
INSERT INTO OCCUPATIONS VALUES('Samantha','Doctor'),
('Julia','Actor'),
('Maria','Actor'),
('Meera','Singer'),
('Ashely','Professor'),
('Ketty','Professor'),
('Christeen','Professor'),
('Jane','Actor'),
('Jenny','Doctor'),
('Priya','Singer');
SELECT * FROM OCCUPATIONS;

-- 1]  Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses).
--  For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
SELECT CONCAT(Name,'(',SUBSTR(Occupation,1,1),')') AS FormatName
FROM OCCUPATIONS
ORDER BY Name;


-- 2]  Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
-- Ex: There are a total of [occupation_count] [occupation]s.
-- where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
SELECT CONCAT('There are a total of', ' ',COUNT(*),' ',LOWER(Occupation),'s.') AS OccupationCount
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*), Occupation;



-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
-- The output should consist of four columns (Doctor, Professor, Singer, and Actor) in that specific order, with their respective names listed alphabetically under each column.
-- Note: Print NULL when there are no more names corresponding to an occupation.
-- Input Format
-- The OCCUPATIONS table is described as follows:
-- Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

SELECT 
	MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
	SELECT 
    Name, Occupation,ROW_NUMBER() OVER (partition by Occupation ORDER BY Name ) AS rn
    FROM OCCUPATIONS
    )AS Ranked
    GROUP BY rn;

