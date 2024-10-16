CREATE DATABASE C07;

USE C07;

CREATE TABLE jame (
                      username  VARCHAR(225) UNIQUE,
                      password  VARCHAR(225),
                      PRIMARY KEY (username)
);

CREATE TABLE class (
                       id   INT AUTO_INCREMENT,
                       name VARCHAR(225),
                       PRIMARY KEY (id)
);

CREATE TABLE room (
                      id       INT AUTO_INCREMENT,
                      name     VARCHAR(225),
                      class_id INT,
                      PRIMARY KEY (id),
                      FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE instructor (
                            id       INT AUTO_INCREMENT,
                            name     VARCHAR(225),
                            birthday DATE,
                            salary   INT,
                            PRIMARY KEY (id)
);

CREATE TABLE student (
                         id       INT AUTO_INCREMENT,
                         name     VARCHAR(225),
                         gender   VARCHAR(225),
                         birthday DATE,
                         email    VARCHAR(225),
                         point    INT,
                         username VARCHAR(225),
                         class_id INT,
                         PRIMARY KEY (id),
                         FOREIGN KEY (class_id) REFERENCES class(id),
                         FOREIGN KEY (username) REFERENCES jame(username)
);


CREATE TABLE instructor_clas (
                                 instructor_id INT,
                                 class_id      INT,
                                 start_time    DATE,
                                 PRIMARY KEY (instructor_id, class_id),
                                 FOREIGN KEY (instructor_id) REFERENCES instructor(id),
                                 FOREIGN KEY (class_id) REFERENCES class(id)
);

INSERT INTO jame(username, password)
VALUES ('cunn', '123'),
       ('chunglh', '123'),
       ('hoanghh', '123'),
       ('dungd', '123'),
       ('huynhtd', '123'),
       ('hainm', '123'),
       ('namtv', '123'),
       ('hieuvm', '123'),
       ('kynx', '123'),
       ('vulm', '123');

INSERT INTO class(id, name)
VALUES (1, 'c1121g1'),
       (2, 'a0821i1');

INSERT INTO room(id, name, class_id)
VALUES (1, 'Ken', 1),
       (2, 'Jame', 1),
       (3, 'Ada', 2),
       (4, 'Jimmy', 2);

INSERT INTO instructor(id, name, birthday, salary)
VALUES (1, 'tran van chanh', '1985-02-03', 100),
       (2, 'tran minh chien', '1985-02-03', 200),
       (3, 'vu thanh tien', '1985-02-03', 300),
       (4, 'tran van nam', '1989-12-12', 100);

INSERT INTO instructor_clas(instructor_id, class_id, start_time)
VALUES (1, 1, NULL),
       (1, 2, NULL),
       (2, 1, NULL),
       (2, 2, NULL),
       (3, 1, NULL),
       (3, 2, NULL);

INSERT INTO student(id, name, gender, birthday, email, point, username, class_id)
VALUES (1, 'nguyen ngoc cu', 'Nam', '1985-12-12', 'cunn@gmail.com', 8, 'cunn', 1),
       (2, 'le hai chung', 'Nam', '1986-12-12', 'chunglh@gmail.com', 5, 'chunglh', 1),
       (3, 'hoang huu hoan', 'Nam', '1987-12-12', 'hoanghh@gmail.com', 6, 'hoanghh', 2),
       (4, 'dau dung', 'Nam', '1980-12-12', 'dungd@gmail.com', 8, 'dungd', 1),
       (5, 'ta dinh huynh', 'Nam', '1979-12-12', 'huynhtd@gmail.com', 9, 'huynhtd', 2),
       (6, 'nguyen minh hai', 'Nam', '1954-12-12', 'hainm@gmail.com', 9, 'hainm', 1),
       (7, 'tran van nam', 'Nam', '1915-12-12', 'namtv@gmail.com', 4, 'namtv', 2),
       (8, 'vo minh hieu', 'Nam', '1999-12-12', 'hieuvm@gmail.com', 3, 'hieuvm', 1),
       (9, 'le xuan ky', 'Nam', '1998-12-12', 'kynx@gmail.com', 7, 'kynx', 1),
       (10, 'le minh vu', 'Nam', '1989-12-12', 'vulm@gmail.com', 7, 'vulm', 1);


