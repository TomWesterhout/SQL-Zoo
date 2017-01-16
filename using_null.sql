#Using Null

#1
SELECT name
FROM teacher
WHERE dept IS NULL;

#2
SELECT teacher.name, dept.name
FROM teacher 
INNER JOIN dept
ON (teacher.dept=dept.id);

#3
SELECT teacher.name, dept.name
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

#4
SELECT teacher.name, dept.name
FROM teacher
RIGHT JOIN dept
ON teacher.dept = dept.id;

#5
SELECT name, 
COALESCE(mobile, '07986 444 2266') AS number
FROM teacher;

#6
SELECT teacher.name,
COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept
ON teacher.dept = dept.id;

#7
SELECT COUNT(name) AS name, COUNT(mobile) AS number
FROM teacher;

#8