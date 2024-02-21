--Знайти які курси читає певний викладач

SELECT d.name, t.fullname
from disciplines d
JOIN teachers t ON teacher_id = t.id;