-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 08, 2021 at 08:46 PM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `castle`
--

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

DROP TABLE IF EXISTS `bonuses`;
CREATE TABLE IF NOT EXISTS `bonuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `userid` bigint NOT NULL,
  `bonusvalue` int NOT NULL,
  `transactionid` bigint NOT NULL,
  `description` varchar(100) NOT NULL,
  `bonustype` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Bonuses link to transaction` (`transactionid`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `name`, `userid`, `bonusvalue`, `transactionid`, `description`, `bonustype`, `time`) VALUES
(3, 'Haliru', 2, 0, 29, 'Gaari |', 'registration bonus', '2021-01-20 10:59:16'),
(4, 'Haliru', 1, 0, 31, 'Rice |', 'registration bonus', '2021-01-21 08:54:56'),
(5, 'Haliru', 1, 0, 32, 'Rice |', 'registration bonus', '2021-01-21 08:55:48'),
(6, 'Haliru', 1, 0, 33, 'Rice |', 'registration bonus', '2021-01-21 08:56:32'),
(7, 'Haliru', 1, 0, 34, 'Rice |', 'registration bonus', '2021-01-21 08:57:50'),
(8, 'Haliru', 1, 0, 35, 'Rice |', 'registration bonus', '2021-01-21 09:03:03'),
(9, 'Haliru', 1, 0, 36, 'Rice |', 'registration bonus', '2021-01-21 09:03:48'),
(21, 'Lateef Yusuf', 7, 1960, 12, 'Kareem', 'Not eligible for Pension', '2021-01-24 09:32:55'),
(22, 'Lateef Yusuf', 7, 1960, 12, 'Kareem', 'Not eligible for Pension', '2021-01-24 09:33:37'),
(23, 'Lateef Yusuf', 7, 1860, 12, 'Kareem', 'Pension deducted', '2021-01-24 09:34:47'),
(24, 'Lateef Yusuf', 7, 111, 12, 'Kareem', 'Pension', '2021-01-24 09:34:47'),
(25, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:38:58'),
(26, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:38:58'),
(27, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:39:00'),
(28, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:39:00'),
(29, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:47:30'),
(30, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:47:30'),
(31, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:57:00'),
(32, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:57:00'),
(33, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:58:58'),
(34, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:58:58'),
(35, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 09:59:12'),
(36, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 09:59:12'),
(37, 'Lateef Yusuf', 7, 1860, 12, 'Kareem\'s Registration', 'Pension deducted bonus', '2021-01-24 10:00:34'),
(38, 'Lateef Yusuf', 7, 111, 12, 'Kareem\'s Registration', 'Pension from registration bonus', '2021-01-24 10:00:34'),
(39, 'Lateef Yusuf', 7, 1860, 12, 'ABIOLA ISRAEL ENIOLA\'s Registration', 'Pension deducted bonus', '2021-01-24 10:03:38'),
(40, 'Lateef Yusuf', 7, 111, 12, 'ABIOLA ISRAEL ENIOLA\'s Registration', 'Pension from registration bonus', '2021-01-24 10:03:38'),
(41, 'Haliru', 1, 1960, 12, 'GAFAR YUSUF\'s Registration', 'Not eligible for Pension', '2021-01-24 10:06:37'),
(42, 'Haliru Yusuf', 5, -10, 10, 'See', 'Bonus Paid', '2021-01-24 12:11:07'),
(43, 'Haliru', 1, -2000, 10, 'Test Payment', 'Bonus Paid', '2021-01-24 12:12:35'),
(44, 'Lateef Yusuf', 7, 505, 10, 'Direct bonus', 'Pension deducted', '2021-01-30 17:21:56'),
(45, 'Lateef Yusuf', 7, 30, 10, 'Direct bonus', 'Pension', '2021-01-30 17:21:56'),
(46, 'Lateef Yusuf', 7, 459, 10, 'Direct bonus', 'Pension deducted', '2021-01-30 17:23:15'),
(47, 'Lateef Yusuf', 7, 27, 10, 'Direct bonus', 'Pension', '2021-01-30 17:23:15'),
(48, 'Haliru', 1, 4966, 10, 'Direct bonus', 'Pension deducted', '2021-02-03 11:49:49'),
(49, 'Haliru', 1, -4926, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:27:03'),
(50, 'Lateef Yusuf', 7, -10883, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:27:03'),
(51, 'Haliru', 1, -4926, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:28:05'),
(52, 'Lateef Yusuf', 7, -10883, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:28:06'),
(53, 'Haliru', 1, -4926, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:28:42'),
(54, 'Lateef Yusuf', 7, -10883, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:28:42'),
(55, 'DADA STEPHEN OMOBOLAJI', 11, -345, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:52:36'),
(56, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -456, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:53:58'),
(57, 'YUSUF JAMIU AYODEJI', 13, -25, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:53:58'),
(58, 'UDOH UKARABONG LERI', 14, -678, 10, 'Feb,2021', 'Bonus Paid', '2021-02-04 09:53:58'),
(59, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 1960, 10, 'JEMENI CHINONSO EMMANUEL\'s Registration', 'Pension not deducted', '2021-02-06 12:41:45'),
(60, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 1960, 10, 'UDOYE EKENE PAUL\'s Registration', 'Pension not deducted', '2021-02-06 12:44:41'),
(61, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 1860, 10, 'BALOGUN GAFAR OLABIWONU\'s Registration', 'Pension deducted', '2021-02-06 12:47:42'),
(62, 'JEMENI CHINONSO EMMANUEL', 19, 78, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 13:19:16'),
(63, 'JEMENI CHINONSO EMMANUEL', 19, 74, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 13:19:16'),
(64, 'JEMENI CHINONSO EMMANUEL', 19, 102, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 13:19:29'),
(65, 'Haliru', 2, 484, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 13:36:45'),
(66, 'JEMENI CHINONSO EMMANUEL', 19, 139, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 13:36:45'),
(67, 'JEMENI CHINONSO EMMANUEL', 19, 158, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 13:44:09'),
(68, 'GARBA OCHAYAN PEACE ', 18, 117, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 13:45:04'),
(69, 'GARBA OCHAYAN PEACE ', 18, 111, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 13:45:04'),
(70, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:09:35'),
(71, 'JEMENI CHINONSO EMMANUEL', 19, 58, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 14:12:27'),
(72, 'JEMENI CHINONSO EMMANUEL', 19, 27, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:18:17'),
(73, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:20:39'),
(74, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:38:28'),
(75, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:41:56'),
(76, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:43:36'),
(77, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:44:51'),
(78, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:46:08'),
(79, 'Haliru', 2, -484, 10, 'Feb,2021', 'Bonus Paid', '2021-02-06 14:48:42'),
(80, 'SHIFATU AMINAT OLUWADAMILOLA', 17, -5780, 10, 'Feb,2021', 'Bonus Paid', '2021-02-06 14:48:42'),
(81, 'GARBA OCHAYAN PEACE ', 18, -230, 10, 'Feb,2021', 'Bonus Paid', '2021-02-06 14:48:42'),
(82, 'JEMENI CHINONSO EMMANUEL', 19, -772, 10, 'Feb,2021', 'Bonus Paid', '2021-02-06 14:48:42'),
(83, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:51:58'),
(84, 'UDOYE EKENE PAUL', 20, 176, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 14:55:07'),
(85, 'UDOYE EKENE PAUL', 20, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 14:56:02'),
(86, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 15:11:47'),
(87, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 15:17:08'),
(88, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:05:05'),
(89, 'JEMENI CHINONSO EMMANUEL', 19, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:06:45'),
(90, 'UDOH UKARABONG LERI', 14, 1662, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 16:10:05'),
(91, 'UDOH UKARABONG LERI', 14, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:19:01'),
(92, 'YUSUF JAMIU AYODEJI', 13, 58, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 16:22:09'),
(93, 'BALOGUN GAFAR OLABIWONU', 21, 58, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 16:23:11'),
(94, 'BALOGUN GAFAR OLABIWONU', 21, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:23:35'),
(95, 'GARBA OCHAYAN PEACE ', 18, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:53:28'),
(96, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 16:54:24'),
(97, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 17:00:54'),
(98, 'GAFAR YUSUF', 16, 196, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 17:04:39'),
(99, 'GAFAR YUSUF', 16, 186, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 17:05:55'),
(100, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 93, 10, '1st Gen. Indirect bonus', 'Pension deducted', '2021-02-06 17:05:55'),
(101, 'GAFAR YUSUF', 16, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 17:20:37'),
(102, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 18, 10, 'Direct bonus', 'Pension deducted', '2021-02-06 17:23:17'),
(103, 'Lateef Yusuf', 3, 180, 10, 'First time Direct bonus', 'Pension not deducted', '2021-02-06 18:13:25'),
(104, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 9, 10, 'Direct bonus', 'Pension deducted', '2021-02-08 10:41:48'),
(105, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 4, 10, '1st Gen. Indirect bonus', 'Pension deducted', '2021-02-08 10:41:48'),
(106, 'Kareem Yusuf', 6, 111, 10, 'First time Direct bonus', 'Pension deducted', '2021-02-08 16:02:36'),
(107, 'Lateef Yusuf', 3, -180, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(108, 'Kareem Yusuf', 6, -145, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(109, 'Lateef Yusuf', 7, -345678, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(110, 'ABIOLA ISRAEL ENIOLA', 10, -1256, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(111, 'DADA STEPHEN OMOBOLAJI', 11, -14, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(112, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -116, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(113, 'YUSUF JAMIU AYODEJI', 13, -58, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(114, 'UDOH UKARABONG LERI', 14, -1681, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(115, 'GAFAR YUSUF', 16, -400, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(116, 'SHIFATU AMINAT OLUWADAMILOLA', 17, -46, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(117, 'GARBA OCHAYAN PEACE ', 18, -18, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(118, 'JEMENI CHINONSO EMMANUEL', 19, -57, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(119, 'UDOYE EKENE PAUL', 20, -19, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19'),
(120, 'BALOGUN GAFAR OLABIWONU', 21, -77, 10, 'Feb,2021', 'Bonus Paid', '2021-02-08 20:35:19');

-- --------------------------------------------------------

--
-- Table structure for table `constants`
--

DROP TABLE IF EXISTS `constants`;
CREATE TABLE IF NOT EXISTS `constants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` float NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `constants`
--

INSERT INTO `constants` (`id`, `name`, `value`, `description`) VALUES
(1, 'bonusvalue', 5, ''),
(2, 'pensionvalue', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
CREATE TABLE IF NOT EXISTS `managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int NOT NULL DEFAULT '1',
  `description` varchar(100) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `username`, `name`, `password`, `role`, `description`, `time_created`) VALUES
(1, 'hallykola', 'Haliru', 'are', 2, 'This just a test', '2021-01-18 09:57:50'),
(3, 'admin', 'Haliru Yusuf', '$2y$10$5MMY3lLaClMn4uKkz3XrQemsR8ypl6F1bnQZvGRUDnJga219ceCa2', 2, 'Special', '2021-01-19 08:33:54'),
(4, 'hallykola', 'Haliru Yusuf', '$2y$10$q5MZbvroByb3rZwrbSpUfej4jffr3rQ/VJE6WgQggRFGWBbr4zbpW', 4, 'IT', '2021-01-21 21:23:23'),
(5, 'newadmin', 'ADEBISI DORCAS', '$2y$10$a8bs/WblLE0hx6t9oh6GJOTKGyoXCp7TyuKCqSyytffkxzCAf//Li', 4, 'test', '2021-01-22 07:59:59'),
(6, 'newadmin', 'Kareem', '$2y$10$g3PRiSr.Q6EEFb3jVN2i1uVfDIJSfIipKK0af5jFLocPzK8oQIkp.', 4, 'test', '2021-01-22 08:01:29'),
(7, 'yusuf', 'YUSUF AZEEZ OLAWALE', '$2y$10$tNqsdCro62/MJDLdZ8BFh.16n3tmFMiAj2VTVUcVWqqE5hfNqgN7a', 4, 'IT', '2021-01-23 18:50:24');

-- --------------------------------------------------------

--
-- Table structure for table `pensions`
--

DROP TABLE IF EXISTS `pensions`;
CREATE TABLE IF NOT EXISTS `pensions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `userid` int NOT NULL,
  `pensionvalue` int NOT NULL,
  `month` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pensions`
--

INSERT INTO `pensions` (`id`, `name`, `userid`, `pensionvalue`, `month`, `description`, `type`, `time`) VALUES
(1, 'Haliru', 1, 297, 'February,2021', 'Direct bonus', 'Pension', '2021-02-03 11:49:49.047222'),
(2, 'Haliru', 1, -298, '10', 'Feb,2021', 'Pension Paid', '2021-02-04 10:45:41.382123'),
(3, 'Lateef Yusuf', 7, -765, '10', 'Feb,2021', 'Pension Paid', '2021-02-04 10:53:46.570621'),
(4, 'Haliru Yusuf ', 9, -654, '10', 'Feb,2021', 'Pension Paid', '2021-02-04 10:53:46.587092'),
(5, 'Haliru Yusuf ', 9, -50, 'Feb,2021 Pension Payment', 'Feb,2021', 'Pension Paid', '2021-02-04 11:14:30.901527'),
(6, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -50, 'Feb,2021 Pension Payment', 'Feb,2021', 'Pension Paid', '2021-02-04 11:14:30.916145'),
(7, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -50, 'Feb,2021 Pension Payment of50', 'Feb,2021', 'Pension Paid', '2021-02-04 11:15:35.551982'),
(8, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:16:40.168067'),
(9, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:17:54.439572'),
(10, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:18:31.176527'),
(11, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:18:50.797074'),
(12, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:20:37.405887'),
(13, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:20:56.177252'),
(14, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of 0', 'Feb,2021', 'Pension Paid', '2021-02-04 11:22:46.305797'),
(15, 'Haliru Yusuf ', 9, 0, 'Feb,2021, Pension Payment of 0', 'Feb,2021', 'Pension Paid', '2021-02-04 11:23:26.374533'),
(16, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of 0', 'Feb,2021', 'Pension Paid', '2021-02-04 11:23:26.392648'),
(17, 'Haliru Yusuf ', 9, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:24:22.493763'),
(18, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'Feb,2021, Pension Payment of ', 'Feb,2021', 'Pension Paid', '2021-02-04 11:24:22.731061'),
(19, 'Haliru Yusuf ', 9, -4, 'Feb,2021, Pension Payment of 4', 'Feb,2021', 'Pension Paid', '2021-02-04 11:25:14.205244'),
(20, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -113, 'Feb,2021, Pension Payment of 113', 'Feb,2021', 'Pension Paid', '2021-02-04 11:25:14.220901'),
(21, 'Haliru Yusuf ', 9, -32, 'Feb,2021, Pension Payment of 32', 'Feb,2021', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:29:47.989735'),
(22, 'DADA STEPHEN OMOBOLAJI', 11, -56, 'Feb,2021, Pension Payment of 56', 'Feb,2021', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:29:48.010474'),
(23, 'UDOH UKARABONG LERI', 14, -3, 'Feb,2021, Pension Payment of 3', 'Feb,2021', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:37:13.162645'),
(24, 'ABIOLA ISRAEL ENIOLA', 15, -3, 'Feb,2021, Pension Payment of 3', 'Feb,2021', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:37:13.178799'),
(25, 'UDOH UKARABONG LERI', 14, -5, 'Feb,2021', 'Feb,2021, Pension Payment of 5', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:42:19.532079'),
(26, 'ABIOLA ISRAEL ENIOLA', 15, -5, 'Feb,2021', 'Feb,2021, Pension Payment of 5', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-04 11:42:19.541702'),
(27, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 111, 'February,2021', 'BALOGUN GAFAR OLABIWONU\'s Registration', 'Pension', '2021-02-06 12:47:42.192127'),
(28, 'JEMENI CHINONSO EMMANUEL', 19, 4, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 13:19:16.680448'),
(29, 'JEMENI CHINONSO EMMANUEL', 19, 6, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 13:19:29.243923'),
(30, 'JEMENI CHINONSO EMMANUEL', 19, 8, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 13:36:45.289031'),
(31, 'JEMENI CHINONSO EMMANUEL', 19, 9, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 13:44:09.334404'),
(32, 'GARBA OCHAYAN PEACE ', 18, 6, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 13:45:04.678530'),
(33, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:09:35.954922'),
(34, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:18:17.950097'),
(35, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:20:39.956630'),
(36, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:38:28.529398'),
(37, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:41:56.911519'),
(38, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:43:36.964676'),
(39, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:44:51.907369'),
(40, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:46:08.465630'),
(41, 'UDOH UKARABONG LERI', 14, -24, 'Feb,2021', 'Feb,2021, Pension Payment of 24', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-06 14:48:49.934162'),
(42, 'ABIOLA ISRAEL ENIOLA', 15, -46, 'Feb,2021', 'Feb,2021, Pension Payment of 46', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-06 14:48:49.949821'),
(43, 'SHIFATU AMINAT OLUWADAMILOLA', 17, -112, 'Feb,2021', 'Feb,2021, Pension Payment of 112', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-06 14:48:49.960955'),
(44, 'GARBA OCHAYAN PEACE ', 18, -7, 'Feb,2021', 'Feb,2021, Pension Payment of 7', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-06 14:48:49.982766'),
(45, 'JEMENI CHINONSO EMMANUEL', 19, -36, 'Feb,2021', 'Feb,2021, Pension Payment of 36', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-06 14:48:50.000063'),
(46, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:51:58.137798'),
(47, 'UDOYE EKENE PAUL', 20, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 14:56:02.009203'),
(48, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 15:11:47.722303'),
(49, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 15:17:08.860445'),
(50, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:05:05.638614'),
(51, 'JEMENI CHINONSO EMMANUEL', 19, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:06:45.785147'),
(52, 'UDOH UKARABONG LERI', 14, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:19:01.258695'),
(53, 'BALOGUN GAFAR OLABIWONU', 21, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:23:35.673767'),
(54, 'GARBA OCHAYAN PEACE ', 18, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:53:28.792290'),
(55, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 16:54:24.750712'),
(56, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 17:00:54.823980'),
(57, 'GAFAR YUSUF', 16, 11, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 17:05:55.047924'),
(58, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 5, 'February,2021', '1st Gen. Indirect bonus', 'Pension', '2021-02-06 17:05:55.080061'),
(59, 'GAFAR YUSUF', 16, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 17:20:37.716736'),
(60, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 1, 'February,2021', 'Direct bonus', 'Pension', '2021-02-06 17:23:17.760756'),
(61, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 0, 'February,2021', 'Direct bonus', 'Pension', '2021-02-08 10:41:48.706768'),
(62, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 0, 'February,2021', '1st Gen. Indirect bonus', 'Pension', '2021-02-08 10:41:48.734870'),
(63, 'Kareem Yusuf', 6, 7, 'February,2021', 'First time Direct bonus', 'Pension', '2021-02-08 16:02:36.742538'),
(64, 'Kareem Yusuf', 6, -7, 'Feb,2021', 'Feb,2021, Pension Payment of 7.06', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.181563'),
(65, 'ABIOLA ISRAEL ENIOLA', 10, -12, 'Feb,2021', 'Feb,2021, Pension Payment of 12.34', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.220100'),
(66, 'RAHEEM ABDULQUADIR OPEYEMI', 12, -7, 'Feb,2021', 'Feb,2021, Pension Payment of 7.36', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.230406'),
(67, 'UDOH UKARABONG LERI', 14, -1, 'Feb,2021', 'Feb,2021, Pension Payment of 1.18', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.239431'),
(68, 'GAFAR YUSUF', 16, -12, 'Feb,2021', 'Feb,2021, Pension Payment of 12.94', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.255206'),
(69, 'SHIFATU AMINAT OLUWADAMILOLA', 17, -2, 'Feb,2021', 'Feb,2021, Pension Payment of 2.95', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.265370'),
(70, 'GARBA OCHAYAN PEACE ', 18, -1, 'Feb,2021', 'Feb,2021, Pension Payment of 1.18', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.272791'),
(71, 'JEMENI CHINONSO EMMANUEL', 19, -5, 'Feb,2021', 'Feb,2021, Pension Payment of 5.352', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.284354'),
(72, 'BALOGUN GAFAR OLABIWONU', 21, -1, 'Feb,2021', 'Feb,2021, Pension Payment of 1.18', 'Pension Paid YUSUF AZEEZ OLAWALE', '2021-02-08 20:44:13.299467');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(75) NOT NULL,
  `bronzevalue` int NOT NULL,
  `description` varchar(100) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `productname`, `bronzevalue`, `description`, `time`) VALUES
(1, 'Rice', 100, 'Special', '2021-01-19 14:05:27'),
(2, 'Beans', 150, 'Test product', '2021-01-19 14:07:33'),
(3, 'Beans', 150, 'Test product', '2021-01-19 14:09:21'),
(4, 'Beans', 150, 'Test product', '2021-01-19 14:09:43'),
(5, 'Gaari', 200, 'test', '2021-01-19 14:52:06'),
(6, 'Blood Tonic', 250, 'Test product', '2021-01-19 19:00:53'),
(7, 'Supplement Tablet', 150, 'Good tablets', '2021-01-23 19:20:37'),
(8, 'Sweet Kola', 50, 'Bitter Kola Drink', '2021-01-23 19:23:13'),
(9, 'Green Tea', 200, 'tea', '2021-01-23 19:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
CREATE TABLE IF NOT EXISTS `ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `userid` bigint NOT NULL,
  `oldrank` varchar(50) NOT NULL,
  `newrank` varchar(50) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ranks`
--

INSERT INTO `ranks` (`id`, `name`, `userid`, `oldrank`, `newrank`, `time`) VALUES
(1, '0', 1, 'ruby', 'general', '2021-01-20 10:44:12'),
(2, '0', 2, 'ruby', 'general', '2021-01-20 10:44:41'),
(3, '0', 2, 'ruby', 'general', '2021-01-20 10:49:41'),
(4, '0', 2, 'ruby', 'general', '2021-01-20 10:51:28'),
(5, '0', 2, 'ruby', 'general', '2021-01-20 10:59:16'),
(6, 'Haliru', 1, 'ruby', 'general', '2021-01-21 08:54:56'),
(7, 'Haliru', 1, 'ruby', 'general', '2021-01-21 08:55:48'),
(8, 'Haliru', 1, 'ruby', 'general', '2021-01-21 08:56:32'),
(9, 'Haliru', 1, 'ruby', 'general', '2021-01-21 08:57:50'),
(10, 'Haliru', 1, 'ruby', 'general', '2021-01-21 09:03:03'),
(11, 'Haliru', 1, 'ruby', 'general', '2021-01-21 09:03:48'),
(12, 'Haliru Yusuf', 5, 'none', 'none', '2021-01-21 13:21:01'),
(13, 'Haliru Kolawole Yusuf', 3, 'none', 'none', '2021-01-21 13:21:01'),
(14, 'Haliru', 2, 'none', 'none', '2021-01-21 13:21:01'),
(15, 'Lateef Yusuf', 7, 'none', 'none', '2021-01-21 13:21:01'),
(16, 'Haliru', 1, 'none', 'none', '2021-01-21 13:21:01'),
(17, 'Lateef Yusuf', 7, 'RUBY', 'none', '2021-01-24 10:20:11'),
(18, 'Haliru', 1, 'BRONZE', 'none', '2021-01-24 10:20:11'),
(19, 'Haliru Yusuf', 5, 'none', 'BRONZE', '2021-01-24 10:39:59'),
(20, 'Lateef Yusuf', 3, 'none', 'BRONZE', '2021-01-24 10:39:59'),
(21, 'Haliru', 2, 'none', 'BRONZE', '2021-01-24 10:39:59'),
(22, 'Haliru', 1, 'GENERAL', 'BRONZE', '2021-01-24 10:39:59'),
(23, 'Haliru', 1, 'BRONZE', 'SAPPHIRE', '2021-01-25 16:02:48'),
(24, 'Haliru', 2, 'BRONZE', 'SAPPHIRE', '2021-01-30 17:04:10'),
(25, 'Lateef Yusuf', 7, 'BRONZE', 'SAPPHIRE', '2021-01-30 17:04:10'),
(26, 'Haliru Yusuf ', 9, 'none', 'BRONZE', '2021-01-30 17:33:25'),
(27, 'ABIOLA ISRAEL ENIOLA', 15, 'none', 'BRONZE', '2021-01-30 17:41:57'),
(28, 'UDOH UKARABONG LERI', 14, 'none', 'BRONZE', '2021-01-30 17:41:58'),
(29, 'YUSUF JAMIU AYODEJI', 13, 'none', 'BRONZE', '2021-01-30 17:41:58'),
(30, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'RUBY', 'BRONZE', '2021-01-30 17:41:58'),
(31, 'Haliru', 2, 'SAPPHIRE', 'BRONZE', '2021-01-30 17:41:58'),
(32, 'Lateef Yusuf', 7, 'SAPPHIRE', 'BRONZE', '2021-01-30 17:41:58'),
(33, 'Haliru', 1, 'SAPPHIRE', 'BRONZE', '2021-01-30 17:41:58'),
(34, 'DADA STEPHEN OMOBOLAJI', 11, 'RUBY', 'SAPPHIRE', '2021-02-01 15:16:09'),
(35, 'Lateef Yusuf', 7, 'BRONZE', 'SAPPHIRE', '2021-02-03 11:49:49'),
(36, 'Haliru', 1, 'BRONZE', 'SAPPHIRE', '2021-02-03 11:49:49'),
(37, 'JEMENI CHINONSO EMMANUEL', 19, 'none', 'SAPPHIRE', '2021-02-06 13:19:16'),
(38, 'GARBA OCHAYAN PEACE ', 18, 'none', 'BRONZE', '2021-02-06 13:19:43'),
(39, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'BRONZE', 'none', '2021-02-06 13:36:45'),
(40, 'Haliru', 2, 'BRONZE', 'SAPPHIRE', '2021-02-06 13:36:45'),
(41, 'GARBA OCHAYAN PEACE ', 18, 'BRONZE', 'SAPPHIRE', '2021-02-06 13:45:04'),
(42, 'JEMENI CHINONSO EMMANUEL', 19, 'BRONZE', 'SAPPHIRE', '2021-02-06 14:12:27'),
(43, 'UDOYE EKENE PAUL', 20, 'none', 'SAPPHIRE', '2021-02-06 14:55:07'),
(44, 'YUSUF JAMIU AYODEJI', 13, 'BRONZE', 'none', '2021-02-06 16:09:24'),
(45, 'UDOH UKARABONG LERI', 14, 'BRONZE', 'SAPPHIRE', '2021-02-06 16:10:05'),
(46, 'YUSUF JAMIU AYODEJI', 13, 'none', 'BRONZE', '2021-02-06 16:21:23'),
(47, 'YUSUF JAMIU AYODEJI', 13, 'BRONZE', 'SAPPHIRE', '2021-02-06 16:22:09'),
(48, 'BALOGUN GAFAR OLABIWONU', 21, 'none', 'SAPPHIRE', '2021-02-06 16:23:11'),
(49, 'SHIFATU AMINAT OLUWADAMILOLA', 17, 'SAPPHIRE', 'RUBY', '2021-02-06 17:00:54'),
(50, 'GAFAR YUSUF', 16, 'none', 'SAPPHIRE', '2021-02-06 17:04:39'),
(51, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'none', 'RUBY', '2021-02-06 17:04:39'),
(52, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'RUBY', 'none', '2021-02-06 17:20:37'),
(53, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'none', 'BRONZE', '2021-02-06 17:22:34'),
(54, 'RAHEEM ABDULQUADIR OPEYEMI', 12, 'BRONZE', 'RUBY', '2021-02-06 17:23:17'),
(55, 'Lateef Yusuf', 3, 'BRONZE', 'SAPPHIRE', '2021-02-06 18:13:25'),
(56, 'Kareem Yusuf', 6, 'SILVER', 'SAPPHIRE', '2021-02-08 16:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `issuer` int NOT NULL,
  `oldbv` int NOT NULL,
  `thisbv` int NOT NULL,
  `newbv` int NOT NULL,
  `description` varchar(150) NOT NULL,
  `transactiontime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BV transaction link to manager` (`issuer`),
  KEY `BV transactions link to users` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `name`, `issuer`, `oldbv`, `thisbv`, `newbv`, `description`, `transactiontime`, `userid`) VALUES
(10, '0', 1, 100, 100, 200, 'This just a test', '2021-01-18 10:12:26', 1),
(11, '0', 1, 100, 100, 200, 'This just a test', '2021-01-18 18:40:31', 1),
(12, '0', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:17:53', 1),
(13, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:23:59', 1),
(14, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:25:46', 1),
(15, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:26:59', 1),
(16, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:27:53', 1),
(17, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:30:23', 1),
(18, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:30:57', 1),
(19, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:31:28', 1),
(20, 'Haliru', 3, 320, 100, 420, 'Rice |', '2021-01-20 07:32:17', 1),
(21, 'Haliru', 3, 420, 100, 520, 'Rice |', '2021-01-20 07:32:53', 1),
(22, 'Haliru', 3, 520, 750, 1270, 'Blood Tonic |Blood Tonic |Blood Tonic |', '2021-01-20 08:40:30', 1),
(23, 'Haliru', 3, 1270, 100, 1370, 'Rice |', '2021-01-20 10:42:21', 1),
(24, 'Haliru', 3, 1370, 100, 1470, 'Rice |', '2021-01-20 10:43:07', 1),
(25, 'Haliru', 3, 1470, 100, 1570, 'Rice |', '2021-01-20 10:44:12', 1),
(26, 'Haliru', 3, 320, 200, 520, 'Gaari |', '2021-01-20 10:44:41', 2),
(27, 'Haliru', 3, 520, 200, 720, 'Gaari |', '2021-01-20 10:49:41', 2),
(28, 'Haliru', 3, 720, 200, 920, 'Gaari |', '2021-01-20 10:51:28', 2),
(29, 'Haliru', 3, 920, 200, 1120, 'Gaari |', '2021-01-20 10:59:16', 2),
(30, 'Haliru', 3, 1570, 100, 1670, 'Rice |', '2021-01-21 08:51:51', 1),
(31, 'Haliru', 3, 1570, 100, 1670, 'Rice |', '2021-01-21 08:54:56', 1),
(32, 'Haliru', 3, 1670, 100, 1770, 'Rice |', '2021-01-21 08:55:48', 1),
(33, 'Haliru', 3, 1770, 100, 1870, 'Rice |', '2021-01-21 08:56:32', 1),
(34, 'Haliru', 3, 1870, 100, 1970, 'Rice |', '2021-01-21 08:57:50', 1),
(35, 'Haliru', 3, 1970, 100, 2070, 'Rice |', '2021-01-21 09:03:03', 1),
(36, 'Haliru', 3, 2070, 100, 2170, 'Rice |', '2021-01-21 09:03:48', 1),
(37, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 10:43:23', 1),
(38, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 10:45:08', 1),
(39, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 10:45:40', 1),
(40, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:02:39', 1),
(41, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:03:10', 1),
(42, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:12:06', 1),
(43, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:13:39', 1),
(44, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:15:47', 1),
(45, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:17:14', 1),
(46, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:18:31', 1),
(47, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:19:12', 1),
(48, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:21:06', 1),
(49, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:21:52', 1),
(50, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:30:16', 1),
(51, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:33:44', 1),
(52, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:38:01', 1),
(53, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:41:00', 1),
(54, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:42:28', 1),
(55, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:46:12', 1),
(56, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:46:31', 1),
(57, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:47:43', 1),
(58, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:48:41', 1),
(59, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:50:18', 1),
(60, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-21 11:55:41', 1),
(61, 'Haliru', 3, 2170, 3500, 5670, 'Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood Tonic |Blood T', '2021-01-21 16:35:05', 1),
(62, 'Haliru', 3, 2170, 150, 2320, 'Beans |', '2021-01-21 16:37:22', 1),
(63, 'Haliru', 3, 2170, 850, 3020, 'Rice |Blood Tonic |Blood Tonic |Blood Tonic |', '2021-01-21 16:45:00', 1),
(64, 'Haliru', 3, 2170, 850, 3020, 'Rice |Blood Tonic |Blood Tonic |Blood Tonic |', '2021-01-21 16:48:23', 1),
(65, 'Haliru', 3, 2170, 850, 3020, 'Rice |Blood Tonic |Blood Tonic |Blood Tonic |', '2021-01-21 16:49:03', 1),
(66, 'Haliru', 3, 3020, 150, 3170, 'Beans |', '2021-01-21 16:50:00', 1),
(67, 'Haliru', 3, 3170, 100, 3270, 'Rice |', '2021-01-21 16:50:12', 1),
(68, 'Haliru', 3, 1120, 150, 1270, 'Beans |', '2021-01-21 16:50:23', 2),
(69, 'Haliru', 3, 3270, 200, 3470, 'Gaari |', '2021-01-21 16:51:02', 1),
(70, 'Haliru', 3, 1270, 200, 1470, 'Gaari |', '2021-01-21 16:51:16', 2),
(71, 'Haliru', 3, 1470, 250, 1720, 'Blood Tonic |', '2021-01-21 16:52:02', 2),
(72, 'Haliru Kolawole Yusuf', 3, 320, 150, 470, 'Beans |', '2021-01-21 18:40:45', 3),
(73, 'Haliru', 3, 1720, 100, 1820, 'Rice |', '2021-01-21 18:45:45', 2),
(74, 'Haliru', 3, 1820, 350, 2170, 'Beans |Gaari |', '2021-01-21 18:47:08', 2),
(95, 'Haliru', 3, 2170, 100, 2270, 'Rice |', '2021-01-23 16:45:43', 2),
(96, 'Haliru Kolawole Yusuf', 3, 470, 100, 570, 'Rice |', '2021-01-23 16:45:57', 3),
(97, 'Haliru Yusuf', 3, 0, 100, 100, 'Rice |', '2021-01-23 16:46:08', 4),
(98, 'Haliru Yusuf', 3, 0, 100, 100, 'Rice |', '2021-01-23 16:50:19', 4),
(99, 'Haliru', 3, 3470, 350, 3820, 'Beans |Gaari |', '2021-01-23 16:50:46', 1),
(100, 'Haliru', 3, 2170, 250, 2420, 'Rice |Beans |', '2021-01-23 16:51:08', 2),
(101, 'Haliru', 3, 3470, 100, 3570, 'Rice |', '2021-01-23 17:02:49', 1),
(102, 'Haliru', 3, 3470, 100, 3570, 'Rice |', '2021-01-23 17:03:09', 1),
(103, 'Haliru', 3, 600, 100, 700, 'Rice |', '2021-01-23 17:12:19', 1),
(104, 'Haliru', 3, 2170, 350, 2520, 'Rice |Blood Tonic |', '2021-01-23 17:12:40', 2),
(105, 'Haliru', 3, 700, 100, 800, 'Rice |', '2021-01-23 17:12:53', 1),
(106, 'Haliru', 3, 800, 250, 1050, 'Rice |Beans |', '2021-01-23 17:13:18', 1),
(107, 'Lateef Yusuf', 7, 470, 250, 720, 'Green Tea |Sweet Kola |', '2021-01-23 19:26:58', 3),
(108, 'Haliru Yusuf', 7, 0, 100, 100, 'Rice |', '2021-01-24 10:39:59', 5),
(109, 'Haliru Yusuf', 7, 100, 100, 200, 'Rice |', '2021-01-24 10:40:12', 5),
(110, 'Haliru', 7, 1050, 100, 1150, 'Rice |', '2021-01-25 16:02:47', 1),
(111, 'Haliru', 7, 1150, 100, 1250, 'Rice |', '2021-01-25 16:05:28', 1),
(112, 'Haliru', 7, 1250, 100, 1350, 'Rice |', '2021-01-25 16:09:28', 1),
(113, 'Haliru', 7, 1350, 100, 1450, 'Rice |', '2021-01-25 16:17:50', 1),
(114, 'Haliru', 7, 1450, 100, 1550, 'Rice |', '2021-01-25 16:18:11', 1),
(115, 'Haliru', 7, 2520, -100, 2420, 'test', '2021-01-30 17:04:10', 2),
(116, 'Haliru', 7, 2420, 100, 2520, 'test', '2021-01-30 17:04:33', 2),
(117, 'Haliru', 7, 2520, 100, 2620, 'test', '2021-01-30 17:10:03', 2),
(118, 'Haliru', 7, 2620, 100, 2720, 'test', '2021-01-30 17:10:58', 2),
(119, 'Haliru', 7, 2720, -100, 2620, 'Rice |', '2021-01-30 17:20:15', 2),
(120, 'Haliru', 7, 2620, -100, 2520, 'Rice |', '2021-01-30 17:20:56', 2),
(121, 'Haliru', 7, 2520, 100, 2620, 'Rice |', '2021-01-30 17:21:03', 2),
(122, 'Haliru', 7, 2620, 100, 2720, 'Rice |', '2021-01-30 17:21:56', 2),
(123, 'Haliru', 7, 1550, -100, 1450, 'Rice |', '2021-01-30 17:22:49', 1),
(124, 'Haliru', 7, 2720, -250, 2470, 'Blood Tonic |', '2021-01-30 17:23:15', 2),
(125, 'Haliru Yusuf ', 7, 0, 200, 200, 'Sample Product', '2021-01-30 17:33:25', 9),
(126, 'ABIOLA ISRAEL ENIOLA', 7, 0, 200, 200, 'Rice |Rice |', '2021-01-30 17:41:57', 15),
(127, 'DADA STEPHEN OMOBOLAJI', 7, 0, 36000, 36000, 'Rice-1 |Beans-55 |Sweet Kola-17 |Green Tea-134 |', '2021-02-01 15:16:09', 11),
(128, 'DADA STEPHEN OMOBOLAJI', 7, 36000, 10000, 46000, 'Rice-100 |', '2021-02-03 11:47:57', 11),
(129, 'Lateef Yusuf', 7, 0, 26700, 26700, 'Supplement Tablet-178 |', '2021-02-03 11:49:48', 7),
(130, 'JEMENI CHINONSO EMMANUEL', 7, 0, 200, 200, 'Gaari-1 |', '2021-02-06 13:17:47', 19),
(131, 'JEMENI CHINONSO EMMANUEL', 7, 200, 200, 400, 'Gaari-1 |', '2021-02-06 13:19:16', 19),
(132, 'JEMENI CHINONSO EMMANUEL', 7, 400, 150, 550, 'Supplement Tablet-1 |', '2021-02-06 13:19:29', 19),
(133, 'GARBA OCHAYAN PEACE ', 7, 0, 100, 100, 'Rice-1 |', '2021-02-06 13:19:43', 18),
(134, 'JEMENI CHINONSO EMMANUEL', 7, 600, 150, 750, 'Supplement Tablet-1 |', '2021-02-06 13:36:45', 19),
(135, 'JEMENI CHINONSO EMMANUEL', 7, 750, 100, 850, 'Rice-1 |', '2021-02-06 13:44:09', 19),
(136, 'GARBA OCHAYAN PEACE ', 7, 500, 100, 600, 'Rice-1 |', '2021-02-06 13:45:04', 18),
(137, 'JEMENI CHINONSO EMMANUEL', 7, 200, 100, 300, 'Rice-1 |', '2021-02-06 14:09:35', 19),
(138, 'JEMENI CHINONSO EMMANUEL', 7, 200, 100, 300, 'Rice-1 |', '2021-02-06 14:12:27', 19),
(139, 'JEMENI CHINONSO EMMANUEL', 7, 300, 150, 450, 'Beans-1 |', '2021-02-06 14:18:17', 19),
(140, 'JEMENI CHINONSO EMMANUEL', 7, 450, 100, 550, 'Rice-1 |', '2021-02-06 14:20:39', 19),
(141, 'JEMENI CHINONSO EMMANUEL', 7, 550, 100, 650, 'Rice-1 |', '2021-02-06 14:38:28', 19),
(142, 'JEMENI CHINONSO EMMANUEL', 7, 650, 100, 750, 'Rice-1 |', '2021-02-06 14:41:56', 19),
(143, 'JEMENI CHINONSO EMMANUEL', 7, 750, 100, 850, 'Rice-1 |', '2021-02-06 14:43:36', 19),
(144, 'JEMENI CHINONSO EMMANUEL', 7, 850, 100, 950, 'Rice-1 |', '2021-02-06 14:44:51', 19),
(145, 'JEMENI CHINONSO EMMANUEL', 7, 950, 100, 1050, 'Rice-1 |', '2021-02-06 14:46:08', 19),
(146, 'JEMENI CHINONSO EMMANUEL', 7, 1050, 100, 1150, 'Rice-1 |', '2021-02-06 14:51:58', 19),
(147, 'UDOYE EKENE PAUL', 7, 800, 100, 900, 'Rice-1 |', '2021-02-06 14:55:07', 20),
(148, 'UDOYE EKENE PAUL', 7, 900, 100, 1000, 'Rice-1 |', '2021-02-06 14:56:01', 20),
(149, 'JEMENI CHINONSO EMMANUEL', 7, 1150, 100, 1250, 'Rice-1 |', '2021-02-06 15:11:47', 19),
(150, 'JEMENI CHINONSO EMMANUEL', 7, 1250, 100, 1350, 'Rice-1 |', '2021-02-06 15:17:08', 19),
(151, 'JEMENI CHINONSO EMMANUEL', 7, 1350, 100, 1450, 'Rice-1 |', '2021-02-06 16:05:05', 19),
(152, 'JEMENI CHINONSO EMMANUEL', 7, 1450, 100, 1550, 'Rice-1 |', '2021-02-06 16:06:45', 19),
(153, 'UDOH UKARABONG LERI', 7, 0, 100, 100, 'Rice-1 |', '2021-02-06 16:09:24', 14),
(154, 'UDOH UKARABONG LERI', 7, 100, 300, 400, 'Rice-3 |', '2021-02-06 16:10:05', 14),
(155, 'UDOH UKARABONG LERI', 7, 400, 100, 500, 'Rice-1 |', '2021-02-06 16:19:01', 14),
(156, 'YUSUF JAMIU AYODEJI', 7, 0, 200, 200, 'Rice-2 |', '2021-02-06 16:21:23', 13),
(157, 'YUSUF JAMIU AYODEJI', 7, 200, 100, 300, 'Rice-1 |', '2021-02-06 16:22:09', 13),
(158, 'BALOGUN GAFAR OLABIWONU', 7, 0, 300, 300, 'Rice-3 |', '2021-02-06 16:23:11', 21),
(159, 'BALOGUN GAFAR OLABIWONU', 7, 300, 100, 400, 'Rice-1 |', '2021-02-06 16:23:35', 21),
(160, 'GARBA OCHAYAN PEACE ', 7, 600, 100, 700, 'Rice-1 |', '2021-02-06 16:53:28', 18),
(161, 'SHIFATU AMINAT OLUWADAMILOLA', 7, 400, 100, 500, 'Rice-1 |', '2021-02-06 16:54:24', 17),
(162, 'SHIFATU AMINAT OLUWADAMILOLA', 7, 500, 100, 600, 'Rice-1 |', '2021-02-06 17:00:54', 17),
(163, 'GAFAR YUSUF', 7, 0, 1000, 1000, 'Rice-10 |', '2021-02-06 17:04:39', 16),
(164, 'GAFAR YUSUF', 7, 1000, 1000, 2000, 'Rice-10 |', '2021-02-06 17:05:54', 16),
(165, 'GAFAR YUSUF', 7, 2000, 100, 2100, 'Rice-1 |', '2021-02-06 17:20:37', 16),
(166, 'RAHEEM ABDULQUADIR OPEYEMI', 7, 0, 100, 100, 'Rice-1 |', '2021-02-06 17:22:34', 12),
(167, 'RAHEEM ABDULQUADIR OPEYEMI', 7, 100, 100, 200, 'Rice-1 |', '2021-02-06 17:23:05', 12),
(168, 'RAHEEM ABDULQUADIR OPEYEMI', 7, 200, 100, 300, 'Rice-1 |', '2021-02-06 17:23:17', 12),
(169, 'Lateef Yusuf', 7, 720, 200, 920, 'Rice-2 |', '2021-02-06 18:13:25', 3),
(170, 'SHIFATU AMINAT OLUWADAMILOLA', 7, 600, 50, 650, 'Sweet Kola-1 |', '2021-02-08 10:41:48', 17),
(171, 'Kareem Yusuf', 7, 0, 600, 600, 'Rice-6 |', '2021-02-08 16:02:36', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent` bigint DEFAULT NULL,
  `sponsor` bigint NOT NULL,
  `ancestors` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descendants` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bronzevalue` float NOT NULL DEFAULT '0',
  `bonusvalue` float NOT NULL DEFAULT '0',
  `pensionvalue` float NOT NULL DEFAULT '0',
  `rank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'none',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0000000000',
  `bankaccount` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0000000000',
  `dateregistered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `password`, `parent`, `sponsor`, `ancestors`, `descendants`, `bronzevalue`, `bonusvalue`, `pensionvalue`, `rank`, `phone`, `bankaccount`, `dateregistered`) VALUES
(1, 'hallykola', 'Haliru', 'hally123', 0, 0, '', '0', 1450, 0, 0, 'SAPPHIRE', '35342422', '2343423535', '2021-01-18 07:54:39'),
(2, 'hallykola', 'Haliru', '$2y$10$1ueea65VAolalckrV7ZWBOOtLYuASmoqe8n89jyiXHQrVG22nuEaK', 7, 0, '', '0', 2470, 0, 0, 'SAPPHIRE', '35342422', '2343423535', '2021-01-18 08:01:47'),
(3, 'hallykola', 'Lateef Yusuf', '$2y$10$DUHdu6xb6oDiBiYJ/HbcO.dtOU3YQgUcWuee7JTOr54xUv5QUJSgy', 2, 0, '', '0', 920, 0, 0, 'SAPPHIRE', '', '1234', '2021-01-18 10:00:07'),
(4, 'hallykola', 'Haliru Yusuf', '$2y$10$GrpzR237saYi.6aC09H1dOEfs/Cmd/QQcbiuYO4f.CRkFV7zONHA6', 3, 0, '', '0', 0, 0, 0, 'none', '08068858953', '12345', '2021-01-19 08:00:21'),
(5, 'admin', 'Haliru Yusuf', '$2y$10$7qZ1dTvFc4rlkw6fsephP.iBu8ad6SQ56XxiML7H39uNU0vJAwXS6', 3, 0, '', '0', 200, -10, 0, 'BRONZE', '08068858953', '12345', '2021-01-19 08:00:59'),
(6, 'kreemzo', 'Kareem Yusuf', '$2y$10$KHzU9YencALa6LivcoGnrucNTarv1zpmTGsE3bMwNCvWkQ..KsEem', 1, 0, '', '0', 600, 0, 0, 'SAPPHIRE', '08068858953', '12345', '2021-01-19 08:03:37'),
(7, 'lateef', 'Lateef Yusuf', '$2y$10$/HyrSATZ/RNd7ou4qGUCD.dPy5BglDnvJBDCS1B6O0IR6dfk3MXAu', 1, 0, '', '0', 26700, 0, 0, 'SAPPHIRE', '08068858953', '123456', '2021-01-19 08:07:39'),
(8, 'lateef', 'Lateef Yusuf', '$2y$10$Qod48nnEJyO8yIBqPy346eHDpRaX5WTxY8tdwwu52DyUNFRL6JTJq', 16, 0, '', '0', 0, 0, 0, 'none', '08068858953', '12345', '2021-01-19 08:10:15'),
(9, 'hallykola1', 'Haliru Yusuf ', '$2y$10$5vd8ahvEd/2wqqL1y.lCYOgtyTpBKhyWmFLyOpM64e4jUryKhHk.a', 0, 1, NULL, NULL, 200, 0, 0, 'BRONZE', '0806885834', '00191214523', '2021-01-21 21:33:01'),
(10, 'abiola', 'ABIOLA ISRAEL ENIOLA', '$2y$10$cGbU4EhA5KBnZdTr/wrpQeiYXBa/rQZuyLspTeWNOUKwFo2xF/Xy6', 0, 45, NULL, NULL, 0, 0, 0, 'RUBY', '070', '0', '2021-01-22 07:50:35'),
(11, 'dada', 'DADA STEPHEN OMOBOLAJI', '$2y$10$zi9mbyOYK5o0cQ7eba9Mt.OSHdtXRkCV6kH2TveQw0q36kZQ5kV1S', 0, 1, NULL, NULL, 46000, 0, 0, 'SAPPHIRE', '08023434567', '00', '2021-01-23 18:46:39'),
(12, 'raheem', 'RAHEEM ABDULQUADIR OPEYEMI', '$2y$10$0BSy12jDmpSJ9t7O2448q.nrenM4gD31yX2rIUEGCVU/I2wFPZKNO', 2, 7, NULL, NULL, 300, 0, 0, 'RUBY', '', '0', '2021-01-23 19:50:48'),
(13, 'jamiu', 'YUSUF JAMIU AYODEJI', '$2y$10$j3kwYpdNzy5qi2zOeK7eNOLTJo7OmUw1KBNWirFsC7L/v90GK6K.i', 12, 7, NULL, NULL, 300, 0, 0, 'SAPPHIRE', '', '0', '2021-01-23 20:03:14'),
(14, 'udoh', 'UDOH UKARABONG LERI', '$2y$10$DenzirrJd005AoPMHKvBHeo5o9Yw27YvxUsL6deL/xbp8Tw02AdqW', 13, 7, NULL, NULL, 500, 0, 0, 'SAPPHIRE', '', '0', '2021-01-23 20:11:17'),
(15, 'israel', 'ABIOLA ISRAEL ENIOLA', '$2y$10$WxY5fQxq46sV4eFNPXNiEOEqXIwJgyUkzw94a7hOWKoZGTJf0LL2C', 14, 7, NULL, NULL, 200, 0, 0, 'BRONZE', '', '0', '2021-01-24 10:03:38'),
(16, 'gafar', 'GAFAR YUSUF', '$2y$10$7TrCQVM7/AidCAGMFQfJY.1NSNOBKScrY4ZIFUQaa.k6Aht72cwuy', 12, 1, NULL, NULL, 2100, 0, 0, 'SAPPHIRE', '08023434567', '0019121524', '2021-01-24 10:06:37'),
(17, 'shifatu', 'SHIFATU AMINAT OLUWADAMILOLA', '$2y$10$kDjtQViqwklw/V2rw0UDj.dwcZprxGte9NnCrU1Pq8F8YTWDbfTWK', 12, 11, NULL, NULL, 650, 0, 0, 'RUBY', '', '0', '2021-02-06 12:37:01'),
(18, 'garba', 'GARBA OCHAYAN PEACE ', '$2y$10$TYPs2jsOU.y2BuqYmMkVde/2D/WDC5eAxLqa/OmyRuaOsKYPuHIoS', 17, 17, NULL, NULL, 700, 0, 0, 'SAPPHIRE', '', '0', '2021-02-06 12:39:14'),
(19, 'jemeni', 'JEMENI CHINONSO EMMANUEL', '$2y$10$7MmBag9/pQyzWcI5198lVexokCivefbGGEez3FyvemPxvvGq7NLdi', 17, 17, NULL, NULL, 1550, 0, 0, 'SAPPHIRE', '08068858953, 0708236', '0019121524 gtbank', '2021-02-06 12:41:45'),
(20, 'udoye', 'UDOYE EKENE PAUL', '$2y$10$9ByYiLKMkzbwVeqCD/ZwW.PvyBlKzDYYgq8uhCWM7UWOBP3b/4KwS', 17, 17, NULL, NULL, 1000, 0, 1, 'SAPPHIRE', '', '0', '2021-02-06 12:44:41'),
(21, 'balogun', 'BALOGUN GAFAR OLABIWONU', '$2y$10$AwCgjqpW1kt1GTc43RXsXebOXthMj62p8Yky4jtwzuOEzRG.eNp0K', 19, 17, NULL, NULL, 400, 0, 0, 'SAPPHIRE', '', '0', '2021-02-06 12:47:42');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD CONSTRAINT `Bonuses link to transaction` FOREIGN KEY (`transactionid`) REFERENCES `transactions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `BV transaction link to manager` FOREIGN KEY (`issuer`) REFERENCES `managers` (`id`),
  ADD CONSTRAINT `BV transactions link to users` FOREIGN KEY (`userid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
