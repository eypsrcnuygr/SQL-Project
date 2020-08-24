SELECT name
FROM world
WHERE population >
     (SELECT population
FROM world
WHERE name='Russia')

SELECT (name)
from world
WHERE continent = 'Europe' AND (GDP/population) > 
(SELECT (GDP/population)
  FROM world
  WHERE name = 'United Kingdom')

SELECT name, continent
from world
WHERE continent = 'South America' OR continent = 'Oceania'
ORDER BY name

SELECT name, population
from world
WHERE population BETWEEN (SELECT population
from world
WHERE name = 'Poland') AND
(SELECT population
from world
WHERE name = 'Canada');

SELECT name, CONCAT(ROUND((population/(SELECT population
  FROM world
  WHERE name = 'Germany'))* 100), '%') as percentage
FROM world
WHERE continent = 'Europe'

SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp
FROM world
WHERE continent = 'Europe' AND gdp > 0)

SELECT continent, name, area
FROM world x
WHERE area >= ALL
    (SELECT area
FROM world y
WHERE y.continent=x.continent
  AND area > 0)

SELECT continent, name
from world x
WHERE name <= ALL(SELECT name
FROM world y
WHERE y.continent = x.continent AND y.name >= 'a' )

SELECT name, continent, population
FROM world x
WHERE 25000000 >= ALL(SELECT population
FROM world AS y
WHERE x.continent = y.continent
  AND y.population > 0);


SELECT name, continent
FROM world x
WHERE population/3 >= ALL(SELECT population
FROM world AS y
WHERE x.continent = y.continent
  AND x.name != y.name);








