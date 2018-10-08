-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2018 at 05:58 PM
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
-- Database: `education`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_categories`
--

INSERT INTO `tbl_categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Class Wise', 'class_wise', '', '2018-10-06 08:49:20', '0000-00-00 00:00:00'),
(12, 'Subjects', 'Subjects', '', '2018-10-07 13:12:05', '0000-00-00 00:00:00'),
(13, 'Board', 'Board', '', '2018-10-07 13:12:19', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_content`
--

CREATE TABLE `tbl_content` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `nano_category_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `file` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_content`
--

INSERT INTO `tbl_content` (`id`, `type`, `nano_category_id`, `title`, `description`, `file`, `created_at`, `updated_at`) VALUES
(21, '', 4, 'test content', '&lt;p&gt;This is&amp;nbsp;&lt;strong&gt;test content for&amp;nbsp;&lt;&#x2F;strong&gt;our site&lt;em&gt;&amp;nbsp;sdf sdf&amp;nbsp; sdf fd&amp;nbsp;&lt;&#x2F;em&gt;&amp;nbsp;dfs d&amp;nbsp;&amp;nbsp;&lt;&#x2F;p&gt;\r\n\r\n&lt;p&gt;&amp;nbsp;&lt;&#x2F;p&gt;\r\n\r\n&lt;p&gt;&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;p&gt;', '', '2018-10-07 15:27:37', '0000-00-00 00:00:00'),
(22, '', 4, 'd fdsfdsfsd', '&lt;p&gt;this is tested ek jsdkf sdlkfj&amp;nbsp;&amp;nbsp;&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;p&gt;', '', '2018-10-07 15:41:48', '0000-00-00 00:00:00'),
(23, '', 4, 'sdsfd', '&lt;p&gt;this fdsj flsdjhkdsjfsdlfdsfsd ds&amp;nbsp;&amp;nbsp;&lt;strong&gt;&amp;nbsp;sdfds fsd s dds&lt;span class=&quot;math-tex&quot;&gt;&#x5C;(x = {-b &#x5C;pm &#x5C;sqrt{b^2-4ac} &#x5C;over 2a}&#x5C;)&lt;&#x2F;span&gt;&lt;&#x2F;strong&gt;&lt;&#x2F;p&gt;', '', '2018-10-07 15:43:16', '0000-00-00 00:00:00'),
(24, '', 5, 'sd fsdf', '<p>&nbsp;sdf sdf&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\n', '', '2018-10-07 15:44:21', '0000-00-00 00:00:00'),
(25, '', 4, 'vx dsf sdfsdd', '<p>&nbsp;sdf dsfds&nbsp; dsfsd<strong>&nbsp;f sd df ds&nbsp; dfdf</strong> dsd f</p>\n', '', '2018-10-07 15:55:35', '0000-00-00 00:00:00'),
(26, '', 4, 's dfsd fs', '<ol>\n	<li>this is te jks dflskdj fsd&nbsp;<s>&nbsp; fdsf sd fsdfsd sd</s>&nbsp;a sdfsd sdf sdfds<em>&nbsp;sdf ds<strong>&nbsp;sdfs df</strong></em><strong>&nbsp;sdfsd&nbsp;</strong>&nbsp;sdfd sf</li>\n	<li>s ;lfjsldfjdskjfsd</li>\n</ol>\n', '', '2018-10-07 15:58:21', '0000-00-00 00:00:00'),
(27, '', 5, 'Testing Title', '<p>this is an test equation.</p>\n\n<p>BY&nbsp;<strong>Kuldeep Sharma</strong></p>\n\n<p>sd sd sdf<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\n', '', '2018-10-07 15:59:59', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nano_category`
--

CREATE TABLE `tbl_nano_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `image` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_nano_category`
--

INSERT INTO `tbl_nano_category` (`id`, `name`, `slug`, `sub_category_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 'FORCE', 'foce', 2, '', '2018-10-07 13:15:29', '0000-00-00 00:00:00'),
(4, 'GRAVITATION', 'gravitation', 2, '', '2018-10-07 13:16:08', '0000-00-00 00:00:00'),
(5, 'ATOMS', 'atoms', 3, '', '2018-10-07 13:16:08', '0000-00-00 00:00:00'),
(6, 'CHEMICAL', 'chemical', 3, '', '2018-10-07 13:16:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_categories`
--

CREATE TABLE `tbl_sub_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sub_categories`
--

INSERT INTO `tbl_sub_categories` (`id`, `name`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(1, '10th', '10th', 2, '2018-10-06 08:49:40', '0000-00-00 00:00:00'),
(2, 'PHYSICS', 'physics', 12, '2018-10-07 13:14:28', '0000-00-00 00:00:00'),
(3, 'CHEMISTRY', 'chemisetry', 12, '2018-10-07 13:14:28', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content`
--
ALTER TABLE `tbl_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_content`
--
ALTER TABLE `tbl_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  ADD CONSTRAINT `tbl_nano_category_ibfk_1` FOREIGN KEY (`sub_category_id`) REFERENCES `tbl_sub_categories` (`id`);

--
-- Constraints for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  ADD CONSTRAINT `tbl_sub_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `tbl_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
