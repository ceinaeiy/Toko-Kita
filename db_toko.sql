-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2026 at 07:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_toko`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Fashion'),
(3, 'Makanan'),
(4, 'Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_produk` varchar(150) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga`, `stok`, `gambar`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laptop ASUS', 7500000, 10, 'laptop.jpg', 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Maxime eos est proident et tempore ut quis laborum consequatur eu. Illum magna ut optio dolores incididunt est.\r\n\r\nNon lorem minim expedita non laborum ullamco facilis. Facere distinctio iusto quos dolor molestias praesentium cumque cumque. Blanditiis sunt nisi dolorem eum sunt. Cupidatat placeat dolorem exercitation excepturi minus dolor.\r\n\r\nAdipiscing fugiat mollitia do repellendus rerum minus. Cupidatat laborum quod eos nihil imperdiet facilis deleniti qui praesentium qui dolor enim. Expedita irure dolorum in eum excepturi optio officia et similique.\r\n\r\nNulla placeat quo eligendi qui dolore. Aliquip eiusmod harum blanditiis magna eiusmod odio ea. Ea lorem nobis temporibus eiusmod atque in quod aliqua. Voluptatum eiusmod commodo voluptatum culpa ex aliqua eligendi nisi nulla animi deserunt distinctio.\r\n\r\nLibero elit non excepturi deleniti quo ut. Dolore minim sunt esse proident et omnis culpa dolor aliquip soluta. Et lorem labore praesentium voluptatum qui. Minim facilis nam expedita et ducimus at. Aliquip optio nulla quo officia nulla nostrud in id sit.\r\n\r\nNihil fugiat dolorum consectetur ducimus illum tempore aut nihil occaecat. Occaecat expedita aliqua assumenda eligendi ut sunt voluptatum non. Magna et sint et voluptas ex provident praesentium assumenda dolor. Dolore minim cumque pariatur ducimus mollitia aliquip quidem.\r\n\r\nVel nihil quas excepteur temporibus laborum ex consequatur. Et proident voluptate aliquip dolore in velit et illum voluptate quos quibusdam fuga. Sint commodo mollitia vero nostrud harum dolore nisi non tempore. Eos iusto eu quos duis culpa sint iusto.\r\n\r\nVeniam quos laboris officia similique deserunt duis ducimus praesentium illum. Nulla id nihil cum ducimus dolores sint minim. Omnis est aut dolores deleniti nihil. Cupidatat in quibusdam nulla irure reprehenderit est.\r\n\r\nUt velit mollit dolor laborum fugiat. Elit culpa adipiscing elit facilis est nihil aute. Quibusdam minus laborum proident laboris omnis corrupti quo et provident dolor irure et. Similique iusto animi est provident excepteur enim nihil voluptate minus. In rerum anim exercitation nobis atque sed id distinctio distinctio harum pariatur et.\r\n\r\nSint vero distinctio in facilis irure consequat. Cillum maxime in harum quas deserunt dolorem est id dolore nihil. Nobis optio et nulla non in animi. Expedita magna voluptatum quidem commodo distinctio anim omnis commodo nulla excepturi laborum id.', '2026-09-07 08:50:02', '2026-09-09 20:54:02'),
(2, 1, 'Mouse Wireless', 150000, 20, 'mouse.jpg', 'Mouse wireless praktis dan nyaman digunakan.', '2026-09-07 08:50:02', '2026-09-07 08:50:02'),
(3, 2, 'Kaos Polos', 75000, 295, 'kaos.jpg', 'Kaos polos berkualitas dengan bahan nyaman.', '2026-09-07 08:50:02', '2026-09-11 11:18:40'),
(4, 3, 'Keripik Kentang', 20000, 50, 'keripik.jpg', 'Keripik kentang renyah dan gurih.', '2026-09-07 08:50:02', '2026-09-07 08:50:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
