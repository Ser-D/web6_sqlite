--Знайти список студентів у певній групі

SELECT g.name, s.fullname

from groups g
JOIN students s ON g.id = s.group_id
WHERE g.id = 2
GROUP by s.fullname
ORDER BY g.name;