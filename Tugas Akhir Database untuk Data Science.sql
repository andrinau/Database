show databases;
create database tugas_db;
use tugas_db;

drop table customer;
drop table tiket;
drop table pembayaran;
drop table penerbangan;
drop table staff;
drop table pesawat;
drop table destinasi;

create table customer(
nama varchar(50) not null,
no_paspor varchar(30) not null primary key,
email varchar(30) not null unique,
tanggal_lahir date not null,
kebangsaan varchar(30)) engine = innodb;

create table tiket(
id_tiket varchar(30) not null primary key,
id_penerbangan varchar(30) not null,
no_paspor varchar(30) not null,
kelas varchar(30) not null,
no_kursi varchar(30) not null unique,
FOREIGN KEY (no_paspor) REFERENCES customer(no_paspor),
FOREIGN KEY (id_penerbangan) REFERENCES penerbangan(id_penerbangan)) engine = innodb;

create table penerbangan(
id_penerbangan varchar(30) not null primary key,
id_bandaratujuan varchar(30) not null,
id_pesawat varchar(30) not null,
terminal int not null,
gate int not null,
waktu_keberangkatan timestamp not null,
waktu_tiba timestamp not null,
FOREIGN KEY (id_bandaratujuan) REFERENCES destinasi(id_bandaratujuan),
FOREIGN KEY (id_pesawat) REFERENCES pesawat(id_pesawat)) engine = innodb;

create table pesawat(
id_pesawat varchar(30) not null primary key,
nama_maskapai varchar(30) not null,
jenis_pesawat varchar(30) not null, 
perusahaan_pembuat varchar(30) not null,
negara_pembuat varchar(30) not null,
kapasitas_penumpang int not null,
berat int not null) engine = innodb;

create table destinasi(
id_bandaratujuan varchar(30) not null primary key,
nama_bandara varchar(50) not null,
kota_bandara varchar(30) not null,
negara_bandara varchar(30) not null) engine = innodb;

create table pembayaran(
id_transaksi varchar(30) not null primary key,
id_tiket varchar(30) not null,
jumlah_tiket int not null,
total_pembayaran int not null,
metode_pembayaran varchar(30) not null,
FOREIGN KEY (id_tiket) REFERENCES tiket(id_tiket)) engine = innodb;

create table staff(
id_staff varchar(30) not null primary key,
id_penerbangan varchar(30) not null,
nama_staff varchar(50) not null,
posisi varchar(30) not null,
tanggal_bertugas date not null,
FOREIGN KEY (id_penerbangan) REFERENCES penerbangan(id_penerbangan)) engine = innodb;

INSERT INTO customer(nama,no_paspor,email,tanggal_lahir,kebangsaan)
VALUES ('Ananta Dila','X01824K8','anandil@gmail.com',"2003-09-17",'Indonesia'),
('Kirana Muthia','X16521U7','kiranamuth16@gmail.com',"1998-01-23",'Indonesia'),
('Bora Kim','K7152182H0','borborakkim@gmail.com',"2003-09-17",'Korea Selatan'),
('Jarjit Singh','Y186192Y7','jarjitqqq@gmail.com',"2000-09-17",'Malaysia'),
('Aurelio Dan','X972158U8','havdanh@gmail.com',"1990-06-20",'Indonesia');

INSERT INTO destinasi(id_bandaratujuan,nama_bandara,kota_bandara,negara_bandara)
VALUES ('NRII6','Bandar Udara Internasional Ngurah Rai','Denpasar, Bali','Indonesia'),
('JII3','Bandar Udara Internasional Juanda','Sidoarjo, Jawa Timur','Indonesia'),
('SHII18','Bandar Udara Internasional Sultan Hasanuddin','Makasar, Sulawesi Selatan','Indonesia'),
('AII2','Bandar Udara Internasional Adisutjipto','Daerah Istimewa Yogyakarta','Indonesia'),
('STI24','Bandar Udara Sultan Thaha','Kota Jambi, Jambi','Indonesia'),
('ARSII3','Bandar Udara Abdul Rachman Saleh','Malang, Jawa Timur','Indonesia'),
('IISK34','Bandar Udara Internasional Incheon','Incheon','Korea Selatan'),
('IGII56', 'Bandara Internasional Indira Gandhi','Delhi','India') ;

INSERT INTO pesawat(id_pesawat,nama_maskapai,jenis_pesawat,perusahaan_pembuat,negara_pembuat,kapasitas_penumpang,berat)
VALUES ('BOE-X78','Garuda Indonesia','Boeing 737 Max','PT. Sejahtera','Amerika Serikat','250','300.000'),
('BOE-Y17','Garuda Indonesia','Boeing 767','PT. Sejahtera','Amerika Serikat','230','280.000'),
('BOE-G67','Garuda Indonesia','Boeing 777','PT. Sejahtera','Amerika Serikat','210','280.000'),
('BOE-Y76','Garuda Indonesia','Boeing 787','PT. Sejahtera','Amerika Serikat','200','280.000'),
('NSU-T56','Batik Air','Airbus a380','PT. Raya Cipta','Prancis','240','300.000'),
('UYT-H76','Indonesia AirAsia','Airbus a330','PT. Cahaya','Prancis','210','280.000');

INSERT INTO penerbangan(id_penerbangan,id_bandaratujuan,id_pesawat,terminal,gate,waktu_keberangkatan,waktu_tiba)
VALUES ('IDNRI82611715','NRII6','BOE-X78','1','10','2023-06-01 10:30:00','2023-06-01 12:30:00'),
('IDJI7217118671','JII3','BOE-Y17','2','13','2023-06-01 10:30:00','2023-06-01 12:30:00'),
('IDSHI822268171','SHII18','BOE-G67','2','8','2023-06-01 11:00:00','2023-06-01 13:30:00'),
('IDARS871672178','ARSII3','NSU-T56','1','2','2023-06-01 11:00:00','2023-06-01 13:30:00'),
('SKII9171681711','IISK34','UYT-H76','3','7','2023-06-01 11:30:00','2023-06-01 16:30:00'),
('IDSTI918712712','STI24','BOE-Y76','2','1','2023-06-01 12:30:00','2023-06-01 14:30:00');

INSERT INTO staff(id_staff,id_penerbangan,nama_staff,posisi,tanggal_bertugas)
VALUES ('2345897D','IDNRI82611715','Widya','Pramugari','2023-06-01'),
('8767116D','IDNRI82611715','Luna','Pramugari','2023-06-01'),
('8712618H','IDJI7217118671','Rian','Pilot','2023-06-01'),
('981T216H','IDJI7217118671','Kurnia','Pramugara','2023-06-01'),
('8721271G','IDSHI822268171','Ami','Pilot','2023-06-01'),
('8127631T','IDSHI822268171','Subagyo','Co-Pilot','2023-06-01'),
('9867126Y','IDARS871672178','Lina','Pramugari','2023-06-01'),
('8917612E','IDARS871672178','Suprapto','Pramugara','2023-06-01'),
('9871176R','SKII9171681711','Wahyu','Pilot','2023-06-01'),
('0926732R','IDSTI918712712','Ningsih','Pilot','2023-06-01');

INSERT INTO tiket(id_tiket,id_penerbangan,no_paspor,kelas,no_kursi) 
VALUES ('II78ARS89','SKII9171681711','K7152182H0','Ekonomi','G12'),
('II61AI90','IDARS871672178','X01824K8','Ekonomi','H04'),
('II56IG187','IDJI7217118671','X16521U7','Bisnis','A08'),
('HY615KS81','IDSHI822268171','Y186192Y7','Bisnis','I09'),
('JP16NRI23','IDNRI82611715','X972158U8','Ekonomi','G10');

INSERT INTO pembayaran(id_transaksi,id_tiket,jumlah_tiket,total_pembayaran,metode_pembayaran)
VALUES ('01926XCF','II78ARS89',1,1985000,'Bank Virtual Account'),
('1721GYU','II61AI90',1,4500000,'Bank Virtual Account'),
('8162HYU','JP16NRI23',1,1985000,'Credit Card'),
('7152WER','HY615KS81',1,1985000,'OVO'),
('0128IOP','II56IG187',1,5400000,'Credit Card');

select * from customer;
select * from destinasi;
select * from pesawat;
select * from penerbangan;
select * from staff;
select * from tiket;
select * from pembayaran;

select c.nama, t.kelas, d.kota_bandara, ps.nama_maskapai, 
pe.waktu_keberangkatan, pe.waktu_tiba, timediff(waktu_tiba,waktu_keberangkatan) as lama_perjalanan
from customer as c join tiket as t on c.no_paspor = t.no_paspor
join penerbangan as pe  on t.id_penerbangan = pe.id_penerbangan
join destinasi as d on d.id_bandaratujuan = pe.id_bandaratujuan
join pesawat as ps on ps.id_pesawat = pe.id_pesawat
order by nama asc;

select c.nama, pm.total_pembayaran, t.kelas, ps.nama_maskapai, 
dense_rank()over(order by total_pembayaran desc) as tingkat_pengeluaran
from customer as c join tiket as t on c.no_paspor = t.no_paspor
join penerbangan as pe on t.id_penerbangan = pe.id_penerbangan
join pembayaran as pm on pm.id_tiket = t.id_tiket
join pesawat as ps on ps.id_pesawat = pe.id_pesawat;

update pembayaran
set total_pembayaran =+ 200000
where id_transaksi = '7152WER';

delete from pembayaran
where id_transaksi = '7152WER';



show tables;

drop table tiket;
drop table customer;
drop table pesawat;
drop table staff;
drop table penerbangan;
drop table bandaratujuan;
drop table pembayaran;
