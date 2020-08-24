SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal
  JOIN eteam ON teamid = id
WHERE gtime<=10

SELECT mdate, teamname
FROM game
  JOIN eteam ON team1=eteam.id
WHERE coach = 'Fernando Santos'

SELECT player
from goal
  JOIN game ON game.id = goal.matchid
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game
  JOIN goal
  ON goal.matchid = game.id
WHERE (team1='GER' OR team2='GER')
  AND goal.teamid != 'GER'

SELECT teamname, COUNT(*)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

SELECT stadium, COUNT(*)
FROM game
  JOIN goal ON game.id = goal.matchid
GROUP BY stadium

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id
WHERE (goal.teamid = 'GER')
GROUP BY matchid, mdate

SELECT mdate, team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
FROM game
  JOIN goal
  ON goal.matchid = game.id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;



