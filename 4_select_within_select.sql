# SELECT within SELECT

#1
SELECT name
FROM world
WHERE population > (SELECT population 
	FROM world 
	WHERE name = 'Russia');

#2
SELECT name
FROM world
WHERE continent = 'Europe' 
AND gdp/population > (SELECT gdp/population 
	FROM world 
	WHERE name = 'United Kingdom');

#3
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent 
	FROM world 
	WHERE name IN ('Argentina', 'Australia'))
ORDER BY name;

#4
SELECT name, population
FROM world
WHERE population > (SELECT population 
	FROM world 
	WHERE name = 'Canada') 
AND population < (SELECT population 
	FROM world 
	WHERE name = 'Poland');

#5
SELECT name, CONCAT(ROUND(population*100/(SELECT population 
	FROM world 
	WHERE name = 'Germany'), 0), '%')
FROM world
WHERE continent = 'Europe';

#6
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp 
	FROM world 
	WHERE gdp > 0 AND continent = 'Europe');

#7
SELECT continent, name, area
FROM world a
WHERE area >= ALL(SELECT area 
	FROM world b 
	WHERE a.continent = b.continent AND area > 0);

#8
SELECT continent, name
FROM world a
WHERE name <= ALL(SELECT name 
	FROM world b 
	WHERE a.continent = b.continent);

#9
SELECT name, continent, population
FROM world a
WHERE 25000000 >= ALL(SELECT population 
	FROM world b 
	WHERE a.continent = b.continent AND population > 0);

#10
SELECT name, continent
FROM world a
WHERE population > ALL(SELECT (population * 3) 
	FROM world b 
	WHERE a.continent = b.continent AND a.name <> b.name);
