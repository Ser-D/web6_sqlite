--Знайти список курсів, які відвідує студент.

SELECT s.fullname, d.name

from students s
JOIN grades g ON s.id = g.student_id
JOIN disciplines d ON d.id = g.discipline_id
WHERE s.id = 6
GROUP by d.name;