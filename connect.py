import sqlite3
from contextlib import contextmanager

database = './hw6.sqlite'


@contextmanager
def create_connection(db_file):
    """create a database connection to SQLite database"""
    try:
        conn = sqlite3.connect(db_file)
        yield conn
        conn.close()
    except sqlite3.DatabaseError as e:
        raise RuntimeError(f"Failed to create database connection {e}")


if __name__ == '__main__':
    create_connection(database)
