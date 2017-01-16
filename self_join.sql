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
SELECT DISTINCT an, ac, stops.name, dn, dc
FROM (SELECT a.num as an, a.company as ac, b.stop as bstop
      FROM route a JOIN route b 
      JOIN stops s ON a.num = b.num AND s.id = a.stop
      WHERE s.name = 'Craiglockhart') T1
JOIN (SELECT d.num as dn, d.company as dc, c.stop as cstop
      FROM route c JOIN route d 
      JOIN stops s ON c.num = d.num AND c.company = d.company AND s.id = d.stop
      WHERE s.name = 'Sighthill') T2
JOIN stops ON bstop = cstop AND bstop = stops.id