-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2018 at 10:19 AM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 7.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukkupk`
--

-- --------------------------------------------------------

--
-- Table structure for table `asesor`
--

CREATE TABLE `asesor` (
  `id_asesor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_perusahaan` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `kontak` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_komponen`
--

CREATE TABLE `detail_komponen` (
  `id_detail_komponen` int(11) NOT NULL,
  `id_komponen` int(11) NOT NULL,
  `skor_maksimal` int(11) NOT NULL,
  `bobot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_komponen`
--

INSERT INTO `detail_komponen` (`id_detail_komponen`, `id_komponen`, `skor_maksimal`, `bobot`) VALUES
(2, 2, 60, 30),
(3, 7, 50, 40),
(4, 8, 20, 10),
(6, 25, 20, 10),
(7, 1, 20, 10);

-- --------------------------------------------------------

--
-- Table structure for table `detail_penilaian`
--

CREATE TABLE `detail_penilaian` (
  `id_detail_penilaian` int(11) NOT NULL,
  `id_penilaian` int(11) NOT NULL,
  `id_komponen` int(11) NOT NULL,
  `skor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_asesor`
--

CREATE TABLE `dokumen_asesor` (
  `id_dokumen` int(11) NOT NULL,
  `nama_dokumen` text NOT NULL,
  `tanggal_diupload` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_asesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `indikator`
--

CREATE TABLE `indikator` (
  `id_indikator` int(11) NOT NULL,
  `id_komponen` int(11) NOT NULL,
  `indikator` text NOT NULL,
  `standar_skor` enum('tidak','7,0 - 7,9','8,0 - 8,9','9,0 - 10') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `indikator`
--

INSERT INTO `indikator` (`id_indikator`, `id_komponen`, `indikator`, `standar_skor`) VALUES
(1, 3, 'Menginstall software aplikasi sesuai SOP secara mandiri', '9,0 - 10'),
(2, 3, 'Menginstall software aplikasi sesuai SOP dengan bantuan', '8,0 - 8,9'),
(3, 3, 'Menginstall software aplikasi tidak sesuai SOP secara mandiri', '7,0 - 7,9'),
(5, 4, 'Hasil install normal bekerja sesuai SOP', '9,0 - 10'),
(6, 4, 'Hasil install tidak bekerja sesuai SOP dan dapat diperbaiki secara mandiri', '8,0 - 8,9'),
(7, 4, 'Hasil install tidak bekerja sesuai SOP dan diperbaiki dengan bantuan', '7,0 - 7,9'),
(8, 4, 'Hasil install tidak bekerja sesuai SOP dan harus install ulang', 'tidak'),
(9, 6, 'Prosedur dan fungsi dibuat sesuai SOP', '9,0 - 10'),
(10, 6, 'Prosedur dan fungsi dibuat sesuai SOP tetapi ada kesalahan', '8,0 - 8,9'),
(11, 6, 'Prosedur dan fungsi tidak dibuat sesuai SOP', '7,0 - 7,9'),
(12, 6, 'Prosedur dan fungsi tidak dibuat', 'tidak'),
(15, 10, 'Library pemrograman grafik digunakan dan sesuai SOP', '9,0 - 10'),
(16, 10, 'Library pemrograman grafik dapat digunakan tetapi tidak sesuai SOP', '8,0 - 8,9'),
(17, 10, 'Library pemrograman grafik tidak dapat digunakan', '7,0 - 7,9'),
(18, 10, 'Library pemrograman grafik tidak dibuat', 'tidak'),
(19, 16, 'Tabel dibuat dan diisi serta sesuai SOP', '9,0 - 10'),
(20, 16, 'Tabel dibuat dan diisi tetapi tidak sesuai SOP', '8,0 - 8,9'),
(21, 16, 'Tabel dibuat dan akan tetapi tidak diisi', '7,0 - 7,9'),
(22, 16, 'Tabel tidak dibuat', 'tidak'),
(23, 17, 'View dibuat dan diisi serta sesuai SOP', '9,0 - 10'),
(24, 17, 'View dibuat dan diisi ada perbaikan', '8,0 - 8,9'),
(25, 17, 'View dibuat tidak sesuai SOP', '7,0 - 7,9'),
(26, 17, 'View tidak dibuat', 'tidak'),
(27, 3, 'Instalasi tidak sesuai', 'tidak');

-- --------------------------------------------------------

--
-- Table structure for table `komponen`
--

CREATE TABLE `komponen` (
  `id_komponen` int(11) NOT NULL,
  `komponen` text NOT NULL,
  `parent_komponen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komponen`
--

INSERT INTO `komponen` (`id_komponen`, `komponen`, `parent_komponen`) VALUES
(1, 'Persiapan Kerja', NULL),
(2, 'Proses (Sistematika & Cara Kerja)', NULL),
(3, 'Menginstal software sesuai dengan kebutuhan', 1),
(4, 'Mengecek hasil instalasi software', 1),
(5, 'Menerapkan algoritma pemrograman', 2),
(6, 'Menggunakan Prosedur dan Fungsi', 5),
(7, 'Hasil Kerja', NULL),
(8, 'Sikap Kerja', NULL),
(10, 'Menggunakan library pemrograman grafis', 5),
(11, 'Membuat aplikasi basis data menggunakan SQL', 2),
(12, 'Membuat halaman web dinamis/form', 2),
(13, 'Membuat aplikasi desktop', 2),
(14, 'Membuat aplikasi program basis data', 2),
(15, 'Mengintegrasikan sebuah basis data dengan sebuah situs web', 2),
(16, 'Membuat dan mengisi table', 11),
(17, 'Mengoperasikan tabel dan View table', 11),
(18, 'Membuat web menggunakan bahasa pemrograman server side', 12),
(19, 'Menambahkan function pada halaman web dinamis', 12),
(20, 'Membuat aplikasi desktop menggunakan bahasa script pemrograman', 13),
(21, 'Menerapkan konsep pemrograman berorientasi objek', 13),
(22, 'Menggunakan triggers', 14),
(23, 'Menerapkan Administrasi Database Server', 14),
(24, 'Membuat koneksi basis data', 15),
(25, 'Waktu', NULL),
(27, 'Halaman Web', 7),
(28, 'Layout', 27),
(29, 'Link', 27),
(30, 'User interface', 27),
(31, 'Komposisi warna', 27),
(32, 'Aplikasi desktop', 7),
(33, 'Menubar (menu/submenu)', 32),
(35, 'Toolbar (icon bar)', 32),
(36, 'User interface', 32),
(37, 'Database', 7),
(38, 'Tabel', 37),
(39, 'Relation', 37),
(40, 'Query', 37),
(41, 'Report', 7),
(42, 'Keamanan Data', 7),
(43, 'Back up data', 42),
(44, 'Pembatasan akses', 42),
(45, 'Bekerja sesuai kaidah keselamatan kerja', 8),
(46, 'Bekerja sesuai kaidah keselamatan alat dan manusia', 8),
(47, 'Waktu persiapan kerja', 25),
(48, 'Waktu pelaksanaan', 25);

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_asesor` int(11) NOT NULL,
  `id_peserta` varchar(30) NOT NULL,
  `paket_soal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(200) NOT NULL,
  `alamat_perusahaan` text NOT NULL,
  `direktur_perusahaan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id_peserta` varchar(30) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `kontak` varchar(50) NOT NULL,
  `id_tahun_ajar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajar`
--

CREATE TABLE `tahun_ajar` (
  `id_tahun_ajar` int(11) NOT NULL,
  `tahun_ajar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_ajar`
--

INSERT INTO `tahun_ajar` (`id_tahun_ajar`, `tahun_ajar`) VALUES
(1, '2017-2018'),
(2, '2018-2019'),
(3, '2019-2020');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_aktif`
--

CREATE TABLE `tahun_aktif` (
  `id_tahun_aktif` int(11) NOT NULL,
  `id_tahun_ajar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_aktif`
--

INSERT INTO `tahun_aktif` (`id_tahun_aktif`, `id_tahun_ajar`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `akses` enum('administrator','asesor') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `akses`, `email`, `remember_token`) VALUES
(28, 'Administrator', '$2y$10$Uqlzr3UFIN.W5FcW7Yjc5O7wyKQE4fcXx86w1Qa05UeL9XIIXKzvK', 'administrator', NULL, 'QE8Q4jI67NxVII57ogJM8YmMCF5iUAszKfww4HnwvFudfZHly87Etwr7226U');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`id_asesor`),
  ADD KEY `asesor_ibfk_1` (`id_user`),
  ADD KEY `asesor_ibfk_2` (`id_perusahaan`);

--
-- Indexes for table `detail_komponen`
--
ALTER TABLE `detail_komponen`
  ADD PRIMARY KEY (`id_detail_komponen`),
  ADD KEY `id_komponen` (`id_komponen`);

--
-- Indexes for table `detail_penilaian`
--
ALTER TABLE `detail_penilaian`
  ADD PRIMARY KEY (`id_detail_penilaian`),
  ADD KEY `detail_penilaian_ibfk_1` (`id_komponen`),
  ADD KEY `detail_penilaian_ibfk_2` (`id_penilaian`);

--
-- Indexes for table `dokumen_asesor`
--
ALTER TABLE `dokumen_asesor`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `dokumen_asesor_ibfk_1` (`id_asesor`);

--
-- Indexes for table `indikator`
--
ALTER TABLE `indikator`
  ADD PRIMARY KEY (`id_indikator`),
  ADD KEY `id_komponen` (`id_komponen`);

--
-- Indexes for table `komponen`
--
ALTER TABLE `komponen`
  ADD PRIMARY KEY (`id_komponen`),
  ADD KEY `parent_komponen` (`parent_komponen`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `penilaian_ibfk_1` (`id_asesor`),
  ADD KEY `penilaian_ibfk_2` (`id_peserta`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id_peserta`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `tahun_ajar`
--
ALTER TABLE `tahun_ajar`
  ADD PRIMARY KEY (`id_tahun_ajar`);

--
-- Indexes for table `tahun_aktif`
--
ALTER TABLE `tahun_aktif`
  ADD PRIMARY KEY (`id_tahun_aktif`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asesor`
--
ALTER TABLE `asesor`
  MODIFY `id_asesor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `detail_komponen`
--
ALTER TABLE `detail_komponen`
  MODIFY `id_detail_komponen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `detail_penilaian`
--
ALTER TABLE `detail_penilaian`
  MODIFY `id_detail_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=813;

--
-- AUTO_INCREMENT for table `dokumen_asesor`
--
ALTER TABLE `dokumen_asesor`
  MODIFY `id_dokumen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `indikator`
--
ALTER TABLE `indikator`
  MODIFY `id_indikator` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `komponen`
--
ALTER TABLE `komponen`
  MODIFY `id_komponen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tahun_ajar`
--
ALTER TABLE `tahun_ajar`
  MODIFY `id_tahun_ajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tahun_aktif`
--
ALTER TABLE `tahun_aktif`
  MODIFY `id_tahun_aktif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `asesor_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `asesor_ibfk_2` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`) ON DELETE CASCADE;

--
-- Constraints for table `detail_komponen`
--
ALTER TABLE `detail_komponen`
  ADD CONSTRAINT `detail_komponen_ibfk_1` FOREIGN KEY (`id_komponen`) REFERENCES `komponen` (`id_komponen`);

--
-- Constraints for table `detail_penilaian`
--
ALTER TABLE `detail_penilaian`
  ADD CONSTRAINT `detail_penilaian_ibfk_1` FOREIGN KEY (`id_komponen`) REFERENCES `komponen` (`id_komponen`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_penilaian_ibfk_2` FOREIGN KEY (`id_penilaian`) REFERENCES `penilaian` (`id_penilaian`) ON DELETE CASCADE;

--
-- Constraints for table `dokumen_asesor`
--
ALTER TABLE `dokumen_asesor`
  ADD CONSTRAINT `dokumen_asesor_ibfk_1` FOREIGN KEY (`id_asesor`) REFERENCES `asesor` (`id_asesor`) ON DELETE CASCADE;

--
-- Constraints for table `indikator`
--
ALTER TABLE `indikator`
  ADD CONSTRAINT `indikator_ibfk_1` FOREIGN KEY (`id_komponen`) REFERENCES `komponen` (`id_komponen`);

--
-- Constraints for table `komponen`
--
ALTER TABLE `komponen`
  ADD CONSTRAINT `komponen_ibfk_1` FOREIGN KEY (`parent_komponen`) REFERENCES `komponen` (`id_komponen`);

--
-- Constraints for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_asesor`) REFERENCES `asesor` (`id_asesor`) ON DELETE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id_peserta`) ON DELETE CASCADE;

--
-- Constraints for table `peserta`
--
ALTER TABLE `peserta`
  ADD CONSTRAINT `peserta_ibfk_1` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `tahun_aktif`
--
ALTER TABLE `tahun_aktif`
  ADD CONSTRAINT `tahun_aktif_ibfk_1` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `tahun_ajar` (`id_tahun_ajar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
