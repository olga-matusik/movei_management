import json

from flask import Flask, render_template, request
from flask_mysqldb import MySQL


#instanciated a class Falsk to a variable
app = Flask("MovieApp")

app.config["MYSQL_HOST"] = "terraform-20221007103204294300000001.cpelnmirnwb7.eu-central-1.rds.amazonaws.com"
app.config["MYSQL_USER"] = "root"
app.config["MYSQL_PASSWORD"] = "my-secret-pw"
app.config["MYSQL_DB"] = "movie_db"

mysql = MySQL(app)

#define routes, part after a "/" in a domaine name
@app.route("/") #decorater, change the behavior of the function- makes the def be executed without rendering the function
def hello_world():
    return render_template("index.html") # returns html

'''@app.route("/movies/")
def list_movies():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    #return json.dumps(data)
    return json.dumps(data)'''

'''@app.route("/directors/")
def list_directors():
    cursor2 = mysql.connection.cursor()
    query_string_2 = "SELECT movies_tbl.title FROM movies_tbl JOIN directors_tbl ON movies_tbl.director_id=directors_tbl.id WHERE directors_tbl.name='James Cameron'"
    cursor2.execute(query_string_2)
    data2 = cursor2.fetchall()
    cursor2.close()   
    return json.dumps(data2)'''

@app.route("/movies-table/")
def list_movie_tbl():
    cursor = mysql.connection.cursor()
    query_string = "SELECT * FROM movies_tbl"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("movies.html", movies_data=data)

@app.route("/directors-table/")
def list_directors_tbl():
    cursor2 = mysql.connection.cursor()
    query_string_2 = "SELECT name FROM directors_tbl"
    cursor2.execute(query_string_2)
    data2 = cursor2.fetchall()
    cursor2.close()
    #return json.dumps(data2)
    #return the template with  arguments: the name and the variable
    return render_template("directors.html", directors=data2) 

@app.route("/actors-table/")
def list_actors_tbl():
    cursor3 = mysql.connection.cursor()
    query_string_3 = "SELECT name FROM main_actors_tbl"
    cursor3.execute(query_string_3)
    data3 = cursor3.fetchall()
    cursor3.close()
    return render_template("actors.html", actors=data3)

@app.route("/actor-movies/")
def actor_movies():
    name = request.args.get("actor-name")
    cursor = mysql.connection.cursor()
    query_string = f"SELECT movies_tbl.title FROM movies_tbl JOIN movie_actors_tbl ON movies_tbl.id=movie_actors_tbl.movie_id JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id=main_actors_tbl.id WHERE main_actors_tbl.name LIKE'{name}'"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("actor-movies.html", name=name, data=data)

@app.route("/director-movies/")
def director_movies():
    name = request.args.get("director-name")
    cursor = mysql.connection.cursor()
    query_string = f"SELECT movies_tbl.title FROM movies_tbl JOIN directors_tbl ON movies_tbl.director_id=directors_tbl.id WHERE directors_tbl.name LIKE'{name}'"
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close()
    return render_template("director_movies.html", name=name, data=data)    

if __name__ == "__main__":
    app.run(host="127.0.0.1")

