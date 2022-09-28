'CASE'

'Contains a WHEN, THEN, ELSE and finishes with END'

CASE    WHEN x=1 THEN 'a'
        WHEN x=2 THEN 'b'
        ELSE 'c' END as new_column

'if we dont want a new column created:'
CASE    WHEN x=1 THEN 'a'
        WHEN x=2 THEN 'b'
        END IS NOT NULL;

'we can add AND to the WHEN statement'

CASE WHEN x=1 AND y>1 THEN 'a'

'if there are nulls in the result or we dont care for other results (ommit using ELSE), we can exclude them by adding WHERE'

WHERE CASE WHEN x=1 THEN 'a'
           WHEN x=2 THEN 'b'

'Aggregate functions in CASE WHEN clauses'

SELECT season
COUNT(CASE WHEN hometeam_id = 1111
            AND home_goals > away_goals
            THEN id END) AS home_wins
FROM matches
GROUP BY season;


'example of avg and pct, rounded'
SELECT 
	c.name AS country,
    -- Round the percentage of tied games to 2 decimal points
	ROUND(AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2013_2014,
	ROUND(AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;

-----------------------------------

'SUBQUERIES'
'can be in any part of a query: select, from, where or group by'
'can return a variety of info: quantities, list, a table'


'Subquery inside WHERE clause'
'common in semi-joins and anti-joins but also with aggregate functions within same table:'

SELECT name, fert_rate
FROM states
WHERE continent = 'Asia'
    AND fert_rate <
        (SELECT AVG(fert_rate)
        FROM states)

'Subquery filtering list with IN or NOT IN'
SELECT team_name
FROM teams
WHERE
    team_id IN
    (SELECT hometeam_id
    FROM matches
    WHERE country_id=1234);

'Subquery inside FROM clause'
SELECT DISTINCT monarchs.continent, subquery.max_perc
FROM monarchs,
    (SELECT continent, MAX(women_parli_pct) AS max_perc
    FROM states
    GROUP BY continent) AS subquery
WHERE monarchs.continent = subquery.continent
ORDER BY continent;


'Subquery inside SELECT clause'
'Always we have to give an Alias to that subquery'

SELECT DISTINCT continent,
    (SELECT COUNT(*)
    FROM states
    WHERE prime_ministers.continent = states.continent) AS countries_sum
FROM prime_ministers;

--------------
'BEST PRACTICES'
'https://www.sqlstyle.guide/'

'annotate your queries'
/* This query looks for... */

'add inline comments'
FROM table1 -- this table has 10.000 rows

'indent subqueries'
FROM
SELECT
WHERE
    (SELECT ...)

SELECT
    data
    CASE WHEN ...
FROM
WHERE

'subqueries require computing power, so make sure it is necessary. Specially querying huge db'
    