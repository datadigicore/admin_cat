-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2016 at 05:09 
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cat_polda`
--

-- --------------------------------------------------------

--
-- Table structure for table `cat_users`
--

CREATE TABLE IF NOT EXISTS `cat_users` (
`id` int(15) NOT NULL,
  `projectList` text,
  `nik` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `jenis_kelamin` tinyint(1) DEFAULT NULL,
  `tempat_lahir` tinytext,
  `tanggal_lahir` date DEFAULT NULL,
  `pendidikan` varchar(255) DEFAULT NULL,
  `institusi` tinytext,
  `jenis_pekerjaan` varchar(255) DEFAULT NULL,
  `hp` tinytext,
  `alamat` text,
  `other_data` text,
  `type` int(11) DEFAULT NULL COMMENT '1:admin,2:user',
  `salt` varchar(200) DEFAULT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `email_token` varchar(255) DEFAULT NULL,
  `is_online` int(11) NOT NULL DEFAULT '0',
  `n_status` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cat_users`
--

INSERT INTO `cat_users` (`id`, `projectList`, `nik`, `name`, `username`, `email`, `password`, `register_date`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pendidikan`, `institusi`, `jenis_pekerjaan`, `hp`, `alamat`, `other_data`, `type`, `salt`, `login_count`, `email_token`, `is_online`, `n_status`) VALUES
(1, NULL, NULL, 'admin', 'admin', 'admin@example.com', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb', '2016-01-11 14:19:28', 0, 'Jakarta', '1989-09-08', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'codekir v3.0', 0, NULL, 0, 1),
(4, '', NULL, 'Andreass Bayu', 'andreassbayu', 'andreass.bayu@gmail.com', '8e7ade691e55def6d2984a2272a0fb9e75b8c7bc', '2016-01-15 00:53:26', NULL, NULL, NULL, 'S2', 'Gunadarma', 'Information Management', NULL, NULL, NULL, 3, '1234567890', 0, NULL, 0, 1),
(5, '1,2,3', NULL, 'Verra Theresia', 'veynicks', 'verra@gmail.com', 'fdb9f5f5d30065406c0635eba10fc07257c0bfdc', '2016-01-16 14:25:59', NULL, 'Cirebon', '1989-11-20', NULL, 'Fransiskus II', 'Perbankan', NULL, NULL, NULL, 2, '1234567890', 0, NULL, 0, 1),
(6, NULL, NULL, 'yuki', 'yuki', 'yuki@gmail.com', '4b738cccae22c51d2e1db5b98d8ebcef14d4c624', '2016-01-16 16:25:53', NULL, NULL, NULL, 'S1', 'Bina Nusantara', 'Manager', NULL, NULL, NULL, 2, '1234567890', 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ck_activity`
--

CREATE TABLE IF NOT EXISTS `ck_activity` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL COMMENT '1:content;2:norma;3:peraturan;4:produk;5:program;6:sig;7:user',
  `activity_value` varchar(50) NOT NULL,
  `n_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ck_activity_log`
--

CREATE TABLE IF NOT EXISTS `ck_activity_log` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `activity_desc` varchar(250) NOT NULL,
  `source` varchar(20) NOT NULL,
  `datetimes` datetime NOT NULL,
  `n_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ck_admin_member`
--

CREATE TABLE IF NOT EXISTS `ck_admin_member` (
`id` int(15) NOT NULL,
  `name` varchar(46) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_akses` varchar(300) DEFAULT NULL,
  `username` varchar(46) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1:admin, 2:verifikator, 3:evaluator, 4: balai',
  `salt` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `n_status` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ck_admin_member`
--

INSERT INTO `ck_admin_member` (`id`, `name`, `nickname`, `email`, `register_date`, `menu_akses`, `username`, `type`, `salt`, `password`, `n_status`) VALUES
(1, 'admin', 'admin', 'admin@example.com', '2014-08-07 15:56:36', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24', 'admin', 1, 'codekir v3.0', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ck_menu`
--

CREATE TABLE IF NOT EXISTS `ck_menu` (
`menuID` int(2) NOT NULL,
  `menuDesc` varchar(50) DEFAULT NULL,
  `menuParent` int(2) DEFAULT NULL,
  `menuPath` varchar(100) DEFAULT NULL,
  `menuIcon` varchar(100) DEFAULT NULL,
  `menuStatus` int(11) NOT NULL,
  `menuAksesLogin` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ck_menu_parent`
--

CREATE TABLE IF NOT EXISTS `ck_menu_parent` (
`menuParentID` int(2) NOT NULL,
  `menuParentDesc` varchar(20) DEFAULT NULL,
  `menuOrder` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `generated_soal`
--

CREATE TABLE IF NOT EXISTS `generated_soal` (
`id` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `soal` text NOT NULL,
  `opt` varchar(10) NOT NULL,
  `paket` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generated_soal`
--

INSERT INTO `generated_soal` (`id`, `id_paket`, `id_peserta`, `id_kategori`, `soal`, `opt`, `paket`) VALUES
(1, 5, 1, 4, '11,1,14,4,13,6,12,5', '3,1,2,4', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `jawaban`
--

CREATE TABLE IF NOT EXISTS `jawaban` (
`id_jawaban` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL,
  `kunci` text NOT NULL,
  `jawaban` text NOT NULL,
  `opt` varchar(15) NOT NULL,
  `nilai` int(11) NOT NULL,
  `id_peserta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `log_upload_peserta`
--

CREATE TABLE IF NOT EXISTS `log_upload_peserta` (
`id` int(11) NOT NULL,
  `nama_file` tinytext NOT NULL,
  `tgl_upload` datetime NOT NULL,
  `hash` text NOT NULL,
  `status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_upload_soal`
--

CREATE TABLE IF NOT EXISTS `log_upload_soal` (
`id` int(11) NOT NULL,
  `nama_file` tinytext NOT NULL,
  `tgl_upload` datetime NOT NULL,
  `hash` text NOT NULL,
  `status_soal` int(11) NOT NULL COMMENT '0= ready to upload; 1 = uploading; 2 = done;',
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kisi` int(11) NOT NULL,
  `penulis` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_upload_soal`
--

INSERT INTO `log_upload_soal` (`id`, `nama_file`, `tgl_upload`, `hash`, `status_soal`, `id_user`, `id_kategori`, `kisi`, `penulis`) VALUES
(31, '2016-01-24_09:57:34-CONTOH SOAL.xls', '2016-01-24 09:57:34', 'e04de1a8c2a67a4c0584ff04689bf0c342521e08e5ccf47bf5fc83230f0ce0aa860aed16cf9c9394537c26d5a8ca8ae86a47b48823f8f5b6f4ed25ee5d15f357', 1, 1, 4, 5, 'harris');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE IF NOT EXISTS `lokasi` (
`id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL,
  `status_pemanfaatan` tinyint(1) NOT NULL COMMENT '1-? aktif, 0--> non aktif'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `nama_lokasi`, `status_pemanfaatan`) VALUES
(1, 'Kampus Depok', 1),
(2, 'Kampus E(Kelapa Dua)', 1),
(3, 'Kampus J (Kalimalang)', 1),
(4, 'Kampus K (Karawaci)', 1),
(5, 'Kampus H (Ciliwung)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori`
--

CREATE TABLE IF NOT EXISTS `master_kategori` (
`id_master` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `nama_master` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='daftar nama mata pelajaran/soal';

--
-- Dumping data for table `master_kategori`
--

INSERT INTO `master_kategori` (`id_master`, `id_parent`, `nama_master`) VALUES
(1, 0, 'BAHASA INGGRIS'),
(2, 0, 'BAHASA INDONESIA'),
(3, 0, 'MATEMATIKA'),
(4, 0, 'PENGETAHUAN UMUM'),
(5, 4, 'ALGORITMA');

-- --------------------------------------------------------

--
-- Table structure for table `master_peserta`
--

CREATE TABLE IF NOT EXISTS `master_peserta` (
`id_peserta` int(11) NOT NULL,
  `id_ujian` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `no_peserta` varchar(50) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `nrp` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status_ujian` int(11) NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `durasi_pengerjaan` int(11) NOT NULL,
  `tambahan_waktu` int(11) NOT NULL,
  `waktu_selesai` datetime NOT NULL,
  `skor_total` int(11) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_peserta`
--

INSERT INTO `master_peserta` (`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES
(1, 1, 1, 4, '373/P/PMJ', 'NUR SUHARTONO', '83110054', '2016-01-22', 0, '0000-00-00 00:00:00', 90, 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `master_soal`
--

CREATE TABLE IF NOT EXISTS `master_soal` (
`id_soal` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `tipe_soal` int(11) NOT NULL DEFAULT '0',
  `penulis` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `kisi` int(11) NOT NULL DEFAULT '0' COMMENT 'kategori_soal',
  `waktu` int(11) NOT NULL DEFAULT '0' COMMENT 'minutes',
  `tingkatan` int(11) NOT NULL DEFAULT '0',
  `prosedur_penilaian` int(11) NOT NULL DEFAULT '0',
  `soal` text NOT NULL,
  `1` text NOT NULL COMMENT 'kunci',
  `2` text NOT NULL,
  `3` text NOT NULL,
  `4` text NOT NULL,
  `5` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_soal`
--

INSERT INTO `master_soal` (`id_soal`, `no_urut`, `tipe_soal`, `penulis`, `id_kategori`, `kisi`, `waktu`, `tingkatan`, `prosedur_penilaian`, `soal`, `1`, `2`, `3`, `4`, `5`) VALUES
(1, 0, 0, '', 4, 5, 0, 0, 0, 'Definisi algoritma adalah :', 'Urutan langkah-langkah logis penyelesaian masalah yang disusun secara sistematis', 'Sebuah system manusia/mesin yang terpadu untuk menyajikan informasi', 'Sebuah kumpulan system yang digunakan pada suatu organisasi', 'Metode untuk menyelesaikan masalah besar', ''),
(2, 0, 0, '', 4, 5, 0, 0, 0, 'Kriteria algoritma yang baik, kecuali:', 'Kompleks', 'Tepat', 'Logis', 'Proses dapat berakhir', ''),
(3, 0, 0, '', 4, 5, 0, 0, 0, 'Kode yang mirip dengan kode pemrograman yang sebenarnya disebut juga dengan :', 'Pseudocode', 'Bahasa Pemrograman', 'Sintaks', 'Semantic', ''),
(4, 0, 0, '', 4, 5, 0, 0, 0, 'Generasi pertama bahasa pemrograman adalah:', 'Machine Language', 'Assembly Language', 'Pascal', 'Basic', ''),
(5, 0, 0, '', 4, 5, 0, 0, 0, 'Yang termasuk ke dalam bahasa pemrograman OOP adalah :', 'C++', 'C', 'Pascal', 'Fortran', ''),
(6, 0, 0, '', 4, 5, 0, 0, 0, 'Sejarah Metrologi dimulai sejak perabadan kuno di Mesir berupa standar panjang â€œCubitâ€ yang didefinisikan sebagai panjang lengan bawah dari siku ke ujung jari tengah Firâ€™aun yang sedang memerintah ditambah dengan â€¦', 'lebar telapak tangannya', 'panjang lengan kakinya', 'panjang jari jempol', 'panjang lengan atasnya', ''),
(7, 0, 0, '', 4, 5, 0, 0, 0, 'Metrologi modern dimulai sejak Revolusi Perancis (1795) dengan penetapan standar meter yaitu sepersepuluh juta bagian dari seperempat meridian bumi atau sepersepuluh juta bagian dari jarak antara kota Barcelona dengan kotaâ€¦', 'Dunkirk', 'Paris', 'Bavaria', 'Cordova', ''),
(8, 0, 0, '', 4, 5, 0, 0, 0, 'Metrologi dibagi menjadi 3, yaitu:', 'Ilmiah, Industri dan Legal', 'Dasar, Turunan, dan Legal', 'Dasar, Industri, dan Legal', 'Ilmiah, Turunan, dan Legal', ''),
(9, 0, 0, '', 4, 5, 0, 0, 0, 'Menjamin transparansi transaksi ekonomi dan perlindungan konsumen merupakan salah satu peran Metrologi?', 'Legal', 'Dasar', 'Industri', 'Ilmiah', ''),
(10, 0, 0, '', 4, 5, 0, 0, 0, 'Alasan utama kalibrasi alat ukur kecuali?', 'agar tidak cepat rusak atau awet', 'membangun dan menunjukkan ketertelusuran', 'memastikan konsistensi dan keakuratan pembacaan alat ukur', 'menjaga reliabilitas alat ukur agar dapat dipercaya', ''),
(11, 0, 0, '', 4, 5, 0, 0, 0, 'Kegiatan untuk menilai bahwa barang, jasa, proses, sistem, atau personel telah memenuhi persyaratan acuan atau standar merupakan pengertian dari?', 'Penilaian Kesesuaian', 'Sertifikasi', 'Standardisasi', 'Akreditasi', ''),
(12, 0, 0, '', 4, 5, 0, 0, 0, 'Prinsip mengenai penilaian kesesuaian terkandung di dalam?', 'ISO/IEC 17000:2004', 'ISO 9001:2008', 'ISO 15189:2012', 'ISO/IEC Guide 2:2004', ''),
(13, 0, 0, '', 4, 5, 0, 0, 0, 'Kegiatan di dalam penilaian kesesuaian pada dasarnya bersifat....', 'Sukarela', 'Wajib', 'Positif', 'Mandatory', ''),
(14, 0, 0, '', 4, 5, 0, 0, 0, 'Berdasarkan pihak penilai, praktik penilaian kesesuaian dapat menjadi tiga, yaitu..', 'Pihak Pertama, Pihak Kedua, Pihak Ketiga', 'Produsen, Pemasok, Konsumen', 'Produsen, Konsumen, Regulator', 'Input, Proses, Output', ''),
(15, 0, 0, '', 4, 5, 0, 0, 0, 'Kegiatan penilaian kesesuaian yang dilakukan oleh produsen yang menyediakan obyek yang sedang dinilai adalah pengertian dari?', 'Pihak Pertama', 'Produsen', 'Regulator', 'Proses', ''),
(16, 0, 0, '', 4, 5, 0, 0, 0, 'Berikut prinsip penilaian kesesuaian yang harus dipenuhi, kecuali?', 'Berikut prinsip penilaian kesesuaian yang harus dipenuhi, kecualiâ€¦', 'Kompeten, tidak memihak, terbuka', 'Tidak memihak, Terbuka, Efektif', 'Transparan, Terbuka, Konvergen', '');

-- --------------------------------------------------------

--
-- Table structure for table `paket_soal`
--

CREATE TABLE IF NOT EXISTS `paket_soal` (
`id_paket` int(11) NOT NULL,
  `id_soal` text NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `paket` varchar(11) NOT NULL,
  `waktu_acak` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paket_soal`
--

INSERT INTO `paket_soal` (`id_paket`, `id_soal`, `id_kategori`, `paket`, `waktu_acak`) VALUES
(5, '1,5,4,6,13,11,14,12', 4, 'A', '2016-01-20 05:32:42'),
(6, '16,10,8,7,9,15,3,2', 4, 'B', '2016-01-20 05:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
`id_pengguna` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL COMMENT '1->super_admin,2->admin lokasi, 3->admin ruangan',
  `lokasi` varchar(255) NOT NULL,
  `ruangan` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1-> aktif, 0-> non aktif'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `level`, `lokasi`, `ruangan`, `status`) VALUES
(1, 'admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 1, 'tes lokasi', 'tes ruangan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `prosentase_soal`
--

CREATE TABLE IF NOT EXISTS `prosentase_soal` (
  `ID` int(11) NOT NULL,
  `Kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `Persentase` double DEFAULT NULL,
  `Status` varchar(9) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `prosentase_soal`
--

INSERT INTO `prosentase_soal` (`ID`, `Kategori`, `Persentase`, `Status`) VALUES
(1, 'BAHASA INDONESIA', 30, 'AKTIF'),
(2, 'BAHASA INGGRIS', 30, 'AKTIF'),
(3, 'PENGETAHUAN UMUM', 40, 'AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE IF NOT EXISTS `ruangan` (
`id_ruangan` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `id_lokasi`, `nama`, `status`) VALUES
(1, 1, 'D436/LePKom', 0),
(2, 1, 'D437/LePKom', 0),
(3, 1, 'D440/LePMA', 0),
(4, 1, 'D450/LePMA', 0),
(5, 1, 'D441/LePMA', 0),
(6, 1, 'D448/LePTek', 0),
(7, 1, 'D456/LPUG', 0),
(8, 1, 'D457/LPUG', 0),
(9, 1, 'D522/UM', 0),
(10, 1, 'D521/UM', 0),
(11, 2, 'E428/T.Mesin', 0),
(12, 2, 'E516/SI', 0),
(13, 2, 'E342/Sastra', 0),
(14, 2, 'E521/SI', 0),
(15, 2, 'E522/Ak.Lanjut B', 0),
(16, 2, 'E523/Manaj.Lanjut', 0),
(17, 2, 'E532/Manaj Menengah', 0),
(18, 2, 'E533/Ak.Lanjut A', 0),
(19, 2, 'E534/TI', 0),
(20, 2, 'E542/TI', 0),
(21, 2, 'E543/TI', 0),
(22, 2, 'E545/Ak.Menengah', 0),
(23, 2, 'E546/SI', 0),
(24, 3, 'J1 Belakang/ Ujian Mandiri', 0),
(25, 3, 'J125 / TI', 0),
(26, 3, 'J1426 / Akuntasi', 0),
(27, 3, 'J1423 / Manajemen', 0),
(28, 3, 'J1525 / SI', 0),
(29, 3, 'J1522 / SI', 0),
(30, 4, 'K121', 0),
(31, 4, 'K122', 0),
(32, 4, 'K123', 0),
(33, 4, 'K124', 0),
(34, 5, 'LANTAI 2 MERAH (J)', 0),
(35, 5, 'LANTAI 2 TOSKA 1 (K)', 0),
(36, 5, 'LANTAI 2 TOSKA 2 (K)', 0),
(37, 5, 'LANTAI 2 BIRU (L)', 0),
(38, 5, 'LANTAI 2 HIJAU DAUN (M)', 0),
(39, 5, 'LANTAI 2 ORANGE (N)', 0),
(40, 5, 'LANTAI 2 PUTIH (O)', 0),
(41, 5, 'LANTAI 2 ABU-ABU (P)', 0),
(42, 5, 'LANTAI 2 KUNING (Q)', 0),
(43, 5, 'LANTAI 3 MERAH (A)', 0),
(44, 5, 'LANTAI 3 TOSKA (B)', 0),
(45, 5, 'LANTAI 3 BIRU (C)', 0),
(46, 5, 'LANTAI 3 HIJAU (D)', 0),
(47, 5, 'LANTAI 3 ORANGE (E)', 0),
(48, 5, 'LANTAI 3 PUTIH (F)', 0),
(49, 5, 'LANTAI 3 ABU-ABU (H)', 0),
(50, 5, 'LANTAI 3 KUNING (I)', 0),
(51, 1, 'D532/UM', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE IF NOT EXISTS `ujian` (
`id_ujian` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `lama_ujian` int(11) NOT NULL COMMENT 'minutes',
  `jumlah_soal` int(11) NOT NULL,
  `waktu_ujian` date NOT NULL,
  `mulai` int(11) NOT NULL,
  `selesai` int(11) NOT NULL,
  `jumlah_peserta` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `pilihan_paket` varchar(5) NOT NULL,
  `status_ujian` tinyint(1) NOT NULL COMMENT '0:belum mulai;1:verifikasi;2:sedang dimulai;3:selesai',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `id_kategori`, `lama_ujian`, `jumlah_soal`, `waktu_ujian`, `mulai`, `selesai`, `jumlah_peserta`, `keterangan`, `pilihan_paket`, `status_ujian`, `status`) VALUES
(1, 4, 90, 8, '2016-01-20', 0, 0, 500, '0', '2', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cat_users`
--
ALTER TABLE `cat_users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `ck_activity_log`
--
ALTER TABLE `ck_activity_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ck_admin_member`
--
ALTER TABLE `ck_admin_member`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ck_menu`
--
ALTER TABLE `ck_menu`
 ADD PRIMARY KEY (`menuID`), ADD KEY `menuID` (`menuID`);

--
-- Indexes for table `ck_menu_parent`
--
ALTER TABLE `ck_menu_parent`
 ADD PRIMARY KEY (`menuParentID`), ADD KEY `menuParentID` (`menuParentID`);

--
-- Indexes for table `generated_soal`
--
ALTER TABLE `generated_soal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jawaban`
--
ALTER TABLE `jawaban`
 ADD PRIMARY KEY (`id_jawaban`);

--
-- Indexes for table `log_upload_peserta`
--
ALTER TABLE `log_upload_peserta`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_upload_soal`
--
ALTER TABLE `log_upload_soal`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
 ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `master_kategori`
--
ALTER TABLE `master_kategori`
 ADD PRIMARY KEY (`id_master`);

--
-- Indexes for table `master_peserta`
--
ALTER TABLE `master_peserta`
 ADD PRIMARY KEY (`id_peserta`), ADD KEY `id_ujian` (`id_ujian`);

--
-- Indexes for table `master_soal`
--
ALTER TABLE `master_soal`
 ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `paket_soal`
--
ALTER TABLE `paket_soal`
 ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
 ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `prosentase_soal`
--
ALTER TABLE `prosentase_soal`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
 ADD PRIMARY KEY (`id_ruangan`), ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
 ADD PRIMARY KEY (`id_ujian`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cat_users`
--
ALTER TABLE `cat_users`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ck_activity_log`
--
ALTER TABLE `ck_activity_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ck_admin_member`
--
ALTER TABLE `ck_admin_member`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ck_menu`
--
ALTER TABLE `ck_menu`
MODIFY `menuID` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ck_menu_parent`
--
ALTER TABLE `ck_menu_parent`
MODIFY `menuParentID` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `generated_soal`
--
ALTER TABLE `generated_soal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `jawaban`
--
ALTER TABLE `jawaban`
MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_upload_peserta`
--
ALTER TABLE `log_upload_peserta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_upload_soal`
--
ALTER TABLE `log_upload_soal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `master_kategori`
--
ALTER TABLE `master_kategori`
MODIFY `id_master` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `master_peserta`
--
ALTER TABLE `master_peserta`
MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `master_soal`
--
ALTER TABLE `master_soal`
MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `paket_soal`
--
ALTER TABLE `paket_soal`
MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
MODIFY `id_ujian` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
