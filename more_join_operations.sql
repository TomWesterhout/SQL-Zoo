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
SELECT id
FROM movie
WHERE title = 'Casablanca';

#7
SELECT name
FROM actor 
JOIN casting ON (id = actorid)
WHERE movieid = 11768;

#8
SELECT name
FROM casting 
JOIN actor ON (casting.actorid = actor.id) 
JOIN movie ON (casting.movieid = movie.id)
WHERE title = 'Alien';

#9
SELECT title
FROM casting 
JOIN movie ON (casting.movieid = movie.id) 
JOIN actor ON (casting.actorid = actor.id)
WHERE name = 'Harrison Ford';

#10
SELECT title
FROM casting 
JOIN movie ON (casting.movieid = movie.id) 
JOIN actor ON (casting.actorid = actor.id)
WHERE name = 'Harrison Ford' AND ord > 1;

#11
SELECT title, name
FROM casting 
JOIN movie ON (casting.movieid = movie.id) 
JOIN actor ON (casting.actorid = actor.id)
WHERE yr = 1962 AND ord = 1;

#12
SELECT yr, COUNT(title)
FROM casting 
JOIN movie ON (casting.movieid = movie.id) 
JOIN actor ON (casting.actorid = actor.id)
WHERE name = 'John Travolta'
GROUP BY yr
HAVING COUNT(title) > 2;

#13
SELECT title, name
FROM casting 
	JOIN movie ON (casting.movieid = movie.id) 
	JOIN actor ON (casting.actorid = actor.id)
WHERE movieid IN(SELECT movieid FROM casting 
	JOIN movie ON(casting.movieid = movie.id) 
	JOIN actor ON (casting.actorid = actor.id) WHERE name = 'Julie Andrews') 
AND ord = 1;

#14
SELECT DISTINCT(name)
FROM casting
JOIN movie ON (casting.movieid = movie.id)
JOIN actor ON (casting.actorid = actor.id)
WHERE actorid IN(SELECT actorid FROM casting WHERE ord = 1 GROUP BY actorid HAVING COUNT(ord) >= 30);

#15
SELECT title, COUNT(actorid) AS actors
FROM casting
JOIN movie ON (casting.movieid = movie.id)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title;

#16
SELECT DISTINCT(name)
FROM casting
JOIN actor ON (casting.actorid = actor.id)
WHERE movieid IN(SELECT movieid FROM casting 
JOIN actor ON (casting.actorid = actor.id) WHERE name = 'Art Garfunkel') AND name <> 'Art Garfunkel'
