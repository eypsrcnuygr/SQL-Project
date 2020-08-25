SELECT id, title
FROM movie
WHERE yr=1962

SELECT yr
FROM movie
WHERE title ='citizen Kane'

SELECT id, title, yr
from movie
WHERE title LIKE ('Star Trek%')
ORDER BY yr

SELECT id
FROM actor
WHERE name = 'Glenn Close'

SELECT id
FROM movie
WHERE title = 'Casablanca'

SELECT actor.name
FROM casting
  JOIN actor
  ON casting.actorid = actor.id
WHERE movieid = 11768

SELECT actor.name
FROM casting
  JOIN actor
  ON casting.actorid = actor.id
WHERE movieid = (SELECT id
FROM movie
WHERE title = 'Alien')

SELECT title
FROM movie
  JOIN casting
  ON casting.movieid = movie.id
WHERE casting.actorid = (SELECT id
FROM actor
WHERE name = 'Harrison Ford')

SELECT title
FROM movie
  JOIN casting
  ON casting.movieid = movie.id
WHERE casting.actorid = (SELECT id
  FROM actor
  WHERE name = 'Harrison Ford')
  AND casting.ord != 1

 SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE yr = 1962
AND casting.ord = 1

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title, name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor   ON casting.actorid = actor.id
WHERE movie.id IN (SELECT casting.movieid
                   FROM casting
                   JOIN actor ON casting.actorid = actor.id
                   WHERE actor.name = 'Julie Andrews')
AND casting.ord = 1

SELECT name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.actorid) >= 15

SELECT title, COUNT(actorid) FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

SELECT actor.name
FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.movieid
IN (SELECT casting.movieid
    FROM casting
    WHERE casting.actorid
     = (SELECT actor.id
        FROM actor
        WHERE name = 'Art Garfunkel'))
AND name != 'Art Garfunkel'