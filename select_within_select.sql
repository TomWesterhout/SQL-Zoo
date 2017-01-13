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
					WHERE name 
					IN ('Argentina', 'Australia'))
ORDER BY name;