use dbpegawai;

show tables;

desc divisi;

desc pegawai ;

INSERT into divisi values (default, 'SDM'),(default, 'Keuangan'),(default, 'Marketing'),(default, 'IT');

INSERT into pegawai (nip,nama,gender,tmp_lahir,tgl_lahir,divisi_id,alamat) values
(01101, 'pegawai 1', 'L', 'Jakarta', '2020-01-06', 2, 'jl. road 1'),
(01102, 'pegawai 2', 'P', 'Jakarta', '2020-01-07', 2, 'jl. road 2'),
(01103, 'pegawai 3', 'L', 'Jakarta', '2020-01-08', 2, 'jl. road 3'),
(01104, 'pegawai 4', 'P', 'Jakarta', '2020-01-09', 2, 'jl. road 4'),
(01105, 'pegawai 5', 'L', 'Jakarta', '2020-01-10', 2, 'jl. road 5'),
(01106, 'pegawai 6', 'P', 'Jakarta', '2020-01-06', 2, 'jl. road 6'),
(01107, 'pegawai 7', 'L', 'Jakarta', '2020-01-07', 2, 'jl. road 7'),
(01108, 'pegawai 8', 'P', 'Jakarta', '2020-01-08', 2, 'jl. road 8'),
(01109, 'pegawai 9', 'L', 'Jakarta', '2020-01-09', 2, 'jl. road 9'),
(01110, 'pegawai 10', 'P', 'Jakarta', '2020-01-10', 2, 'jl. road 10'),
(01111, 'pegawai 11', 'L', 'Jakarta', '2020-01-11', 3, 'jl. road 11'),
(01112, 'pegawai 12', 'P', 'Jakarta', '2020-01-12', 3, 'jl. road 12'),
(01113, 'pegawai 13', 'L', 'Jakarta', '2020-01-13', 3, 'jl. road 13'),
(01114, 'pegawai 14', 'P', 'Jakarta', '2020-01-14', 3, 'jl. road 14'),
(01115, 'pegawai 15', 'L', 'Jakarta', '2020-01-15', 3, 'jl. road 15'),
(01116, 'pegawai 16', 'P', 'Jakarta', '2020-01-16', 4, 'jl. road 16'),
(01117, 'pegawai 17', 'L', 'Jakarta', '2020-01-17', 4, 'jl. road 17'),
(01118, 'pegawai 18', 'P', 'Jakarta', '2020-01-18', 4, 'jl. road 18'),
(01119, 'pegawai 19', 'L', 'Jakarta', '2020-01-19', 4, 'jl. road 19'),
(01120, 'pegawai 20', 'P', 'Jakarta', '2020-01-20', 4, 'jl. road 20');





