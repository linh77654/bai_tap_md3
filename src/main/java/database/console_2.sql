CREATE database furama;

USE furama;

-- Tạo các bảng
CREATE TABLE vi_tri
(
    ma_vi_tri  INT AUTO_INCREMENT,
    ten_vi_tri VARCHAR(225),
    PRIMARY KEY (ma_vi_tri)
);

CREATE TABLE trinh_do
(
    ma_trinh_do  INT AUTO_INCREMENT,
    ten_trinh_do VARCHAR(225),
    PRIMARY KEY (ma_trinh_do)
);

CREATE TABLE bo_phan
(
    ma_bo_phan  INT AUTO_INCREMENT,
    ten_bo_phan VARCHAR(225),
    PRIMARY KEY (ma_bo_phan)
);

CREATE TABLE loai_khach
(
    ma_loai_khach  INT AUTO_INCREMENT,
    ten_loai_khach VARCHAR(225),
    PRIMARY KEY (ma_loai_khach)
);

CREATE TABLE loai_dich_vu
(
    ma_loai_dich_vu  INT AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(225),
    PRIMARY KEY (ma_loai_dich_vu)
);

CREATE TABLE kieu_thue
(
    ma_kieu_thue  INT AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(225),
    PRIMARY KEY (ma_kieu_thue)
);

CREATE TABLE dich_vu
(
    ma_dich_vu           INT AUTO_INCREMENT,
    ten_dich_vu          VARCHAR(225),
    dien_tich            INT,
    chi_phi_thue         DOUBLE,
    so_nguoi_toi_da      VARCHAR(225),
    tieu_chuan_phong     VARCHAR(225),
    mo_ta_tien_nghi_khac VARCHAR(225),
    dien_tich_ho_boi     DOUBLE,
    so_tang              INT,
    ma_kieu_thue         INT,
    ma_loai_dich_vu      INT,
    PRIMARY KEY (ma_dich_vu),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu (ma_loai_dich_vu),
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue (ma_kieu_thue)
);

CREATE TABLE nhan_vien
(
    ma_nhan_vien  INT AUTO_INCREMENT,
    ho_ten        VARCHAR(225),
    ngay_sinh     DATE,
    so_cmnd       VARCHAR(225),
    luong         DOUBLE,
    so_dien_thoai VARCHAR(45),
    email         VARCHAR(45),
    dia_chi       VARCHAR(45),
    ma_vi_tri     INT,
    ma_trinh_do   INT,
    ma_bo_phan    INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan (ma_bo_phan),
    PRIMARY KEY (ma_nhan_vien)
);

CREATE TABLE khach_hang
(
    ma_khach_hang INT AUTO_INCREMENT,
    ma_loai_khach INT,
    ho_ten        VARCHAR(225),
    ngay_sinh     DATE,
    gioi_tinh     BIT(1),
    so_cmnd       VARCHAR(225),
    so_dien_thoai VARCHAR(225),
    email         VARCHAR(225),
    dia_chi       VARCHAR(225),
    PRIMARY KEY (ma_khach_hang),
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE dich_vu_di_kem
(
    ma_dich_vu_di_kem  INT AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(225),
    gia                DOUBLE,
    don_vi             VARCHAR(225),
    trang_thai         VARCHAR(225),
    PRIMARY KEY (ma_dich_vu_di_kem)
);

CREATE TABLE hop_dong
(
    ma_hop_dong            INT AUTO_INCREMENT,
    ngay_lam_hop_dong      DATE,
    ngay_ket_thuc_hop_dong DATE,
    tien_dat_coc           DOUBLE,
    ma_nhan_vien           INT,
    ma_khach_hang          INT,
    ma_dich_vu             INT,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu (ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet
(
    ma_hop_dong_chi_tiet INT AUTO_INCREMENT,
    ma_hop_dong          INT,
    ma_dich_vu_di_kem    INT,
    so_luong             INT,
    PRIMARY KEY (ma_hop_dong_chi_tiet),
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

-- Chèn dữ liệu vào các bảng
INSERT INTO vi_tri(ten_vi_tri)
VALUES ('Quản Lý'),
       ('Nhân viên');

INSERT INTO trinh_do(ten_trinh_do)
VALUES ('trung cấp'),
       ('Cao đẳng'),
       ('đại học'),
       ('sau đại học');

INSERT INTO bo_phan(ten_bo_phan)
VALUES ('Sale-Marketing'),
       ('Hành chính'),
       ('Phục vụ'),
       ('Quản lý');

INSERT INTO loai_khach(ten_loai_khach)
VALUES ('Diamond'),
       ('Platinium'),
       ('Gold'),
       ('Silver'),
       ('Member');

INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES ('Villa'),
       ('House'),
       ('Room');

INSERT INTO kieu_thue(ten_kieu_thue)
VALUES ('year'),
       ('month'),
       ('day'),
       ('hour');

INSERT INTO dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong,
                    mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
VALUES ('Villa Beach Front', 25000, 10000000, 10, 'vip', 'Có hồ bơi', 500, 4, 3, 1),
       ('House Princess', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, 2, 2),
       ('House Princess 01', 14000, 5000000, 7, 'vip', 'Có thêm bếp nướng', null, 3, 2, 2),
       ('Room Twin 01', 5000, 1000000, 2, 'normal', 'Có tivi', null, null, 4, 3),
       ('Villa No Beach Front', 22000, 9000000, 8, 'normal', 'Có hồ bơi', 300, 3, 3, 1),
       ('House Princess 02', 10000, 4000000, 5, 'normal', 'Có thêm bếp nướng', null, 2, 3, 2),
       ('Room Twin 02', 3000, 900000, 2, 'normal', 'Có tivi', null, null, 4, 3);

INSERT INTO nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri,
                      ma_trinh_do, ma_bo_phan)
VALUES ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com',
        '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
       ('Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1,
        2, 2),
       ('Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com',
        'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
       ('Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com',
        '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
       ('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com',
        '43 Yên Bái, Đà Nẵng', 2, 1, 1),
       ('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com',
        '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
       ('Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com',
        '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
       ('Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com',
        '111 Hùng Vương, Hà Nội', 2, 4, 4),
       ('Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng',
        2, 4, 4),
       ('Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com',
        '6 Hoà Khánh, Đồng Nai', 2, 3, 2);

INSERT INTO khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email,
                       dia_chi)
VALUES (5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com',
        '23 Nguyễn Hoàng, Đà Nẵng'),
       (3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com',
        'K77/22 Thái Phiên, Quảng Trị'),
       (1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com',
        'K323/12 Ông Ích Khiêm, Vinh'),
       (1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com',
        'K453/12 Lê Lợi, Đà Nẵng'),
       (4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com',
        '224 Lý Thái Tổ, Gia Lai'),
       (4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com',
        '37 Yên Thế, Đà Nẵng'),
       (1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com',
        'K123/45 Lê Lợi, Hồ Chí Minh'),
       (3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com',
        '55 Nguyễn Văn Linh, Kon Tum'),
       (1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com',
        '24 Lý Thường Kiệt, Quảng Ngãi'),
       (2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com',
        '22 Ngô Quyền, Đà Nẵng');

INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES ('Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
       ('Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
       ('Thuê xe đạp', 20000, 'chiếc', 'tốt'),
       ('Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       ('Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
       ('Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO hop_dong(ngay_lam_hop_dong, ngay_ket_thuc_hop_dong, tien_dat_coc, ma_nhan_vien, ma_khach_hang,
                     ma_dich_vu)
VALUES ('2020-12-08', '2020-12-08', 0, 3, 1, 3),
       ('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
       ('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
       ('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
       ('2021-07-14', '2021-07-15', 0, 7, 2, 6),
       ('2021-06-01', '2021-06-03', 0, 7, 7, 6),
       ('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
       ('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
       ('2020-11-19', '2020-11-19', 0, 3, 4, 3),
       ('2021-04-12', '2021-04-14', 0, 10, 3, 5),
       ('2021-04-25', '2021-04-25', 0, 2, 2, 1),
       ('2021-05-25', '2021-05-27', 0, 7, 10, 1);

INSERT INTO hop_dong_chi_tiet(ma_hop_dong, ma_dich_vu_di_kem, so_luong)
VALUES (2, 4, 5),
       (2, 5, 8),
       (2, 6, 15),
       (3, 1, 1),
       (3, 2, 11),
       (1, 3, 1),
       (1, 2, 2),
       (12, 2, 2);

-- 1.	Hiển thị thông tin của tất cả nhân viên thuộc bộ phận hành chính có là họ “Nguyễn” --
SELECT *
FROM nhan_vien
WHERE ma_bo_phan = (SELECT ma_bo_phan FROM bo_phan WHERE ten_bo_phan = 'Hành chính')
  AND ho_ten LIKE 'Nguyễn %';

-- 2.	Hiển thị thông tin của tất cả khách hàng có năm sinh từ 1990 đến 1985 và thuộc loại khách hàng Diamond
SELECT *
FROM khach_hang
WHERE YEAR(ngay_sinh) BETWEEN 1985 AND 1990
  AND ma_loai_khach = (SELECT ma_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Diamond');

-- 3.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có số lần đặt từ 2 lần trở lên.
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang kh
         JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
GROUP BY kh.ma_khach_hang, kh.ho_ten
HAVING COUNT(hd.ma_hop_dong) >= 2
ORDER BY so_lan_dat_phong ASC;

-- 4.	Hiển thị ma_khach_hang, ho_ten, tong_tien mà khách hàng đã làm hợp đồng  (Với tổng tiền được tính từ  Chi Phí Thuê) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT kh.ma_khach_hang,
       kh.ho_ten,
       COALESCE(SUM(dv.chi_phi_thue), 0) AS tong_tien
FROM khach_hang kh
         LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
         LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
GROUP BY kh.ma_khach_hang, kh.ho_ten;

-- 5.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ không được đặt trong 2021
SELECT dv.ma_dich_vu,
       dv.ten_dich_vu,
       dv.dien_tich,
       dv.chi_phi_thue,
       ldv.ten_loai_dich_vu
FROM dich_vu dv
         JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE dv.ma_dich_vu NOT IN (
    SELECT DISTINCT hd.ma_dich_vu
    FROM hop_dong hd
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
);

-- 6.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).



-- 7.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi



-- 8.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT
    ma_nhan_vien AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien
UNION
SELECT ma_khach_hang AS id,
       ho_ten,
       email,
       so_dien_thoai,
       ngay_sinh,
       dia_chi
FROM khach_hang;