SELECT COUNT(*) FROM stops

SELECT id FROM stops
WHERE name = 'Craiglockhart'

SELECT stops.id, stops.name
FROM route
JOIN stops ON stops.id = route.stop
WHERE num = 4
AND company = 'LRT'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53
AND b.stop = 149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London Road'

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop = 115
AND b.stop = 137

SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'Tollcross'

SELECT stopb.name, a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'

SELECT rt1.num, rt1.company, st1.name, rt3.num, rt3.company 
FROM route rt1
JOIN route rt2 ON rt1.num = rt2.num AND rt1.company = rt2.company
JOIN route rt3 ON rt2.stop = rt3.stop
JOIN route rt4 ON rt3.num = rt4.num AND rt3.company = rt4.company
JOIN stops st1 ON st1.id = rt2.stop
WHERE rt1.stop = (SELECT stops.id
                 FROM stops
                 WHERE name = 'Craiglockhart')
AND rt4.stop = (SELECT stops.id
               FROM stops
               WHERE name = 'Lochend')
ORDER BY rt1.num, st1.name, rt3.num;



