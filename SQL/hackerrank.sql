-- BASIC SELECT

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees 
-- in Employee having a salary greater than 2000 per month who have been employees for less than 10  months. 
-- Sort your result by ascending employee_id.
SELECT NAME FROM EMPLOYEE
WHERE SALARY>2000 AND MONTHS<10
ORDER BY employee_id

-- Query all columns for all American cities in the CITY table with populations larger than 100000. 
-- The CountryCode for America is USA.
SELECT * FROM CITY
WHERE POPULATION>100000 AND CountryCode='USA'

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. 
-- Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE LEFT(CITY,1) NOT IN('a','e','i','o','u')
AND RIGHT(CITY,1) NOT IN('a','e','i','o','u')

-- Find the difference between the total number of CITY entries in the table 
-- and the number of distinct CITY entries in the table.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) 
FROM STATION

-- Query the two cities in STATION with the shortest and longest CITY names, 
-- as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
select city, char_length(city) from STATION 
 where city = (
        select min(city) 
        from STATION
        where char_length(city) = (select min(char_length(city)) from STATION)
    ) or city = (
        select min(city) 
        from STATION
        where char_length(city) = (select max(char_length(city)) from STATION)
    );

    --Query a list of CITY names from STATION for cities that have an even ID number. 
    --Print the results in any order, but exclude duplicates from the answe
    SELECT DISTINCT CITY FROM STATION 
WHERE MOD(ID,2)=0;

--Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
--Your result cannot contain duplicates.
SELECT DISTINCT(CITY) FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%'
OR CITY LIKE 'U%';

--Query the Name of any student in STUDENTS who scored higher than 75 Marks. 
--Order your output by the last three characters of each name. 
--If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME FROM STUDENTS
WHERE MARKS>75
ORDER BY RIGHT(NAME,3),ID ASC;

