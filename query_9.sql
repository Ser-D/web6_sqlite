--Знайти список курсів, які відвідує студент.

SELECT s.fullname, d.name
from disciplines d
JOIN grades g ON d.id = g.discipline_id
JOIN students s ON s.id = g.student_id
WHERE s.id = 1
GROUP by s.fullname, d.name;