#The JOIN operation

#1
SELECT matchid, player
FROM goal 
WHERE teamid = 'GER';

#2
SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012;

#3
SELECT player, teamid, stadium, mdate
FROM goal 
JOIN game ON (matchid=id)
WHERE teamid = 'GER';

#4
SELECT team1, team2, player
FROM game 
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

#5
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON (teamid=id)
WHERE gtime <= 10;

#6
SELECT mdate, teamname
FROM game 
JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos';

#7
SELECT player
FROM goal 
JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw';

#8
SELECT DISTINCT(player)
FROM goal 
JOIN game ON (matchid = id)
WHERE team1 = teamid AND team2 = 'GER' 
OR team2 = teamid AND team1 = 'GER';

#9
SELECT teamname, COUNT(teamid) AS goals
FROM eteam 
JOIN goal ON (id=teamid)
WHERE id = teamid
GROUP BY teamname;

#10
SELECT stadium, COUNT(*) AS goals
FROM game 
JOIN goal ON (id = matchid)
WHERE teamid = team1 OR teamid = team2
GROUP BY stadium;

#11
SELECT matchid, mdate, COUNT(teamid) AS goals
FROM goal 
JOIN game ON (matchid = id)
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid, mdate;

#12
SELECT matchid, mdate, COUNT(teamid) AS goals
FROM goal 
JOIN game ON (matchid = id)
WHERE teamid = 'GER'
GROUP BY matchid, mdate;

#13
SELECT DISTINCT( mdate), team1, 
	SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) score1, 
	team2, 
	SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) score2
FROM game 
LEFT JOIN goal ON id = matchid
GROUP BY mdate, team1, team2
ORDER BY mdate, team1, team2