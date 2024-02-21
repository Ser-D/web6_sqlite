--Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT t.fullname, d.name,
ROUND(AVG(g.grade), 2) AS average_grade
from grades g
JOIN disciplines d ON d.id = g.discipline_id
JOIN teachers t ON d.teacher_id = t.id
WHERE d.teacher_id = 4
ORDER BY d.teacher_id, d.name;