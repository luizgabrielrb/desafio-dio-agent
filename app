"""LABORATÓRIO: app propositalmente VULNERÁVEL (SQL Injection).
Use apenas na sua máquina, para estudo. Nunca publique em um servidor real."""
import sqlite3
from flask import Flask, request

app = Flask(__name__)


def init_db():
    con = sqlite3.connect("lab.db")
    con.execute("CREATE TABLE IF NOT EXISTS users (username TEXT, password TEXT)")
    con.execute("DELETE FROM users")
    con.execute("INSERT INTO users VALUES ('admin', 'senha-de-lab')")
    con.commit()
    con.close()


@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username", "")
    password = request.form.get("password", "")
    con = sqlite3.connect("lab.db")
    # VULNERÁVEL: o SQL é montado juntando o texto digitado
    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    row = con.execute(query).fetchone()
    con.close()
    return ("Login ok", 200) if row else ("Credenciais inválidas", 401)


if __name__ == "__main__":
    init_db()
    app.run(host="127.0.0.1", port=5000)
