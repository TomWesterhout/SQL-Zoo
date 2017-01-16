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