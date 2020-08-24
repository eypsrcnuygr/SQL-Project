SELECT name, continent, population FROM world

SELECT name FROM world
WHERE population > 200000000

SELECT name, (GDP/population) AS per_capita_GDP
FROM world
WHERE population > 200000000

SELECT name, (population/1000000) as population_as_millions
FROM world
WHERE continent = 'South America'

SELECT name, population 
FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy'

SELECT name FROM world
WHERE name LIKE '%United%'

SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000

SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000

