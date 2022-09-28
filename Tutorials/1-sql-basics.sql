'SELECTING'

'select all'
SELECT * FROM films;

'get all unique values'
SELECT DISTINCT language
FROM films;

'count'
SELECT COUNT(*)
FROM films;

--------------------------------------------
--------------------------------------------
'FILTERING'

'where, and, or'
SELECT title, release_year
FROM films
WHERE (release_year >= 1990 AND release_year < 2000)
AND (language = 'French' OR language = 'Spanish');

'where all menos <>'
SELECT *
FROM films
WHERE release_year <> 2015

'between - includes start and end values'
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

'where in - makes it easier to specify multiple OR conditions'
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
AND duration > 120;

'null, isnull'
SELECT name
FROM people
WHERE deathdate IS NULL;

'like and not like'
'LIKE operator can be used in a WHERE clause to search for a pattern in a column'
'The % wildcard will match zero, one, or many characters in text'
'The _ wildcard will match a single character'
SELECT name
FROM people
WHERE name LIKE 'B%';

SELECT name
FROM people
WHERE name LIKE '_r%';

SELECT name
FROM people
WHERE name NOT LIKE 'A%';

--------------------------------------------
--------------------------------------------
'AGGREGATE FX'

'AVG, SUM, MAX, MIN'
SELECT SUM(duration)
FROM films

'arithmetic symbols + - * /'
SELECT (2 + 2) 
'SQL assumes that if you divide an integer by an integer, you want to get an integer back'
SELECT (10 / 3) => SELECT 3

'AS - alias for result column name'
SELECT MAX(budget) AS max_budget,
       MAX(duration) AS max_duration
FROM films;

SELECT AVG(duration) / 60.0 AS avg_duration_hours  
FROM films;

--------------------------------------------
--------------------------------------------
'SORTING AND GROUPING'

'order by'
SELECT title
FROM films
ORDER BY release_year DESC;

'ORDER BY can also be used to sort on multiple columns. It will sort by the first column specified, then sort by the next'
SELECT birthdate, name
FROM people
ORDER BY birthdate, name;

'group by'
SELECT release_year, COUNT(id)
FROM films
GROUP BY release_year;

'having'
'aggregate functions cant be used in WHERE clauses, so we use HAVING'
'it should go after group by but before order by'
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10
ORDER BY release_year ASC;
