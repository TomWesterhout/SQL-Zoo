#Self join

#1
SELECT COUNT(stops.id) AS Stops
FROM stops;

#2
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

#3
