SELECT SUM(population)
FROM world

SELECT DISTINCT continent FROM world

SELECT SUM(gdp) from world
WHERE continent = 'Africa'

SELECT COUNT(name) FROM world
WHERE area > 1000000

SELECT SUM(population)
FROM world
WHERE name IN ('Lithuania', 'Latvia', 'Estonia')

SELECT continent, COUNT(name) FROM world
GROUP BY continent

SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent

SELECT continent from world
GROUP BY continent
HAVING SUM(population) >= 100000000

