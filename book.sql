create database book_mangement;

use book_mangement;

create table books(
    id int,
    name varchar(225),
    page_size int,
    author varchar(225)
);

INSERT INTO books(id, name, page_size, author) VALUES (1,'toán',45,'nguyễn thi học'),
                                                      (2,'văn',34,'trần minh hoàng'),
                                                      (3,'sử',56,'dương trung quốc'),
                                                      (4,'địa',76,'lê văn hiến'),
                                                      (5,'hoá',32,'hà văn minh');

-- cập nhập số trang --
update books set page_size = 50 where name = 'sử';

-- xoá sách --
delete from books where id = 5;

-- xoá bảng --
drop table books;

-- xoá cơ sở dữ liệu
drop database book_mangement;
