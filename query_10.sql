--Список курсів, які певному студенту читає певний викладач

SELECT g.student_id, d.name

from grades g
JOIN disciplines d ON d.id = g.discipline_id

WHERE d.teacher_id = 3
AND
student_id = 11

GROUP by d.name
;