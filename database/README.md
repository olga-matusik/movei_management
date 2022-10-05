# movie_management_project 
# answers to the exercise with movies database

#List all the actors born before 1980.
```
SELECT name FROM main_actors_tbl WHERE year_of_birth < 1980;
```
```sql
| name                  |
+-----------------------+
| Arnold Schwarzenegger |
| Christian Bale        |
| Sigourney Weaver      |
| Leonardo DiCaprio     |
| Angelina Jolie        |
| Zoe Saldaña           |
```

#How many movies did Nolan direct ?
```
SELECT COUNT(movies_tbl.title) FROM movies_tbl 
JOIN directors_tbl ON movies_tbl.director_id=directors_tbl.id
WHERE directors_tbl.name="Christopher Nolan";
```
```sql
| COUNT(movies_tbl.title) |
+-------------------------+
|                       2 |
```

#Among all the movies of James Cameron, how many were female actors ?
```
SELECT COUNT(DISTINCT main_actors_tbl.name) FROM main_actors_tbl
JOIN movie_actors_tbl ON main_actors_tbl.id=movie_actors_tbl.main_actor_id
JOIN movies_tbl ON movie_actors_tbl.movie_id=movies_tbl.id
JOIN directors_tbl ON movies_tbl.director_id=directors_tbl.id
WHERE directors_tbl.name="James Cameron" AND main_actors_tbl.sex="F";
```
```sql
| COUNT(DISTINCT main_actors_tbl.name) |
+--------------------------------------+
|                                    2 |
```
#How many directors did Leonardo DiCaprio worked with ?
```
SELECT COUNT(directors_tbl.name) FROM directors_tbl
JOIN movies_tbl ON directors_tbl.id=movies_tbl.director_id
JOIN movie_actors_tbl ON movies_tbl.id=movie_actors_tbl.movie_id
JOIN main_actors_tbl ON main_actors_tbl.id=movie_actors_tbl.main_actor_id
WHERE main_actors_tbl.name="Leonardo DiCaprio";
```
```sql
| COUNT(directors_tbl.name) |
+---------------------------+
|                         1 |
```

#Who is the oldest director ?
```
SELECT name FROM directors_tbl ORDER BY year_of_birth LIMIT 1;
```
```sql
| name          |
+---------------+
| James Cameron |
```

#What is the earliest movie of the first director ?
```
SELECT title, release_year FROM movies_tbl WHERE director_id=1 ORDER BY release_year LIMIT 1;
```
```sql
| title      |
+------------+
| Terminator |
```

#What is the latest movie of the youngest actor ?
```
SELECT movies_tbl.title FROM movies_tbl
JOIN movie_actors_tbl ON movies_tbl.id=movie_actors_tbl.movie_id
JOIN main_actors_tbl ON movie_actors_tbl.main_actor_id=main_actors_tbl.id
WHERE main_actors_tbl.name =
(SELECT main_actors_tbl.name FROM main_actors_tbl ORDER BY year_of_birth DESC LIMIT 1)
ORDER BY movies_tbl.release_year DESC LIMIT 1;
```
```sql
| title     |
+-----------+
| Cleopatra |
```