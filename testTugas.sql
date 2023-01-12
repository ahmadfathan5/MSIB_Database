SELECT * FROM gaji g 

CALL THP(5, @gatot);

SELECT @gatot;

SELECT pegawai.nip, pegawai.nama, jabatan.nama AS posisi, divisi.nama AS departemen,
gaji.gapok, gaji.tunjab, @gatot AS totalGaji FROM pegawai
INNER JOIN gaji ON gaji.pegawai_id = pegawai.id
INNER JOIN divisi ON divisi.id = pegawai.divisi_id1
INNER JOIN jabatan ON jabatan.id = pegawai.jabatan_id;

SELECT pegawai.nip, pegawai.nama, jabatan.nama AS posisi, divisi.nama AS departemen,
gaji.gapok, gaji.tunjab, (gaji.gapok + gaji.tunjab) AS totalGaji FROM pegawai
INNER JOIN gaji ON gaji.pegawai_id = pegawai.id
INNER JOIN divisi ON divisi.id = pegawai.divisi_id1
INNER JOIN jabatan ON jabatan.id = pegawai.jabatan_id;

CREATE or REPLACE  VIEW test_slip_gaji_pegawai_vw AS
SELECT pegawai.nip, pegawai.nama, jabatan.nama AS posisi, divisi.nama AS departemen,
gaji.gapok, gaji.tunjab, (SELECT @totalGaji) AS total_gaji FROM pegawai
INNER JOIN gaji ON gaji.pegawai_id = pegawai.id
INNER JOIN divisi ON divisi.id = pegawai.divisi_id
INNER JOIN jabatan ON jabatan.id = pegawai.jabatan_id;