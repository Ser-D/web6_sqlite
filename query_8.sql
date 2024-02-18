--Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT d.teacher_id, d.name,
ROUND(AVG(g.grade), 2) AS average_grade

from grades g
JOIN disciplines d ON d.id = g.discipline_id
WHERE d.teacher_id = 1
GROUP by d.name
ORDER BY d.teacher_id;