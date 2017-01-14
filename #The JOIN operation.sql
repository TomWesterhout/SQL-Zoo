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
FROM goal JOIN game ON (matchid=id)
WHERE teamid = 'GER';

#4
SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%';

#5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (teamid=id)
WHERE gtime <= 10;

#6
SELECT mdate, teamname
FROM game JOIN eteam ON (team1 = eteam.id)
WHERE coach = 'Fernando Santos';

#7
SELECT player
FROM goal JOIN game ON (matchid = id)
WHERE stadium = 'National Stadium, Warsaw';

#8
SELECT DISTINCT(player)
FROM goal JOIN game ON (matchid = id)
WHERE team1 = teamid AND team2 = 'GER' OR team2 = teamid AND team1 = 'GER';

#9
SELECT teamname, COUNT(teamid) AS goals
FROM eteam JOIN goal ON (id=teamid)
WHERE id = teamid
GROUP BY teamname;