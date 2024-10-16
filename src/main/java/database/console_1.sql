CREATE DATABASE library;

use library;

CREATE TABLE students
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(255),
    birthday   DATE,
    class_name VARCHAR(255)
);

CREATE TABLE authors
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);

CREATE TABLE category
(
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
);


CREATE TABLE books
(
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(255),
    page_size   INT,
    author_id   int,
    category_id int,
    foreign key (author_id) references authors (id),
    foreign key (category_id) references category (id)
);

CREATE TABLE borrows
(
    id          int auto_increment primary key,
    student_id  INT,
    book_id     INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (student_id) REFERENCES students (id),
    FOREIGN KEY (book_id) REFERENCES books (id)
);

INSERT INTO authors(id, name)
VALUES (1, 'Nguyễn thái học'),
       (2, 'Trần Minh Hoàng'),
       (3, 'Dương Trung Quốc'),
       (4, 'Lê Văn Hiền'),
       (5, 'Hà Văn Minh');

INSERT INTO category(id, name)
VALUES (1, 'Tự nhiên'),
       (2, 'Xã hội'),
       (3, 'Truyện'),
       (4, 'Tiểu thuyết'),
       (5, 'Khác');

INSERT INTO students(id, name, birthday, class_name)
VALUES (1, 'nguyễn văn A', '1999-12-12', 'C0822g1'),
       (2, 'Nguyễn văn B', '1999-12-13', 'C0822g1'),
       (3, 'Nguyễn văn C', '1999-12-14', 'C0822g1'),
       (4, 'Nguyễn văn D', '1999-12-15', 'C0922g1'),
       (5, 'Nguyễn văn E', '1999-12-16', 'C1022g1');

INSERT INTO books(id, name, page_size, author_id, category_id)
VALUES (1, 'Toán', 45, 1, 1),
       (2, 'văn', 34, 2, 2),
       (3, 'Sử', 56, 3, 2),
       (4, 'Địa', 76, 4, 2),
       (5, 'Hoá', 32, 5, 1);

INSERT INTO borrows(id, student_id, book_id, borrow_date, return_date)
VALUES (1, 1, 1, '2022-12-12', '2022-12-13'),
       (2, 2, 2, '2022-12-12', '2022-12-17'),
       (3, 3, 3, '2022-12-12', '2022-12-14'),
       (4,4,4,'2022-12-12','2022-12-16'),
       (5,1,5,'2022-12-12','2022-12-19');

-- lấy toàn bộ sách trong thư viện

SELECT books.name AS book_name, authors.name AS author_name, category.name AS category_name
FROM books
         JOIN authors ON books.author_id = authors.id
         JOIN category ON books.category_id = category.id;

-- lấy danh sách các học viên a-z

SELECT DISTINCT students.name
FROM students
         JOIN borrows ON students.id = borrows.student_id
ORDER BY students.name ASC;


-- lấy 2 quyển sách được mượn nhiều nhất --
SELECT books.name AS book_name, COUNT(borrows.id) AS borrow_count
FROM books
         JOIN borrows ON books.id = borrows.book_id
GROUP BY books.name
ORDER BY borrow_count DESC
LIMIT 2;
