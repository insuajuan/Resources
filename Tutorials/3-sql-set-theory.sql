'SET THEORY'

'Set Theory Venn Diagrams'

'Union => incluye todos los valores, intersecciones y no. Sin repetir'
'Intersect => solo incluye los valores en comun'
'Except => solo toma en cuenta un dataset, q no intersecciona en comun con el otro'
'Union All => como Union, pero trae duplicados los valores en comun que interseccionan'

'!! The fields included in the operation must be of the same data type since they come back as just a single field. You cant stack a number on top of a character field in other words.'

'UNION'

SELECT * 
FROM economies2010
UNION
SELECT *
FROM economies2015
ORDER BY code;

'UNION ALL'

SELECT * 
FROM economies2010
UNION ALL
SELECT *
FROM economies2015
ORDER BY code;

'INTERSECTIONAL'
SELECT code, year
FROM economies
INTERSECT
SELECT country_code, year
FROM populations
ORDER BY code, year;

'EXCEPT'
'busco monarcas q no son primeros ministros'
SELECT monarch, country
FROM monarchs
EXCEPT
SELECT prime_minister, country
FROM prime_ministers;

'SEMI-JOINS and ANTI-JOINS'

'The SEMI-JOIN matches records by key field in the right table with those in the left. 
It then picks out only the rows in the left table that match that condition. 
The ANTI-JOIN picks out those columns in the left table that do not match the condition on the right table.'

'Semi-Join'
SELECT president, country, continent
FROM presidents
WHERE country IN
    (SELECT name
    FROM states
    WHERE indep_year < 1880);

'Anti-Join'
SELECT president, country, continent
FROM presidents
WHERE continent LIKE '%America'
    AND country NOT IN
        (SELECT name
        FROM states
        WHERE indep_year < 1880);

'There are four different types of joins you learned about in this course. 
First, an INNER JOIN is also denoted as just JOIN in SQL. 
A special case of an INNER JOIN you explored is called a self-join. 
Second, there are three OUTER JOINs denoted as LEFT JOIN (or LEFT OUTER JOIN), RIGHT JOIN (or RIGHT OUTER JOIN), and FULL JOIN (or FULL OUTER JOIN). 
Third, you worked with CROSS JOINs to create all possible combinations between two tables. 
Lastly, you investigated semi-joins and anti-joins.'