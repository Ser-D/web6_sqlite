--Знайти середній бал у групах з певного предмета.

SELECT gr.name,
ROUND(AVG(g.grade), 2) AS average_grade
from students s
JOIN grades g ON s.id = g.student_id
JOIN groups gr ON gr.id = s.group_id
WHERE g.discipline_id = 3
GROUP by gr.name
ORDER BY average_grade DESC;