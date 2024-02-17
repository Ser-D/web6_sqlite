DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY autoincrement NOT NULL,
    name VARCHAR(30)
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY autoincrement NOT NULL,
    fullname VARCHAR(60)
);

DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY autoincrement NOT NULL,
    fullname VARCHAR(60),
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups(id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS disciplines;
CREATE TABLE disciplines (
    id INTEGER PRIMARY KEY autoincrement NOT NULL,
    name VARCHAR(60),
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
        ON DELETE CASCADE
);

DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY autoincrement NOT NULL,
    grade INTEGER,
    grade_date DATE,
    discipline_id INTEGER,
    student_id INTEGER,
    FOREIGN KEY (discipline_id) REFERENCES disciplines(id)
        ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(id)
        ON DELETE CASCADE
);
