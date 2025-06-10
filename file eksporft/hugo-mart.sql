-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 04 Jun 2025 pada 10.46
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hugo-mart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jual`
--

CREATE TABLE `tb_jual` (
  `id_jual` varchar(10) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `tgl_jual` datetime NOT NULL,
  `total` int(11) NOT NULL,
  `diskon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jualdtl`
--

CREATE TABLE `tb_jualdtl` (
  `id_jual` varchar(10) NOT NULL,
  `id_produk` varchar(10) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_ktg`
--

CREATE TABLE `tb_ktg` (
  `id_kategori` varchar(10) NOT NULL,
  `nm_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_ktg`
--

INSERT INTO `tb_ktg` (`id_kategori`, `nm_kategori`) VALUES
('K002', 'Daging Ayam'),
('K003', 'Daging Sapi'),
('K004', 'Sayuran'),
('K005', 'Buah'),
('K006', 'Ikan'),
('K007', 'Frozen Food'),
('K008', 'Bumbu Dapur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id_pesanan` varchar(10) NOT NULL,
  `id_produk` varchar(10) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `id_user` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` varchar(10) NOT NULL,
  `nm_produk` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `desk` text,
  `id_kategori` varchar(10) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `nm_produk`, `harga`, `stok`, `desk`, `id_kategori`, `gambar`) VALUES
('P001', 'Bawang Merah', 24000, 50, 'Bawang merah berkualitas tinggi,merah segar, berkualitas, dan memiliki rasa yang khas', 'K008', 'acb26155dc5cc65cbe3f9b7725eed229.jpg'),
('P002', 'Dada Ayam', 22500, 50, 'Daging ayam bagian dada,daging tebal dan berkualitas', 'K002', '09b4356b6dea4cc24fe77716c8d46c87.jpg'),
('P003', 'Cabe Rawit', 21500, 25, 'Cabe kecil kualitas tinggi, di jamin pedas dan harga terjangkau', 'K008', 'd7da02813ca7810a81d330126a6a4b21.jpg'),
('P004', 'Daging Salmon', 250000, 15, 'Daging ikan salmon, dengan tekstur yang lembut dan gurih, merupakan pilihan sempurna untuk hidangan lezat dan bergiz', 'K006', '2cd52c9b68c3f5e0ae80eb7e8680a466.jpg'),
('P005', 'Iga Sapi', 150000, 10, 'Daging dijamin segar, dan harga terjangkau', 'K003', '5ce1d4cf1b388f5208b1abf189258c9b.jpg'),
('P006', 'Sawi Hijau', 15000, 5, 'Sayur sawi yang segar dan murah', 'K004', '1d21287042d0410001dbf9dc2fa24fff.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('admin','customer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `status`) VALUES
('U001', 'RahmadAris12', '$2y$10$2wpNb9EmgfALZiieTbeW1ueXxM4TDD3Icb9huSbi5TcLaob2VLuKa', 'admin'),
('U002', 'Aris', '$2y$10$pzv.RP3PPlAM.v.omrOLhugsviLJB02..ssGMZT8vG29F8dBJy9f2', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jual`
--
ALTER TABLE `tb_jual`
  ADD PRIMARY KEY (`id_jual`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_jualdtl`
--
ALTER TABLE `tb_jualdtl`
  ADD PRIMARY KEY (`id_jual`,`id_produk`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `tb_ktg`
--
ALTER TABLE `tb_ktg`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_ktg` (`id_kategori`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jual`
--
ALTER TABLE `tb_jual`
  ADD CONSTRAINT `tb_jual_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jualdtl`
--
ALTER TABLE `tb_jualdtl`
  ADD CONSTRAINT `tb_jualdtl_ibfk_1` FOREIGN KEY (`id_jual`) REFERENCES `tb_jual` (`id_jual`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jualdtl_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD CONSTRAINT `tb_pesanan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `tb_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pesanan_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD CONSTRAINT `tb_produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `tb_ktg` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
