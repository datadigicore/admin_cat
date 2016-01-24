-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2016 at 07:35 
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
  `status_log_peserta` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_upload_peserta`
--

INSERT INTO `log_upload_peserta` (`id`, `nama_file`, `tgl_upload`, `hash`, `status_log_peserta`, `id_user`) VALUES
(5, '2016-01-24_12:37:11-NOMINATIF SIP KIRIM KE UG.xlsx', '2016-01-24 12:37:11', 'a80c76081bfe209de35ddf44fa314f030c5a97490ceb82337076daad2f870230b9eaa29c74899737d4e4938efaa192735a5caa61b1a42bd11959f9a6176b7bc8', 2, 1);

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
  `jenkel` varchar(1) NOT NULL,
  `pkt` varchar(64) NOT NULL,
  `kesatuan` varchar(255) NOT NULL,
  `tempat_lahir` varchar(64) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status_ujian` int(11) NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `durasi_pengerjaan` int(11) NOT NULL,
  `tambahan_waktu` int(11) NOT NULL,
  `waktu_selesai` datetime NOT NULL,
  `skor_total` int(11) NOT NULL,
  `keterangan` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1446 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_peserta`
--

INSERT INTO `master_peserta` (`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `jenkel`, `pkt`, `kesatuan`, `tempat_lahir`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES
(1, 1, 1, 4, '373/P/PMJ', 'NUR SUHARTONO', '83110054', '0', '', '', '', '2016-01-22', 0, '0000-00-00 00:00:00', 90, 0, '0000-00-00 00:00:00', 0, 0),
(484, 0, 0, 0, '001/P/PMJ', 'ENDY ROHANDI', '75100172', 'P', 'AIPTU', 'RO SARPRAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(485, 0, 0, 0, '002/P/PMJ', 'DICKY NURHUDHAN, S.H.', '80040098', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(486, 0, 0, 0, '003/P/PMJ', 'MOHAMAD FARHAN', '79071092', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(487, 0, 0, 0, '004/P/PMJ', 'MUSTOFA', '81100230', 'P', 'BRIPKA', 'DIT TAHTI POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(488, 0, 0, 0, '005/P/PMJ', 'PULUNG WAHYU UMBORO', '78080415', 'P', 'AIPDA', 'DIT SABHARA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(489, 0, 0, 0, '006/W/PMJ', 'SRI ROSMALA', '72080544', 'W', 'AIPTU', 'DIT BINMAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(490, 0, 0, 0, '007/P/PMJ', 'HERI SUTANTO', '79051125', 'P', 'BRIPKA', 'SPN POLDA METRO JAYA', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(491, 0, 0, 0, '008/P/PMJ', 'M.R. SUHARTONO', '72060133', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(492, 0, 0, 0, '009/P/PMJ', 'HELMI PURWADI, S.Pd', '75110364', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'KARANGANYAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(493, 0, 0, 0, '010/P/PMJ', 'SYAMSUL BAHRI, S.H.', '78081283', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(494, 0, 0, 0, '011/P/PMJ', 'IRFAN WAHYU DIONO', '83010200', 'P', 'BRIPKA', 'DIT TAHTI POLDA METRO JAYA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(495, 0, 0, 0, '012/P/PMJ', 'JACK HARISON, S.H.', '75040277', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'AGAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(496, 0, 0, 0, '013/P/PMJ', 'MUSLIM', '78110471', 'P', 'BRIPKA', 'BID HUMAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(497, 0, 0, 0, '014/W/PMJ', 'DWI ERNAWATI', '74110331', 'W', 'AIPTU', 'DIT INTELKAM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(498, 0, 0, 0, '015/P/PMJ', 'EKO SUGENG RIANTO, S.H.', '77100418', 'P', 'AIPDA', 'DIT INTELKAM POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(499, 0, 0, 0, '016/P/PMJ', 'AGUNG PRANOTO, S.H.', '81100229', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(500, 0, 0, 0, '017/P/PMJ', 'BAMBANG WIRAWAN, S.T.', '79111186', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(501, 0, 0, 0, '018/W/PMJ', 'HERLIN YULIARTI DIANTAMA, S.E.', '83071371', 'W', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(502, 0, 0, 0, '019/P/PMJ', 'SUTARNO, S.H., M.H.', '82040621', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 0, 0, '020/P/PMJ', 'AGUNG PRASETYO, S.Kom', '81101205', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 0, 0, '021/P/PMJ', 'YONAS LEDEWEDJO', '75060880', 'P', 'AIPTU', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(505, 0, 0, 0, '022/P/PMJ', 'DIDIK TRI MARYANTO', '81030239', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 0, 0, '023/P/PMJ', 'HERIYANTO, S.H.', '81020175', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 0, 0, '024/P/PMJ', 'HERMAN SAPUTRA', '80110576', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'DEPOK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(508, 0, 0, 0, '025/P/PMJ', 'ASEP SUDRAJAT MULYANA, S.H.', '80110273', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(509, 0, 0, 0, '026/P/PMJ', 'SYAEFUL HAMDI, S.H.', '79040112', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(510, 0, 0, 0, '027/P/PMJ', 'SUJUD SUGIHARTO, S.H.', '75090104', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(511, 0, 0, 0, '028/P/PMJ', 'SYAEFUDIN JAELANI, S.H.', '82070643', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(512, 0, 0, 0, '029/P/PMJ', 'AGUNG CAHYADI, S.H.', '83030330', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'CIREBON', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(513, 0, 0, 0, '030/P/PMJ', 'IZA SAMSU KIFLI, S.H.', '81020033', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(514, 0, 0, 0, '031/P/PMJ', 'HARSONO', '79020518', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(515, 0, 0, 0, '032/P/PMJ', 'DAVIT RONALDO, S.H.', '83030154', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'LUBUK LINGGAU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(516, 0, 0, 0, '033/P/PMJ', 'SARYONO', '74010365', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(517, 0, 0, 0, '034/P/PMJ', 'SURYONO, S.H.', '82070473', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(518, 0, 0, 0, '035/P/PMJ', 'SUMARNO', '77060702', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(519, 0, 0, 0, '036/P/PMJ', 'BUDIYANTO', '75050841', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(520, 0, 0, 0, '037/P/PMJ', 'EDY SUYANTO, S.H.', '76060596', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(521, 0, 0, 0, '038/P/PMJ', 'MUHAMMAD TOYIB', '74060658', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'KP. ASAHAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(522, 0, 0, 0, '039/W/PMJ', 'PANCA SIRSANTI', '80080180', 'W', 'BRIPKA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(523, 0, 0, 0, '040/P/PMJ', 'WAHYUDI, S.H.', '78100175', 'P', 'AIPDA', 'DIT POLAIR POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(524, 0, 0, 0, '041/P/PMJ', 'TRIYANTO, S.H.', '83070074', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'TEMANGGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(525, 0, 0, 0, '042/P/PMJ', 'IWAN NUGRAHA, S.H.', '76050111', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(526, 0, 0, 0, '043/P/PMJ', 'HARI SANTOSO', '83030088', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(527, 0, 0, 0, '044/P/PMJ', 'JUSTAN, S.H.', '80121077', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'PATUKU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(528, 0, 0, 0, '045/W/PMJ', 'MUTIARA HARAHAP, S.H.', '79090942', 'W', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'PADANG SIDEMPUAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(529, 0, 0, 0, '046/P/PMJ', 'MUHAMAD SOBRI, S.H.', '80100715', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(530, 0, 0, 0, '047/P/PMJ', 'RUMAIN', '75030562', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(531, 0, 0, 0, '048/P/PMJ', 'AHMAD JAYADI', '79081036', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(532, 0, 0, 0, '049/P/PMJ', 'DWI YULIANTO, S.H.', '81120619', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(533, 0, 0, 0, '050/W/PMJ', 'ISTIKHOMAH, S.H.', '79110966', 'W', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(534, 0, 0, 0, '051/P/PMJ', 'RONALD REAGEN ISHAK', '79110216', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(535, 0, 0, 0, '052/P/PMJ', 'SOLYCHAN', '74050661', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'JEPARA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(536, 0, 0, 0, '053/P/PMJ', 'YOYO HIDAYAT, S.H.', '80041039', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(537, 0, 0, 0, '054/P/PMJ', 'JOKO ADI WIBOWO, S.H.', '80090380', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(538, 0, 0, 0, '055/P/PMJ', 'SUROYO', '77120233', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(539, 0, 0, 0, '056/P/PMJ', 'IMAM ROHADI, S.H.', '80050713', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'DEMAK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(540, 0, 0, 0, '057/P/PMJ', 'YUSBANI YUSUF, S.H.', '77020234', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(541, 0, 0, 0, '058/P/PMJ', 'PURWANTO', '76050039', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(542, 0, 0, 0, '059/P/PMJ', 'JIMMY SAUT SUMIHAR SILALAHI', '78090126', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(543, 0, 0, 0, '060/P/PMJ', 'AGUS AMINUDIN', '85110276', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(544, 0, 0, 0, '061/P/PMJ', 'WAWAN SETIAWAN, S.E.', '81060171', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'PURWAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(545, 0, 0, 0, '062/P/PMJ', 'DARFIN NAINGGOLAN, S.H.', '77090857', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'SINAMBELA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(546, 0, 0, 0, '063/P/PMJ', 'HENDRO PURWANTO', '76020555', 'P', 'AIPDA', 'YANMA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(547, 0, 0, 0, '064/P/PMJ', 'ELIA UMBOH, S.H., M.H.', '85020123', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(548, 0, 0, 0, '065/P/PMJ', 'BAMBANG IRAWAN', '72040145', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(549, 0, 0, 0, '066/P/PMJ', 'EDY WIDOYONO, S.Sos', '73010073', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'PROBOLINGGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(550, 0, 0, 0, '067/P/PMJ', 'ARIES RUDIYANTO', '81050359', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(551, 0, 0, 0, '068/P/PMJ', 'KOKO KUSWOYO', '79060345', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(552, 0, 0, 0, '069/P/PMJ', 'AGUNG PRASOJO', '78100425', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(553, 0, 0, 0, '070/P/PMJ', 'SUTRISNO, S.H.', '77061058', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'TULUNGAGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(554, 0, 0, 0, '071/P/PMJ', 'BERNI WILLIAM PAKASI', '78120221', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'MANADO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(555, 0, 0, 0, '072/P/PMJ', 'A. RAHMATULLA', '83050013', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BONE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(556, 0, 0, 0, '073/P/PMJ', 'MALINDRA PRADITIYA GUNAWAN, S.H., M.M.', '82020124', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(557, 0, 0, 0, '074/P/PMJ', 'KEMBAR WAHYU SUSILO', '80030833', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(558, 0, 0, 0, '075/P/PMJ', 'SLAMET PRAWORO, S.H.', '81020501', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(559, 0, 0, 0, '076/P/PMJ', 'PRIYO CAHYONO', '79051130', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(560, 0, 0, 0, '077/P/PMJ', 'ARYAWAN DIATMANTO, S.H.', '83030358', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(561, 0, 0, 0, '078/P/PMJ', 'DONO AVIANTO', '76040469', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(562, 0, 0, 0, '079/P/PMJ', 'AJI MULYANTO', '75010528', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(563, 0, 0, 0, '080/P/PMJ', 'ARIF YUDIANTO', '79041248', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(564, 0, 0, 0, '081/P/PMJ', 'DENNY FIRMANSYAH', '75060400', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(565, 0, 0, 0, '082/P/PMJ', 'SRIYANTO', '75090596', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(566, 0, 0, 0, '083/P/PMJ', 'WIDODO KURNIAWAN', '80060722', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(567, 0, 0, 0, '084/P/PMJ', 'OZI SUSANTRO, S.H., M.H.', '78101100', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(568, 0, 0, 0, '085/P/PMJ', 'MICHAEL', '80060157', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(569, 0, 0, 0, '086/P/PMJ', 'ADHI LAKSONO, S.H.', '79060193', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(570, 0, 0, 0, '087/P/PMJ', 'BAHROEL MUNIR', '78040405', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(571, 0, 0, 0, '088/P/PMJ', 'MASNGUDIN, S.H.', '81120264', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'MOJOKERTO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(572, 0, 0, 0, '089/P/PMJ', 'ANANG PRALISTYO', '73060429', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(573, 0, 0, 0, '090/W/PMJ', 'SISCA YOGAWATI', '82030052', 'W', 'BRIPKA', 'SPRIPIM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(574, 0, 0, 0, '091/P/PMJ', 'INDRI SUHADI, S.Kom', '81061349', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(575, 0, 0, 0, '092/P/PMJ', 'ASEP HERMAWAN', '79120784', 'P', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'SUBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(576, 0, 0, 0, '093/P/PMJ', 'WISNU KUSUMA', '77090374', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(577, 0, 0, 0, '094/P/PMJ', 'HERMANSYAH', '76060523', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(578, 0, 0, 0, '095/P/PMJ', 'SUBIYANTORO, S.H.', '79071463', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(579, 0, 0, 0, '096/P/PMJ', 'WISNU PRABOWO', '81120188', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(580, 0, 0, 0, '097/P/PMJ', 'AWANG, S.H.', '81060807', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(581, 0, 0, 0, '098/P/PMJ', 'AMANG PRIBADI, S.H.', '79120830', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(582, 0, 0, 0, '099/P/PMJ', 'AGUS MULYANA', '81070153', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(583, 0, 0, 0, '100/P/PMJ', 'RIRIN DWI UTOMO, S.H.', '83050182', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(584, 0, 0, 0, '101/P/PMJ', 'SUMITRO, S.H.', '79031049', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(585, 0, 0, 0, '102/P/PMJ', 'ANDIK SUWANTO, S.H.', '81020283', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(586, 0, 0, 0, '103/P/PMJ', 'SYAHRUL MUNIR, S.H.', '80110440', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(587, 0, 0, 0, '104/P/PMJ', 'EDY LESTARI', '80030640', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(588, 0, 0, 0, '105/P/PMJ', 'ASEP IWAN SUPRIATNA', '73110305', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(589, 0, 0, 0, '106/P/PMJ', 'BEKTI NUGROHO', '75090539', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'GUNUNG KIDUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(590, 0, 0, 0, '107/P/PMJ', 'NOVEL SAPTA SATNAWA', '76110062', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(591, 0, 0, 0, '108/P/PMJ', 'UDIN JAMALLUDIN. S.Sos', '75080085', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(592, 0, 0, 0, '109/P/PMJ', 'EKO KRISBIYANTO', '75040818', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(593, 0, 0, 0, '110/P/PMJ', 'TRIONO AGUNG SAPUTRO, S.H.', '82010535', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(594, 0, 0, 0, '111/P/PMJ', 'SANDI WIBISONO', '76080022', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(595, 0, 0, 0, '112/P/PMJ', 'ALFRED SAM ESRON, S.H.', '78060448', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(596, 0, 0, 0, '113/P/PMJ', 'BASORI', '74100446', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(597, 0, 0, 0, '114/P/PMJ', 'SURYADI', '76100354', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'SUMBER REJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(598, 0, 0, 0, '115/P/PMJ', 'MARTONO MAULANA, S.H.', '81020793', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'INDRAMAYU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(599, 0, 0, 0, '116/P/PMJ', 'INDRA KUSUMAWIJAYA', '75010765', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(600, 0, 0, 0, '117/P/PMJ', 'WALOEYO DJATI', '81040633', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(601, 0, 0, 0, '118/P/PMJ', 'S. SOEPRAPTO KADIRAN', '76110070', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(602, 0, 0, 0, '119/P/PMJ', 'MUCH. ANWARUDDIN', '79041226', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(603, 0, 0, 0, '120/P/PMJ', 'DADANG SETIAWAN', '76020479', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'CIANJUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(604, 0, 0, 0, '121/P/PMJ', 'MADROI HARYANTO', '78120521', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(605, 0, 0, 0, '122/P/PMJ', 'DIDI DARMADI', '81040219', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(606, 0, 0, 0, '123/P/PMJ', 'FRANSISCUS, S.H.', '82020247', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(607, 0, 0, 0, '124/P/PMJ', 'DAHMIRUL, S.H.', '82110140', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'KOTO BARU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(608, 0, 0, 0, '125/P/PMJ', 'JOHNY ARIFIYANTO', '74100592', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(609, 0, 0, 0, '126/P/PMJ', 'MAHMUDI', '73050279', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'REMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(610, 0, 0, 0, '127/P/PMJ', 'AJI DEWANTORO', '81050225', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(611, 0, 0, 0, '128/P/PMJ', 'YUSUF BUDI HARDJO, S.H., S.Pd', '79011043', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(612, 0, 0, 0, '129/P/PMJ', 'ROJALI', '77061019', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PABUARAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(613, 0, 0, 0, '130/P/PMJ', 'MOCHAMMAD ACU SUHENDAR', '77100135', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(614, 0, 0, 0, '131/P/PMJ', 'KUKUH SETIO UTOMO, S.H.', '79041264', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(615, 0, 0, 0, '132/P/PMJ', 'CUCU HIDAYAT', '80060537', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(616, 0, 0, 0, '133/P/PMJ', 'EKO ARIANTO F.', '79020151', 'P', 'AIPDA', 'POLRES PULAU SERIBU', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(617, 0, 0, 0, '134/P/PMJ', 'YUHARDI HENDRI', '79050993', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(618, 0, 0, 0, '135/P/PMJ', 'ASEP HERMAWAN', '79031028', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(619, 0, 0, 0, '136/P/PMJ', 'MARWATA', '74020239', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(620, 0, 0, 0, '137/P/PMJ', 'DARWIN, S.H.', '79120398', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(621, 0, 0, 0, '138/P/PMJ', 'AGUNG PUJIANTO, S.H.', '83070040', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(622, 0, 0, 0, '139/P/PMJ', 'DJOKO APRIANTO SAPUTRO, S.H.', '81040922', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(623, 0, 0, 0, '140/P/PMJ', 'JOKO IMAM PRAYITNO', '74050101', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(624, 0, 0, 0, '141/P/PMJ', 'ENGKUS KUSNADI', '78050890', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'MAJALENGKA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(625, 0, 0, 0, '142/P/PMJ', 'SYAIFUL HADI WIDODO', '79100737', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(626, 0, 0, 0, '143/P/PMJ', 'SUDIRO', '76080070', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(627, 0, 0, 0, '144/P/PMJ', 'YANG RUSKIYANTO', '79050883', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(628, 0, 0, 0, '145/P/PMJ', 'SUMARNO, S.H.', '74070606', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'SEI GUNTUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(629, 0, 0, 0, '146/W/PMJ', 'NOVIANTY ARTAMARA, S.T.', '79111185', 'W', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(630, 0, 0, 0, '147/P/PMJ', 'YANU TRIYANTO', '73010442', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(631, 0, 0, 0, '148/P/PMJ', 'WAHYUDI', '78080371', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(632, 0, 0, 0, '149/P/PMJ', 'MUHAMMAD AGUS WINARNO', '77050084', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(633, 0, 0, 0, '150/P/PMJ', 'RESI MULYONO', '77040384', 'P', 'AIPDA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(634, 0, 0, 0, '151/P/PMJ', 'M. SUBCHAN, S.H.', '78060225', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(635, 0, 0, 0, '152/P/PMJ', 'LEDUS SITUMORANG, S.H.', '81041104', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'LUMBAN TURNIP', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(636, 0, 0, 0, '153/P/PMJ', 'RAHMAT SUPRIADI, S.H.', '73030155', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(637, 0, 0, 0, '154/P/PMJ', 'TATA AMINUDIN, S.H.', '82040527', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(638, 0, 0, 0, '155/P/PMJ', 'YASMIR', '80060794', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'RIAU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(639, 0, 0, 0, '156/P/PMJ', 'SUPRIYANTO, S.H.', '80110923', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(640, 0, 0, 0, '157/P/PMJ', 'HERMAWAN', '72120506', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(641, 0, 0, 0, '158/P/PMJ', 'DONI AGUSMAN', '83080118', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BENGKULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(642, 0, 0, 0, '159/P/PMJ', 'ABDUL KHOLID', '76120419', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(643, 0, 0, 0, '160/P/PMJ', 'M. KADAFI', '74010407', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(644, 0, 0, 0, '161/P/PMJ', 'ERIC HIMAWAN, S.H.', '79121186', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(645, 0, 0, 0, '162/P/PMJ', 'R. DERRY DAYANA KELANA PUTRA, M.Si', '84120162', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(646, 0, 0, 0, '163/W/PMJ', 'NENDEN JUHRIYAH, AM.Keb', '76120158', 'W', 'AIPTU', 'POLRES TANGERANG SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(647, 0, 0, 0, '164/P/PMJ', 'SOFYANTO, S.H.', '78020678', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'TRENGGALEK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(648, 0, 0, 0, '165/P/PMJ', 'AMRIL', '73090461', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'AEK KORSIK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(649, 0, 0, 0, '166/P/PMJ', 'SAMSUDIN, S.H.', '77030099', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(650, 0, 0, 0, '167/P/PMJ', 'NURHAKIM, S.H.', '81010863', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(651, 0, 0, 0, '168/P/PMJ', 'SUMARTO', '76020620', 'P', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'PASURUAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(652, 0, 0, 0, '169/P/PMJ', 'YUSTIAR, S.H.', '82030679', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'REMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(653, 0, 0, 0, '170/P/PMJ', 'JEPRY ROBIN', '77090233', 'P', 'AIPDA', 'POLRES KOTA BANDARA SOETTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(654, 0, 0, 0, '171/P/PMJ', 'EDI WIJAYANTO', '79100467', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(655, 0, 0, 0, '172/P/PMJ', 'DENI SUPERI, S.H.', '81100211', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(656, 0, 0, 0, '173/P/PMJ', 'IWAN WAHYUDI, S.H.', '75050115', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(657, 0, 0, 0, '174/P/PMJ', 'FADLI SUSANTO, S.Kom', '80051309', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(658, 0, 0, 0, '175/P/PMJ', 'HERI WIYAJI', '73010465', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(659, 0, 0, 0, '176/P/PMJ', 'BAMBANG MURDIANTO', '76040470', 'P', 'AIPDA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(660, 0, 0, 0, '177/P/PMJ', 'SAGIYANA, S.H.', '81020371', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(661, 0, 0, 0, '178/P/PMJ', 'MELI SUPRIATNA', '75010147', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'SERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(662, 0, 0, 0, '179/P/PMJ', 'DEDE MAHDI PERMANA, S.H.', '84020097', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(663, 0, 0, 0, '180/P/PMJ', 'FIRMAN SUPRIYADI, S.Pd', '74090058', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(664, 0, 0, 0, '181/P/PMJ', 'EKO SLAMET BASUKI', '77120228', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(665, 0, 0, 0, '182/W/PMJ', 'EKA ERINA FAHMI', '81050397', 'W', 'BRIPKA', 'YANMA POLDA METRO JAYA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(666, 0, 0, 0, '183/P/PMJ', 'BUDY PURNOMO', '73020394', 'P', 'AIPTU', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAYAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(667, 0, 0, 0, '184/P/PMJ', 'EKO PUJI PURWANTO', '81090215', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(668, 0, 0, 0, '185/P/PMJ', 'WINARTO', '75080985', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(669, 0, 0, 0, '186/P/PMJ', 'SUHENRI', '72060194', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(670, 0, 0, 0, '187/P/PMJ', 'ASEP GUNAWAN', '78090116', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(671, 0, 0, 0, '188/P/PMJ', 'HENDRA KURNIAWAN, S.H.', '83060215', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(672, 0, 0, 0, '189/P/PMJ', 'FERRY MUFTI MAULANA, S.H.', '84020034', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(673, 0, 0, 0, '190/P/PMJ', 'WAWAN BAEHAQI, S.H., M.H.', '74030275', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(674, 0, 0, 0, '191/P/PMJ', 'EKO PURNOMO, S.H.', '75070006', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(675, 0, 0, 0, '192/P/PMJ', 'OGAN LOFIANA', '72100271', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(676, 0, 0, 0, '193/P/PMJ', 'PURWANTO', '76030600', 'P', 'AIPDA', 'POLRES PEL. TANJUNG PRIOK', 'TRENGGALEK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(677, 0, 0, 0, '194/P/PMJ', 'ROHMANI', '71060281', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(678, 0, 0, 0, '195/P/PMJ', 'YUHANES YULI SUKRONISTIYAWAN', '80070529', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(679, 0, 0, 0, '196/P/PMJ', 'SETIYONO, S.H.', '77030319', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(680, 0, 0, 0, '197/P/PMJ', 'IPAN SARWOKO', '79030471', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(681, 0, 0, 0, '198/P/PMJ', 'SETYO UTOMO', '77120771', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(682, 0, 0, 0, '199/P/PMJ', 'PANDU JIWA RASA, S.H.', '74120180', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(683, 0, 0, 0, '200/P/PMJ', 'ROBI CAHYADI, S.H.', '74080255', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(684, 0, 0, 0, '201/W/PMJ', 'SELVI MUSLINAWATI', '75090722', 'W', 'AIPTU', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(685, 0, 0, 0, '202/P/PMJ', 'DOSO CATUR BUDI SANTOSO, S.E.', '79121367', 'P', 'BRIPKA', 'RO OPS POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(686, 0, 0, 0, '203/P/PMJ', 'RIONO', '77090768', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(687, 0, 0, 0, '204/P/PMJ', 'APIP, S.H.', '78071228', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(688, 0, 0, 0, '205/P/PMJ', 'ADING ASRONI, S.H.', '82060355', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(689, 0, 0, 0, '206/P/PMJ', 'NUR YASIN, S.H.', '81121238', 'P', 'BRIPKA', 'RO OPS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(690, 0, 0, 0, '207/P/PMJ', 'SUKRISNO', '75030536', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(691, 0, 0, 0, '208/P/PMJ', 'TUTUK SYAIFUL AKBAR', '76030025', 'P', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(692, 0, 0, 0, '209/P/PMJ', 'MAHDI, S.H.', '74040482', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'ACEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(693, 0, 0, 0, '210/P/PMJ', 'FATHURROJI, S.H.', '77120819', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(694, 0, 0, 0, '211/P/PMJ', 'SUPARMAN, S.H.', '75070017', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(695, 0, 0, 0, '212/W/PMJ', 'ERMAWATI', '78090261', 'W', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(696, 0, 0, 0, '213/P/PMJ', 'JUNAEDI SHOLAT', '83060022', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(697, 0, 0, 0, '214/P/PMJ', 'PAISAL WIDJAYA, S.H.', '81050062', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(698, 0, 0, 0, '215/W/PMJ', 'SUSI SULASTRI', '76070732', 'W', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(699, 0, 0, 0, '216/P/PMJ', 'MOHAMAD SOLECHAN, S.H.', '79031122', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 0, 0, '217/P/PMJ', 'ERWIN MARCIANO SIAHAAN, S.H.', '81030354', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PEMANTANG SIANTAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(701, 0, 0, 0, '218/W/PMJ', 'ENDANG NURIASIH', '78010103', 'W', 'AIPDA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SINTANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(702, 0, 0, 0, '219/P/PMJ', 'AKHMAD KHOLIL EFFENDY', '77080684', 'P', 'AIPDA', 'POLRES TANGERANG SELATAN', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(703, 0, 0, 0, '220/W/PMJ', 'RETNO KURNIASIH, S.H.', '84030092', 'W', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'CILACAP', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(704, 0, 0, 0, '221/P/PMJ', 'MAATURNA BANGUN', '80060821', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANJUNG LANGKAT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(705, 0, 0, 0, '222/P/PMJ', 'FRANKYE', '80030008', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(706, 0, 0, 0, '223/P/PMJ', 'HERWIN MANATAR SIRAIT, S.H.', '79030470', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'DAMIAK PULI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(707, 0, 0, 0, '224/P/PMJ', 'NURDIN ADIKARA, S.H.', '79070275', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(708, 0, 0, 0, '226/P/PMJ', 'SUKAREN, S.H.', '80070912', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'MOJOKERTO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(709, 0, 0, 0, '227/P/PMJ', 'BAMBANG WIJANARKO, S.E.', '74010089', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(710, 0, 0, 0, '228/P/PMJ', 'NUR FAJAR PRASETYO, S.H.', '83100212', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(711, 0, 0, 0, '229/P/PMJ', 'M ZULKARNAEN LUBIS, S.H.', '72070601', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(712, 0, 0, 0, '230/P/PMJ', 'SARDI, S.H.', '75080934', 'P', 'AIPTU', 'DIT PAMOBVIT POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(713, 0, 0, 0, '231/P/PMJ', 'TONI SUHENDAR', '76060685', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(714, 0, 0, 0, '232/P/PMJ', 'IRWAN, S.H., M.H.', '82100273', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'TAPAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(715, 0, 0, 0, '233/P/PMJ', 'M.RIKI JATNIKA', '79061177', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(716, 0, 0, 0, '234/P/PMJ', 'MARNANGON SINAGA', '82120261', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'PASIR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(717, 0, 0, 0, '235/P/PMJ', 'SARTO MARIDUK PANJAITAN, S.H.', '78091095', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SARKO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(718, 0, 0, 0, '236/P/PMJ', 'MUHNI, S.H.', '75040795', 'P', 'AIPTU', 'DIT PAMOBVIT POLDA METRO JAYA', 'PRUBALINGGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(719, 0, 0, 0, '237/P/PMJ', 'SAEPUDIN', '78070263', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(720, 0, 0, 0, '238/P/PMJ', 'HUNTAL DAPOT MULA TUA SIBARANI, S.H.', '80020917', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(721, 0, 0, 0, '239/P/PMJ', 'YUDI BUDI YONO', '79051853', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(722, 0, 0, 0, '240/P/PMJ', 'ALFIAN AFNANY', '83090203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(723, 0, 0, 0, '241/P/PMJ', 'EKO WAHYONO', '74090693', 'P', 'AIPTU', 'DIT RESKRIMUM POLDA METRO JAYA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(724, 0, 0, 0, '242/P/PMJ', 'MUS''AD DASOPANG, S.H.', '78110548', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'KOTA PINANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(725, 0, 0, 0, '243/P/PMJ', 'IMAM SYAIFUDIN', '79051772', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(726, 0, 0, 0, '244/P/PMJ', 'IRWAN SUWANCOKO, S.H., M.Si', '79100772', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(727, 0, 0, 0, '245/P/PMJ', 'BAYU PURHADI', '76060107', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(728, 0, 0, 0, '246/P/PMJ', 'ASEP ACHMAD NURDIN, S.H.', '79030946', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(729, 0, 0, 0, '247/P/PMJ', 'M. FRESLY ARNALDO HASIBUAN', '76120078', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(730, 0, 0, 0, '248/P/PMJ', 'ERBINSON PURBA, S.H.', '81011079', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDAR SERIBU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(731, 0, 0, 0, '249/P/PMJ', 'AGUS WIDIONO', '74090674', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(732, 0, 0, 0, '250/P/PMJ', 'YOYOK SETYO UTOMO', '76080504', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'SIDOARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(733, 0, 0, 0, '251/P/PMJ', 'BRIAN PEBRIANTO', '80030510', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(734, 0, 0, 0, '252/P/PMJ', 'SAMSUL ROKHMAN', '78050642', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'JEMBER', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(735, 0, 0, 0, '253/P/PMJ', 'KEMAS JUNAIDI', '78060931', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(736, 0, 0, 0, '254/P/PMJ', 'BENI MUCHTAR', '75030269', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(737, 0, 0, 0, '255/P/PMJ', 'YUDHA BARATA ARITONANG, S.H.', '79040234', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(738, 0, 0, 0, '256/P/PMJ', 'NANANG HERI PURWANTO', '75070458', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(739, 0, 0, 0, '257/P/PMJ', 'MAIYOGI', '79050910', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(740, 0, 0, 0, '258/P/PMJ', 'KUNTORO', '72090223', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'BELINYU BANGKA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(741, 0, 0, 0, '259/P/PMJ', 'EKO BUDI WARDIANTO', '73120312', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'TEGAL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(742, 0, 0, 0, '260/P/PMJ', 'ARIES ARIANTO', '72040188', 'P', 'AIPTU', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(743, 0, 0, 0, '261/P/PMJ', 'AAN SUPRIYADI, S.H.', '75080588', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(744, 0, 0, 0, '262/P/PMJ', 'TEGUH TRIYONO HS', '80010532', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SURAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(745, 0, 0, 0, '263/P/PMJ', 'IBNU SETIAWAN', '78020194', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `master_peserta` (`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `jenkel`, `pkt`, `kesatuan`, `tempat_lahir`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES
(746, 0, 0, 0, '264/P/PMJ', 'DWI PUJIANTORO', '81030448', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(747, 0, 0, 0, '265/P/PMJ', 'BAMBANG RYADI', '81050084', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(748, 0, 0, 0, '266/P/PMJ', 'HERU KRISWANTO', '81030306', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'CIMANGGIS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(749, 0, 0, 0, '267/P/PMJ', 'HERY DJATMIKO', '77010595', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(750, 0, 0, 0, '268/P/PMJ', 'DINA PRIHANTO', '80120452', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(751, 0, 0, 0, '269/P/PMJ', 'DIAT GUNAWAN, S.E.', '83070301', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(752, 0, 0, 0, '270/P/PMJ', 'M RIZKY ARIFIANSYAH', '75060621', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(753, 0, 0, 0, '271/P/PMJ', 'YARI NUGROHO', '80030308', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(754, 0, 0, 0, '272/P/PMJ', 'SETIANTO WIBOWO, S.H.', '74120178', 'P', 'AIPTU', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(755, 0, 0, 0, '273/P/PMJ', 'FERDI HARTANTO', '77070204', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(756, 0, 0, 0, '274/P/PMJ', 'EKO CAHYONO, S.H.', '80050275', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(757, 0, 0, 0, '275/W/PMJ', 'ISWINARNI', '81040245', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(758, 0, 0, 0, '276/P/PMJ', 'SODIQ FURQON, S.H.', '81010456', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(759, 0, 0, 0, '277/P/PMJ', 'AGUS BAMBANG PURNAWAN', '80010653', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(760, 0, 0, 0, '278/P/PMJ', 'WIDIASTONO, S.H.', '72090007', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(761, 0, 0, 0, '279/P/PMJ', 'HENDRIK SULISNO', '78060753', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANYUWANGI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(762, 0, 0, 0, '280/P/PMJ', 'AVAN PRAKASA, S.E.', '78101250', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(763, 0, 0, 0, '281/P/PMJ', 'MANGIMPAL SILABAN, S.H.', '78010325', 'P', 'AIPDA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'HUTAJULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(764, 0, 0, 0, '282/P/PMJ', 'ACHMAD ZAWAWI', '78060707', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PANGKAL PINANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(765, 0, 0, 0, '283/P/PMJ', 'PURWADITYA P.', '84030176', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(766, 0, 0, 0, '284/P/PMJ', 'SAHRUL BOEDIMAN', '81030293', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(767, 0, 0, 0, '285/P/PMJ', 'GUNUNG ADI SANTOSO, S.H.', '77080710', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(768, 0, 0, 0, '286/W/PMJ', 'FANI PRILILA YAPI', '81040203', 'W', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(769, 0, 0, 0, '287/P/PMJ', 'YOHANES INU HARDI PURNOMO, S.E.', '80111100', 'P', 'BRIPKA', 'BID KEU POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(770, 0, 0, 0, '288/P/PMJ', 'HARYO SUTRIYANTO', '76010287', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(771, 0, 0, 0, '289/P/PMJ', 'WASIS ABADI, S.H., M.H.', '81070740', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(772, 0, 0, 0, '290/P/PMJ', 'HARI SANTOSO', '78030630', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMNPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(773, 0, 0, 0, '291/P/PMJ', 'COMA SYAKUNTALA PRIHARSA', '78050678', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(774, 0, 0, 0, '292/P/PMJ', 'MOCH. ISWAHYOEDIN', '73050252', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(775, 0, 0, 0, '293/P/PMJ', 'NYOMAN SUDIARTANA, S.H.', '83010269', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'DHARMA AGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(776, 0, 0, 0, '294/P/PMJ', 'AHYAR', '78050875', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(777, 0, 0, 0, '295/P/PMJ', 'RAHMAN NURJAMAN, S.H.', '80100335', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(778, 0, 0, 0, '296/P/PMJ', 'AGUS TRI CAHYONO', '76080610', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BLITAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(779, 0, 0, 0, '297/P/PMJ', 'GUNAWAN DWI PRASETYO', '83060075', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(780, 0, 0, 0, '298/W/PMJ', 'HENI HERMAYANTI, S.E.', '80080818', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PAGAR ALAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(781, 0, 0, 0, '299/P/PMJ', 'ARIFUDDIN', '76110192', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BONE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(782, 0, 0, 0, '300/P/PMJ', 'YULIANTO EDY PRAMONO', '77070073', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BREBES', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(783, 0, 0, 0, '301/P/PMJ', 'ANURAFIK, S.E.', '78111161', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(784, 0, 0, 0, '302/P/PMJ', 'DEDEN HARY', '79052088', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(785, 0, 0, 0, '303/P/PMJ', 'BUDI ARIANTO, S.H.', '84010021', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(786, 0, 0, 0, '304/P/PMJ', 'REKI ANTONI', '74110636', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PAGAR ALAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(787, 0, 0, 0, '305/P/PMJ', 'IRFAN BAHA, S.H.', '81120030', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'TERNATE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(788, 0, 0, 0, '306/P/PMJ', 'HERU HENDRAWAN', '75040322', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'ACEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(789, 0, 0, 0, '307/P/PMJ', 'SUHERMAN, S.H.', '77010296', 'P', 'AIPDA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(790, 0, 0, 0, '308/P/PMJ', 'SRI MARYANTO', '76070104', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(791, 0, 0, 0, '309/P/PMJ', 'FERY PARASIAN S. HABEAHAN, S.H.', '82050256', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PEMANTANG SIANTAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(792, 0, 0, 0, '310/P/PMJ', 'AGUS SETIAWAN', '74080622', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(793, 0, 0, 0, '311/P/PMJ', 'SURAHMAN', '74110333', 'P', 'AIPDA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(794, 0, 0, 0, '312/P/PMJ', 'RIHARD HM SIRAIT, S.H.', '73010567', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'RAJANOLIGAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(795, 0, 0, 0, '313/P/PMJ', 'HARRY NOVIAN, S.H.', '79110745', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(796, 0, 0, 0, '314/P/PMJ', 'SOPYANTO', '73030175', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(797, 0, 0, 0, '315/P/PMJ', 'GUMILAR PRASETIA, S.H.', '80100501', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SUBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(798, 0, 0, 0, '316/P/PMJ', 'TEGUH SULISTYONO', '80010541', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWODADI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(799, 0, 0, 0, '317/P/PMJ', 'SYAFRUDDIN', '79020304', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(800, 0, 0, 0, '318/P/PMJ', 'DEDE PRIYANA', '80120451', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'CIWARU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(801, 0, 0, 0, '319/P/PMJ', 'JONI PURWANTO', '77050069', 'P', 'AIPTU', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 0, 0, '320/P/PMJ', 'TOMY SUGIONO', '82010382', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(803, 0, 0, 0, '321/P/PMJ', 'FARMAL, S.H.', '72040432', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(804, 0, 0, 0, '322/W/PMJ', 'NOVITASARI', '77110515', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(805, 0, 0, 0, '323/P/PMJ', 'ERWAN KUSBIYANTORO', '81110208', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(806, 0, 0, 0, '324/P/PMJ', 'AGUS SETIYANTO UTOMO', '79061167', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(807, 0, 0, 0, '325/P/PMJ', 'ROVIKARNOV MANAEK TAMBUNAN, S.Psi', '83110211', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(808, 0, 0, 0, '326/P/PMJ', 'MUHAMAD RAMDAN', '80070597', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BATUJAJAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(809, 0, 0, 0, '327/P/PMJ', 'I MADE BUDI SANTOSO, S.E.', '80031125', 'P', 'BRIPKA', 'SPKT POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(810, 0, 0, 0, '328/P/PMJ', 'YATINO', '79010851', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(811, 0, 0, 0, '329/W/PMJ', 'DHENIS DHIKRILLA MITA', '82040739', 'W', 'BRIPKA', 'BID DOKKES POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(812, 0, 0, 0, '330/P/PMJ', 'LALU SATYA IRFANDI', '82010315', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SUMBAWA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(813, 0, 0, 0, '331/P/PMJ', 'RANCES I.MANURUNG', '77090735', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'GIRSANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(814, 0, 0, 0, '332/P/PMJ', 'READY KURNIAWAN, A.Md.Kep', '78010329', 'P', 'AIPDA', 'BID DOKKES POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(815, 0, 0, 0, '333/P/PMJ', 'TRI WALUYO', '80090692', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(816, 0, 0, 0, '334/P/PMJ', 'PRIHONO', '78030446', 'P', 'BRIPKA', 'BID DOKKES POLDA METRO JAYA', 'KLATEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(817, 0, 0, 0, '335/P/PMJ', 'WIWIT WAHONO, S.Kom', '82021185', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(818, 0, 0, 0, '336/P/PMJ', 'KADEK ARYA SUDIANTARA', '80090427', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(819, 0, 0, 0, '337/P/PMJ', 'HERFIK RIYANTO, S.H.', '80040542', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(820, 0, 0, 0, '338/P/PMJ', 'SUHENDRA', '79031155', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAYAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(821, 0, 0, 0, '339/P/PMJ', 'SAHAT PARULIAN, S.H.', '80090922', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(822, 0, 0, 0, '340/P/PMJ', 'SAIRUL EFENDI', '75040124', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'DURIAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(823, 0, 0, 0, '341/P/PMJ', 'I GEDE PUTU WIRA ADNYANA', '82050163', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SUKAMAJU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(824, 0, 0, 0, '342/P/PMJ', 'JOMSON LIMBONG', '79051606', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'HARIAN BOHO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(825, 0, 0, 0, '343/P/PMJ', 'HADIRAT SYUKUR LOMBU', '80030496', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'NIAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(826, 0, 0, 0, '344/P/PMJ', 'HENDRI NOVIKA ARISANDRA', '80120493', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(827, 0, 0, 0, '345/P/PMJ', 'LUCKY SUKOHAJI, S.E., M.M.', '82091287', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(828, 0, 0, 0, '346/P/PMJ', 'DOLI SANDRI', '78100595', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'ALAHAN MATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(829, 0, 0, 0, '347/P/PMJ', 'DEDY KUSPRIYANTO, S.H.', '84060129', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(830, 0, 0, 0, '348/P/PMJ', 'SUTRISNO', '76050820', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(831, 0, 0, 0, '349/P/PMJ', 'MARWAN, S.H.', '80120659', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'INDRAMAYU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(832, 0, 0, 0, '350/P/PMJ', 'TRI WALUYO', '76090609', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(833, 0, 0, 0, '351/P/PMJ', 'ATANG SETIAWAN, S.Sos, M.Si', '73040098', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'KUNINGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(834, 0, 0, 0, '352/P/PMJ', 'ABU BAKAR AJIE LUHULIMA', '81090203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'KULUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(835, 0, 0, 0, '353/P/PMJ', 'BUDIYONO', '77070342', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SAMPANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(836, 0, 0, 0, '354/P/PMJ', 'DICKY ARDIANSYAH, S.H.', '83040232', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(837, 0, 0, 0, '355/P/PMJ', 'SUGIYONO', '79110893', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(838, 0, 0, 0, '356/P/PMJ', 'SOPIAN HADI', '79090974', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'DEPOK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(839, 0, 0, 0, '357/P/PMJ', 'DONI AKHMADIN', '79060220', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(840, 0, 0, 0, '358/P/PMJ', 'FERY OKTARIZAL', '74100341', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(841, 0, 0, 0, '359/P/PMJ', 'TRI MULYO', '73100448', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(842, 0, 0, 0, '360/P/PMJ', 'SUHAEBY', '79051106', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(843, 0, 0, 0, '361/P/PMJ', 'RUBY ANTON, S.H.', '81020599', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(844, 0, 0, 0, '362/P/PMJ', 'MARTOGI', '79020914', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(845, 0, 0, 0, '363/P/PMJ', 'BASUKI ABDULLAH', '82010552', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMPUNG TENGAH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(846, 0, 0, 0, '364/P/PMJ', 'DEDEN SUGIARTO', '80100546', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(847, 0, 0, 0, '365/P/PMJ', 'SIGIT PRIYANTO', '81030936', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(848, 0, 0, 0, '366/P/PMJ', 'ASEP TRIANA', '79051727', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(849, 0, 0, 0, '367/P/PMJ', 'DHOHIR, S.H.', '78091170', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SURAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(850, 0, 0, 0, '368/P/PMJ', 'TRIADY MAHENDRA', '77010379', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'CIREBON', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(851, 0, 0, 0, '369/P/PMJ', 'ANTON SUHARNOYO, S.H.', '82030422', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(852, 0, 0, 0, '370/P/PMJ', 'SUNARDI', '81110703', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(853, 0, 0, 0, '371/P/PMJ', 'RICARDHO SIAHAAN', '83010139', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(854, 0, 0, 0, '372/P/PMJ', 'JOSUA PARDOMUAN SIANTURI, S.H.', '83090190', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'BANDAR LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(855, 0, 0, 0, '373/P/PMJ', 'NUR SUHARTONO', '83110054', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(856, 0, 0, 0, '374/P/PMJ', 'SUKARDI, S.H.', '75030041', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(857, 0, 0, 0, '375/P/PMJ', 'DENY SUKMO PRABOWO', '80020114', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(858, 0, 0, 0, '376/P/PMJ', 'NEKHRINTO DACHI', '82110428', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'NIAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(859, 0, 0, 0, '377/P/PMJ', 'KENEDI MARKOS SIJABAT', '83050162', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(860, 0, 0, 0, '378/P/PMJ', 'SISWANTO, S.H.', '79031301', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(861, 0, 0, 0, '379/P/PMJ', 'FIRMANSYAH', '73080409', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(862, 0, 0, 0, '380/P/PMJ', 'SUSANTO', '83010151', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'TULUNG AGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(863, 0, 0, 0, '381/P/PMJ', 'PILIPI GINTING', '82040541', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'LINGGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(864, 0, 0, 0, '382/P/PMJ', 'SUWANTORO', '77100198', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(865, 0, 0, 0, '383/P/PMJ', 'HERY DWI SUDARYANTO', '82070046', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(866, 0, 0, 0, '384/P/PMJ', 'ROMMEL SANTER, S.H.', '76110546', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(867, 0, 0, 0, '385/P/PMJ', 'MUHAMMAD BANDI', '78080703', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(868, 0, 0, 0, '386/P/PMJ', 'AGUS FITRIYANTO, S.H.', '80080929', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(869, 0, 0, 0, '387/P/PMJ', 'RUDI BASAROH', '174050289', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(870, 0, 0, 0, '388/W/PMJ', 'SRI RATU COMERIHI', '75081131', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'MAUJAWA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(871, 0, 0, 0, '389/P/PMJ', 'MUHAMMAD JOKO ARIANTO', '76110691', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(872, 0, 0, 0, '390/P/PMJ', 'YUDHI SUGIYANTO', '80050300', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(873, 0, 0, 0, '391/P/PMJ', 'BUDIYONO', '75050565', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(874, 0, 0, 0, '392/P/PMJ', 'BAMBANG KASIYADI', '80100578', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(875, 0, 0, 0, '393/P/PMJ', 'CHEPY MARYANTO', '81120163', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(876, 0, 0, 0, '394/P/PMJ', 'PONIRAN', '77020380', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(877, 0, 0, 0, '395/P/PMJ', 'GITO SUHONO', '81050590', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(878, 0, 0, 0, '396/P/PMJ', 'SUBAGYO', '75120311', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(879, 0, 0, 0, '397/P/PMJ', 'DEDI BUDI HARIYANTO', '80120402', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(880, 0, 0, 0, '398/P/PMJ', 'SUKARDI', '78080746', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'BENGKULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(881, 0, 0, 0, '399/P/PMJ', 'ISAK ERIXON, S.H.', '82010194', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(882, 0, 0, 0, '400/P/PMJ', 'SUWARDI', '81050497', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(883, 0, 0, 0, '401/P/PMJ', 'IMAM HARISMAWAN', '79110635', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(884, 0, 0, 0, '402/P/PMJ', 'MUHAMMAD SOFYAN', '78030643', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MAJENE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(885, 0, 0, 0, '403/P/PMJ', 'AGUS SETIYAWAN, S.H.', '78080164', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(886, 0, 0, 0, '404/P/PMJ', 'DADI SUTARDI', '79050715', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(887, 0, 0, 0, '405/P/PMJ', 'DADIK HANDRI WIRATNO, S.H.', '79061229', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(888, 0, 0, 0, '406/P/PMJ', 'NURJAKWAN', '77051075', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(889, 0, 0, 0, '407/W/PMJ', 'MELIDA', '82050452', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(890, 0, 0, 0, '408/P/PMJ', 'SLAMET SISWADI, S.H.', '74060596', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'BREBES', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(891, 0, 0, 0, '409/P/PMJ', 'MAKMURI, S.H.', '78121141', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(892, 0, 0, 0, '410/P/PMJ', 'MIQUEL P MANULANG', '79041134', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SEI RAMPAH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(893, 0, 0, 0, '411/P/PMJ', 'AGUNG KURNIAWAN', '78080942', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(894, 0, 0, 0, '412/P/PMJ', 'VICTOR HISAR PANDAPOTAN', '78030195', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'SOSOR PASIR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(895, 0, 0, 0, '413/P/PMJ', 'MAT SANI, S.H.', '79091302', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(896, 0, 0, 0, '414/P/PMJ', 'DENY NURHOLIS, S.H.', '78060893', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(897, 0, 0, 0, '415/P/PMJ', 'WITOYO, S.H.', '79021087', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(898, 0, 0, 0, '416/P/PMJ', 'ACHMAD SUPANJI', '75080421', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(899, 0, 0, 0, '417/P/PMJ', 'DADANG.SETIAWAN', '84060057', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KLATEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(900, 0, 0, 0, '418/P/PMJ', 'BENNI SANTOSO PANDIANGAN', '78081560', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'LAUMIL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(901, 0, 0, 0, '419/P/PMJ', 'MARYANTO', '78071193', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(902, 0, 0, 0, '420/P/PMJ', 'LAMSIHAR SIAHAAN', '79020166', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SIMISAK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(903, 0, 0, 0, '421/P/PMJ', 'LUKAS PARDAMEAN E MARBUN', '83030372', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(904, 0, 0, 0, '422/P/PMJ', 'RUDY SETYO WARDOYO, S.H.', '79070424', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(905, 0, 0, 0, '423/P/PMJ', 'MARSILAN, S.H.', '80050632', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SIUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(906, 0, 0, 0, '424/P/PMJ', 'AMIRUDIN BAHARUDIN, S.H.', '79051581', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'TOLI TOLI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(907, 0, 0, 0, '425/P/PMJ', 'RINTIS SIGIT PRABOWO', '82030567', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(908, 0, 0, 0, '426/P/PMJ', 'M ARIF SYATRIADIN, S.Sos', '76100070', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(909, 0, 0, 0, '427/P/PMJ', 'DWI HANDOYO, S.H.', '83090176', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(910, 0, 0, 0, '428/P/PMJ', 'BUDI GUNAWAN SULISTYO', '79080461', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SOLO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(911, 0, 0, 0, '429/P/PMJ', 'RUSTAMI', '79090797', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(912, 0, 0, 0, '430/P/PMJ', 'BARU TRISNO, S.H.', '78010004', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(913, 0, 0, 0, '431/P/PMJ', 'DULRAHMAD', '77080568', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(914, 0, 0, 0, '432/W/PMJ', 'HENI SULISTYOWATI, S.H.', '76110530', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(915, 0, 0, 0, '433/P/PMJ', 'ARIYANTO, S.H.', '80100548', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(916, 0, 0, 0, '434/P/PMJ', 'PANANGIANG LIMBONG', '77071186', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'LOMBONG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(917, 0, 0, 0, '435/P/PMJ', 'PIRMANSYAH, S.H.', '77040050', 'P', 'AIPTU', 'POLRES METRO JAKARTA PUSAT', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(918, 0, 0, 0, '436/P/PMJ', 'ANDRIANTO, S.H.', '78120516', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(919, 0, 0, 0, '437/P/PMJ', 'SUPARMIN, S.H.', '78050459', 'P', 'AIPDA', 'POLRES METRO JAKARTA PUSAT', 'SUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(920, 0, 0, 0, '438/P/PMJ', 'JAPARUDIN', '75110251', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(921, 0, 0, 0, '439/P/PMJ', 'DHANI RAMDANI', '83060272', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(922, 0, 0, 0, '440/P/PMJ', 'EDISON MANABUNG', '77040361', 'P', 'AIPDA', 'POLRES METRO JAKARTA UTARA', 'BABAT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(923, 0, 0, 0, '441/P/PMJ', 'ROMULUS SIRAIT', '83120126', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'SIRAIT URUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(924, 0, 0, 0, '442/P/PMJ', 'GUNTUR MARCOS', '79120427', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(925, 0, 0, 0, '443/P/PMJ', 'I NYOMAN SARJANA', '79060467', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'KLUNGKUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(926, 0, 0, 0, '444/P/PMJ', 'MUHAMAD IRWAN', '79060382', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(927, 0, 0, 0, '445/P/PMJ', 'ARIDINI GRANDIS', '83020203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'PACITAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(928, 0, 0, 0, '446/P/PMJ', 'BEBEN LIUS SEPTA DARMA', '80090109', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(929, 0, 0, 0, '447/P/PMJ', 'FERDINAND PARULIAN MANURUNG', '83030168', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'TANJUNG BALAI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(930, 0, 0, 0, '448/P/PMJ', 'ANDI SUHANDI', '76020075', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(931, 0, 0, 0, '449/P/PMJ', 'DIMAS DWICAHYO', '85110025', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(932, 0, 0, 0, '450/P/PMJ', 'ANTON PRAMONO', '80040138', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(933, 0, 0, 0, '451/P/PMJ', 'SULISTIONO', '79070537', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'TUBAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(934, 0, 0, 0, '452/P/PMJ', 'JOKO WIYONO', '75080723', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(935, 0, 0, 0, '453/P/PMJ', 'HARSONO BAMBANG PERMADI', '80031109', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(936, 0, 0, 0, '454/P/PMJ', 'MUCHAMMAD ERFAN', '74020117', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'KALTEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(937, 0, 0, 0, '455/P/PMJ', 'SAHARUDDIN', '74090130', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'UJUNG PANDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(938, 0, 0, 0, '456/P/PMJ', 'EKO PURWANTO', '79120417', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(939, 0, 0, 0, '457/P/PMJ', 'ARIEF WIDYANTORO, S.E.', '82020535', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(940, 0, 0, 0, '458/P/PMJ', 'KUMBINO', '78070715', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(941, 0, 0, 0, '459/P/PMJ', 'AGUS WARTONO, S.H.', '71080060', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(942, 0, 0, 0, '460/P/PMJ', 'CHAIRUL HUDA', '82060071', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(943, 0, 0, 0, '461/P/PMJ', 'SYAFRUL', '72120509', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'BATU HAMPAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(944, 0, 0, 0, '462/W/PMJ', 'FRISKA YERNITA POHAN', '76020151', 'W', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'TANJUNG BALAI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(945, 0, 0, 0, '463/P/PMJ', 'RESTU SETYAWAN, S.H.', '79121353', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(946, 0, 0, 0, '464/P/PMJ', 'ISWANDI', '73120238', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'MARTAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(947, 0, 0, 0, '465/P/PMJ', 'MAHMUD ARYANTO, S.H.', '79041033', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(948, 0, 0, 0, '466/P/PMJ', 'JHON PIETR SARTO TORTET', '77030644', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'MUARA TEWEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(949, 0, 0, 0, '467/P/PMJ', 'JANNES EDWARD MANURUNG', '82030591', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(950, 0, 0, 0, '468/P/PMJ', 'AGUS SUDRAJAT', '73080635', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(951, 0, 0, 0, '469/P/PMJ', 'SARMIN TARIGAN, S.H.', '73050325', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(952, 0, 0, 0, '470/P/PMJ', 'WANDI SUGIANTO', '79081093', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(953, 0, 0, 0, '471/P/PMJ', 'LILIK PRASOJO', '79060344', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(954, 0, 0, 0, '472/P/PMJ', 'ENDANG DAHYUDI', '73040210', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(955, 0, 0, 0, '473/P/PMJ', 'AMIR CHOIRUDIN', '79090062', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(956, 0, 0, 0, '474/P/PMJ', 'MOCH ADIL SUBEKTI, S.E.', '76100004', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(957, 0, 0, 0, '475/P/PMJ', 'BENY ROKY RISKIAWAN', '79020946', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(958, 0, 0, 0, '476/P/PMJ', 'AGUS IRSAN, S.H.', '82080491', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(959, 0, 0, 0, '477/P/PMJ', 'DIDIEK APRI LISTIONO', '73040447', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'SALATIGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(960, 0, 0, 0, '478/P/PMJ', 'DEVI ALEXANDER BETTE, S.H.', '77060423', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'KUPANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(961, 0, 0, 0, '479/P/PMJ', 'JOKO RAHARJO', '75050116', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(962, 0, 0, 0, '480/P/PMJ', 'MAHPUDIN', '71030262', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(963, 0, 0, 0, '481/P/PMJ', 'DENY TRI GUNAWAN, S.H.', '77080711', 'P', 'AIPDA', 'POLRES METRO JAKARTA UTARA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(964, 0, 0, 0, '483/P/PMJ', 'GUNAWAN SETIYARSO', '80060724', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(965, 0, 0, 0, '001/P/PMJ', 'ENDY ROHANDI', '75100172', 'P', 'AIPTU', 'RO SARPRAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(966, 0, 0, 0, '002/P/PMJ', 'DICKY NURHUDHAN, S.H.', '80040098', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(967, 0, 0, 0, '003/P/PMJ', 'MOHAMAD FARHAN', '79071092', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(968, 0, 0, 0, '004/P/PMJ', 'MUSTOFA', '81100230', 'P', 'BRIPKA', 'DIT TAHTI POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(969, 0, 0, 0, '005/P/PMJ', 'PULUNG WAHYU UMBORO', '78080415', 'P', 'AIPDA', 'DIT SABHARA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(970, 0, 0, 0, '006/W/PMJ', 'SRI ROSMALA', '72080544', 'W', 'AIPTU', 'DIT BINMAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(971, 0, 0, 0, '007/P/PMJ', 'HERI SUTANTO', '79051125', 'P', 'BRIPKA', 'SPN POLDA METRO JAYA', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(972, 0, 0, 0, '008/P/PMJ', 'M.R. SUHARTONO', '72060133', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(973, 0, 0, 0, '009/P/PMJ', 'HELMI PURWADI, S.Pd', '75110364', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'KARANGANYAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(974, 0, 0, 0, '010/P/PMJ', 'SYAMSUL BAHRI, S.H.', '78081283', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(975, 0, 0, 0, '011/P/PMJ', 'IRFAN WAHYU DIONO', '83010200', 'P', 'BRIPKA', 'DIT TAHTI POLDA METRO JAYA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(976, 0, 0, 0, '012/P/PMJ', 'JACK HARISON, S.H.', '75040277', 'P', 'AIPTU', 'SPN POLDA METRO JAYA', 'AGAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(977, 0, 0, 0, '013/P/PMJ', 'MUSLIM', '78110471', 'P', 'BRIPKA', 'BID HUMAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(978, 0, 0, 0, '014/W/PMJ', 'DWI ERNAWATI', '74110331', 'W', 'AIPTU', 'DIT INTELKAM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(979, 0, 0, 0, '015/P/PMJ', 'EKO SUGENG RIANTO, S.H.', '77100418', 'P', 'AIPDA', 'DIT INTELKAM POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(980, 0, 0, 0, '016/P/PMJ', 'AGUNG PRANOTO, S.H.', '81100229', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(981, 0, 0, 0, '017/P/PMJ', 'BAMBANG WIRAWAN, S.T.', '79111186', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(982, 0, 0, 0, '018/W/PMJ', 'HERLIN YULIARTI DIANTAMA, S.E.', '83071371', 'W', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(983, 0, 0, 0, '019/P/PMJ', 'SUTARNO, S.H., M.H.', '82040621', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(984, 0, 0, 0, '020/P/PMJ', 'AGUNG PRASETYO, S.Kom', '81101205', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(985, 0, 0, 0, '021/P/PMJ', 'YONAS LEDEWEDJO', '75060880', 'P', 'AIPTU', 'DIT INTELKAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(986, 0, 0, 0, '022/P/PMJ', 'DIDIK TRI MARYANTO', '81030239', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(987, 0, 0, 0, '023/P/PMJ', 'HERIYANTO, S.H.', '81020175', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(988, 0, 0, 0, '024/P/PMJ', 'HERMAN SAPUTRA', '80110576', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'DEPOK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(989, 0, 0, 0, '025/P/PMJ', 'ASEP SUDRAJAT MULYANA, S.H.', '80110273', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(990, 0, 0, 0, '026/P/PMJ', 'SYAEFUL HAMDI, S.H.', '79040112', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(991, 0, 0, 0, '027/P/PMJ', 'SUJUD SUGIHARTO, S.H.', '75090104', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(992, 0, 0, 0, '028/P/PMJ', 'SYAEFUDIN JAELANI, S.H.', '82070643', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(993, 0, 0, 0, '029/P/PMJ', 'AGUNG CAHYADI, S.H.', '83030330', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'CIREBON', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(994, 0, 0, 0, '030/P/PMJ', 'IZA SAMSU KIFLI, S.H.', '81020033', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(995, 0, 0, 0, '031/P/PMJ', 'HARSONO', '79020518', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(996, 0, 0, 0, '032/P/PMJ', 'DAVIT RONALDO, S.H.', '83030154', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'LUBUK LINGGAU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(997, 0, 0, 0, '033/P/PMJ', 'SARYONO', '74010365', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(998, 0, 0, 0, '034/P/PMJ', 'SURYONO, S.H.', '82070473', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(999, 0, 0, 0, '035/P/PMJ', 'SUMARNO', '77060702', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1000, 0, 0, 0, '036/P/PMJ', 'BUDIYANTO', '75050841', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1001, 0, 0, 0, '037/P/PMJ', 'EDY SUYANTO, S.H.', '76060596', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1002, 0, 0, 0, '038/P/PMJ', 'MUHAMMAD TOYIB', '74060658', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'KP. ASAHAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1003, 0, 0, 0, '039/W/PMJ', 'PANCA SIRSANTI', '80080180', 'W', 'BRIPKA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1004, 0, 0, 0, '040/P/PMJ', 'WAHYUDI, S.H.', '78100175', 'P', 'AIPDA', 'DIT POLAIR POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1005, 0, 0, 0, '041/P/PMJ', 'TRIYANTO, S.H.', '83070074', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'TEMANGGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1006, 0, 0, 0, '042/P/PMJ', 'IWAN NUGRAHA, S.H.', '76050111', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `master_peserta` (`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `jenkel`, `pkt`, `kesatuan`, `tempat_lahir`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES
(1007, 0, 0, 0, '043/P/PMJ', 'HARI SANTOSO', '83030088', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1008, 0, 0, 0, '044/P/PMJ', 'JUSTAN, S.H.', '80121077', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'PATUKU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1009, 0, 0, 0, '045/W/PMJ', 'MUTIARA HARAHAP, S.H.', '79090942', 'W', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'PADANG SIDEMPUAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1010, 0, 0, 0, '046/P/PMJ', 'MUHAMAD SOBRI, S.H.', '80100715', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1011, 0, 0, 0, '047/P/PMJ', 'RUMAIN', '75030562', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1012, 0, 0, 0, '048/P/PMJ', 'AHMAD JAYADI', '79081036', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1013, 0, 0, 0, '049/P/PMJ', 'DWI YULIANTO, S.H.', '81120619', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1014, 0, 0, 0, '050/W/PMJ', 'ISTIKHOMAH, S.H.', '79110966', 'W', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1015, 0, 0, 0, '051/P/PMJ', 'RONALD REAGEN ISHAK', '79110216', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1016, 0, 0, 0, '052/P/PMJ', 'SOLYCHAN', '74050661', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'JEPARA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1017, 0, 0, 0, '053/P/PMJ', 'YOYO HIDAYAT, S.H.', '80041039', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1018, 0, 0, 0, '054/P/PMJ', 'JOKO ADI WIBOWO, S.H.', '80090380', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1019, 0, 0, 0, '055/P/PMJ', 'SUROYO', '77120233', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1020, 0, 0, 0, '056/P/PMJ', 'IMAM ROHADI, S.H.', '80050713', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'DEMAK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1021, 0, 0, 0, '057/P/PMJ', 'YUSBANI YUSUF, S.H.', '77020234', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1022, 0, 0, 0, '058/P/PMJ', 'PURWANTO', '76050039', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1023, 0, 0, 0, '059/P/PMJ', 'JIMMY SAUT SUMIHAR SILALAHI', '78090126', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1024, 0, 0, 0, '060/P/PMJ', 'AGUS AMINUDIN', '85110276', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1025, 0, 0, 0, '061/P/PMJ', 'WAWAN SETIAWAN, S.E.', '81060171', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'PURWAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1026, 0, 0, 0, '062/P/PMJ', 'DARFIN NAINGGOLAN, S.H.', '77090857', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'SINAMBELA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1027, 0, 0, 0, '063/P/PMJ', 'HENDRO PURWANTO', '76020555', 'P', 'AIPDA', 'YANMA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1028, 0, 0, 0, '064/P/PMJ', 'ELIA UMBOH, S.H., M.H.', '85020123', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1029, 0, 0, 0, '065/P/PMJ', 'BAMBANG IRAWAN', '72040145', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1030, 0, 0, 0, '066/P/PMJ', 'EDY WIDOYONO, S.Sos', '73010073', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'PROBOLINGGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1031, 0, 0, 0, '067/P/PMJ', 'ARIES RUDIYANTO', '81050359', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1032, 0, 0, 0, '068/P/PMJ', 'KOKO KUSWOYO', '79060345', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1033, 0, 0, 0, '069/P/PMJ', 'AGUNG PRASOJO', '78100425', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1034, 0, 0, 0, '070/P/PMJ', 'SUTRISNO, S.H.', '77061058', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'TULUNGAGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1035, 0, 0, 0, '071/P/PMJ', 'BERNI WILLIAM PAKASI', '78120221', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'MANADO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1036, 0, 0, 0, '072/P/PMJ', 'A. RAHMATULLA', '83050013', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BONE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1037, 0, 0, 0, '073/P/PMJ', 'MALINDRA PRADITIYA GUNAWAN, S.H., M.M.', '82020124', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1038, 0, 0, 0, '074/P/PMJ', 'KEMBAR WAHYU SUSILO', '80030833', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1039, 0, 0, 0, '075/P/PMJ', 'SLAMET PRAWORO, S.H.', '81020501', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1040, 0, 0, 0, '076/P/PMJ', 'PRIYO CAHYONO', '79051130', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1041, 0, 0, 0, '077/P/PMJ', 'ARYAWAN DIATMANTO, S.H.', '83030358', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1042, 0, 0, 0, '078/P/PMJ', 'DONO AVIANTO', '76040469', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1043, 0, 0, 0, '079/P/PMJ', 'AJI MULYANTO', '75010528', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1044, 0, 0, 0, '080/P/PMJ', 'ARIF YUDIANTO', '79041248', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1045, 0, 0, 0, '081/P/PMJ', 'DENNY FIRMANSYAH', '75060400', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1046, 0, 0, 0, '082/P/PMJ', 'SRIYANTO', '75090596', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1047, 0, 0, 0, '083/P/PMJ', 'WIDODO KURNIAWAN', '80060722', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1048, 0, 0, 0, '084/P/PMJ', 'OZI SUSANTRO, S.H., M.H.', '78101100', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1049, 0, 0, 0, '085/P/PMJ', 'MICHAEL', '80060157', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1050, 0, 0, 0, '086/P/PMJ', 'ADHI LAKSONO, S.H.', '79060193', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1051, 0, 0, 0, '087/P/PMJ', 'BAHROEL MUNIR', '78040405', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1052, 0, 0, 0, '088/P/PMJ', 'MASNGUDIN, S.H.', '81120264', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'MOJOKERTO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1053, 0, 0, 0, '089/P/PMJ', 'ANANG PRALISTYO', '73060429', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1054, 0, 0, 0, '090/W/PMJ', 'SISCA YOGAWATI', '82030052', 'W', 'BRIPKA', 'SPRIPIM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1055, 0, 0, 0, '091/P/PMJ', 'INDRI SUHADI, S.Kom', '81061349', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1056, 0, 0, 0, '092/P/PMJ', 'ASEP HERMAWAN', '79120784', 'P', 'BRIPKA', 'RO SDM POLDA METRO JAYA', 'SUBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1057, 0, 0, 0, '093/P/PMJ', 'WISNU KUSUMA', '77090374', 'P', 'AIPDA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1058, 0, 0, 0, '094/P/PMJ', 'HERMANSYAH', '76060523', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1059, 0, 0, 0, '095/P/PMJ', 'SUBIYANTORO, S.H.', '79071463', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1060, 0, 0, 0, '096/P/PMJ', 'WISNU PRABOWO', '81120188', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1061, 0, 0, 0, '097/P/PMJ', 'AWANG, S.H.', '81060807', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1062, 0, 0, 0, '098/P/PMJ', 'AMANG PRIBADI, S.H.', '79120830', 'P', 'BRIPKA', 'DIT INTELKAM POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1063, 0, 0, 0, '099/P/PMJ', 'AGUS MULYANA', '81070153', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1064, 0, 0, 0, '100/P/PMJ', 'RIRIN DWI UTOMO, S.H.', '83050182', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1065, 0, 0, 0, '101/P/PMJ', 'SUMITRO, S.H.', '79031049', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1066, 0, 0, 0, '102/P/PMJ', 'ANDIK SUWANTO, S.H.', '81020283', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1067, 0, 0, 0, '103/P/PMJ', 'SYAHRUL MUNIR, S.H.', '80110440', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1068, 0, 0, 0, '104/P/PMJ', 'EDY LESTARI', '80030640', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1069, 0, 0, 0, '105/P/PMJ', 'ASEP IWAN SUPRIATNA', '73110305', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1070, 0, 0, 0, '106/P/PMJ', 'BEKTI NUGROHO', '75090539', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'GUNUNG KIDUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1071, 0, 0, 0, '107/P/PMJ', 'NOVEL SAPTA SATNAWA', '76110062', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1072, 0, 0, 0, '108/P/PMJ', 'UDIN JAMALLUDIN. S.Sos', '75080085', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1073, 0, 0, 0, '109/P/PMJ', 'EKO KRISBIYANTO', '75040818', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1074, 0, 0, 0, '110/P/PMJ', 'TRIONO AGUNG SAPUTRO, S.H.', '82010535', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1075, 0, 0, 0, '111/P/PMJ', 'SANDI WIBISONO', '76080022', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1076, 0, 0, 0, '112/P/PMJ', 'ALFRED SAM ESRON, S.H.', '78060448', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1077, 0, 0, 0, '113/P/PMJ', 'BASORI', '74100446', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1078, 0, 0, 0, '114/P/PMJ', 'SURYADI', '76100354', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'SUMBER REJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1079, 0, 0, 0, '115/P/PMJ', 'MARTONO MAULANA, S.H.', '81020793', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'INDRAMAYU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1080, 0, 0, 0, '116/P/PMJ', 'INDRA KUSUMAWIJAYA', '75010765', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1081, 0, 0, 0, '117/P/PMJ', 'WALOEYO DJATI', '81040633', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1082, 0, 0, 0, '118/P/PMJ', 'S. SOEPRAPTO KADIRAN', '76110070', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1083, 0, 0, 0, '119/P/PMJ', 'MUCH. ANWARUDDIN', '79041226', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1084, 0, 0, 0, '120/P/PMJ', 'DADANG SETIAWAN', '76020479', 'P', 'AIPDA', 'POLRES KOTA BEKASI KOTA', 'CIANJUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1085, 0, 0, 0, '121/P/PMJ', 'MADROI HARYANTO', '78120521', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1086, 0, 0, 0, '122/P/PMJ', 'DIDI DARMADI', '81040219', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1087, 0, 0, 0, '123/P/PMJ', 'FRANSISCUS, S.H.', '82020247', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1088, 0, 0, 0, '124/P/PMJ', 'DAHMIRUL, S.H.', '82110140', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'KOTO BARU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1089, 0, 0, 0, '125/P/PMJ', 'JOHNY ARIFIYANTO', '74100592', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1090, 0, 0, 0, '126/P/PMJ', 'MAHMUDI', '73050279', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'REMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1091, 0, 0, 0, '127/P/PMJ', 'AJI DEWANTORO', '81050225', 'P', 'BRIPKA', 'SAT BRIMOB POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1092, 0, 0, 0, '128/P/PMJ', 'YUSUF BUDI HARDJO, S.H., S.Pd', '79011043', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1093, 0, 0, 0, '129/P/PMJ', 'ROJALI', '77061019', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PABUARAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1094, 0, 0, 0, '130/P/PMJ', 'MOCHAMMAD ACU SUHENDAR', '77100135', 'P', 'AIPTU', 'POLRES KOTA BEKASI', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1095, 0, 0, 0, '131/P/PMJ', 'KUKUH SETIO UTOMO, S.H.', '79041264', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1096, 0, 0, 0, '132/P/PMJ', 'CUCU HIDAYAT', '80060537', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1097, 0, 0, 0, '133/P/PMJ', 'EKO ARIANTO F.', '79020151', 'P', 'AIPDA', 'POLRES PULAU SERIBU', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1098, 0, 0, 0, '134/P/PMJ', 'YUHARDI HENDRI', '79050993', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1099, 0, 0, 0, '135/P/PMJ', 'ASEP HERMAWAN', '79031028', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1100, 0, 0, 0, '136/P/PMJ', 'MARWATA', '74020239', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1101, 0, 0, 0, '137/P/PMJ', 'DARWIN, S.H.', '79120398', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1102, 0, 0, 0, '138/P/PMJ', 'AGUNG PUJIANTO, S.H.', '83070040', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1103, 0, 0, 0, '139/P/PMJ', 'DJOKO APRIANTO SAPUTRO, S.H.', '81040922', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1104, 0, 0, 0, '140/P/PMJ', 'JOKO IMAM PRAYITNO', '74050101', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1105, 0, 0, 0, '141/P/PMJ', 'ENGKUS KUSNADI', '78050890', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'MAJALENGKA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1106, 0, 0, 0, '142/P/PMJ', 'SYAIFUL HADI WIDODO', '79100737', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1107, 0, 0, 0, '143/P/PMJ', 'SUDIRO', '76080070', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1108, 0, 0, 0, '144/P/PMJ', 'YANG RUSKIYANTO', '79050883', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1109, 0, 0, 0, '145/P/PMJ', 'SUMARNO, S.H.', '74070606', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'SEI GUNTUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1110, 0, 0, 0, '146/W/PMJ', 'NOVIANTY ARTAMARA, S.T.', '79111185', 'W', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1111, 0, 0, 0, '147/P/PMJ', 'YANU TRIYANTO', '73010442', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1112, 0, 0, 0, '148/P/PMJ', 'WAHYUDI', '78080371', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1113, 0, 0, 0, '149/P/PMJ', 'MUHAMMAD AGUS WINARNO', '77050084', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1114, 0, 0, 0, '150/P/PMJ', 'RESI MULYONO', '77040384', 'P', 'AIPDA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1115, 0, 0, 0, '151/P/PMJ', 'M. SUBCHAN, S.H.', '78060225', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1116, 0, 0, 0, '152/P/PMJ', 'LEDUS SITUMORANG, S.H.', '81041104', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'LUMBAN TURNIP', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1117, 0, 0, 0, '153/P/PMJ', 'RAHMAT SUPRIADI, S.H.', '73030155', 'P', 'AIPTU', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1118, 0, 0, 0, '154/P/PMJ', 'TATA AMINUDIN, S.H.', '82040527', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1119, 0, 0, 0, '155/P/PMJ', 'YASMIR', '80060794', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'RIAU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1120, 0, 0, 0, '156/P/PMJ', 'SUPRIYANTO, S.H.', '80110923', 'P', 'BRIPKA', 'DIT SABHARA POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1121, 0, 0, 0, '157/P/PMJ', 'HERMAWAN', '72120506', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1122, 0, 0, 0, '158/P/PMJ', 'DONI AGUSMAN', '83080118', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'BENGKULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1123, 0, 0, 0, '159/P/PMJ', 'ABDUL KHOLID', '76120419', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1124, 0, 0, 0, '160/P/PMJ', 'M. KADAFI', '74010407', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1125, 0, 0, 0, '161/P/PMJ', 'ERIC HIMAWAN, S.H.', '79121186', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1126, 0, 0, 0, '162/P/PMJ', 'R. DERRY DAYANA KELANA PUTRA, M.Si', '84120162', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1127, 0, 0, 0, '163/W/PMJ', 'NENDEN JUHRIYAH, AM.Keb', '76120158', 'W', 'AIPTU', 'POLRES TANGERANG SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1128, 0, 0, 0, '164/P/PMJ', 'SOFYANTO, S.H.', '78020678', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'TRENGGALEK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1129, 0, 0, 0, '165/P/PMJ', 'AMRIL', '73090461', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'AEK KORSIK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1130, 0, 0, 0, '166/P/PMJ', 'SAMSUDIN, S.H.', '77030099', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1131, 0, 0, 0, '167/P/PMJ', 'NURHAKIM, S.H.', '81010863', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1132, 0, 0, 0, '168/P/PMJ', 'SUMARTO', '76020620', 'P', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'PASURUAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1133, 0, 0, 0, '169/P/PMJ', 'YUSTIAR, S.H.', '82030679', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'REMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1134, 0, 0, 0, '170/P/PMJ', 'JEPRY ROBIN', '77090233', 'P', 'AIPDA', 'POLRES KOTA BANDARA SOETTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1135, 0, 0, 0, '171/P/PMJ', 'EDI WIJAYANTO', '79100467', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1136, 0, 0, 0, '172/P/PMJ', 'DENI SUPERI, S.H.', '81100211', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1137, 0, 0, 0, '173/P/PMJ', 'IWAN WAHYUDI, S.H.', '75050115', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1138, 0, 0, 0, '174/P/PMJ', 'FADLI SUSANTO, S.Kom', '80051309', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1139, 0, 0, 0, '175/P/PMJ', 'HERI WIYAJI', '73010465', 'P', 'AIPTU', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1140, 0, 0, 0, '176/P/PMJ', 'BAMBANG MURDIANTO', '76040470', 'P', 'AIPDA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1141, 0, 0, 0, '177/P/PMJ', 'SAGIYANA, S.H.', '81020371', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1142, 0, 0, 0, '178/P/PMJ', 'MELI SUPRIATNA', '75010147', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'SERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1143, 0, 0, 0, '179/P/PMJ', 'DEDE MAHDI PERMANA, S.H.', '84020097', 'P', 'BRIPKA', 'POLRES KOTA BEKASI', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1144, 0, 0, 0, '180/P/PMJ', 'FIRMAN SUPRIYADI, S.Pd', '74090058', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1145, 0, 0, 0, '181/P/PMJ', 'EKO SLAMET BASUKI', '77120228', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1146, 0, 0, 0, '182/W/PMJ', 'EKA ERINA FAHMI', '81050397', 'W', 'BRIPKA', 'YANMA POLDA METRO JAYA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1147, 0, 0, 0, '183/P/PMJ', 'BUDY PURNOMO', '73020394', 'P', 'AIPTU', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAYAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1148, 0, 0, 0, '184/P/PMJ', 'EKO PUJI PURWANTO', '81090215', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1149, 0, 0, 0, '185/P/PMJ', 'WINARTO', '75080985', 'P', 'AIPTU', 'SAT BRIMOB POLDA METRO JAYA', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1150, 0, 0, 0, '186/P/PMJ', 'SUHENRI', '72060194', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1151, 0, 0, 0, '187/P/PMJ', 'ASEP GUNAWAN', '78090116', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1152, 0, 0, 0, '188/P/PMJ', 'HENDRA KURNIAWAN, S.H.', '83060215', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1153, 0, 0, 0, '189/P/PMJ', 'FERRY MUFTI MAULANA, S.H.', '84020034', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1154, 0, 0, 0, '190/P/PMJ', 'WAWAN BAEHAQI, S.H., M.H.', '74030275', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1155, 0, 0, 0, '191/P/PMJ', 'EKO PURNOMO, S.H.', '75070006', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1156, 0, 0, 0, '192/P/PMJ', 'OGAN LOFIANA', '72100271', 'P', 'AIPTU', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1157, 0, 0, 0, '193/P/PMJ', 'PURWANTO', '76030600', 'P', 'AIPDA', 'POLRES PEL. TANJUNG PRIOK', 'TRENGGALEK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1158, 0, 0, 0, '194/P/PMJ', 'ROHMANI', '71060281', 'P', 'AIPTU', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1159, 0, 0, 0, '195/P/PMJ', 'YUHANES YULI SUKRONISTIYAWAN', '80070529', 'P', 'BRIPKA', 'DIT RESNARKOBA POLDA METRO JAYA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1160, 0, 0, 0, '196/P/PMJ', 'SETIYONO, S.H.', '77030319', 'P', 'AIPDA', 'POLRES KOTA TANGERANG', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1161, 0, 0, 0, '197/P/PMJ', 'IPAN SARWOKO', '79030471', 'P', 'BRIPKA', 'POLRES KOTA BANDARA SOETTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1162, 0, 0, 0, '198/P/PMJ', 'SETYO UTOMO', '77120771', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1163, 0, 0, 0, '199/P/PMJ', 'PANDU JIWA RASA, S.H.', '74120180', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1164, 0, 0, 0, '200/P/PMJ', 'ROBI CAHYADI, S.H.', '74080255', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1165, 0, 0, 0, '201/W/PMJ', 'SELVI MUSLINAWATI', '75090722', 'W', 'AIPTU', 'DIT RESNARKOBA POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1166, 0, 0, 0, '202/P/PMJ', 'DOSO CATUR BUDI SANTOSO, S.E.', '79121367', 'P', 'BRIPKA', 'RO OPS POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1167, 0, 0, 0, '203/P/PMJ', 'RIONO', '77090768', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1168, 0, 0, 0, '204/P/PMJ', 'APIP, S.H.', '78071228', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1169, 0, 0, 0, '205/P/PMJ', 'ADING ASRONI, S.H.', '82060355', 'P', 'BRIPKA', 'POLRES KOTA TANGERANG', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1170, 0, 0, 0, '206/P/PMJ', 'NUR YASIN, S.H.', '81121238', 'P', 'BRIPKA', 'RO OPS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1171, 0, 0, 0, '207/P/PMJ', 'SUKRISNO', '75030536', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1172, 0, 0, 0, '208/P/PMJ', 'TUTUK SYAIFUL AKBAR', '76030025', 'P', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1173, 0, 0, 0, '209/P/PMJ', 'MAHDI, S.H.', '74040482', 'P', 'AIPTU', 'POLRES KOTA TANGERANG', 'ACEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1174, 0, 0, 0, '210/P/PMJ', 'FATHURROJI, S.H.', '77120819', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1175, 0, 0, 0, '211/P/PMJ', 'SUPARMAN, S.H.', '75070017', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1176, 0, 0, 0, '212/W/PMJ', 'ERMAWATI', '78090261', 'W', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1177, 0, 0, 0, '213/P/PMJ', 'JUNAEDI SHOLAT', '83060022', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'KARAWANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1178, 0, 0, 0, '214/P/PMJ', 'PAISAL WIDJAYA, S.H.', '81050062', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1179, 0, 0, 0, '215/W/PMJ', 'SUSI SULASTRI', '76070732', 'W', 'AIPDA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1180, 0, 0, 0, '216/P/PMJ', 'MOHAMAD SOLECHAN, S.H.', '79031122', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1181, 0, 0, 0, '217/P/PMJ', 'ERWIN MARCIANO SIAHAAN, S.H.', '81030354', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PEMANTANG SIANTAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1182, 0, 0, 0, '218/W/PMJ', 'ENDANG NURIASIH', '78010103', 'W', 'AIPDA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SINTANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1183, 0, 0, 0, '219/P/PMJ', 'AKHMAD KHOLIL EFFENDY', '77080684', 'P', 'AIPDA', 'POLRES TANGERANG SELATAN', 'JOMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1184, 0, 0, 0, '220/W/PMJ', 'RETNO KURNIASIH, S.H.', '84030092', 'W', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'CILACAP', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1185, 0, 0, 0, '221/P/PMJ', 'MAATURNA BANGUN', '80060821', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANJUNG LANGKAT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1186, 0, 0, 0, '222/P/PMJ', 'FRANKYE', '80030008', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1187, 0, 0, 0, '223/P/PMJ', 'HERWIN MANATAR SIRAIT, S.H.', '79030470', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'DAMIAK PULI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1188, 0, 0, 0, '224/P/PMJ', 'NURDIN ADIKARA, S.H.', '79070275', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1189, 0, 0, 0, '226/P/PMJ', 'SUKAREN, S.H.', '80070912', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'MOJOKERTO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1190, 0, 0, 0, '227/P/PMJ', 'BAMBANG WIJANARKO, S.E.', '74010089', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1191, 0, 0, 0, '228/P/PMJ', 'NUR FAJAR PRASETYO, S.H.', '83100212', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'BANTUL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1192, 0, 0, 0, '229/P/PMJ', 'M ZULKARNAEN LUBIS, S.H.', '72070601', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1193, 0, 0, 0, '230/P/PMJ', 'SARDI, S.H.', '75080934', 'P', 'AIPTU', 'DIT PAMOBVIT POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1194, 0, 0, 0, '231/P/PMJ', 'TONI SUHENDAR', '76060685', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1195, 0, 0, 0, '232/P/PMJ', 'IRWAN, S.H., M.H.', '82100273', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'TAPAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1196, 0, 0, 0, '233/P/PMJ', 'M.RIKI JATNIKA', '79061177', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1197, 0, 0, 0, '234/P/PMJ', 'MARNANGON SINAGA', '82120261', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'PASIR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1198, 0, 0, 0, '235/P/PMJ', 'SARTO MARIDUK PANJAITAN, S.H.', '78091095', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SARKO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1199, 0, 0, 0, '236/P/PMJ', 'MUHNI, S.H.', '75040795', 'P', 'AIPTU', 'DIT PAMOBVIT POLDA METRO JAYA', 'PRUBALINGGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1200, 0, 0, 0, '237/P/PMJ', 'SAEPUDIN', '78070263', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1201, 0, 0, 0, '238/P/PMJ', 'HUNTAL DAPOT MULA TUA SIBARANI, S.H.', '80020917', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1202, 0, 0, 0, '239/P/PMJ', 'YUDI BUDI YONO', '79051853', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1203, 0, 0, 0, '240/P/PMJ', 'ALFIAN AFNANY', '83090203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA TIMUR', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1204, 0, 0, 0, '241/P/PMJ', 'EKO WAHYONO', '74090693', 'P', 'AIPTU', 'DIT RESKRIMUM POLDA METRO JAYA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1205, 0, 0, 0, '242/P/PMJ', 'MUS''AD DASOPANG, S.H.', '78110548', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'KOTA PINANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1206, 0, 0, 0, '243/P/PMJ', 'IMAM SYAIFUDIN', '79051772', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1207, 0, 0, 0, '244/P/PMJ', 'IRWAN SUWANCOKO, S.H., M.Si', '79100772', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1208, 0, 0, 0, '245/P/PMJ', 'BAYU PURHADI', '76060107', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1209, 0, 0, 0, '246/P/PMJ', 'ASEP ACHMAD NURDIN, S.H.', '79030946', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1210, 0, 0, 0, '247/P/PMJ', 'M. FRESLY ARNALDO HASIBUAN', '76120078', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1211, 0, 0, 0, '248/P/PMJ', 'ERBINSON PURBA, S.H.', '81011079', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDAR SERIBU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1212, 0, 0, 0, '249/P/PMJ', 'AGUS WIDIONO', '74090674', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1213, 0, 0, 0, '250/P/PMJ', 'YOYOK SETYO UTOMO', '76080504', 'P', 'AIPDA', 'POLRES KOTA DEPOK', 'SIDOARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1214, 0, 0, 0, '251/P/PMJ', 'BRIAN PEBRIANTO', '80030510', 'P', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1215, 0, 0, 0, '252/P/PMJ', 'SAMSUL ROKHMAN', '78050642', 'P', 'BRIPKA', 'POLRES KOTA DEPOK', 'JEMBER', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1216, 0, 0, 0, '253/P/PMJ', 'KEMAS JUNAIDI', '78060931', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1217, 0, 0, 0, '254/P/PMJ', 'BENI MUCHTAR', '75030269', 'P', 'AIPTU', 'POLRES KOTA DEPOK', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1218, 0, 0, 0, '255/P/PMJ', 'YUDHA BARATA ARITONANG, S.H.', '79040234', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1219, 0, 0, 0, '256/P/PMJ', 'NANANG HERI PURWANTO', '75070458', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1220, 0, 0, 0, '257/P/PMJ', 'MAIYOGI', '79050910', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1221, 0, 0, 0, '258/P/PMJ', 'KUNTORO', '72090223', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'BELINYU BANGKA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1222, 0, 0, 0, '259/P/PMJ', 'EKO BUDI WARDIANTO', '73120312', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'TEGAL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1223, 0, 0, 0, '260/P/PMJ', 'ARIES ARIANTO', '72040188', 'P', 'AIPTU', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1224, 0, 0, 0, '261/P/PMJ', 'AAN SUPRIYADI, S.H.', '75080588', 'P', 'AIPTU', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1225, 0, 0, 0, '262/P/PMJ', 'TEGUH TRIYONO HS', '80010532', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SURAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1226, 0, 0, 0, '263/P/PMJ', 'IBNU SETIAWAN', '78020194', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1227, 0, 0, 0, '264/P/PMJ', 'DWI PUJIANTORO', '81030448', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1228, 0, 0, 0, '265/P/PMJ', 'BAMBANG RYADI', '81050084', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1229, 0, 0, 0, '266/P/PMJ', 'HERU KRISWANTO', '81030306', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'CIMANGGIS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1230, 0, 0, 0, '267/P/PMJ', 'HERY DJATMIKO', '77010595', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1231, 0, 0, 0, '268/P/PMJ', 'DINA PRIHANTO', '80120452', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1232, 0, 0, 0, '269/P/PMJ', 'DIAT GUNAWAN, S.E.', '83070301', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1233, 0, 0, 0, '270/P/PMJ', 'M RIZKY ARIFIANSYAH', '75060621', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1234, 0, 0, 0, '271/P/PMJ', 'YARI NUGROHO', '80030308', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1235, 0, 0, 0, '272/P/PMJ', 'SETIANTO WIBOWO, S.H.', '74120178', 'P', 'AIPTU', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1236, 0, 0, 0, '273/P/PMJ', 'FERDI HARTANTO', '77070204', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1237, 0, 0, 0, '274/P/PMJ', 'EKO CAHYONO, S.H.', '80050275', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1238, 0, 0, 0, '275/W/PMJ', 'ISWINARNI', '81040245', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1239, 0, 0, 0, '276/P/PMJ', 'SODIQ FURQON, S.H.', '81010456', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1240, 0, 0, 0, '277/P/PMJ', 'AGUS BAMBANG PURNAWAN', '80010653', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1241, 0, 0, 0, '278/P/PMJ', 'WIDIASTONO, S.H.', '72090007', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1242, 0, 0, 0, '279/P/PMJ', 'HENDRIK SULISNO', '78060753', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANYUWANGI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1243, 0, 0, 0, '280/P/PMJ', 'AVAN PRAKASA, S.E.', '78101250', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1244, 0, 0, 0, '281/P/PMJ', 'MANGIMPAL SILABAN, S.H.', '78010325', 'P', 'AIPDA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'HUTAJULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1245, 0, 0, 0, '282/P/PMJ', 'ACHMAD ZAWAWI', '78060707', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PANGKAL PINANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1246, 0, 0, 0, '283/P/PMJ', 'PURWADITYA P.', '84030176', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1247, 0, 0, 0, '284/P/PMJ', 'SAHRUL BOEDIMAN', '81030293', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1248, 0, 0, 0, '285/P/PMJ', 'GUNUNG ADI SANTOSO, S.H.', '77080710', 'P', 'AIPDA', 'POLRES METRO JAKARTA SELATAN', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1249, 0, 0, 0, '286/W/PMJ', 'FANI PRILILA YAPI', '81040203', 'W', 'BRIPKA', 'DIT PAMOBVIT POLDA METRO JAYA', 'SURABAYA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1250, 0, 0, 0, '287/P/PMJ', 'YOHANES INU HARDI PURNOMO, S.E.', '80111100', 'P', 'BRIPKA', 'BID KEU POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1251, 0, 0, 0, '288/P/PMJ', 'HARYO SUTRIYANTO', '76010287', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1252, 0, 0, 0, '289/P/PMJ', 'WASIS ABADI, S.H., M.H.', '81070740', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1253, 0, 0, 0, '290/P/PMJ', 'HARI SANTOSO', '78030630', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMNPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1254, 0, 0, 0, '291/P/PMJ', 'COMA SYAKUNTALA PRIHARSA', '78050678', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1255, 0, 0, 0, '292/P/PMJ', 'MOCH. ISWAHYOEDIN', '73050252', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1256, 0, 0, 0, '293/P/PMJ', 'NYOMAN SUDIARTANA, S.H.', '83010269', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'DHARMA AGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1257, 0, 0, 0, '294/P/PMJ', 'AHYAR', '78050875', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1258, 0, 0, 0, '295/P/PMJ', 'RAHMAN NURJAMAN, S.H.', '80100335', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SUKABUMI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1259, 0, 0, 0, '296/P/PMJ', 'AGUS TRI CAHYONO', '76080610', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BLITAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1260, 0, 0, 0, '297/P/PMJ', 'GUNAWAN DWI PRASETYO', '83060075', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1261, 0, 0, 0, '298/W/PMJ', 'HENI HERMAYANTI, S.E.', '80080818', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PAGAR ALAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1262, 0, 0, 0, '299/P/PMJ', 'ARIFUDDIN', '76110192', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BONE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1263, 0, 0, 0, '300/P/PMJ', 'YULIANTO EDY PRAMONO', '77070073', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BREBES', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1264, 0, 0, 0, '301/P/PMJ', 'ANURAFIK, S.E.', '78111161', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1265, 0, 0, 0, '302/P/PMJ', 'DEDEN HARY', '79052088', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1266, 0, 0, 0, '303/P/PMJ', 'BUDI ARIANTO, S.H.', '84010021', 'P', 'BRIPKA', 'BID PROPAM POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `master_peserta` (`id_peserta`, `id_ujian`, `id_lokasi`, `id_ruangan`, `no_peserta`, `nama`, `nrp`, `jenkel`, `pkt`, `kesatuan`, `tempat_lahir`, `tgl_lahir`, `status_ujian`, `waktu_mulai`, `durasi_pengerjaan`, `tambahan_waktu`, `waktu_selesai`, `skor_total`, `keterangan`) VALUES
(1267, 0, 0, 0, '304/P/PMJ', 'REKI ANTONI', '74110636', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PAGAR ALAM', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1268, 0, 0, 0, '305/P/PMJ', 'IRFAN BAHA, S.H.', '81120030', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'TERNATE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1269, 0, 0, 0, '306/P/PMJ', 'HERU HENDRAWAN', '75040322', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'ACEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1270, 0, 0, 0, '307/P/PMJ', 'SUHERMAN, S.H.', '77010296', 'P', 'AIPDA', 'DIT RESKRIMUM POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1271, 0, 0, 0, '308/P/PMJ', 'SRI MARYANTO', '76070104', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1272, 0, 0, 0, '309/P/PMJ', 'FERY PARASIAN S. HABEAHAN, S.H.', '82050256', 'P', 'BRIPKA', 'DIT RESKRIMUM POLDA METRO JAYA', 'PEMANTANG SIANTAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1273, 0, 0, 0, '310/P/PMJ', 'AGUS SETIAWAN', '74080622', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1274, 0, 0, 0, '311/P/PMJ', 'SURAHMAN', '74110333', 'P', 'AIPDA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1275, 0, 0, 0, '312/P/PMJ', 'RIHARD HM SIRAIT, S.H.', '73010567', 'P', 'AIPTU', 'POLRES METRO TANGERANG KOTA', 'RAJANOLIGAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1276, 0, 0, 0, '313/P/PMJ', 'HARRY NOVIAN, S.H.', '79110745', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1277, 0, 0, 0, '314/P/PMJ', 'SOPYANTO', '73030175', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1278, 0, 0, 0, '315/P/PMJ', 'GUMILAR PRASETIA, S.H.', '80100501', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'SUBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1279, 0, 0, 0, '316/P/PMJ', 'TEGUH SULISTYONO', '80010541', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWODADI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1280, 0, 0, 0, '317/P/PMJ', 'SYAFRUDDIN', '79020304', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BIMA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1281, 0, 0, 0, '318/P/PMJ', 'DEDE PRIYANA', '80120451', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'CIWARU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1282, 0, 0, 0, '319/P/PMJ', 'JONI PURWANTO', '77050069', 'P', 'AIPTU', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1283, 0, 0, 0, '320/P/PMJ', 'TOMY SUGIONO', '82010382', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1284, 0, 0, 0, '321/P/PMJ', 'FARMAL, S.H.', '72040432', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PADANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1285, 0, 0, 0, '322/W/PMJ', 'NOVITASARI', '77110515', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'NGANJUK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1286, 0, 0, 0, '323/P/PMJ', 'ERWAN KUSBIYANTORO', '81110208', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1287, 0, 0, 0, '324/P/PMJ', 'AGUS SETIYANTO UTOMO', '79061167', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1288, 0, 0, 0, '325/P/PMJ', 'ROVIKARNOV MANAEK TAMBUNAN, S.Psi', '83110211', 'P', 'BRIPKA', 'POLRES METRO TANGERANG KOTA', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1289, 0, 0, 0, '326/P/PMJ', 'MUHAMAD RAMDAN', '80070597', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BATUJAJAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1290, 0, 0, 0, '327/P/PMJ', 'I MADE BUDI SANTOSO, S.E.', '80031125', 'P', 'BRIPKA', 'SPKT POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1291, 0, 0, 0, '328/P/PMJ', 'YATINO', '79010851', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1292, 0, 0, 0, '329/W/PMJ', 'DHENIS DHIKRILLA MITA', '82040739', 'W', 'BRIPKA', 'BID DOKKES POLDA METRO JAYA', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1293, 0, 0, 0, '330/P/PMJ', 'LALU SATYA IRFANDI', '82010315', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SUMBAWA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1294, 0, 0, 0, '331/P/PMJ', 'RANCES I.MANURUNG', '77090735', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'GIRSANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1295, 0, 0, 0, '332/P/PMJ', 'READY KURNIAWAN, A.Md.Kep', '78010329', 'P', 'AIPDA', 'BID DOKKES POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1296, 0, 0, 0, '333/P/PMJ', 'TRI WALUYO', '80090692', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1297, 0, 0, 0, '334/P/PMJ', 'PRIHONO', '78030446', 'P', 'BRIPKA', 'BID DOKKES POLDA METRO JAYA', 'KLATEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1298, 0, 0, 0, '335/P/PMJ', 'WIWIT WAHONO, S.Kom', '82021185', 'P', 'BRIPKA', 'POLRES PEL. TANJUNG PRIOK', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1299, 0, 0, 0, '336/P/PMJ', 'KADEK ARYA SUDIANTARA', '80090427', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1300, 0, 0, 0, '337/P/PMJ', 'HERFIK RIYANTO, S.H.', '80040542', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1301, 0, 0, 0, '338/P/PMJ', 'SUHENDRA', '79031155', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAYAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1302, 0, 0, 0, '339/P/PMJ', 'SAHAT PARULIAN, S.H.', '80090922', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1303, 0, 0, 0, '340/P/PMJ', 'SAIRUL EFENDI', '75040124', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'DURIAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1304, 0, 0, 0, '341/P/PMJ', 'I GEDE PUTU WIRA ADNYANA', '82050163', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SUKAMAJU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1305, 0, 0, 0, '342/P/PMJ', 'JOMSON LIMBONG', '79051606', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'HARIAN BOHO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1306, 0, 0, 0, '343/P/PMJ', 'HADIRAT SYUKUR LOMBU', '80030496', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'NIAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1307, 0, 0, 0, '344/P/PMJ', 'HENDRI NOVIKA ARISANDRA', '80120493', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1308, 0, 0, 0, '345/P/PMJ', 'LUCKY SUKOHAJI, S.E., M.M.', '82091287', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1309, 0, 0, 0, '346/P/PMJ', 'DOLI SANDRI', '78100595', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'ALAHAN MATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1310, 0, 0, 0, '347/P/PMJ', 'DEDY KUSPRIYANTO, S.H.', '84060129', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'YOGYAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1311, 0, 0, 0, '348/P/PMJ', 'SUTRISNO', '76050820', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'NGAWI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1312, 0, 0, 0, '349/P/PMJ', 'MARWAN, S.H.', '80120659', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'INDRAMAYU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1313, 0, 0, 0, '350/P/PMJ', 'TRI WALUYO', '76090609', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1314, 0, 0, 0, '351/P/PMJ', 'ATANG SETIAWAN, S.Sos, M.Si', '73040098', 'P', 'BRIPKA', 'DIT RESKRIMSUS POLDA METRO JAYA', 'KUNINGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1315, 0, 0, 0, '352/P/PMJ', 'ABU BAKAR AJIE LUHULIMA', '81090203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'KULUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1316, 0, 0, 0, '353/P/PMJ', 'BUDIYONO', '77070342', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SAMPANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1317, 0, 0, 0, '354/P/PMJ', 'DICKY ARDIANSYAH, S.H.', '83040232', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1318, 0, 0, 0, '355/P/PMJ', 'SUGIYONO', '79110893', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1319, 0, 0, 0, '356/P/PMJ', 'SOPIAN HADI', '79090974', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'DEPOK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1320, 0, 0, 0, '357/P/PMJ', 'DONI AKHMADIN', '79060220', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1321, 0, 0, 0, '358/P/PMJ', 'FERY OKTARIZAL', '74100341', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'PALEMBANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1322, 0, 0, 0, '359/P/PMJ', 'TRI MULYO', '73100448', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOYOLALI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1323, 0, 0, 0, '360/P/PMJ', 'SUHAEBY', '79051106', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1324, 0, 0, 0, '361/P/PMJ', 'RUBY ANTON, S.H.', '81020599', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1325, 0, 0, 0, '362/P/PMJ', 'MARTOGI', '79020914', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1326, 0, 0, 0, '363/P/PMJ', 'BASUKI ABDULLAH', '82010552', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'LAMPUNG TENGAH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1327, 0, 0, 0, '364/P/PMJ', 'DEDEN SUGIARTO', '80100546', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1328, 0, 0, 0, '365/P/PMJ', 'SIGIT PRIYANTO', '81030936', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1329, 0, 0, 0, '366/P/PMJ', 'ASEP TRIANA', '79051727', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1330, 0, 0, 0, '367/P/PMJ', 'DHOHIR, S.H.', '78091170', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SURAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1331, 0, 0, 0, '368/P/PMJ', 'TRIADY MAHENDRA', '77010379', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'CIREBON', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1332, 0, 0, 0, '369/P/PMJ', 'ANTON SUHARNOYO, S.H.', '82030422', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1333, 0, 0, 0, '370/P/PMJ', 'SUNARDI', '81110703', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1334, 0, 0, 0, '371/P/PMJ', 'RICARDHO SIAHAAN', '83010139', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1335, 0, 0, 0, '372/P/PMJ', 'JOSUA PARDOMUAN SIANTURI, S.H.', '83090190', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'BANDAR LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1336, 0, 0, 0, '373/P/PMJ', 'NUR SUHARTONO', '83110054', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1337, 0, 0, 0, '374/P/PMJ', 'SUKARDI, S.H.', '75030041', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'SRAGEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1338, 0, 0, 0, '375/P/PMJ', 'DENY SUKMO PRABOWO', '80020114', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1339, 0, 0, 0, '376/P/PMJ', 'NEKHRINTO DACHI', '82110428', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'NIAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1340, 0, 0, 0, '377/P/PMJ', 'KENEDI MARKOS SIJABAT', '83050162', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1341, 0, 0, 0, '378/P/PMJ', 'SISWANTO, S.H.', '79031301', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1342, 0, 0, 0, '379/P/PMJ', 'FIRMANSYAH', '73080409', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1343, 0, 0, 0, '380/P/PMJ', 'SUSANTO', '83010151', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'TULUNG AGUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1344, 0, 0, 0, '381/P/PMJ', 'PILIPI GINTING', '82040541', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'LINGGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1345, 0, 0, 0, '382/P/PMJ', 'SUWANTORO', '77100198', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1346, 0, 0, 0, '383/P/PMJ', 'HERY DWI SUDARYANTO', '82070046', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1347, 0, 0, 0, '384/P/PMJ', 'ROMMEL SANTER, S.H.', '76110546', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1348, 0, 0, 0, '385/P/PMJ', 'MUHAMMAD BANDI', '78080703', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MADIUN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1349, 0, 0, 0, '386/P/PMJ', 'AGUS FITRIYANTO, S.H.', '80080929', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1350, 0, 0, 0, '387/P/PMJ', 'RUDI BASAROH', '174050289', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1351, 0, 0, 0, '388/W/PMJ', 'SRI RATU COMERIHI', '75081131', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'MAUJAWA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1352, 0, 0, 0, '389/P/PMJ', 'MUHAMMAD JOKO ARIANTO', '76110691', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'TANGERANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1353, 0, 0, 0, '390/P/PMJ', 'YUDHI SUGIYANTO', '80050300', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1354, 0, 0, 0, '391/P/PMJ', 'BUDIYONO', '75050565', 'P', 'AIPTU', 'DIT LANTAS POLDA METRO JAYA', 'PEKALONGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1355, 0, 0, 0, '392/P/PMJ', 'BAMBANG KASIYADI', '80100578', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1356, 0, 0, 0, '393/P/PMJ', 'CHEPY MARYANTO', '81120163', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1357, 0, 0, 0, '394/P/PMJ', 'PONIRAN', '77020380', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1358, 0, 0, 0, '395/P/PMJ', 'GITO SUHONO', '81050590', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PONOROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1359, 0, 0, 0, '396/P/PMJ', 'SUBAGYO', '75120311', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'SLEMAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1360, 0, 0, 0, '397/P/PMJ', 'DEDI BUDI HARIYANTO', '80120402', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BEKASI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1361, 0, 0, 0, '398/P/PMJ', 'SUKARDI', '78080746', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'BENGKULU', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1362, 0, 0, 0, '399/P/PMJ', 'ISAK ERIXON, S.H.', '82010194', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1363, 0, 0, 0, '400/P/PMJ', 'SUWARDI', '81050497', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1364, 0, 0, 0, '401/P/PMJ', 'IMAM HARISMAWAN', '79110635', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BANDUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1365, 0, 0, 0, '402/P/PMJ', 'MUHAMMAD SOFYAN', '78030643', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'MAJENE', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1366, 0, 0, 0, '403/P/PMJ', 'AGUS SETIYAWAN, S.H.', '78080164', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'BOJONEGORO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1367, 0, 0, 0, '404/P/PMJ', 'DADI SUTARDI', '79050715', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1368, 0, 0, 0, '405/P/PMJ', 'DADIK HANDRI WIRATNO, S.H.', '79061229', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1369, 0, 0, 0, '406/P/PMJ', 'NURJAKWAN', '77051075', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1370, 0, 0, 0, '407/W/PMJ', 'MELIDA', '82050452', 'W', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1371, 0, 0, 0, '408/P/PMJ', 'SLAMET SISWADI, S.H.', '74060596', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'BREBES', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1372, 0, 0, 0, '409/P/PMJ', 'MAKMURI, S.H.', '78121141', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KEBUMEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1373, 0, 0, 0, '410/P/PMJ', 'MIQUEL P MANULANG', '79041134', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SEI RAMPAH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1374, 0, 0, 0, '411/P/PMJ', 'AGUNG KURNIAWAN', '78080942', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1375, 0, 0, 0, '412/P/PMJ', 'VICTOR HISAR PANDAPOTAN', '78030195', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'SOSOR PASIR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1376, 0, 0, 0, '413/P/PMJ', 'MAT SANI, S.H.', '79091302', 'P', 'BRIPKA', 'POLRES PULAU SERIBU', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1377, 0, 0, 0, '414/P/PMJ', 'DENY NURHOLIS, S.H.', '78060893', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1378, 0, 0, 0, '415/P/PMJ', 'WITOYO, S.H.', '79021087', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'GROBOGAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1379, 0, 0, 0, '416/P/PMJ', 'ACHMAD SUPANJI', '75080421', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1380, 0, 0, 0, '417/P/PMJ', 'DADANG.SETIAWAN', '84060057', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KLATEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1381, 0, 0, 0, '418/P/PMJ', 'BENNI SANTOSO PANDIANGAN', '78081560', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'LAUMIL', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1382, 0, 0, 0, '419/P/PMJ', 'MARYANTO', '78071193', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BLORA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1383, 0, 0, 0, '420/P/PMJ', 'LAMSIHAR SIAHAAN', '79020166', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SIMISAK', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1384, 0, 0, 0, '421/P/PMJ', 'LUKAS PARDAMEAN E MARBUN', '83030372', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1385, 0, 0, 0, '422/P/PMJ', 'RUDY SETYO WARDOYO, S.H.', '79070424', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'KEDIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1386, 0, 0, 0, '423/P/PMJ', 'MARSILAN, S.H.', '80050632', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'SIUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1387, 0, 0, 0, '424/P/PMJ', 'AMIRUDIN BAHARUDIN, S.H.', '79051581', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'TOLI TOLI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1388, 0, 0, 0, '425/P/PMJ', 'RINTIS SIGIT PRABOWO', '82030567', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1389, 0, 0, 0, '426/P/PMJ', 'M ARIF SYATRIADIN, S.Sos', '76100070', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1390, 0, 0, 0, '427/P/PMJ', 'DWI HANDOYO, S.H.', '83090176', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1391, 0, 0, 0, '428/P/PMJ', 'BUDI GUNAWAN SULISTYO', '79080461', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'SOLO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1392, 0, 0, 0, '429/P/PMJ', 'RUSTAMI', '79090797', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1393, 0, 0, 0, '430/P/PMJ', 'BARU TRISNO, S.H.', '78010004', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1394, 0, 0, 0, '431/P/PMJ', 'DULRAHMAD', '77080568', 'P', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'SUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1395, 0, 0, 0, '432/W/PMJ', 'HENI SULISTYOWATI, S.H.', '76110530', 'W', 'AIPDA', 'DIT LANTAS POLDA METRO JAYA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1396, 0, 0, 0, '433/P/PMJ', 'ARIYANTO, S.H.', '80100548', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'WONOGIRI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1397, 0, 0, 0, '434/P/PMJ', 'PANANGIANG LIMBONG', '77071186', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'LOMBONG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1398, 0, 0, 0, '435/P/PMJ', 'PIRMANSYAH, S.H.', '77040050', 'P', 'AIPTU', 'POLRES METRO JAKARTA PUSAT', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1399, 0, 0, 0, '436/P/PMJ', 'ANDRIANTO, S.H.', '78120516', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1400, 0, 0, 0, '437/P/PMJ', 'SUPARMIN, S.H.', '78050459', 'P', 'AIPDA', 'POLRES METRO JAKARTA PUSAT', 'SUKOHARJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1401, 0, 0, 0, '438/P/PMJ', 'JAPARUDIN', '75110251', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1402, 0, 0, 0, '439/P/PMJ', 'DHANI RAMDANI', '83060272', 'P', 'BRIPKA', 'POLRES METRO JAKARTA SELATAN', 'SUMEDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1403, 0, 0, 0, '440/P/PMJ', 'EDISON MANABUNG', '77040361', 'P', 'AIPDA', 'POLRES METRO JAKARTA UTARA', 'BABAT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1404, 0, 0, 0, '441/P/PMJ', 'ROMULUS SIRAIT', '83120126', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'SIRAIT URUR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1405, 0, 0, 0, '442/P/PMJ', 'GUNTUR MARCOS', '79120427', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1406, 0, 0, 0, '443/P/PMJ', 'I NYOMAN SARJANA', '79060467', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'KLUNGKUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1407, 0, 0, 0, '444/P/PMJ', 'MUHAMAD IRWAN', '79060382', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1408, 0, 0, 0, '445/P/PMJ', 'ARIDINI GRANDIS', '83020203', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'PACITAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1409, 0, 0, 0, '446/P/PMJ', 'BEBEN LIUS SEPTA DARMA', '80090109', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1410, 0, 0, 0, '447/P/PMJ', 'FERDINAND PARULIAN MANURUNG', '83030168', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'TANJUNG BALAI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1411, 0, 0, 0, '448/P/PMJ', 'ANDI SUHANDI', '76020075', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1412, 0, 0, 0, '449/P/PMJ', 'DIMAS DWICAHYO', '85110025', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1413, 0, 0, 0, '450/P/PMJ', 'ANTON PRAMONO', '80040138', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1414, 0, 0, 0, '451/P/PMJ', 'SULISTIONO', '79070537', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'TUBAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1415, 0, 0, 0, '452/P/PMJ', 'JOKO WIYONO', '75080723', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'LAMPUNG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1416, 0, 0, 0, '453/P/PMJ', 'HARSONO BAMBANG PERMADI', '80031109', 'P', 'BRIPKA', 'POLRES METRO JAKARTA PUSAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1417, 0, 0, 0, '454/P/PMJ', 'MUCHAMMAD ERFAN', '74020117', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'KALTEN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1418, 0, 0, 0, '455/P/PMJ', 'SAHARUDDIN', '74090130', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'UJUNG PANDANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1419, 0, 0, 0, '456/P/PMJ', 'EKO PURWANTO', '79120417', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1420, 0, 0, 0, '457/P/PMJ', 'ARIEF WIDYANTORO, S.E.', '82020535', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'MALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1421, 0, 0, 0, '458/P/PMJ', 'KUMBINO', '78070715', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'PATI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1422, 0, 0, 0, '459/P/PMJ', 'AGUS WARTONO, S.H.', '71080060', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1423, 0, 0, 0, '460/P/PMJ', 'CHAIRUL HUDA', '82060071', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1424, 0, 0, 0, '461/P/PMJ', 'SYAFRUL', '72120509', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'BATU HAMPAR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1425, 0, 0, 0, '462/W/PMJ', 'FRISKA YERNITA POHAN', '76020151', 'W', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'TANJUNG BALAI', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1426, 0, 0, 0, '463/P/PMJ', 'RESTU SETYAWAN, S.H.', '79121353', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'BANYUMAS', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1427, 0, 0, 0, '464/P/PMJ', 'ISWANDI', '73120238', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'MARTAPURA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1428, 0, 0, 0, '465/P/PMJ', 'MAHMUD ARYANTO, S.H.', '79041033', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'GARUT', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1429, 0, 0, 0, '466/P/PMJ', 'JHON PIETR SARTO TORTET', '77030644', 'P', 'AIPDA', 'POLRES METRO JAKARTA BARAT', 'MUARA TEWEH', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1430, 0, 0, 0, '467/P/PMJ', 'JANNES EDWARD MANURUNG', '82030591', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1431, 0, 0, 0, '468/P/PMJ', 'AGUS SUDRAJAT', '73080635', 'P', 'AIPTU', 'POLRES METRO JAKARTA BARAT', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1432, 0, 0, 0, '469/P/PMJ', 'SARMIN TARIGAN, S.H.', '73050325', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'MEDAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1433, 0, 0, 0, '470/P/PMJ', 'WANDI SUGIANTO', '79081093', 'P', 'BRIPKA', 'POLRES METRO JAKARTA BARAT', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1434, 0, 0, 0, '471/P/PMJ', 'LILIK PRASOJO', '79060344', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'KULON PROGO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1435, 0, 0, 0, '472/P/PMJ', 'ENDANG DAHYUDI', '73040210', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1436, 0, 0, 0, '473/P/PMJ', 'AMIR CHOIRUDIN', '79090062', 'P', 'BRIPKA', 'DIT LANTAS POLDA METRO JAYA', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1437, 0, 0, 0, '474/P/PMJ', 'MOCH ADIL SUBEKTI, S.E.', '76100004', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1438, 0, 0, 0, '475/P/PMJ', 'BENY ROKY RISKIAWAN', '79020946', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'PEMALANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1439, 0, 0, 0, '476/P/PMJ', 'AGUS IRSAN, S.H.', '82080491', 'P', 'BRIPKA', 'POLRES METRO JAKARTA UTARA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1440, 0, 0, 0, '477/P/PMJ', 'DIDIEK APRI LISTIONO', '73040447', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'SALATIGA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1441, 0, 0, 0, '478/P/PMJ', 'DEVI ALEXANDER BETTE, S.H.', '77060423', 'P', 'BRIPKA', 'POLRES KOTA BEKASI KOTA', 'KUPANG', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1442, 0, 0, 0, '479/P/PMJ', 'JOKO RAHARJO', '75050116', 'P', 'AIPTU', 'POLRES KOTA BEKASI KOTA', 'JAKARTA', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1443, 0, 0, 0, '480/P/PMJ', 'MAHPUDIN', '71030262', 'P', 'AIPTU', 'POLRES METRO JAKARTA UTARA', 'BOGOR', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1444, 0, 0, 0, '481/P/PMJ', 'DENY TRI GUNAWAN, S.H.', '77080711', 'P', 'AIPDA', 'POLRES METRO JAKARTA UTARA', 'MAGETAN', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0),
(1445, 0, 0, 0, '483/P/PMJ', 'GUNAWAN SETIYARSO', '80060724', 'P', 'BRIPKA', 'POLRES TANGERANG SELATAN', 'PURWOREJO', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0);

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
  `nama_ruangan` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `id_lokasi`, `nama_ruangan`, `status`) VALUES
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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
MODIFY `id_peserta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1446;
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
