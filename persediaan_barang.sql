-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2023 at 03:26 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `persediaan_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_barang`
--

CREATE TABLE `db_barang` (
  `kode_barang` varchar(7) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_user` int(3) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `db_barang`
--

INSERT INTO `db_barang` (`kode_barang`, `nama_barang`, `harga_beli`, `harga_jual`, `satuan`, `stok`, `created_user`, `created_date`, `updated_user`, `updated_date`) VALUES
('B000001', 'Sosis Single', 10000, 20000, 'Box', 10, 8, '2023-05-30 11:40:06', 8, '2023-06-17 13:14:24'),
('B000002', 'donat', 10000, 20000, 'Kotak', 5, 8, '2023-06-17 13:02:23', 8, '2023-06-19 13:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `db_barang_keluar`
--

CREATE TABLE `db_barang_keluar` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `kode_barang` varchar(7) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `expired` date NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db_barang_keluar`
--

INSERT INTO `db_barang_keluar` (`kode_transaksi`, `tanggal_keluar`, `kode_barang`, `jumlah_keluar`, `expired`, `created_user`, `created_date`) VALUES
('TK-2023-0000001', '2023-06-19', 'B000002', 5, '0000-00-00', 8, '2023-06-19 13:24:25');

-- --------------------------------------------------------

--
-- Table structure for table `db_barang_masuk`
--

CREATE TABLE `db_barang_masuk` (
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `kode_barang` varchar(7) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `expired` date NOT NULL,
  `created_user` int(3) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ex_p` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `db_barang_masuk`
--

INSERT INTO `db_barang_masuk` (`kode_transaksi`, `tanggal_masuk`, `kode_barang`, `jumlah_masuk`, `expired`, `created_user`, `created_date`, `ex_p`) VALUES
('TM-2023-0000001', '2023-06-17', 'B000001', 10, '2024-02-17', 8, '2023-06-17 14:37:13', '2023-09-30'),
('TM-2023-0000002', '2023-06-17', 'B000002', 10, '2023-09-17', 8, '2023-06-17 13:14:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id_user` int(3) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Super Admin','Manajer','Gudang') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`id_user`, `username`, `nama_user`, `password`, `email`, `telepon`, `foto`, `hak_akses`, `status`, `created_at`, `updated_at`) VALUES
(2, 'lifia12', 'Lifia Indriani', '202cb962ac59075b964b07152d234b70', 'lif@gmail.com', '089521348751', 'kadina.png', 'Gudang', 'aktif', '2017-04-01 08:15:15', '2023-05-25 18:52:33'),
(3, 'drean12', 'Andrean Utama Putra', '202cb962ac59075b964b07152d234b70', 'andreanutamaputra12@gmail.com', '0895324779376', '1469574176_users-7.png', 'Manajer', 'aktif', '2017-04-01 08:15:15', '2023-05-23 13:19:18'),
(8, 'admin', 'administrator', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, 'Super Admin', 'aktif', '2022-05-20 05:10:20', '2022-05-20 05:10:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_barang`
--
ALTER TABLE `db_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `created_user` (`created_user`),
  ADD KEY `updated_user` (`updated_user`);

--
-- Indexes for table `db_barang_keluar`
--
ALTER TABLE `db_barang_keluar`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `created_user` (`created_user`);

--
-- Indexes for table `db_barang_masuk`
--
ALTER TABLE `db_barang_masuk`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `id_barang` (`kode_barang`),
  ADD KEY `created_user` (`created_user`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `level` (`hak_akses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id_user` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_barang`
--
ALTER TABLE `db_barang`
  ADD CONSTRAINT `db_barang_ibfk_1` FOREIGN KEY (`created_user`) REFERENCES `db_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_barang_ibfk_2` FOREIGN KEY (`updated_user`) REFERENCES `db_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `db_barang_masuk`
--
ALTER TABLE `db_barang_masuk`
  ADD CONSTRAINT `db_barang_masuk_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `db_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_barang_masuk_ibfk_2` FOREIGN KEY (`created_user`) REFERENCES `db_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
