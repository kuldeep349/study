-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2018 at 01:44 PM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

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
-- Table structure for table `tbl_boards`
--

CREATE TABLE `tbl_boards` (
  `id` int(11) NOT NULL,
  `board_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_boards`
--

INSERT INTO `tbl_boards` (`id`, `board_name`, `created_at`, `updated_at`) VALUES
(3, 'PSEB', '2018-10-09 17:08:56', '2018-10-09 11:38:56'),
(6, 'CBSE', '2018-10-09 17:47:10', '2018-10-09 12:17:10'),
(7, 'UK', '2018-10-10 10:03:27', '2018-10-10 04:33:27');

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
(13, 'Board', 'Board', '', '2018-10-07 13:12:19', '0000-00-00 00:00:00'),
(14, 'Exams', 'Exams', '', '2018-10-08 17:43:59', '0000-00-00 00:00:00'),
(15, 'rrrrrr', 'rrrrrr', '', '2018-10-15 10:45:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `board_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`id`, `class_name`, `board_id`, `created_at`, `updated_at`) VALUES
(9, '10th', 3, '2018-10-09 17:09:56', '2018-10-09 11:39:56'),
(10, '9th', 3, '2018-10-09 17:10:14', '2018-10-09 11:40:14'),
(11, '10th', 6, '2018-10-10 10:03:48', '2018-10-10 04:33:48'),
(12, '12th', 7, '2018-10-10 10:04:03', '2018-10-10 04:34:03'),
(13, '10th', 7, '2018-10-10 10:04:18', '2018-10-10 04:34:18'),
(14, '12th', 6, '2018-10-10 13:20:20', '2018-10-10 07:50:20');

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
(27, '', 5, 'Testing Title', '<p>this is an test equation.</p>\n\n<p>BY&nbsp;<strong>Kuldeep Sharma</strong></p>\n\n<p>sd sd sdf<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span></p>\n', '', '2018-10-07 15:59:59', '0000-00-00 00:00:00'),
(28, '', 5, 'ATOMIC STURTURE', '<p>this fjds fsdhkjf jsdlkf jsdf jsdlj fsdl jls jfldsk ds f&nbsp;&nbsp;<span class=\"math-tex\">\\(x = {-b \\pm \\sqrt{b^2-4ac} \\over 2a}\\)</span>cdjfs44</p>\n\n<p>sdfjsdfjsld&nbsp;</p>\n', '', '2018-10-08 17:45:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contents`
--

CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `file_type` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `content_title` varchar(100) NOT NULL,
  `content_desc` varchar(2000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contents`
--

INSERT INTO `tbl_contents` (`id`, `class_id`, `subject_id`, `topic_id`, `file_type`, `file`, `content_title`, `content_desc`, `created_at`, `updated_at`) VALUES
(28, 14, 11, 11, 1, 'Doc1.pdf', 'werwrwerwer', '', '2018-10-15 04:51:05', '0000-00-00 00:00:00');

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
-- Table structure for table `tbl_subjects`
--

CREATE TABLE `tbl_subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  `class_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subjects`
--

INSERT INTO `tbl_subjects` (`id`, `subject_name`, `class_id`, `created_at`, `updated_at`) VALUES
(2, 'Science', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Math', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Mathematics', 13, '0000-00-00 00:00:00', '2018-10-10 08:01:06'),
(10, 'Physics', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Chemistry', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Physics', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
(3, 'CHEMISTRY', 'chemisetry', 12, '2018-10-07 13:14:28', '0000-00-00 00:00:00'),
(7, '9th', '9th', 2, '2018-10-08 16:51:58', '0000-00-00 00:00:00'),
(8, 'MATHS', 'MATHS', 12, '2018-10-08 16:53:00', '0000-00-00 00:00:00'),
(9, 'ENGLISH', 'ENGLISH', 12, '2018-10-08 16:53:35', '0000-00-00 00:00:00'),
(10, '8th', '8th', 2, '2018-10-08 16:54:16', '0000-00-00 00:00:00'),
(11, 'kuldeep Sharma', 'kuldeep_Sharma', 14, '2018-10-15 10:54:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_topic`
--

CREATE TABLE `tbl_topic` (
  `id` int(11) NOT NULL,
  `topic_name` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_topic`
--

INSERT INTO `tbl_topic` (`id`, `topic_name`, `subject_id`, `class_id`, `description`, `created_at`, `updated_at`) VALUES
(4, 'my topic', 2, 9, 'description', '2018-10-10 11:54:08', '2018-10-10 06:24:08'),
(7, 'Mechanics', 10, 13, 'Mechanics (Greek ????????) is that area of science concerned with the behaviour of physical bodies when subjected to forces or displacements, and the subsequent effects of the bodies on their environm', '2018-10-10 13:10:20', '2018-10-10 07:40:20'),
(8, 'Electricity and Magnetism', 10, 13, 'Electromagnetism is a branch of physical science that describes the interactions of electricity and magnetism, both as separate phenomena and as a singular electromagnetic force. Amagnetic field is cr', '2018-10-10 13:12:21', '2018-10-10 07:42:21'),
(10, 'Geometry', 9, 13, 'Geometry (from the Ancient Greek: ?????????; geo- &quot;earth&quot;, -metron &quot;measurement&quot;) is a branch of mathematics concerned with questions of shape, size, relative position of figures, ', '2018-10-10 13:15:00', '2018-10-10 07:45:00'),
(11, 'Organic', 11, 14, 'Organic chemistry – scientific study of the structure, properties, composition, reactions, and preparation (by synthesis or by other means) of carbon-based compounds, hydrocarbons, and their derivatives', '2018-10-10 17:26:26', '2018-10-10 11:56:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_boards`
--
ALTER TABLE `tbl_boards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_class`
--
ALTER TABLE `tbl_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_content`
--
ALTER TABLE `tbl_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `tbl_topic`
--
ALTER TABLE `tbl_topic`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_boards`
--
ALTER TABLE `tbl_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_content`
--
ALTER TABLE `tbl_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_topic`
--
ALTER TABLE `tbl_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
