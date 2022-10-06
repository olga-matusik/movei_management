# create a new database
CREATE DATABASE movie_db;

# create table directors
CREATE TABLE directors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    PRIMARY KEY (id)
);

# add a new entry to the table
INSERT INTO directors_tbl VALUES(
    null,
    "James Cameron",
    1954
);
INSERT INTO directors_tbl VALUES(
    null,
    "Christopher Nolan",
    1970
);
INSERT INTO directors_tbl VALUES(
    null,
    "Patty Jenkins",
    1971
);
INSERT INTO directors_tbl VALUES(
    null,
    "Chloe Zhaos",
    1982
);

# create movies_tbl
CREATE TABLE movies_tbl(
    id int NOT NULL AUTO_INCREMENT,
    title varchar(255),
    release_year int,
    director_id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (director_id) REFERENCES directors_tbl (id)
);

# add new movie to the table
INSERT INTO movies_tbl VALUES(
    null,
    "Titanic",
    1997,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Wonder Woman",
    2017,
    (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Avatar",
    2009,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Aliens",
    1986,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Inception",
    2010,
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Terminator",
    1984,
    (SELECT id FROM directors_tbl WHERE name like "James Cameron")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Cleopatra",
    2023,
    (SELECT id FROM directors_tbl WHERE name like "Patty Jenkins")
);

INSERT INTO movies_tbl VALUES(
    null,
    "Eternals",
    2021,
    (SELECT id FROM directors_tbl WHERE name like "Chloe Zhaos")
);

INSERT INTO movies_tbl VALUES(
    null,
    "The Dark Knight",
    2008,
    (SELECT id FROM directors_tbl WHERE name like "Christopher Nolan")
);


# Create your Actors table
CREATE TABLE main_actors_tbl(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255),
    year_of_birth int,
    sex varchar(1),
    PRIMARY KEY (ID)
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Christian Bale",
    1974,
    "M"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Gal Gadot",
    1985,
    "F"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Sigourney Weaver",
    1949,
    "F"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Leonardo DiCaprio",
    1974,
    "M"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Angelina Jolie",
    1975,
    "F"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Zoe Saldaña",
    1978,
    "F"
);

INSERT INTO main_actors_tbl VALUES(
    null,
    "Gemma Chan",
    1982,
    "F"
);

# Create your Movie-Actors table
CREATE TABLE movie_actors_tbl(
    movie_id int NOT NULL,
    main_actor_id int NOT NULL,
    PRIMARY KEY (movie_id, main_actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies_tbl(id),
    FOREIGN KEY (main_actor_id) REFERENCES main_actors_tbl(id)
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Zoe Saldaña")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "The Dark Knight"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Christian Bale")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Inception"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Leonardo DiCaprio")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Angelina Jolie")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Aliens"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Sigourney Weaver")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Cleopatra"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Gal Gadot")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Eternals"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Gemma Chan")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Titanic"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Leonardo DiCaprion")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Wonder Woman"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Gal Gadot")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Terminator"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Arnold Schwarzenegger")
);

INSERT INTO movie_actors_tbl VALUES(
    (SELECT id FROM movies_tbl WHERE title LIKE "Avatar"),
    (SELECT id FROM main_actors_tbl WHERE name LIKE "Sigourney Weaver")
);

