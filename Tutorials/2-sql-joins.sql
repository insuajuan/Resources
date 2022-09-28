'INNER JOINS'

'key field/primary key must be the same for tables to do inner joins'
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id;

SELECT c1.name AS city, c2.name AS country
FROM cities AS c1
INNER JOIN countries AS c2
ON c1.country_code = c2.code;

'multiple inner joins'
SELECT *
FROM left_table
  INNER JOIN right_table
    ON left_table.id = right_table.id
  INNER JOIN another_table
    ON left_table.id = another_table.id;

'if joining field name is the same, we can use USING. parenthesis is required'
SELECT *
FROM left_table
INNER JOIN right_table
USING (id);

'Self joins'
SELECT p1.country_code, 
p1.size AS size2010, 
p2.size AS size2015
FROM populations as p1
  INNER JOIN populations as p2
    USING (country_code);

'Case When and Then'
SELECT name, continent, code, surface_area,
    -- First case
    CASE WHEN surface_area > 2000000 THEN 'large'
        -- Second case
        WHEN surface_area > 350000 THEN 'medium'
        -- Else clause + end
        ELSE 'small' END
        -- Alias name
        AS geosize_group
-- From table
FROM countries;

'into'
SELECT country_code, size,
    CASE WHEN size > 50000000 THEN 'large'
        WHEN size > 1000000 THEN 'medium'
        ELSE 'small' END
        AS popsize_group
-- Into table
INTO pop_plus
FROM populations
WHERE year = 2015;

-- Select all columns of pop_plus
SELECT * FROM pop_plus;

-------------------------------------------
-------------------------------------------
'OUTTER and CROSS joins'

'LEFT joins'
'a LEFT JOIN keeps all of the original records in the left table but then marks the values as missing in the right table for those that dont have a match.'
'Duplicate rows are shown in the LEFT JOIN if there is more than one match'

SELECT c1.name AS city, code, c2.name AS country,
       region, city_proper_pop
FROM cities AS c1
  LEFT JOIN countries AS c2
    -- Match on country code
    ON c1.country_code = c2.code

'Right joins arent as common as left joins. One reason why is that you can always write a right join as a left join.'

'FULL joins'
'brings all data from both tables'
SELECT *
FROM left_table
FULL JOIN right_table
USING (id);

'CROSS join'
-- Select fields
SELECT c.name AS city, l.name AS language
-- From cities (alias as c)
FROM cities AS c        
  -- Join to languages (alias as l)
  CROSS JOIN languages AS l
-- Where c.name like Hyderabad
WHERE c.name LIKE 'Hyder%';



