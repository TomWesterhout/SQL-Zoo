#Self join

#1
SELECT COUNT(stops.id) AS Stops
FROM stops;

#2
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

#3
SELECT id, name
FROM stops
JOIN route ON stops.id = route.stop
WHERE num = 4;

#4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

#5
SELECT a.company, a.num, a.stop, b.stop
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = 53 AND b.stop = 149;

#6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

#7
SELECT a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137
GROUP BY company, num;

#8
SELECT a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'Tollcross';

#9
SELECT DISTINCT(name), a.company, a.num
FROM route a
JOIN route b ON a.company = b.company AND a.num = b.num
JOIN stops ON a.stop = stops.id
WHERE b.stop = 53;

#10
SELECT DISTINCT(a.num), a.company, transita.name, c.num, c.company
FROM route a
JOIN route b ON a.num = b.num AND a.company = b.company
JOIN (route c JOIN route d ON c.num = d.num AND c.company = d.company)
JOIN stops start ON a.stop = start.id
JOIN stops transita ON b.stop = transita.id
JOIN stops transitb ON c.stop = transitb.id
JOIN stops stop ON d.stop = stop.id
WHERE start.name = 'Craiglockhart'
AND stop.name = 'Sighthill'
AND transita.name = transitb.name
ORDER BY LENGTH(a.num), b.num, transita.id, LENGTH(c.num), d.num;