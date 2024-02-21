--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

SELECT s.fullname,
ROUND(AVG(g.grade), 2) AS average_grade
from students s
JOIN grades g ON s.id = g.student_id
GROUP by s.id
ORDER BY average_grade DESC
LIMIT 5;