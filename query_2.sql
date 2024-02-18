--Знайти студента із найвищим середнім балом з певного предмета.

SELECT s.fullname, d.name,
ROUND(AVG(g.grade), 2) AS average_grade

from students s
JOIN grades g ON s.id = g.student_id
JOIN disciplines d ON d.id = g.discipline_id
WHERE g.discipline_id = 5
GROUP by s.fullname
ORDER BY average_grade DESC;
