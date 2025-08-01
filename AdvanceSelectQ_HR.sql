                              -- Advance SELECT --
                              -- Traingle Table 
use hackerrank;
show tables;
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



-- 3] Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
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
    


    
                                       -- BST TABLE
-- You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
CREATE TABLE BST(
   N INT,
   P INT
); 
INSERT INTO BST VALUES(1,2),
(3,2),
(6,8),
(9,8),
(2,5),
(8,5),
(5,null);
SELECT * FROM BST;

-- Q1] Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

-- Root: If node is root node.
-- Leaf: If node is leaf node.
-- Inner: If node is neither root nor leaf node.

SELECT N,
	CASE
		WHEN P IS null THEN 'Root'
        WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
	END AS NodeType
FROM BST
ORDER BY N;

-- P IS NULL → Root:
--          If a node has no parent, it's the root node.
-- N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) → Leaf:
--          A node is a leaf if it never appears as a parent (P) in the table.
-- ELSE → Inner:
--         If a node is not a root and appears as a parent, it is an inner node.
-- ORDER BY N:
--         Sorts the result by node value.



   -- NEW COMPANY
-- Each of the companies follows this hiera
--                       Founder
--                         |
-- 	              Lead Manager
--                         |
-- 		      Senoir Manager
--                         |
-- 			Manager
--                         |
-- 			Employee
CREATE TABLE Company (                               -- Company
	company_code VARCHAR(5),
    founder VARCHAR(10)
);
INSERT INTO Company VALUES ('C1','Monika'),('C2','Samantha');
SELECT * FROM Company;

CREATE TABLE Lead_Manager (                          -- Lead_Manager
	  lead_Manager_code VARCHAR(5),
      company_code VARCHAR(5)
);
INSERT INTO Lead_Manager VALUES ('LM1','C1'),('LM2','C2');
SELECT * FROM Lead_Manager;

CREATE TABLE Senior_Manager (                        -- Senior_Manager
		senior_manager_code VARCHAR(5),
        lead_manager_code VARCHAR(5),
        company_code VARCHAR(5)
);
INSERT INTO Senior_Manager VALUES('SM1','LM1','C1'),('SM2','LM1','C1'),
('SM3','LM2','C2');
SELECT * FROM Senior_Manager;

CREATE TABLE Manager (                               -- Manager
	manager_code VARCHAR(5),
    senior_manager_code VARCHAR(5),
    lead_manager_code VARCHAR(5),
    company_code VARCHAR(5)
);
INSERT INTO Manager VALUES ('M1','SM1','LM1','C1'),('M2','SM3','LM2','C2'),
('M3','SM3','LM2','C2');
SELECT * FROM Manager;

CREATE TABLE Employee (                            -- Employee
	employee_code VARCHAR(5),
    manager_code VARCHAR(5),
    senior_manager_code VARCHAR(5),
    lead_manager_code VARCHAR(5),
    company_code VARCHAR(5)
);
INSERT INTO Employee VALUES ('E1','M1','SM1','LM1','C1'),
('E2','M1','SM1','LM1','C1'),
('E3','M2','SM3','LM2','C2'),
('E4','M3','SM3','LM2','C2');
SELECT * FROM Employee;

-- 1]  write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. 
-- Order your output by ascending company_code.

SELECT c.company_code, c.founder, 
COUNT(DISTINCT l.lead_Manager_code),
COUNT(DISTINCT s.senior_manager_code),
COUNT(DISTINCT m.manager_code),
COUNT(DISTINCT e.employee_code)
FROM Company c, Lead_Manager l, Senior_Manager s, Manager m, Employee e
WHERE c.company_code = l.company_code
AND l.lead_Manager_code = s.lead_manager_code 
AND s.senior_manager_code = m.senior_manager_code
AND m.manager_code = e.manager_code 
GROUP BY c.company_code, c.founder  
ORDER BY c.company_code;
