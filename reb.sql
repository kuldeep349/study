-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2018 at 12:29 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reb`
--

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(255) NOT NULL,
  `class_id` int(255) NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_id`, `class_name`, `created_at`, `updated_at`) VALUES
(6, 2015, 'nursery', '2018-06-27 10:24:06', '2018-06-27 10:24:06'),
(7, 2015, 'LKG', '2018-09-28 04:40:18', '2018-09-28 04:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(255) NOT NULL,
  `pdf_link` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `heading` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `content` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `flipbook` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `tags` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `owner` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `pdf_link`, `heading`, `content`, `flipbook`, `keywords`, `tags`, `owner`, `created_at`, `updated_at`) VALUES
(54, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'asdasdasd', 'asdasd', 'asdfasdf', 'sudarsh', '2018-07-26 06:13:24', '2018-07-26 06:13:24'),
(55, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'Software', 'software,link', '#soft#ware', 'ram', '2018-07-26 06:22:47', '2018-07-26 06:22:47'),
(56, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'assc', 'ascs', 'aa', 'aa', '2018-07-26 06:24:38', '2018-07-26 06:24:38'),
(57, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'ascas', 'as', 'as', 'assd', '2018-07-26 06:26:57', '2018-07-26 06:26:57'),
(58, 'www.ur.com', 'army', 'undefined', 'df', 'software,link', 'asdfasdf', 'sudarsh', '2018-07-26 06:29:58', '2018-07-26 06:29:58'),
(59, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'asdasdsa', 'software,link', 'asdfasdf', 'amar', '2018-07-26 06:32:13', '2018-07-26 06:32:13'),
(60, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'df', 'software,link', '#soft#ware', 'adsfa', '2018-07-26 06:43:02', '2018-07-26 06:43:02'),
(61, 'www.ur.com', 'Heading my heading', 'undefined', 'Software', 'software,link', 'asdfasdf', 'ram', '2018-07-29 05:49:11', '2018-07-29 05:49:11'),
(62, 'www.ira.com', 'army', 'undefined', 'Software', 'software,link', '#soft#ware', 'Ashu', '2018-07-29 05:54:56', '2018-07-29 05:54:56'),
(63, 'www.ur.com', 'Victory', 'undefined', 'Software', 'asdasdf', 'asdfasdf', 'adsfa', '2018-07-29 05:56:02', '2018-07-29 05:56:02'),
(64, 'www.ur.com', 'Heading my heading', 'undefined', 'df', 'software,link', 'asdfasdf', 'ram', '2018-07-29 06:00:11', '2018-07-29 06:00:11'),
(65, 'www.ur.com', 'Heading my heading', 'undefined', 'Software', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 06:06:11', '2018-07-29 06:06:11'),
(66, 'www.ira.com', 'Heading my heading', 'undefined', 'Software', 'asdasdf', 'sdfsd', 'sudarsh', '2018-07-29 06:13:35', '2018-07-29 06:13:35'),
(67, 'www.ira.com', 'Heading my heading', 'undefined', 'Software', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 06:14:05', '2018-07-29 06:14:05'),
(68, 'www.ur.com', 'army', 'undefined', 'Software', 'software,link', '#soft#ware', 'amar', '2018-07-29 06:14:39', '2018-07-29 06:14:39'),
(69, 'www.ira.com', 'army', 'undefined', 'sdgsg', 'sdgsd', 'dfssdf', 'sdfsd', '2018-07-29 06:15:33', '2018-07-29 06:15:33'),
(70, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'Software', 'software,link', 'asdfasdf', 'Ashu', '2018-07-29 06:16:00', '2018-07-29 06:16:00'),
(71, 'ashu.com', 'Heading my heading', 'undefined', 'scscs', 'acssc', 'ascasc', 'ascsac', '2018-07-29 06:17:18', '2018-07-29 06:17:18'),
(72, 'www.ur.com', 'Heading my heading', 'undefined', 'Software', 'keywords test', 'asdfasdf', 'adsfa', '2018-07-29 06:20:06', '2018-07-29 06:20:06'),
(73, 'www.ira.com', 'Victory', 'undefined', 'web', 'software,link', '#soft#ware', 'sudarsh', '2018-07-29 06:22:28', '2018-07-29 06:22:28'),
(74, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'amar', '2018-07-29 06:24:11', '2018-07-29 06:24:11'),
(75, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'army', 'undefined', 'website', 'software,link', '#soft#ware', 'rajesh', '2018-07-29 06:25:44', '2018-07-29 06:25:44'),
(76, 'www.ur.com', 'Heading my heading', 'undefined', 'df', 'software,link', '#soft#ware', 'adsfa', '2018-07-29 06:34:24', '2018-07-29 06:34:24'),
(77, 'www.ira.com', 'Heading my heading', 'undefined', 'aXASCCDSC', 'CSDCSDC', 'SDCSDCD', 'DCSDC', '2018-07-29 06:35:39', '2018-07-29 06:35:39'),
(78, 'www.ur.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'sudarsh', '2018-07-29 06:36:50', '2018-07-29 06:36:50'),
(79, 'www.ira.com', 'navy', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'Ashu', '2018-07-29 06:37:41', '2018-07-29 06:37:41'),
(80, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 06:38:20', '2018-07-29 06:38:20'),
(81, 'www.ira.com', 'navy', 'undefined', 'df', 'software,link', '#soft#ware', 'amar', '2018-07-29 06:39:18', '2018-07-29 06:39:18'),
(82, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'sudarsh', '2018-07-29 06:40:38', '2018-07-29 06:40:38'),
(83, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'army', 'undefined', 'df', 'software,link', '#soft#ware', 'adsfa', '2018-07-29 06:41:37', '2018-07-29 06:41:37'),
(84, 'www.ira.com', 'Heading my heading', 'undefined', 'Software', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 06:52:09', '2018-07-29 06:52:09'),
(85, 'www.ira.com', 'navy', 'undefined', 'ascascas', 'sacas', 'acsascas', 'ascsacas', '2018-07-29 06:52:38', '2018-07-29 06:52:38'),
(86, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'df', 'asdasdf', '#soft#ware', 'Ashu', '2018-07-29 06:53:42', '2018-07-29 06:53:42'),
(87, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'scsac', 'undefined', 'scsacsac', 'ascsa', 'ascsac', 'sacsac', '2018-07-29 06:54:48', '2018-07-29 06:54:48'),
(88, 'www.ira.com', 'Victory', 'undefined', 'website', 'asdasdf', '#soft#ware', 'adsfa', '2018-07-29 06:56:24', '2018-07-29 06:56:24'),
(89, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', 'undefined', 'Software', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 06:57:06', '2018-07-29 06:57:06'),
(90, 'www.ira.com', 'Heading my heading', 'undefined', 'website', 'asdasdf', '#soft#ware', 'amar', '2018-07-29 06:58:29', '2018-07-29 06:58:29'),
(91, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'Ashu', '2018-07-29 07:00:25', '2018-07-29 07:00:25'),
(92, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'Software', 'software,link', 'asdfasdf', 'sudarsh', '2018-07-29 07:00:59', '2018-07-29 07:00:59'),
(93, 'www.ur.com', 'Victory', 'undefined', 'df', 'software,link', '#soft#ware', 'ram', '2018-07-29 08:00:15', '2018-07-29 08:00:15'),
(94, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'software,link', 'tags test', 'adsfa', '2018-07-29 08:02:06', '2018-07-29 08:02:06'),
(95, 'ashu.com', 'Victory', 'undefined', 'df', 'software,link', 'asdfasdf', 'amar', '2018-07-29 08:02:45', '2018-07-29 08:02:45'),
(96, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'sdfsd', 'Ashu', '2018-07-29 08:08:10', '2018-07-29 08:08:10'),
(97, 'www.ira.com', 'army', 'undefined', 'Software', 'software,link', 'asdfasdf', 'amar', '2018-07-29 08:10:05', '2018-07-29 08:10:05'),
(98, 'www.ur.com', 'army', 'undefined', 'wdwecewc', 'cwecwecw', 'cwwec', 'cwecwecw', '2018-07-29 08:12:15', '2018-07-29 08:12:15'),
(99, 'www.ira.com', 'Victory', 'undefined', 'Software', 'asdasdf', 'asdfasdf', 'sudarsh', '2018-07-29 08:14:40', '2018-07-29 08:14:40'),
(100, 'www.ira.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'rajesh', '2018-07-29 08:15:22', '2018-07-29 08:15:22'),
(101, 'www.ira.com', 'navy', 'undefined', 'Software', 'asdasdf', '#soft#ware', 'Ashu', '2018-07-29 08:26:39', '2018-07-29 08:26:39'),
(102, 'ashu.com', 'army', 'undefined', 'website', 'keywords test', '#soft#ware', 'adsfa', '2018-07-29 08:29:53', '2018-07-29 08:29:53'),
(103, 'www.ur.com', 'Victory', 'undefined', 'we', 'asdasdf', 'asdfasdf', 'ram', '2018-07-29 08:44:08', '2018-07-29 08:44:08'),
(104, 'www.ur.com', 'asasc', 'undefined', 'website', 'asdasdf', '#soft#ware', 'amar', '2018-07-29 08:44:54', '2018-07-29 08:44:54'),
(105, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'website', 'asdasdf', '#soft#ware', 'ram', '2018-07-29 09:00:06', '2018-07-29 09:00:06'),
(106, 'www.ira.com', 'Heading my heading', 'undefined', 'Software', 'asdasdf', 'asdfasdf', 'adsfa', '2018-07-29 09:05:53', '2018-07-29 09:05:53'),
(107, 'www.ur.com', 'Victory', 'undefined', 'df', 'software,link', 'asdfasdf', 'rajesh', '2018-07-29 09:07:16', '2018-07-29 09:07:16'),
(108, 'www.ur.com', 'Heading my heading', 'undefined', 'df', 'asdasdf', 'asdfasdf', 'Ashu', '2018-07-29 09:08:29', '2018-07-29 09:08:29'),
(109, 'ashu.com', 'navy', 'undefined', 'Software', 'asdasdf', 'asdfasdf', 'sudarsh', '2018-07-29 09:09:50', '2018-07-29 09:09:50'),
(110, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Victory', 'undefined', 'sdbfdsbfb', 'fgdfgdf', 'fdgfdg', 'dfgfg', '2018-07-29 09:11:12', '2018-07-29 09:11:12'),
(111, 'www.ur.com', 'Victory', '&lt;p&gt;&lt;strong&gt;addsvsdvdsv&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'asdfasdf', 'amar', '2018-07-29 09:14:29', '2018-07-29 09:14:29'),
(112, 'www.ur.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;sacsacscs&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'asdasdf', '#soft#ware', 'rajesh', '2018-07-29 09:16:48', '2018-07-29 09:16:48'),
(113, 'https:&#x2F;&#x2F;tcc-world.org&#x2F;whitepaper_1.pdf', 'Heading my heading', '&lt;p&gt;&lt;i&gt;scsdvdsvdsvdvvds&lt;&#x2F;i&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', '#soft#ware', 'sudarsh', '2018-07-29 09:18:51', '2018-07-29 09:18:51'),
(114, 'www.ira.com', 'Victory', '&lt;p&gt;&lt;strong&gt;cdscdcsdc&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'df', 'asdasdf', '#soft#ware', 'Ashu', '2018-07-29 09:20:59', '2018-07-29 09:20:59'),
(115, 'www.ira.com', 'Victory', '&lt;p&gt;&lt;strong&gt;djvndnjdn&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'df', 'software,link', 'asdfasdf', 'ram', '2018-07-29 10:00:36', '2018-07-29 10:00:36'),
(116, 'www.ur.com', 'navy', '&lt;p&gt;&lt;strong&gt;This is equation editor&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', '#soft#ware', 'Ramesh', '2018-07-29 10:01:22', '2018-07-29 10:01:22'),
(117, 'www.ur.com', 'Victory', '&lt;p&gt;&lt;strong&gt;askcnaskcnasknc&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'df', 'asdasdf', 'sdfsd', 'ram', '2018-07-29 10:02:17', '2018-07-29 10:02:17'),
(118, 'www.ira.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;scscscszsc&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'tags test', 'rajesh', '2018-07-29 10:12:52', '2018-07-29 10:12:52'),
(119, 'www.ur.com', 'Victory', '&lt;p&gt;&lt;strong&gt;xcscscn&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'tags test', 'rajesh', '2018-07-29 10:17:24', '2018-07-29 10:17:24'),
(120, 'www.ur.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;scdcdsdvdsv&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'sdfsd', 'Ashu', '2018-07-29 10:20:02', '2018-07-29 10:20:02'),
(121, 'www.ira.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;scwververver&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'asdasdf', 'tags test', 'sudarsh', '2018-07-29 10:24:26', '2018-07-29 10:24:26'),
(122, 'www.ira.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;sdvdffdbfd&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'web,soft', 'amar', '2018-07-29 10:25:35', '2018-07-29 10:25:35'),
(123, 'www.ira.com', 'Heading my heading', '&lt;p&gt;xc&amp;nbsp;&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', 'web,soft', 'Ashu', '2018-07-29 10:28:14', '2018-07-29 10:28:14'),
(124, 'www.ira.com', 'Heading my heading', '&lt;p&gt;&lt;strong&gt;sacscsc&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', 'Software', 'asdasdf', 'asdfasdf', 'sudarsh', '2018-07-29 10:32:34', '2018-07-29 10:32:34'),
(125, 'www.ur.com', 'Heading my heading', '&lt;p&gt;&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;p&gt;', 'Software', 'software,link', '#soft#ware', 'ram', '2018-07-29 12:11:03', '2018-07-29 12:11:03'),
(126, 'asdf', 'asd', '&lt;p&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;&#x2F;p&gt;\r\n\r\n&lt;p&gt;&amp;quot;&amp;gt;&lt;&#x2F;p&gt;', 'asdf', 'asdf', 'asdf', 'ads', '2018-07-29 12:58:02', '2018-07-29 12:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `eligibilities`
--

CREATE TABLE `eligibilities` (
  `id` int(255) NOT NULL,
  `requirement` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `eligibility_type` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `value` int(255) NOT NULL,
  `unit` int(255) NOT NULL,
  `pursuing` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `category` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `gender` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eligibilities`
--

INSERT INTO `eligibilities` (`id`, `requirement`, `eligibility_type`, `value`, `unit`, `pursuing`, `category`, `gender`, `created_at`, `updated_at`) VALUES
(19, 'Driver', 'driver', 5, 2, 'N', 'GEN', 'MALE', '2018-06-27 10:08:00', '2018-06-27 10:08:00');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(255) NOT NULL,
  `field_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `field_name`, `created_at`, `updated_at`) VALUES
(4, 'Teacher', '2018-06-27 10:08:33', '2018-06-27 10:08:33');

-- --------------------------------------------------------

--
-- Table structure for table `streams`
--

CREATE TABLE `streams` (
  `id` int(255) NOT NULL,
  `stream_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `streams`
--

INSERT INTO `streams` (`id`, `stream_name`, `created_at`, `updated_at`) VALUES
(4, 'HORTICULUTRU', '2018-06-27 10:08:45', '2018-06-27 10:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(255) NOT NULL,
  `subject_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `subject_id` int(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `subject_id`, `created_at`, `updated_at`) VALUES
(4, 'HISTORY', 65, '2018-06-27 10:09:28', '2018-06-27 10:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_dashboard`
--

CREATE TABLE `teacher_dashboard` (
  `id` int(255) NOT NULL,
  `teacher_id` int(255) NOT NULL,
  `teacher_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `teacher_role` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `teacher_qualification` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_dashboard`
--

INSERT INTO `teacher_dashboard` (`id`, `teacher_id`, `teacher_name`, `teacher_role`, `teacher_qualification`, `created_at`, `updated_at`) VALUES
(3, 963, 'MEENU', 'TRAINER', 'MSC', '2018-06-27 10:09:52', '2018-06-27 10:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(255) NOT NULL,
  `exam_id` int(255) NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `field` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `stream` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `exam_id`, `exam_name`, `field`, `stream`, `created_at`, `updated_at`) VALUES
(6, 6965, 'SCIENCE', 'TEACEHR', 'education', '2018-06-27 10:09:07', '2018-06-27 10:09:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `phone` varchar(10) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `email`, `user_type`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(10, 'sudershan', 'bsharitwal@gmail.com', 'S瑵摥湴', '1㈳㐵', '9988869096', '2018-06-27 09:57:12', '2018-06-27 09:57:12'),
(11, 'Ram', 'Sdaheer911@gmail.com', 't敡捨敲', '1㈳㐵', '95215', '2018-06-27 10:06:35', '2018-06-27 10:06:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD UNIQUE KEY `id_3` (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eligibilities`
--
ALTER TABLE `eligibilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streams`
--
ALTER TABLE `streams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_dashboard`
--
ALTER TABLE `teacher_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `eligibilities`
--
ALTER TABLE `eligibilities`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `streams`
--
ALTER TABLE `streams`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacher_dashboard`
--
ALTER TABLE `teacher_dashboard`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
