-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2018 at 11:30 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `sync_time` bigint(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `password`, `updated_at`, `created_at`, `sync_time`) VALUES
(8, 'hossein', 'cb00bbb59dde95cd605bea9065f44530', '2018-11-20 17:16:37', '2018-11-20 17:07:48', 1542721597);

-- --------------------------------------------------------

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `type`, `time`, `updated_at`, `created_at`, `product_id`) VALUES
(31, 'delete', 1542451780, '2018-11-17 14:19:40', '2018-11-17 14:19:40', 52),
(32, 'create', 1542720253, '2018-11-20 16:54:13', '2018-11-20 16:54:13', 52),
(33, 'create', 1542721132, '2018-11-20 17:08:52', '2018-11-20 17:08:52', 53),
(34, 'create', 1542721134, '2018-11-20 17:08:54', '2018-11-20 17:08:54', 54),
(35, 'create', 1542721493, '2018-11-20 17:14:53', '2018-11-20 17:14:53', 55),
(36, 'create', 1542721593, '2018-11-20 17:16:33', '2018-11-20 17:16:33', 56),
(37, 'create', 1542721594, '2018-11-20 17:16:34', '2018-11-20 17:16:34', 57),
(38, 'create', 1542732273, '2018-11-20 20:14:33', '2018-11-20 20:14:33', 58),
(39, 'create', 1542732287, '2018-11-20 20:14:47', '2018-11-20 20:14:47', 59),
(40, 'create', 1542732325, '2018-11-20 20:15:25', '2018-11-20 20:15:25', 60);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `updated_at`, `created_at`) VALUES
(5, 'test', '1.20', '2018-11-16 20:13:08', '2018-11-16 20:13:08'),
(6, 'test', '0.00', '2018-11-16 20:13:31', '2018-11-16 20:13:31'),
(7, 'test', '-1.00', '2018-11-16 20:13:49', '2018-11-16 20:13:49'),
(8, 'assa', '1.00', '2018-11-16 20:41:30', '2018-11-16 20:41:30'),
(9, 'assa', '2.00', '2018-11-16 21:52:57', '2018-11-16 21:52:57'),
(10, 'assa', '2.00', '2018-11-16 21:53:01', '2018-11-16 21:53:01'),
(11, 'assa', '2.00', '2018-11-16 21:53:26', '2018-11-16 21:53:26'),
(12, 'assa', '2.00', '2018-11-16 21:54:00', '2018-11-16 21:54:00'),
(13, 'assa', '2.00', '2018-11-16 21:54:35', '2018-11-16 21:54:35'),
(14, 'assa', '2.00', '2018-11-16 21:55:36', '2018-11-16 21:55:36'),
(15, 'assa', '2.00', '2018-11-16 22:01:09', '2018-11-16 22:01:09'),
(16, 'assa', '2.00', '2018-11-16 22:02:54', '2018-11-16 22:02:54'),
(17, 'assa', '2.00', '2018-11-16 22:06:15', '2018-11-16 22:06:15'),
(18, 'assa', '2.00', '2018-11-16 22:06:48', '2018-11-16 22:06:48'),
(19, 'assa', '2.00', '2018-11-16 22:07:06', '2018-11-16 22:07:06'),
(20, 'assa', '2.00', '2018-11-16 22:08:08', '2018-11-16 22:08:08'),
(21, 'assa', '2.00', '2018-11-16 22:08:18', '2018-11-16 22:08:18'),
(22, 'assa', '2.00', '2018-11-16 22:10:06', '2018-11-16 22:10:06'),
(23, 'assa', '2.00', '2018-11-16 22:10:53', '2018-11-16 22:10:53'),
(24, 'assa', '2.00', '2018-11-16 22:11:02', '2018-11-16 22:11:02'),
(25, 'assa', '2.00', '2018-11-16 22:11:10', '2018-11-16 22:11:10'),
(26, 'assa', '2.00', '2018-11-16 22:11:41', '2018-11-16 22:11:41'),
(27, 'assa', '2.00', '2018-11-16 22:14:31', '2018-11-16 22:14:31'),
(28, 'assa', '2.00', '2018-11-16 22:15:04', '2018-11-16 22:15:04'),
(29, 'assa', '2.00', '2018-11-16 22:16:33', '2018-11-16 22:16:33'),
(30, 'assa', '2.00', '2018-11-16 22:17:06', '2018-11-16 22:17:06'),
(31, 'assa', '2.00', '2018-11-16 22:17:57', '2018-11-16 22:17:57'),
(32, 'assa', '2.00', '2018-11-16 22:18:05', '2018-11-16 22:18:05'),
(33, 'assa', '2.00', '2018-11-16 22:18:45', '2018-11-16 22:18:45'),
(34, 'assa', '2.00', '2018-11-16 22:19:16', '2018-11-16 22:19:16'),
(35, 'assa', '2.00', '2018-11-16 22:19:37', '2018-11-16 22:19:37'),
(36, 'assa', '2.00', '2018-11-16 22:20:24', '2018-11-16 22:20:24'),
(37, 'assa', '2.00', '2018-11-16 22:20:53', '2018-11-16 22:20:53'),
(38, 'assa', '2.00', '2018-11-16 22:21:25', '2018-11-16 22:21:25'),
(39, 'assa', '2.00', '2018-11-16 22:21:42', '2018-11-16 22:21:42'),
(40, 'assa', '2.00', '2018-11-16 22:24:47', '2018-11-16 22:24:47'),
(41, 'assa', '2.00', '2018-11-16 22:27:17', '2018-11-16 22:27:17'),
(42, 'assa', '2.00', '2018-11-16 22:27:35', '2018-11-16 22:27:35'),
(43, 'assa', '2.00', '2018-11-16 22:44:37', '2018-11-16 22:44:37'),
(44, 'assa', '2.00', '2018-11-17 01:17:09', '2018-11-17 01:17:09'),
(45, 'assa', '2.00', '2018-11-17 01:21:25', '2018-11-17 01:21:25'),
(46, 'assa', '2.00', '2018-11-17 12:39:10', '2018-11-17 12:39:10'),
(47, NULL, NULL, '2018-11-17 13:13:11', '2018-11-17 13:13:11'),
(48, 'helllllllllllllllo', '22.30', '2018-11-17 13:14:04', '2018-11-17 13:14:04'),
(49, 'helllllllllllllllo', '22.30', '2018-11-17 13:15:25', '2018-11-17 13:15:25'),
(50, 'helllllllllllllllo', '22.30', '2018-11-17 13:15:39', '2018-11-17 13:15:39'),
(51, 'assa', '2.00', '2018-11-17 13:18:39', '2018-11-17 13:18:39'),
(52, 'iPhone', '900.00', '2018-11-20 16:54:13', '2018-11-20 16:54:13'),
(53, 'iPhone', '900.00', '2018-11-20 17:08:52', '2018-11-20 17:08:52'),
(54, 'iPhone', '900.00', '2018-11-20 17:08:54', '2018-11-20 17:08:54'),
(55, 'iPhone', '900.00', '2018-11-20 17:14:53', '2018-11-20 17:14:53'),
(56, 'iPhone', '900.00', '2018-11-20 17:16:33', '2018-11-20 17:16:33'),
(57, 'iPhone', '900.00', '2018-11-20 17:16:34', '2018-11-20 17:16:34'),
(58, 'iPhone', '900.00', '2018-11-20 20:14:33', '2018-11-20 20:14:33'),
(59, 'iPhone', '900.00', '2018-11-20 20:14:47', '2018-11-20 20:14:47'),
(60, 'iPhone', '900.00', '2018-11-20 20:15:25', '2018-11-20 20:15:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
