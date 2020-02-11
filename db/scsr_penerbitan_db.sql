-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30 Des 2019 pada 23.58
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scsr_penerbitan_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `credit`
--

CREATE TABLE `credit` (
  `id_credit` char(16) NOT NULL,
  `date_credit` datetime NOT NULL,
  `status_credit` enum('paid','unpaid') NOT NULL,
  `payment_credit` int(11) NOT NULL,
  `id_transaction` char(14) NOT NULL,
  `id_user` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `item`
--

CREATE TABLE `item` (
  `id_item` char(8) NOT NULL,
  `name_item` varchar(500) NOT NULL,
  `price_item` int(11) NOT NULL,
  `storage_item` int(11) NOT NULL,
  `store_item` int(11) NOT NULL,
  `status_item` enum('TRUE','FALSE') NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `item`
--

INSERT INTO `item` (`id_item`, `name_item`, `price_item`, `storage_item`, `store_item`, `status_item`, `id_category`) VALUES
('21499097', 'Buku', 5000, 0, 0, 'FALSE', 1),
('22142501', 'Buku Tulis SInar Telaga', 3000, 116, 55, 'TRUE', 1),
('27063776', 'Buku Tulis SInar Nekara', 4300, 0, 0, 'FALSE', 1),
('27834980', 'Buku Tulis SInar Dunia', 12123, 0, 0, 'FALSE', 1),
('31411273', 'BUku ', 7000, 40, 4, 'TRUE', 1),
('36154391', 'BUku Sinar Nusantara', 5000, 90, 10, 'TRUE', 1),
('46771405', 'Pensil 2B', 5000, 0, 0, 'FALSE', 2),
('49721413', 'Penghapus', 4000, 0, 120, 'TRUE', 2),
('59365497', 'Buku2', 400, -5, 5, 'FALSE', 1),
('87043068', 'KOmik', 10, 0, 0, 'FALSE', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_category`
--

CREATE TABLE `item_category` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `item_category`
--

INSERT INTO `item_category` (`id_category`, `name_category`) VALUES
(1, 'Buku'),
(2, 'Alat Tulis');

-- --------------------------------------------------------

--
-- Struktur dari tabel `item_log`
--

CREATE TABLE `item_log` (
  `id_item_log` char(20) NOT NULL,
  `describe_item_log` text NOT NULL,
  `type_item_log` enum('add Storage','add Store','new Item','edit Item','remove Item') NOT NULL,
  `date_item_log` datetime NOT NULL,
  `id_item` char(8) NOT NULL,
  `id_user` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `item_log`
--

INSERT INTO `item_log` (`id_item_log`, `describe_item_log`, `type_item_log`, `date_item_log`, `id_item`, `id_user`) VALUES
('20190924231216254321', 'Administrator | add New Item  : Buku Tulis SInar Nekara / id: 27063776', 'new Item', '2019-09-24 23:12:16', '27063776', '000000000000'),
('20190926063013793927', 'Administrator | add New Item  : BUku Sinar Nusantara / id: 36154391', 'new Item', '2019-09-26 06:30:13', '36154391', '000000000000'),
('20190926064431526335', 'Administratorupdate Item | id: 31411273<br> to BUku Iya |  to 7000 |  to 1', 'edit Item', '2019-09-26 06:44:31', '31411273', '000000000000'),
('20190926064954297462', 'Administrator Delete Item | name :  / id: 27063776', 'remove Item', '2019-09-26 06:49:54', '27063776', '000000000000'),
('20190926065020895483', 'Administrator Delete Item | name :  / id: 27834980', 'remove Item', '2019-09-26 06:50:20', '27834980', '000000000000'),
('20190926071656937975', 'Administrator update Storage Item | id: 36154391 / name :  = TRUE + 100', 'add Storage', '2019-09-26 07:16:56', '36154391', '000000000000'),
('20190926072822651326', 'Administrator Delete Item | name :  / id: 59365497', 'remove Item', '2019-09-26 07:28:22', '59365497', '000000000000'),
('20190926072832582476', 'Administrator update Store Item | id: 49721413 / name :  = 0 + 10 | 0 - 10', 'add Store', '2019-09-26 07:28:32', '49721413', '000000000000'),
('20190926073134791666', 'Administrator update Store Item | id: 49721413 / name :  = 0 + 30 | 0 - 30', 'add Store', '2019-09-26 07:31:34', '49721413', '000000000000'),
('20190926073140582443', 'Administrator update Store Item | id: 49721413 / name :  = 30 + 60 | -30 - 60', 'add Store', '2019-09-26 07:31:40', '49721413', '000000000000'),
('20190926073249491984', 'Administrator update Storage Item | id: 49721413 / name :  = 0 + 60', 'add Storage', '2019-09-26 07:32:49', '49721413', '000000000000'),
('20190926073340534062', 'Administrator update Store Item | id: 49721413 / name :  = 0 + 50 | 60 - 50', 'add Store', '2019-09-26 07:33:40', '49721413', '000000000000'),
('20190926073517303665', 'Administrator update Store Item | id: 49721413 / name :  = 50 + 5 | 10 - 5', 'add Store', '2019-09-26 07:35:17', '49721413', '000000000000'),
('20190926074134569052', 'Administrator update Store Item | id: 49721413 / name :  = 55 + 4 | 5 - 4', 'add Store', '2019-09-26 07:41:34', '49721413', '000000000000'),
('20190926074234545271', 'Administrator update Store Item | id: 49721413 / name :  = 59 + 1 | 1 - 1', 'add Store', '2019-09-26 07:42:34', '49721413', '000000000000'),
('20190926074244248566', 'Administrator update Storage Item | id: 49721413 / name :  = 0 + 70', 'add Storage', '2019-09-26 07:42:44', '49721413', '000000000000'),
('20190926074251646702', 'Administrator update Store Item | id: 49721413 / name :  = 60 + 70 | 70 - 70', 'add Store', '2019-09-26 07:42:51', '49721413', '000000000000'),
('20190927134653223553', 'Administrator update Storage Item | id: 49721413 / name :  = 0 + 1', 'add Storage', '2019-09-27 13:46:53', '49721413', '000000000000'),
('20190927135029498118', 'Test update Store Item | id: 49721413 / name :  = 130 + 1 | 1 - 1', 'add Store', '2019-09-27 13:50:29', '49721413', '811625813052'),
('20191001150244357512', 'Test update Storage Item | id: 31411273 / name :  = 0 + 100', 'add Storage', '2019-10-01 15:02:44', '31411273', '811625813052'),
('20191001150345406744', 'Test update Store Item | id: 31411273 / name :  = 0 + 50 | 100 - 50', 'add Store', '2019-10-01 15:03:45', '31411273', '811625813052'),
('20191212011038539962', 'Administrator update Store Item | id: 31411273 / name :  = 6 + 10 | 50 - 10', 'add Store', '2019-12-12 01:10:38', '31411273', '000000000000'),
('20191230160419792483', 'Test update Store Item | id: 36154391 / name :  = 0 + 10 | 100 - 10', 'add Store', '2019-12-30 16:04:19', '36154391', '811625813052');

-- --------------------------------------------------------

--
-- Struktur dari tabel `region_i`
--

CREATE TABLE `region_i` (
  `id_region_i` int(11) NOT NULL,
  `name_region_i` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `region_i`
--

INSERT INTO `region_i` (`id_region_i`, `name_region_i`) VALUES
(0, '-'),
(1, 'Aceh'),
(2, 'Sumatera Utara'),
(3, 'Sumatera Barat'),
(4, 'Riau'),
(5, 'Kepulauan Riau'),
(6, 'Jambi'),
(7, 'Bengkulu'),
(8, 'Sumatera Selatan'),
(9, 'Kepulauan Bangka Belitung'),
(10, 'Lampung'),
(11, 'Banten'),
(12, 'Jawa Barat'),
(13, 'DKI Jakarta'),
(14, 'Jawa Tengah'),
(15, 'DI Yogyakarta'),
(16, 'Jawa Timur'),
(17, 'Bali'),
(18, 'Nusa Tenggara Barat'),
(19, 'Nusa Tenggara Timur'),
(20, 'Kalimantan Barat'),
(21, 'Kalimantan Selatan'),
(22, 'Kalimantan Tengah'),
(23, 'Kalimantan Timur'),
(24, 'Kalimantan Utara'),
(25, 'Gorontalo'),
(26, 'Sulawesi Selatan'),
(27, 'Sulawesi Tenggara'),
(28, 'Sulawesi Tengah'),
(29, 'Sulawesi Utara'),
(30, 'Sulawesi Barat'),
(31, 'Maluku'),
(32, 'Maluku Utara'),
(33, 'Papua'),
(34, 'Papua Barat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `region_ii`
--

CREATE TABLE `region_ii` (
  `id_region_ii` int(11) NOT NULL,
  `name_region_ii` varchar(255) NOT NULL,
  `id_region_i` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `region_ii`
--

INSERT INTO `region_ii` (`id_region_ii`, `name_region_ii`, `id_region_i`) VALUES
(0, '-', 0),
(1, 'Kabupaten Aceh Barat', 1),
(2, 'Kabupaten Aceh Barat Daya', 1),
(3, 'Kabupaten Aceh Besar', 1),
(4, 'Kabupaten Aceh Jaya', 1),
(5, 'Kabupaten Aceh Selatan', 1),
(6, 'Kabupaten Aceh Singkil', 1),
(7, 'Kabupaten Aceh Tamiang', 1),
(8, 'Kabupaten Aceh Tengah', 1),
(9, 'Kabupaten Aceh Tenggara', 1),
(10, 'Kabupaten Aceh Timur', 1),
(11, 'Kabupaten Aceh Utara', 1),
(12, 'Kabupaten Bener Meriah', 1),
(13, 'Kabupaten Bireuen', 1),
(14, 'Kabupaten Gayo Lues', 1),
(15, 'Kabupaten Nagan Raya', 1),
(16, 'Kabupaten Pidie', 1),
(17, 'Kabupaten Pidie Jaya', 1),
(18, 'Kabupaten Simeulue', 1),
(19, 'Kota Banda Aceh', 1),
(20, 'Kota Langsa', 1),
(21, 'Kota Lhokseumawe', 1),
(22, 'Kota Sabang', 1),
(23, 'Kota Subulussalam', 1),
(24, 'Kabupaten Asahan', 2),
(25, 'Kabupaten Batu Bara', 2),
(26, 'Kabupaten Dairi', 2),
(27, 'Kabupaten Deli Serdang', 2),
(28, 'Kabupaten Humbang Hasundutan', 2),
(29, 'Kabupaten Karo', 2),
(30, 'Kabupaten Labuhanbatu', 2),
(31, 'Kabupaten Labuhanbatu Selatan', 2),
(32, 'Kabupaten Labuhanbatu Utara', 2),
(33, 'Kabupaten Langkat', 2),
(34, 'Kabupaten Mandailing Natal', 2),
(35, 'Kabupaten Nias', 2),
(36, 'Kabupaten Nias Barat', 2),
(37, 'Kabupaten Nias Selatan', 2),
(38, 'Kabupaten Nias Utara', 2),
(39, 'Kabupaten Padang Lawas', 2),
(40, 'Kabupaten Padang Lawas Utara', 2),
(41, 'Kabupaten Pakpak Bharat', 2),
(42, 'Kabupaten Samosir', 2),
(43, 'Kabupaten Serdang Bedagai', 2),
(44, 'Kabupaten Simalungun', 2),
(45, 'Kabupaten Tapanuli Selatan', 2),
(46, 'Kabupaten Tapanuli Tengah', 2),
(47, 'Kabupaten Tapanuli Utara', 2),
(48, 'Kabupaten Toba Samosir', 2),
(49, 'Kota Binjai', 2),
(50, 'Kota Gunungsitoli', 2),
(51, 'Kota Medan', 2),
(52, 'Kota Padangsidempuan', 2),
(53, 'Kota Pematangsiantar', 2),
(54, 'Kota Sibolga', 2),
(55, 'Kota Tanjungbalai', 2),
(56, 'Kota Tebing Tinggi', 2),
(57, 'Kabupaten Agam', 3),
(58, 'Kabupaten Dharmasraya', 3),
(59, 'Kabupaten Kepulauan Mentawai', 3),
(60, 'Kabupaten Lima Puluh Kota', 3),
(61, 'Kabupaten Padang Pariaman', 3),
(62, 'Kabupaten Pasaman', 3),
(63, 'Kabupaten Pasaman Barat', 3),
(64, 'Kabupaten Pesisir Selatan', 3),
(65, 'Kabupaten Sijunjung', 3),
(66, 'Kabupaten Solok', 3),
(67, 'Kabupaten Solok Selatan', 3),
(68, 'Kabupaten Tanah Datar', 3),
(69, 'Kota Bukittinggi', 3),
(70, 'Kota Padang', 3),
(71, 'Kota Padangpanjang', 3),
(72, 'Kota Pariaman', 3),
(73, 'Kota Payakumbuh', 3),
(74, 'Kota Sawahlunto', 3),
(75, 'Kota Solok', 3),
(76, 'Kabupaten Bengkalis', 4),
(77, 'Kabupaten Indragiri Hilir', 4),
(78, 'Kabupaten Indragiri Hulu', 4),
(79, 'Kabupaten Kampar', 4),
(80, 'Kabupaten Kepulauan Meranti', 4),
(81, 'Kabupaten Kuantan Singingi', 4),
(82, 'Kabupaten Pelalawan', 4),
(83, 'Kabupaten Rokan Hilir', 4),
(84, 'Kabupaten Rokan Hulu', 4),
(85, 'Kabupaten Siak', 4),
(86, 'Kota Dumai', 4),
(87, 'Kota Pekanbaru', 4),
(88, 'Kabupaten Bintan', 5),
(89, 'Kabupaten Karimun', 5),
(90, 'Kabupaten Kepulauan Anambas', 5),
(91, 'Kabupaten Lingga', 5),
(92, 'Kabupaten Natuna', 5),
(93, 'Kota Batam', 5),
(94, 'Kota Tanjung Pinang', 5),
(95, 'Kabupaten Batanghari', 6),
(96, 'Kabupaten Bungo', 6),
(97, 'Kabupaten Kerinci', 6),
(98, 'Kabupaten Merangin', 6),
(99, 'Kabupaten Muaro Jambi', 6),
(100, 'Kabupaten Sarolangun', 6),
(101, 'Kabupaten Tanjung Jabung Barat', 6),
(102, 'Kabupaten Tanjung Jabung Timur', 6),
(103, 'Kabupaten Tebo', 6),
(104, 'Kota Jambi', 6),
(105, 'Kota Sungaipenuh', 6),
(106, 'Kabupaten Bengkulu Selatan', 7),
(107, 'Kabupaten Bengkulu Tengah', 7),
(108, 'Kabupaten Bengkulu Utara', 7),
(109, 'Kabupaten Kaur', 7),
(110, 'Kabupaten Kepahiang', 7),
(111, 'Kabupaten Lebong', 7),
(112, 'Kabupaten Mukomuko', 7),
(113, 'Kabupaten Rejang Lebong', 7),
(114, 'Kabupaten Seluma', 7),
(115, 'Kota Bengkulu', 7),
(116, 'Kabupaten Banyuasin', 8),
(117, 'Kabupaten Empat Lawang', 8),
(118, 'Kabupaten Lahat', 8),
(119, 'Kabupaten Muara Enim', 8),
(120, 'Kabupaten Musi Banyuasin', 8),
(121, 'Kabupaten Musi Rawas', 8),
(122, 'Kabupaten Musi Rawas Utara', 8),
(123, 'Kabupaten Ogan Ilir', 8),
(124, 'Kabupaten Ogan Komering Ilir', 8),
(125, 'Kabupaten Ogan Komering Ulu', 8),
(126, 'Kabupaten Ogan Komering Ulu Selatan', 8),
(127, 'Kabupaten Ogan Komering Ulu Timur', 8),
(128, 'Kabupaten Penukal Abab Lematang Ilir', 8),
(129, 'Kota Lubuklinggau', 8),
(130, 'Kota Pagar Alam', 8),
(131, 'Kota Palembang', 8),
(132, 'Kota Prabumulih', 8),
(133, 'Kabupaten Bangka', 9),
(134, 'Kabupaten Bangka Barat', 9),
(135, 'Kabupaten Bangka Selatan', 9),
(136, 'Kabupaten Bangka Tengah', 9),
(137, 'Kabupaten Belitung', 9),
(138, 'Kabupaten Belitung Timur', 9),
(139, 'Kota Pangkal Pinang', 9),
(140, 'Kabupaten Lampung Barat', 10),
(141, 'Kabupaten Lampung Selatan', 10),
(142, 'Kabupaten Lampung Tengah', 10),
(143, 'Kabupaten Lampung Timur', 10),
(144, 'Kabupaten Lampung Utara', 10),
(145, 'Kabupaten Mesuji', 10),
(146, 'Kabupaten Pesawaran', 10),
(147, 'Kabupaten Pesisir Barat', 10),
(148, 'Kabupaten Pringsewu', 10),
(149, 'Kabupaten Tanggamus', 10),
(150, 'Kabupaten Tulang Bawang', 10),
(151, 'Kabupaten Tulang Bawang Barat', 10),
(152, 'Kabupaten Way Kanan', 10),
(153, 'Kota Bandar Lampung', 10),
(154, 'Kota Metro', 10),
(155, 'Kabupaten Lebak', 11),
(156, 'Kabupaten Pandeglang', 11),
(157, 'Kabupaten Serang', 11),
(158, 'Kabupaten Tangerang', 11),
(159, 'Kota Cilegon', 11),
(160, 'Kota Serang', 11),
(161, 'Kota Tangerang', 11),
(162, 'Kota Tangerang Selatan', 11),
(163, 'Kabupaten Bandung', 12),
(164, 'Kabupaten Bandung Barat', 12),
(165, 'Kabupaten Bekasi', 12),
(166, 'Kabupaten Bogor', 12),
(167, 'Kabupaten Ciamis', 12),
(168, 'Kabupaten Cianjur', 12),
(169, 'Kabupaten Cirebon', 12),
(170, 'Kabupaten Garut', 12),
(171, 'Kabupaten Indramayu', 12),
(172, 'Kabupaten Karawang', 12),
(173, 'Kabupaten Kuningan', 12),
(174, 'Kabupaten Majalengka', 12),
(175, 'Kabupaten Pangandaran', 12),
(176, 'Kabupaten Purwakarta', 12),
(177, 'Kabupaten Subang', 12),
(178, 'Kabupaten Sukabumi', 12),
(179, 'Kabupaten Sumedang', 12),
(180, 'Kabupaten Tasikmalaya', 12),
(181, 'Kota Bandung', 12),
(182, 'Kota Banjar', 12),
(183, 'Kota Bekasi', 12),
(184, 'Kota Bogor', 12),
(185, 'Kota Cimahi', 12),
(186, 'Kota Cirebon', 12),
(187, 'Kota Depok', 12),
(188, 'Kota Sukabumi', 12),
(189, 'Kota Tasikmalaya', 12),
(190, 'Kabupaten Administrasi Kepulauan Seribu', 13),
(191, 'Kota Administrasi Jakarta Barat', 13),
(192, 'Kota Administrasi Jakarta Pusat', 13),
(193, 'Kota Administrasi Jakarta Selatan', 13),
(194, 'Kota Administrasi Jakarta Timur', 13),
(195, 'Kota Administrasi Jakarta Utara', 13),
(196, 'Kabupaten Banjarnegara', 14),
(197, 'Kabupaten Banyumas', 14),
(198, 'Kabupaten Batang', 14),
(199, 'Kabupaten Blora', 14),
(200, 'Kabupaten Boyolali', 14),
(201, 'Kabupaten Brebes', 14),
(202, 'Kabupaten Cilacap', 14),
(203, 'Kabupaten Demak', 14),
(204, 'Kabupaten Grobogan', 14),
(205, 'Kabupaten Jepara', 14),
(206, 'Kabupaten Karanganyar', 14),
(207, 'Kabupaten Kebumen', 14),
(208, 'Kabupaten Kendal', 14),
(209, 'Kabupaten Klaten', 14),
(210, 'Kabupaten Kudus', 14),
(211, 'Kabupaten Magelang', 14),
(212, 'Kabupaten Pati', 14),
(213, 'Kabupaten Pekalongan', 14),
(214, 'Kabupaten Pemalang', 14),
(215, 'Kabupaten Purbalingga', 14),
(216, 'Kabupaten Purworejo', 14),
(217, 'Kabupaten Rembang', 14),
(218, 'Kabupaten Semarang', 14),
(219, 'Kabupaten Sragen', 14),
(220, 'Kabupaten Sukoharjo', 14),
(221, 'Kabupaten Tegal', 14),
(222, 'Kabupaten Temanggung', 14),
(223, 'Kabupaten Wonogiri', 14),
(224, 'Kabupaten Wonosobo', 14),
(225, 'Kota Magelang', 14),
(226, 'Kota Pekalongan', 14),
(227, 'Kota Salatiga', 14),
(228, 'Kota Semarang', 14),
(229, 'Kota Surakarta', 14),
(230, 'Kota Tegal', 14),
(231, 'Kabupaten Bantul', 15),
(232, 'Kabupaten Gunungkidul', 15),
(233, 'Kabupaten Kulon Progo', 15),
(234, 'Kabupaten Sleman', 15),
(235, 'Kota Yogyakarta', 15),
(236, 'Kabupaten Bangkalan', 16),
(237, 'Kabupaten Banyuwangi', 16),
(238, 'Kabupaten Blitar', 16),
(239, 'Kabupaten Bojonegoro', 16),
(240, 'Kabupaten Bondowoso', 16),
(241, 'Kabupaten Gresik', 16),
(242, 'Kabupaten Jember', 16),
(243, 'Kabupaten Jombang', 16),
(244, 'Kabupaten Kediri', 16),
(245, 'Kabupaten Lamongan', 16),
(246, 'Kabupaten Lumajang', 16),
(247, 'Kabupaten Madiun', 16),
(248, 'Kabupaten Magetan', 16),
(249, 'Kabupaten Malang', 16),
(250, 'Kabupaten Mojokerto', 16),
(251, 'Kabupaten Nganjuk', 16),
(252, 'Kabupaten Ngawi', 16),
(253, 'Kabupaten Pacitan', 16),
(254, 'Kabupaten Pamekasan', 16),
(255, 'Kabupaten Pasuruan', 16),
(256, 'Kabupaten Ponorogo', 16),
(257, 'Kabupaten Probolinggo', 16),
(258, 'Kabupaten Sampang', 16),
(259, 'Kabupaten Sidoarjo', 16),
(260, 'Kabupaten Situbondo', 16),
(261, 'Kabupaten Sumenep', 16),
(262, 'Kabupaten Trenggalek', 16),
(263, 'Kabupaten Tuban', 16),
(264, 'Kabupaten Tulungagung', 16),
(265, 'Kota Batu', 16),
(266, 'Kota Blitar', 16),
(267, 'Kota Kediri', 16),
(268, 'Kota Madiun', 16),
(269, 'Kota Malang', 16),
(270, 'Kota Mojokerto', 16),
(271, 'Kota Pasuruan', 16),
(272, 'Kota Probolinggo', 16),
(273, 'Kota Surabaya', 16),
(274, 'Kabupaten Badung', 17),
(275, 'Kabupaten Bangli', 17),
(276, 'Kabupaten Buleleng', 17),
(277, 'Kabupaten Gianyar', 17),
(278, 'Kabupaten Jembrana', 17),
(279, 'Kabupaten Karangasem', 17),
(280, 'Kabupaten Klungkung', 17),
(281, 'Kabupaten Tabanan', 17),
(282, 'Kota Denpasar', 17),
(283, '', 18),
(284, 'Kabupaten Bima', 18),
(285, 'Kabupaten Dompu', 18),
(286, 'Kabupaten Lombok Barat', 18),
(287, 'Kabupaten Lombok Tengah', 18),
(288, 'Kabupaten Lombok Timur', 18),
(289, 'Kabupaten Lombok Utara', 18),
(290, 'Kabupaten Sumbawa', 18),
(291, 'Kabupaten Sumbawa Barat', 18),
(292, 'Kota Bima', 18),
(293, 'Kota Mataram', 18),
(294, 'Kabupaten Alor', 19),
(295, 'Kabupaten Belu', 19),
(296, 'Kabupaten Ende', 19),
(297, 'Kabupaten Flores Timur', 19),
(298, 'Kabupaten Kupang', 19),
(299, 'Kabupaten Lembata', 19),
(300, 'Kabupaten Malaka', 19),
(301, 'Kabupaten Manggarai', 19),
(302, 'Kabupaten Manggarai Barat', 19),
(303, 'Kabupaten Manggarai Timur', 19),
(304, 'Kabupaten Ngada', 19),
(305, 'Kabupaten Nagekeo', 19),
(306, 'Kabupaten Rote Ndao', 19),
(307, 'Kabupaten Sabu Raijua', 19),
(308, 'Kabupaten Sikka', 19),
(309, 'Kabupaten Sumba Barat', 19),
(310, 'Kabupaten Sumba Barat Daya', 19),
(311, 'Kabupaten Sumba Tengah', 19),
(312, 'Kabupaten Sumba Timur', 19),
(313, 'Kabupaten Timor Tengah Selatan', 19),
(314, 'Kabupaten Timor Tengah Utara', 19),
(315, 'Kota Kupang', 19),
(316, 'Kabupaten Bengkayang', 20),
(317, 'Kabupaten Kapuas Hulu', 20),
(318, 'Kabupaten Kayong Utara', 20),
(319, 'Kabupaten Ketapang', 20),
(320, 'Kabupaten Kubu Raya', 20),
(321, 'Kabupaten Landak', 20),
(322, 'Kabupaten Melawi', 20),
(323, 'Kabupaten Mempawah', 20),
(324, 'Kabupaten Sambas', 20),
(325, 'Kabupaten Sanggau', 20),
(326, 'Kabupaten Sekadau', 20),
(327, 'Kabupaten Sintang', 20),
(328, 'Kota Pontianak', 20),
(329, 'Kota Singkawang', 20),
(330, 'Kabupaten Balangan', 21),
(331, 'Kabupaten Banjar', 21),
(332, 'Kabupaten Barito Kuala', 21),
(333, 'Kabupaten Hulu Sungai Selatan', 21),
(334, 'Kabupaten Hulu Sungai Tengah', 21),
(335, 'Kabupaten Hulu Sungai Utara', 21),
(336, 'Kabupaten Kotabaru', 21),
(337, 'Kabupaten Tabalong', 21),
(338, 'Kabupaten Tanah Bumbu', 21),
(339, 'Kabupaten Tanah Laut', 21),
(340, 'Kabupaten Tapin', 21),
(341, 'Kota Banjarbaru', 21),
(342, 'Kota Banjarmasin', 21),
(343, 'Kabupaten Barito Selatan', 22),
(344, 'Kabupaten Barito Timur', 22),
(345, 'Kabupaten Barito Utara', 22),
(346, 'Kabupaten Gunung Mas', 22),
(347, 'Kabupaten Kapuas', 22),
(348, 'Kabupaten Katingan', 22),
(349, 'Kabupaten Kotawaringin Barat', 22),
(350, 'Kabupaten Kotawaringin Timur', 22),
(351, 'Kabupaten Lamandau', 22),
(352, 'Kabupaten Murung Raya', 22),
(353, 'Kabupaten Pulang Pisau', 22),
(354, 'Kabupaten Sukamara', 22),
(355, 'Kabupaten Seruyan', 22),
(356, 'Kota Palangka Raya', 22),
(357, 'Kabupaten Berau', 23),
(358, 'Kabupaten Kutai Barat', 23),
(359, 'Kabupaten Kutai Kartanegara', 23),
(360, 'Kabupaten Kutai Timur', 23),
(361, 'Kabupaten Mahakam Ulu', 23),
(362, 'Kabupaten Paser', 23),
(363, 'Kabupaten Penajam Paser Utara', 23),
(364, 'Kota Balikpapan', 23),
(365, 'Kota Bontang', 23),
(366, 'Kota Samarinda', 23),
(367, 'Kabupaten Bulungan', 24),
(368, 'Kabupaten Malinau', 24),
(369, 'Kabupaten Nunukan', 24),
(370, 'Kabupaten Tana Tidung', 24),
(371, 'Kota Tarakan', 24),
(372, 'Kabupaten Boalemo', 25),
(373, 'Kabupaten Bone Bolango', 25),
(374, 'Kabupaten Gorontalo', 25),
(375, 'Kabupaten Gorontalo Utara', 25),
(376, 'Kabupaten Pohuwato', 25),
(377, 'Kota Gorontalo', 25),
(378, 'Kabupaten Bantaeng', 26),
(379, 'Kabupaten Barru', 26),
(380, 'Kabupaten Bone', 26),
(381, 'Kabupaten Bulukumba', 26),
(382, 'Kabupaten Enrekang', 26),
(383, 'Kabupaten Gowa', 26),
(384, 'Kabupaten Jeneponto', 26),
(385, 'Kabupaten Kepulauan Selayar', 26),
(386, 'Kabupaten Luwu', 26),
(387, 'Kabupaten Luwu Timur', 26),
(388, 'Kabupaten Luwu Utara', 26),
(389, 'Kabupaten Maros', 26),
(390, 'Kabupaten Pangkajene dan Kepulauan', 26),
(391, 'Kabupaten Pinrang', 26),
(392, 'Kabupaten Sidenreng Rappang', 26),
(393, 'Kabupaten Sinjai', 26),
(394, 'Kabupaten Soppeng', 26),
(395, 'Kabupaten Takalar', 26),
(396, 'Kabupaten Tana Toraja', 26),
(397, 'Kabupaten Toraja Utara', 26),
(398, 'Kabupaten Wajo', 26),
(399, 'Kota Makassar', 26),
(400, 'Kota Palopo', 26),
(401, 'Kota Parepare', 26),
(402, 'Kabupaten Bombana', 27),
(403, 'Kabupaten Buton', 27),
(404, 'Kabupaten Buton Selatan', 27),
(405, 'Kabupaten Buton Tengah', 27),
(406, 'Kabupaten Buton Utara', 27),
(407, 'Kabupaten Kolaka', 27),
(408, 'Kabupaten Kolaka Timur', 27),
(409, 'Kabupaten Kolaka Utara', 27),
(410, 'Kabupaten Konawe', 27),
(411, 'Kabupaten Konawe Kepulauan', 27),
(412, 'Kabupaten Konawe Selatan', 27),
(413, 'Kabupaten Konawe Utara', 27),
(414, 'Kabupaten Muna', 27),
(415, 'Kabupaten Muna Barat', 27),
(416, 'Kabupaten Wakatobi', 27),
(417, 'Kota Bau-Bau', 27),
(418, 'Kota Kendari', 27),
(419, 'Kabupaten Banggai', 28),
(420, 'Kabupaten Banggai Kepulauan', 28),
(421, 'Kabupaten Banggai Laut', 28),
(422, 'Kabupaten Buol', 28),
(423, 'Kabupaten Donggala', 28),
(424, 'Kabupaten Morowali', 28),
(425, 'Kabupaten Morowali Utara', 28),
(426, 'Kabupaten Parigi Moutong', 28),
(427, 'Kabupaten Poso', 28),
(428, 'Kabupaten Sigi', 28),
(429, 'Kabupaten Tojo Una-Una', 28),
(430, 'Kabupaten Tolitoli', 28),
(431, 'Kota Palu', 28),
(432, 'Kabupaten Bolaang Mongondow', 29),
(433, 'Kabupaten Bolaang Mongondow Selatan', 29),
(434, 'Kabupaten Bolaang Mongondow Timur', 29),
(435, 'Kabupaten Bolaang Mongondow Utara', 29),
(436, 'Kabupaten Kepulauan Sangihe', 29),
(437, 'Kabupaten Kepulauan Siau Tagulandang Biaro', 29),
(438, 'Kabupaten Kepulauan Talaud', 29),
(439, 'Kabupaten Minahasa', 29),
(440, 'Kabupaten Minahasa Selatan', 29),
(441, 'Kabupaten Minahasa Tenggara', 29),
(442, 'Kabupaten Minahasa Utara', 29),
(443, 'Kota Bitung', 29),
(444, 'Kota Kotamobagu', 29),
(445, 'Kota Manado', 29),
(446, 'Kota Tomohon', 29),
(447, 'Kabupaten Majene', 30),
(448, 'Kabupaten Mamasa', 30),
(449, 'Kabupaten Mamuju', 30),
(450, 'Kabupaten Mamuju Tengah', 30),
(451, 'Kabupaten Mamuju Utara', 30),
(452, 'Kabupaten Polewali Mandar', 30),
(453, 'Kabupaten Buru', 31),
(454, 'Kabupaten Buru Selatan', 31),
(455, 'Kabupaten Kepulauan Aru', 31),
(456, 'Kabupaten Maluku Barat Daya', 31),
(457, 'Kabupaten Maluku Tengah', 31),
(458, 'Kabupaten Maluku Tenggara', 31),
(459, 'Kabupaten Maluku Tenggara Barat', 31),
(460, 'Kabupaten Seram Bagian Barat', 31),
(461, 'Kabupaten Seram Bagian Timur', 31),
(462, 'Kota Ambon', 31),
(463, 'Kota Tual', 31),
(464, 'Kabupaten Halmahera Barat', 32),
(465, 'Kabupaten Halmahera Tengah', 32),
(466, 'Kabupaten Halmahera Timur', 32),
(467, 'Kabupaten Halmahera Selatan', 32),
(468, 'Kabupaten Halmahera Utara', 32),
(469, 'Kabupaten Kepulauan Sula', 32),
(470, 'Kabupaten Pulau Morotai', 32),
(471, 'Kabupaten Pulau Taliabu', 32),
(472, 'Kota Ternate', 32),
(473, 'Kota Tidore Kepulauan', 32),
(474, 'Kabupaten Asmat', 33),
(475, 'Kabupaten Biak Numfor', 33),
(476, 'Kabupaten Boven Digoel', 33),
(477, 'Kabupaten Deiyai', 33),
(478, 'Kabupaten Dogiyai', 33),
(479, 'Kabupaten Intan Jaya', 33),
(480, 'Kabupaten Jayapura', 33),
(481, 'Kabupaten Jayawijaya', 33),
(482, 'Kabupaten Keerom', 33),
(483, 'Kabupaten Kepulauan Yapen', 33),
(484, 'Kabupaten Lanny Jaya', 33),
(485, 'Kabupaten Mamberamo Raya', 33),
(486, 'Kabupaten Mamberamo Tengah', 33),
(487, 'Kabupaten Mappi', 33),
(488, 'Kabupaten Merauke', 33),
(489, 'Kabupaten Mimika', 33),
(490, 'Kabupaten Nabire', 33),
(491, 'Kabupaten Nduga', 33),
(492, 'Kabupaten Paniai', 33),
(493, 'Kabupaten Pegunungan Bintang', 33),
(494, 'Kabupaten Puncak', 33),
(495, 'Kabupaten Puncak Jaya', 33),
(496, 'Kabupaten Sarmi', 33),
(497, 'Kabupaten Supiori', 33),
(498, 'Kabupaten Tolikara', 33),
(499, 'Kabupaten Waropen', 33),
(500, 'Kabupaten Yahukimo', 33),
(501, 'Kabupaten Yalimo', 33),
(502, 'Kota Jayapura', 33),
(503, 'Kabupaten Fakfak', 34),
(504, 'Kabupaten Kaimana', 34),
(505, 'Kabupaten Manokwari', 34),
(506, 'Kabupaten Manokwari Selatan', 34),
(507, 'Kabupaten Maybrat', 34),
(508, 'Kabupaten Pegunungan Arfak', 34),
(509, 'Kabupaten Raja Ampat', 34),
(510, 'Kabupaten Sorong', 34),
(511, 'Kabupaten Sorong Selatan', 34),
(512, 'Kabupaten Tambrauw', 34),
(513, 'Kabupaten Teluk Bintuni', 34),
(514, 'Kabupaten Teluk Wondama', 34),
(515, 'Kota Sorong', 34),
(516, 'Kota Solo', 14);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rest_api`
--

CREATE TABLE `rest_api` (
  `id_rest` char(10) NOT NULL,
  `key_rest` varchar(255) NOT NULL,
  `user_rest` varchar(255) NOT NULL,
  `paket_rest` varchar(255) NOT NULL,
  `url_rest` text NOT NULL,
  `status_rest` enum('TRUE','FALSE') NOT NULL,
  `date_rest` datetime NOT NULL,
  `id_user` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rest_api`
--

INSERT INTO `rest_api` (`id_rest`, `key_rest`, `user_rest`, `paket_rest`, `url_rest`, `status_rest`, `date_rest`, `id_user`) VALUES
('20191129', 'NTgwNDE3OA==', 'mrd', 'Panitia', 'http://localhost:8056/panitia', 'TRUE', '2019-11-29 21:10:06', '000000000000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` char(14) NOT NULL,
  `date_transaction` datetime NOT NULL,
  `price_transaction` int(12) NOT NULL,
  `pay_transaction` int(12) NOT NULL,
  `method_transaction` enum('cash','credit') NOT NULL,
  `status_transaction` enum('paid','unpaid') NOT NULL,
  `id_warga` char(16) DEFAULT NULL,
  `ktp_warga` char(16) DEFAULT NULL,
  `name_warga` varchar(255) DEFAULT NULL,
  `place_warga` text,
  `address_warga` text,
  `phone_warga` varchar(20) DEFAULT NULL,
  `id_user` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `date_transaction`, `price_transaction`, `pay_transaction`, `method_transaction`, `status_transaction`, `id_warga`, `ktp_warga`, `name_warga`, `place_warga`, `address_warga`, `phone_warga`, `id_user`) VALUES
('0', '2019-12-12 00:37:40', 39000, 50000, 'cash', 'paid', '', '', 'Teat', 'Kabupaten Bangka Tengah / Kepulauan Bangka Belitung', '', '', '000000000000'),
('15201912110001', '2019-12-11 07:03:55', 34000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110002', '2019-12-11 07:19:00', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110003', '2019-12-11 07:19:57', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110004', '2019-12-11 07:21:51', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110005', '2019-12-11 07:23:58', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110006', '2019-12-11 07:24:49', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110007', '2019-12-11 07:25:42', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110008', '2019-12-11 07:26:15', 19000, 0, 'cash', 'paid', '', '', 'Joko Widodo', 'Kabupaten Gunungkidul / DI Yogyakarta', '', '', '000000000000'),
('15201912110009', '2019-12-11 22:22:12', 28000, 0, 'cash', 'paid', '', '', 'Jiki Wididi', 'Kota Administrasi Jakarta Utara / DKI Jakarta', '', '', '000000000000'),
('15201912110011', '2019-12-11 22:41:53', 45000, 0, 'cash', 'paid', '', '', 'Test4', 'Kabupaten Tangerang / Banten', '', '', '000000000000'),
('15201912110012', '2019-12-11 22:43:23', 52000, 0, 'cash', 'paid', '', '', 'Tesr3', 'Kabupaten Kulon Progo / DI Yogyakarta', '', '', '000000000000'),
('15201912110013', '2019-12-11 22:51:53', 48000, 0, 'cash', 'paid', '', '', 'Test 123', 'Kota Serang / Banten', '', '', '000000000000'),
('15201912110014', '2019-12-11 22:56:12', 48000, 0, 'cash', 'paid', '', '', 'Test 123', 'Kota Serang / Banten', '', '', '000000000000'),
('15201912110015', '2019-12-11 22:57:19', 48000, 0, 'cash', 'paid', '', '', 'Test 123', 'Kota Serang / Banten', '', '', '000000000000'),
('15201912110016', '2019-12-11 22:59:42', 19000, 0, 'cash', 'paid', '', '', 'Test User', 'Kabupaten Malinau / Kalimantan Utara', '', '', '000000000000'),
('1520191211010', '2019-12-11 22:39:21', 46000, 0, 'cash', 'paid', '', '', 'Test', 'Kota Cilegon / Banten', '', '', '000000000000'),
('15201912120002', '2019-12-12 22:46:43', 13000, 15000, 'cash', 'paid', '', '', 'E', 'Kabupaten Bengkulu Utara / Bengkulu', '', '', '000000000000'),
('15201912120003', '2019-12-12 22:47:51', 13000, 15000, 'cash', 'paid', '', '', 'E', 'Kabupaten Bengkulu Utara / Bengkulu', '', '', '000000000000'),
('15201912130001', '2019-12-13 01:24:30', 22000, 25000, 'cash', 'paid', '', '', 'Wasto', 'Kota Cilegon / Banten', '', '', '000000000000'),
('15201912130002', '2019-12-13 01:37:04', 35000, 35000, 'cash', 'unpaid', '', '', 'TRACE', 'Kabupaten Rejang Lebong / Bengkulu', '', '', '000000000000'),
('15201912130003', '2019-12-13 01:42:42', 8000, 10000, 'cash', 'unpaid', '', '', 'Turace on', 'Kota Cilegon / Banten', '', '', '000000000000'),
('15201912140001', '2019-12-14 14:16:17', 38000, 40000, 'cash', 'unpaid', '', '', 'Wasto', 'Kabupaten Hulu Sungai Utara / Kalimantan Selatan', '', '', '000000000000'),
('15201912290001', '2019-12-29 15:05:37', 22000, 25000, 'cash', 'unpaid', '', '', 'AA UDIN SAEPUDIN', 'Kabupaten Kendal / Jawa Tengah', '', '', '811625813052');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `price_transaction_detail` int(12) NOT NULL,
  `amount_item` int(12) NOT NULL,
  `id_item` char(8) NOT NULL,
  `id_transaction` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction_detail`
--

INSERT INTO `transaction_detail` (`price_transaction_detail`, `amount_item`, `id_item`, `id_transaction`) VALUES
(14000, 2, '31411273', '15201912110007'),
(35000, 5, '31411273', '15201912110013'),
(35000, 5, '31411273', '15201912110014'),
(10000, 2, '36154391', '15201912110014'),
(3000, 1, '22142501', '15201912110014'),
(35000, 5, '31411273', '15201912110015'),
(10000, 2, '36154391', '15201912110015'),
(3000, 1, '22142501', '15201912110015'),
(14000, 2, '31411273', '15201912110016'),
(5000, 1, '36154391', '15201912110016'),
(700000, 100, '31411273', '0'),
(1000000, 200, '36154391', '0'),
(14000, 2, '31411273', '0'),
(25000, 5, '36154391', '0'),
(7000, 1, '31411273', '15201912120002'),
(6000, 2, '22142501', '15201912120002'),
(7000, 1, '31411273', '15201912120003'),
(6000, 2, '22142501', '15201912120003'),
(15000, 5, '22142501', '15201912130001'),
(7000, 1, '31411273', '15201912130001'),
(15000, 5, '22142501', '15201912130002'),
(20000, 5, '49721413', '15201912130002'),
(8000, 2, '49721413', '15201912130003'),
(24000, 8, '22142501', '15201912140001'),
(14000, 2, '31411273', '15201912140001'),
(7000, 1, '31411273', '15201912290001'),
(15000, 5, '22142501', '15201912290001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` char(12) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `passview_user` varchar(255) NOT NULL,
  `role_user` enum('Manager','Admin','User') NOT NULL,
  `status_user` enum('TRUE','FALSE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `email_user`, `password_user`, `passview_user`, `role_user`, `status_user`) VALUES
('000000000000', 'Administrator', '10111001@knowledge.com', 'ab0711882d9b6dc99c7cfe614f109bb5', '000000', 'Admin', 'TRUE'),
('811625813052', 'Test', 'a@mail.com', 'ed2b1f468c5f915f3f1cf75d7068baae', '538887', 'User', 'TRUE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_log`
--

CREATE TABLE `user_log` (
  `id_user_log` char(20) NOT NULL,
  `type_user_log` enum('add user','remove user','reset user','activation user','presence user') NOT NULL,
  `describe_user_log` text NOT NULL,
  `date_user_log` datetime NOT NULL,
  `id_user` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_log`
--

INSERT INTO `user_log` (`id_user_log`, `type_user_log`, `describe_user_log`, `date_user_log`, `id_user`) VALUES
('20190906151806123912', 'add user', 'Administrator add New User : Test / id: 811625813052', '2019-09-06 15:18:06', '000000000000'),
('20190906151818615798', 'presence user', 'Test Login', '2019-09-06 15:18:18', '811625813052'),
('20190906151831284374', 'activation user', 'Test Activation User ', '2019-09-06 15:18:31', '811625813052'),
('20190906154650452842', 'presence user', 'Test | Login', '2019-09-06 15:46:50', '811625813052'),
('20190906214901584952', 'presence user', 'Test | Login', '2019-09-06 21:49:00', '811625813052'),
('20190908235752823989', 'presence user', 'Test | Login', '2019-09-08 23:57:52', '811625813052'),
('20190923041438741639', 'presence user', 'Administrator | Login', '2019-09-23 04:14:38', '000000000000'),
('20190923042229496474', 'presence user', 'Administrator | Logout', '2019-09-23 04:22:29', '000000000000'),
('20190923042251689933', 'presence user', 'Administrator | Login', '2019-09-23 04:22:51', '000000000000'),
('20190923042304383599', 'presence user', 'Administrator | Logout', '2019-09-23 04:23:04', '000000000000'),
('20190923042356361374', 'presence user', 'Administrator | Login', '2019-09-23 04:23:56', '000000000000'),
('20190923052009635739', 'presence user', 'Administrator | Logout', '2019-09-23 05:20:09', '000000000000'),
('20190923052112347689', 'presence user', 'Administrator | Login', '2019-09-23 05:21:12', '000000000000'),
('20190923064945244535', 'presence user', 'Administrator | Logout', '2019-09-23 06:49:45', '000000000000'),
('20190923223906582017', 'presence user', 'Administrator | Login', '2019-09-23 22:39:06', '000000000000'),
('20190923230145458383', 'presence user', 'Administrator | Logout', '2019-09-23 23:01:45', '000000000000'),
('20190924083338996007', 'presence user', 'Administrator | Login', '2019-09-24 08:33:38', '000000000000'),
('20190924105124135836', 'presence user', 'Administrator | Logout', '2019-09-24 10:51:24', '000000000000'),
('20190924141447168127', 'presence user', 'Administrator | Login', '2019-09-24 14:14:47', '000000000000'),
('20190924141459558425', 'presence user', 'Administrator | Logout', '2019-09-24 14:14:59', '000000000000'),
('20190924141654921841', 'presence user', 'Administrator | Login', '2019-09-24 14:16:54', '000000000000'),
('20190924141657799224', 'presence user', 'Administrator | Logout', '2019-09-24 14:16:57', '000000000000'),
('20190924141740596269', 'presence user', 'Administrator | Login', '2019-09-24 14:17:40', '000000000000'),
('20190924143753898506', 'presence user', 'Administrator | Logout', '2019-09-24 14:37:53', '000000000000'),
('20190924143957995335', 'presence user', 'Administrator | Login', '2019-09-24 14:39:57', '000000000000'),
('20190924152258268988', 'presence user', 'Administrator | Logout', '2019-09-24 15:22:58', '000000000000'),
('20190924152353532505', 'presence user', 'Administrator | Login', '2019-09-24 15:23:53', '000000000000'),
('20190924170638955566', 'presence user', 'Administrator | Logout', '2019-09-24 17:06:38', '000000000000'),
('20190924170653139083', 'presence user', 'Administrator | Login', '2019-09-24 17:06:53', '000000000000'),
('20190924170754684098', 'presence user', 'Administrator | Logout', '2019-09-24 17:07:54', '000000000000'),
('20190924170807421121', 'presence user', 'Administrator | Login', '2019-09-24 17:08:07', '000000000000'),
('20190924170859573586', 'presence user', 'Administrator | Logout', '2019-09-24 17:08:59', '000000000000'),
('20190924222658582242', 'presence user', 'Administrator | Login', '2019-09-24 22:26:58', '000000000000'),
('20190924230531951488', 'presence user', 'Administrator | Logout', '2019-09-24 23:05:31', '000000000000'),
('20190924230709895002', 'presence user', 'Administrator | Login', '2019-09-24 23:07:09', '000000000000'),
('20190924230937135085', 'presence user', 'Administrator | Logout', '2019-09-24 23:09:37', '000000000000'),
('20190924231024527681', 'presence user', 'Administrator | Login', '2019-09-24 23:10:24', '000000000000'),
('20190926062900535663', 'presence user', 'Administrator | Login', '2019-09-26 06:29:00', '000000000000'),
('20190926074057668815', 'presence user', 'Administrator | Logout', '2019-09-26 07:40:57', '000000000000'),
('20190926074108752971', 'presence user', 'Administrator | Login', '2019-09-26 07:41:08', '000000000000'),
('20190927134631189245', 'presence user', 'Administrator | Login', '2019-09-27 13:46:31', '000000000000'),
('20190927134653746264', 'presence user', 'Administrator | Logout', '2019-09-27 13:46:53', '000000000000'),
('20190927134718722806', 'presence user', 'Administrator | Login', '2019-09-27 13:47:18', '000000000000'),
('20190927134726429506', 'presence user', 'Administrator | Logout', '2019-09-27 13:47:26', '000000000000'),
('20190927134821704286', 'presence user', 'Test | Login', '2019-09-27 13:48:21', '811625813052'),
('20190927135029792549', 'presence user', 'Test | Logout', '2019-09-27 13:50:29', '811625813052'),
('20190927135102228444', 'presence user', 'Test | Login', '2019-09-27 13:51:02', '811625813052'),
('20190927135117762957', 'presence user', 'Test | Logout', '2019-09-27 13:51:17', '811625813052'),
('20190927135129939195', 'presence user', 'Test | Login', '2019-09-27 13:51:29', '811625813052'),
('20190927135409836522', 'presence user', 'Test | Logout', '2019-09-27 13:54:09', '811625813052'),
('20190927135418992368', 'presence user', 'Test | Login', '2019-09-27 13:54:18', '811625813052'),
('20190927203824229317', 'presence user', 'Test | Login', '2019-09-27 20:38:24', '811625813052'),
('20190927204455949798', 'presence user', 'Administrator | Login', '2019-09-27 20:44:55', '000000000000'),
('20190927204509741728', 'presence user', 'Administrator | Logout', '2019-09-27 20:45:09', '000000000000'),
('20190927230236814521', 'presence user', 'Test | Logout', '2019-09-27 23:02:36', '811625813052'),
('20190928080718555931', 'presence user', 'Test | Login', '2019-09-28 08:07:18', '811625813052'),
('20190928101039237123', 'presence user', 'Test | Logout', '2019-09-28 10:10:39', '811625813052'),
('20190928101039692776', 'presence user', 'Test | Logout', '2019-09-28 10:10:39', '811625813052'),
('20190928224431644249', 'presence user', 'Test | Login', '2019-09-28 22:44:31', '811625813052'),
('20190929001934819221', 'presence user', 'Test | Logout', '2019-09-29 00:19:34', '811625813052'),
('20190929002121457532', 'presence user', 'Test | Login', '2019-09-29 00:21:21', '811625813052'),
('20190929002332796884', 'presence user', 'Test | Logout', '2019-09-29 00:23:32', '811625813052'),
('20190929002358951198', 'presence user', 'Test | Login', '2019-09-29 00:23:58', '811625813052'),
('20190929002407996489', 'presence user', 'Test | Logout', '2019-09-29 00:24:07', '811625813052'),
('20190929002412485871', 'presence user', 'Test | Login', '2019-09-29 00:24:12', '811625813052'),
('20190929010224295267', 'presence user', 'Test | Logout', '2019-09-29 01:02:24', '811625813052'),
('20191001150155629144', 'presence user', 'Test | Login', '2019-10-01 15:01:55', '811625813052'),
('20191114001946483978', 'presence user', 'Test | Login', '2019-11-14 00:19:46', '811625813052'),
('20191114014234544061', 'presence user', 'Test | Logout', '2019-11-14 01:42:34', '811625813052'),
('20191114150247794735', 'presence user', 'Test | Login', '2019-11-14 15:02:47', '811625813052'),
('20191115215519227515', 'presence user', 'Test | Login', '2019-11-15 21:55:19', '811625813052'),
('20191116001632212758', 'presence user', 'Test | Logout', '2019-11-16 00:16:32', '811625813052'),
('20191116002042383992', 'presence user', 'Administrator | Login', '2019-11-16 00:20:42', '000000000000'),
('20191116002146369302', 'presence user', 'Administrator | Logout', '2019-11-16 00:21:46', '000000000000'),
('20191116003351389925', 'presence user', 'Test | Login', '2019-11-16 00:33:51', '811625813052'),
('20191129150646364733', 'presence user', 'Administrator | Login', '2019-11-29 15:06:46', '000000000000'),
('20191129153904246057', 'presence user', 'Administrator | Login', '2019-11-29 15:39:04', '000000000000'),
('20191129210501151624', 'presence user', 'Administrator | Login', '2019-11-29 21:05:01', '000000000000'),
('20191208114620605565', 'presence user', 'Test | Login', '2019-12-08 11:46:20', '811625813052'),
('20191208133939511846', 'presence user', 'Test | Logout', '2019-12-08 13:39:39', '811625813052'),
('20191208133949315366', 'presence user', 'Test | Login', '2019-12-08 13:39:49', '811625813052'),
('20191208134215225197', 'presence user', 'Test | Logout', '2019-12-08 13:42:15', '811625813052'),
('20191208155547794253', 'presence user', 'Test | Login', '2019-12-08 15:55:47', '811625813052'),
('20191208161949824316', 'presence user', 'Test | Logout', '2019-12-08 16:19:49', '811625813052'),
('20191208162003461987', 'presence user', 'Test | Login', '2019-12-08 16:20:03', '811625813052'),
('20191208162231324245', 'presence user', 'Test | Login', '2019-12-08 16:22:31', '811625813052'),
('20191209103139885025', 'presence user', 'Administrator | Login', '2019-12-09 10:31:39', '000000000000'),
('20191209105340776046', 'presence user', 'Administrator | Login', '2019-12-09 10:53:40', '000000000000'),
('20191209105616807501', 'presence user', 'Administrator | Login', '2019-12-09 10:56:16', '000000000000'),
('20191209105857991126', 'presence user', 'Administrator | Login', '2019-12-09 10:58:57', '000000000000'),
('20191210030704204215', 'presence user', 'Administrator | Login', '2019-12-10 03:07:04', '000000000000'),
('20191210033324495624', 'presence user', 'Administrator | Logout', '2019-12-10 03:33:24', '000000000000'),
('20191210033408954581', 'presence user', 'Administrator | Login', '2019-12-10 03:34:08', '000000000000'),
('20191210042947217046', 'presence user', 'Administrator | Logout', '2019-12-10 04:29:47', '000000000000'),
('20191210043643304548', 'presence user', 'Administrator | Logout', '2019-12-10 04:36:43', '000000000000'),
('20191210043953849339', 'presence user', 'Administrator | Login', '2019-12-10 04:39:53', '000000000000'),
('20191210044228301292', 'presence user', 'Administrator | Logout', '2019-12-10 04:42:28', '000000000000'),
('20191210044240737338', 'presence user', 'Administrator | Login', '2019-12-10 04:42:40', '000000000000'),
('20191210123002605093', 'presence user', 'Administrator | Login', '2019-12-10 12:30:02', '000000000000'),
('20191210132833314492', 'presence user', 'Administrator | Logout', '2019-12-10 13:28:33', '000000000000'),
('20191210134428934673', 'presence user', 'Administrator | Login', '2019-12-10 13:44:28', '000000000000'),
('20191210200131601645', 'presence user', 'Administrator | Login', '2019-12-10 20:01:31', '000000000000'),
('20191211070325734428', 'presence user', 'Administrator | Login', '2019-12-11 07:03:25', '000000000000'),
('20191211080121159832', 'presence user', 'Administrator | Logout', '2019-12-11 08:01:21', '000000000000'),
('20191211222104181877', 'presence user', 'Administrator | Login', '2019-12-11 22:21:04', '000000000000'),
('20191211223636898506', 'presence user', 'Administrator | Logout', '2019-12-11 22:36:36', '000000000000'),
('20191211223649995335', 'presence user', 'Administrator | Login', '2019-12-11 22:36:49', '000000000000'),
('20191212012810521253', 'presence user', 'Administrator | Logout', '2019-12-12 01:28:10', '000000000000'),
('20191212214123548023', 'presence user', 'Administrator | Login', '2019-12-12 21:41:23', '000000000000'),
('20191212221052936061', 'presence user', 'Administrator | Logout', '2019-12-12 22:10:52', '000000000000'),
('20191212221120383141', 'presence user', 'Administrator | Login', '2019-12-12 22:11:20', '000000000000'),
('20191212221458523435', 'presence user', 'Administrator | Logout', '2019-12-12 22:14:58', '000000000000'),
('20191212221508343826', 'presence user', 'Administrator | Login', '2019-12-12 22:15:08', '000000000000'),
('20191212222024288504', 'presence user', 'Administrator | Logout', '2019-12-12 22:20:24', '000000000000'),
('20191212222256635795', 'presence user', 'Administrator | Login', '2019-12-12 22:22:56', '000000000000'),
('20191212230658459144', 'presence user', 'Administrator | Logout', '2019-12-12 23:06:58', '000000000000'),
('20191212230658815997', 'presence user', 'Administrator | Logout', '2019-12-12 23:06:58', '000000000000'),
('20191212235758469434', 'presence user', 'Administrator | Login', '2019-12-12 23:57:58', '000000000000'),
('20191213000242212735', 'presence user', 'Administrator | Logout', '2019-12-13 00:02:42', '000000000000'),
('20191213000306471516', 'presence user', 'Administrator | Login', '2019-12-13 00:03:06', '000000000000'),
('20191213001525964847', 'presence user', 'Administrator | Logout', '2019-12-13 00:15:25', '000000000000'),
('20191213001538249617', 'presence user', 'Administrator | Login', '2019-12-13 00:15:38', '000000000000'),
('20191213005952577964', 'presence user', 'Administrator | Logout', '2019-12-13 00:59:52', '000000000000'),
('20191213010111246258', 'presence user', 'Administrator | Login', '2019-12-13 01:01:11', '000000000000'),
('20191213011838729165', 'presence user', 'Administrator | Logout', '2019-12-13 01:18:38', '000000000000'),
('20191213012359484548', 'presence user', 'Administrator | Login', '2019-12-13 01:23:59', '000000000000'),
('20191213022350873749', 'presence user', 'Administrator | Logout', '2019-12-13 02:23:50', '000000000000'),
('20191213022406155174', 'presence user', 'Administrator | Login', '2019-12-13 02:24:06', '000000000000'),
('20191213065341698924', 'presence user', 'Administrator | Login', '2019-12-13 06:53:41', '000000000000'),
('20191213120019274429', 'presence user', 'Administrator | Login', '2019-12-13 12:00:19', '000000000000'),
('20191213124556691454', 'presence user', 'Administrator | Logout', '2019-12-13 12:45:56', '000000000000'),
('20191213124727273489', 'presence user', 'Administrator | Login', '2019-12-13 12:47:27', '000000000000'),
('20191213152533586138', 'presence user', 'Administrator | Login', '2019-12-13 15:25:33', '000000000000'),
('20191213153943549771', 'presence user', 'Administrator | Logout', '2019-12-13 15:39:43', '000000000000'),
('20191213154030661784', 'presence user', 'Administrator | Login', '2019-12-13 15:40:30', '000000000000'),
('20191213163018573475', 'presence user', 'Administrator | Logout', '2019-12-13 16:30:18', '000000000000'),
('20191213163116222286', 'presence user', 'Administrator | Login', '2019-12-13 16:31:16', '000000000000'),
('20191213180438883469', 'presence user', 'Administrator | Logout', '2019-12-13 18:04:38', '000000000000'),
('20191213180702604018', 'presence user', 'Administrator | Login', '2019-12-13 18:07:02', '000000000000'),
('20191213182008133216', 'presence user', 'Administrator | Logout', '2019-12-13 18:20:08', '000000000000'),
('20191213234119246707', 'presence user', 'Administrator | Login', '2019-12-13 23:41:19', '000000000000'),
('20191214071042289087', 'presence user', 'Administrator | Login', '2019-12-14 07:10:42', '000000000000'),
('20191214135318354723', 'presence user', 'Administrator | Login', '2019-12-14 13:53:18', '000000000000'),
('20191229145851204528', 'presence user', 'Test | Login', '2019-12-29 14:58:51', '811625813052'),
('20191229150436448998', 'presence user', 'Test | Logout', '2019-12-29 15:04:36', '811625813052'),
('20191229150458913153', 'presence user', 'Test | Login', '2019-12-29 15:04:58', '811625813052'),
('20191229160444757203', 'presence user', 'Test | Logout', '2019-12-29 16:04:44', '811625813052'),
('20191229232948747338', 'presence user', 'Test | Login', '2019-12-29 23:29:48', '811625813052'),
('20191229234223648716', 'presence user', 'Test | Logout', '2019-12-29 23:42:23', '811625813052'),
('20191229235320211627', 'presence user', 'Test | Login', '2019-12-29 23:53:20', '811625813052'),
('20191230000458246875', 'presence user', 'Test | Logout', '2019-12-30 00:04:58', '811625813052'),
('20191230000704186222', 'presence user', 'Test | Login', '2019-12-30 00:07:04', '811625813052'),
('20191230071430543132', 'presence user', 'Test | Login', '2019-12-30 07:14:30', '811625813052'),
('20191230072113994956', 'presence user', 'Test | Logout', '2019-12-30 07:21:13', '811625813052'),
('20191230144310768545', 'presence user', 'Test | Login', '2019-12-30 14:43:10', '811625813052'),
('20191230233402162629', 'presence user', 'Test | Login', '2019-12-30 23:34:02', '811625813052');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id_credit`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_credit` (`id_transaction`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `item_log`
--
ALTER TABLE `item_log`
  ADD PRIMARY KEY (`id_item_log`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `region_i`
--
ALTER TABLE `region_i`
  ADD PRIMARY KEY (`id_region_i`);

--
-- Indexes for table `region_ii`
--
ALTER TABLE `region_ii`
  ADD PRIMARY KEY (`id_region_ii`),
  ADD KEY `id_region_i` (`id_region_i`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD KEY `id_item` (`id_item`),
  ADD KEY `transaction_detail_ibfk_2` (`id_transaction`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id_user_log`),
  ADD KEY `id_user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `credit_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `credit_ibfk_3` FOREIGN KEY (`id_transaction`) REFERENCES `transaction` (`id_transaction`);

--
-- Ketidakleluasaan untuk tabel `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `item_category` (`id_category`);

--
-- Ketidakleluasaan untuk tabel `item_log`
--
ALTER TABLE `item_log`
  ADD CONSTRAINT `item_log_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `item_log_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `region_ii`
--
ALTER TABLE `region_ii`
  ADD CONSTRAINT `region_ii_ibfk_1` FOREIGN KEY (`id_region_i`) REFERENCES `region_i` (`id_region_i`);

--
-- Ketidakleluasaan untuk tabel `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD CONSTRAINT `transaction_detail_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `transaction_detail_ibfk_2` FOREIGN KEY (`id_transaction`) REFERENCES `transaction` (`id_transaction`);

--
-- Ketidakleluasaan untuk tabel `user_log`
--
ALTER TABLE `user_log`
  ADD CONSTRAINT `user_log_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
