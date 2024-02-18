--Список курсів, які певному студенту читає певний викладач

SELECT d.name, s.fullname, t.fullname

from disciplines d
JOIN grades g ON g.discipline_id  = d.id
JOIN teachers t on d.teacher_id = t.id
join students s on g.student_id = s.id

WHERE d.teacher_id = 3
AND
student_id = 11

GROUP BY s.fullname , d.name;