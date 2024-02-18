--Оцінки студентів у певній групі з певного предмета на останньому занятті

SELECT s.id, s.fullname, g.grade, MAX(g.grade_date)

from grades g
JOIN students s ON s.id = g.student_id

WHERE g.discipline_id = 2
AND
s.group_id = 2


ORDER BY s.fullname;