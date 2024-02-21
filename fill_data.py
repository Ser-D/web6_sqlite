import sqlite3
import logging
from datetime import timedelta, datetime

from faker import Faker
from random import randint

logging.basicConfig(level=logging.INFO)
fake = Faker('uk-Ua')

TEACHERS_COUNT = 5
STUDENTS_COUNT = 50
GRADES_COUNT = 20

groups = [
    'group_1',
    'group_2',
    'group_3'
]

disciplines = [
    'Business',
    'Communication',
    'Humanities',
    'Social Sciences',
    'Science',
    'Mathematics'
]

conn = sqlite3.connect('hw6.sqlite')
cur = conn.cursor()


def seed_groups():
    sql_expression = "INSERT INTO groups(name) VALUES(?);"
    cur.executemany(sql_expression, zip(groups, ))


def seed_teachers():
    teachers = [fake.name() for _ in range(TEACHERS_COUNT)]
    sql_expression = "INSERT INTO teachers(fullname) VALUES(?);"
    cur.executemany(sql_expression, zip(teachers, ))


def seed_disciplines():
    sql_expression = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    cur.executemany(sql_expression, zip(disciplines,
                                        iter(randint(1, TEACHERS_COUNT) for _ in range(len(disciplines)))))


def seed_students():
    students = [fake.name() for _ in range(STUDENTS_COUNT)]
    sql_expression = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    cur.executemany(sql_expression,
                    zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades():
    sql_expression = "INSERT INTO grades(grade, grade_date, discipline_id, student_id) VALUES(?, ?, ?, ?);"

    grades = []
    start_date = datetime.strptime("01.01.2023", "%d.%m.%Y")
    for student in range(1, (STUDENTS_COUNT + 1)):
        for _ in range(GRADES_COUNT):
            date_grade = start_date + timedelta(randint(1, 360))
            disciplines_ = randint(1, (len(disciplines) + 1))
            grades.append((randint(0, 100), date_grade.date(), disciplines_, student))
    cur.executemany(sql_expression, grades)


if __name__ == "__main__":
    try:
        seed_groups()
        seed_teachers()
        seed_disciplines()
        seed_students()
        seed_grades()
        conn.commit()
    except sqlite3.DatabaseError as e:
        logging.error(e)
        print(e)
    finally:
        conn.close()
