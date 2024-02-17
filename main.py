import sqlite3
import logging

logging.basicConfig(level=logging.INFO)

def query_three():
    with open("query_1.sql", "r") as f:
        sql = f.read()
        print(sql)

    with sqlite3.connect("hw6.sqlite") as con:
        cur = con.cursor()
        cur.execute(sql)

        result = cur.fetchall()
        for row in result:
            #logging.info(f'Середній бал групи "{row[0]}": {row[2]}')
            print(row)






if __name__ == "__main__":
    query_three()