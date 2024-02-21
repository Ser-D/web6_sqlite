--Знайти оцінки студентів у окремій групі з певного предмета.

SELECT s.fullname, g.grade, g.discipline_id
from students s
JOIN grades g ON g.student_id = s.id
WHERE s.group_id = 2
AND g.discipline_id = 2
GROUP by g.grade
ORDER BY s.fullname DESC;