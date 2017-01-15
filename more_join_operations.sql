#More JOIN operations

#1
SELECT id, title
FROM movie
WHERE yr=1962;

#2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

#3
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr;

#4
SELECT title
FROM movie
WHERE id IN (11768, 11955, 21191);

#5
SELECT id
FROM actor
WHERE name = 'Glenn Close';

#6
