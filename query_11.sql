--Середній бал, який певний викладач ставить певному студентові.

SELECT g.student_id AS student, d.teacher_id AS teacher,
ROUND(AVG(g.grade), 2) AS average_grade

from grades g
JOIN disciplines d ON d.id = g.discipline_id
WHERE d.teacher_id = 1
AND
g.student_id = 1

;