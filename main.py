import sqlite3
import logging

logging.basicConfig(level=logging.INFO)


def query_three():
    with open("query_8.sql", "r") as f:
        sql = f.read()
        print(sql)

    with sqlite3.connect("hw6.sqlite") as con:
        cur = con.cursor()
        cur.execute(sql)

        result = cur.fetchall()
        for row in result:
            print(row)


if __name__ == "__main__":
    query_three()
