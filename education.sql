-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2018 at 07:33 AM
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
(8, 'CBSE', '2018-10-16 10:00:13', '2018-10-16 04:30:13'),
(9, 'PSEB', '2018-10-16 10:00:55', '2018-10-16 04:30:55'),
(10, 'ICSE', '2018-10-16 10:22:00', '2018-10-16 04:52:00'),
(11, 'UK', '2018-10-23 14:35:26', '2018-10-23 09:05:26'),
(13, 'Maharashtra', '2018-10-24 12:06:14', '2018-10-24 06:36:14'),
(14, 'Kolkata Board', '2018-10-24 16:52:48', '2018-10-24 11:22:48');

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
(23, 'Subject wise', 'Subject_wise', '', '2018-10-31 12:24:44', '0000-00-00 00:00:00'),
(24, 'Class wise', 'Class_wise', '', '2018-10-31 12:24:53', '0000-00-00 00:00:00'),
(25, 'Study Material by Board', 'Study_Material_by_Board', '', '2018-10-31 12:25:23', '0000-00-00 00:00:00'),
(26, 'Entrance Exam Wise', 'Entrance_Exam_Wise', '', '2018-10-31 12:26:38', '0000-00-00 00:00:00'),
(27, 'Govt. Exam Wise', 'Govt._Exam_Wise', '', '2018-10-31 12:26:52', '0000-00-00 00:00:00'),
(28, 'Your Interest Wise', 'Your_Interest_Wise', '', '2018-10-31 12:27:20', '0000-00-00 00:00:00'),
(29, 'Engineering Study Material', 'Engineering_Study_Material', '', '2018-10-31 12:27:46', '0000-00-00 00:00:00'),
(30, 'Medical Study Material', 'Medical_Study_Material', '', '2018-10-31 12:28:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_class`
--

CREATE TABLE `tbl_class` (
  `id` int(11) NOT NULL,
  `class_name` varchar(30) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_class`
--

INSERT INTO `tbl_class` (`id`, `class_name`, `created_at`, `updated_at`) VALUES
(3, 'IX', '2018-10-25 11:22:03', '2018-10-25 05:52:03'),
(4, 'X', '2018-10-25 11:22:19', '2018-10-25 05:52:19'),
(5, 'XI', '2018-10-25 11:22:37', '2018-10-25 05:52:37'),
(6, 'XII', '2018-10-25 11:22:45', '2018-10-25 05:52:45');

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
(36, 3, 105, 5, 0, '', 'Noun', '<p>Noun is the name of any person or place</p>\r\n', '2018-10-26 05:14:00', '0000-00-00 00:00:00'),
(37, 5, 104, 4, 1, 'dsdsgdsg.pdf', 'velocity', '', '2018-10-26 08:53:58', '0000-00-00 00:00:00'),
(38, 4, 107, 10, 0, '', 'hindi content title', '<p>National Language of india is hindi</p>\r\n', '2018-10-26 10:06:53', '0000-00-00 00:00:00');

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
(6, 'CHEMICAL', 'chemical', 3, '', '2018-10-07 13:16:26', '0000-00-00 00:00:00'),
(7, 'rtetertreterter', 'rtetertreterter', 14, '', '2018-10-22 16:35:57', '0000-00-00 00:00:00'),
(8, 'rrthyrthyt', 'rrthyrthyt', 11, '', '2018-10-22 16:37:59', '0000-00-00 00:00:00'),
(10, 'jitendra', 'jitendra', 1, '', '2018-10-22 16:39:34', '0000-00-00 00:00:00'),
(11, 'jgjgjghjghjhgjhg', 'jgjgjghjghjhgjhg', 14, '', '2018-10-22 16:42:42', '0000-00-00 00:00:00'),
(12, 'WORK', 'WORK', 2, '', '2018-10-23 05:19:15', '0000-00-00 00:00:00'),
(13, 'kuldeep Sharma', 'kuldeep_Sharma', 17, '', '2018-10-23 07:41:10', '0000-00-00 00:00:00'),
(14, 'trytryrty', 'trytryrty', 11, '', '2018-10-23 08:20:56', '0000-00-00 00:00:00'),
(15, 'trytrrt', 'trytrrt', 11, '', '2018-10-23 08:21:10', '0000-00-00 00:00:00'),
(17, 'mycate', 'mycate', 17, '', '2018-10-23 08:46:41', '0000-00-00 00:00:00'),
(20, 'guytytry', 'guytytry', 17, '', '2018-10-23 09:05:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subjects`
--

CREATE TABLE `tbl_subjects` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subjects`
--

INSERT INTO `tbl_subjects` (`id`, `subject_name`, `created_at`, `updated_at`) VALUES
(99, 'Mathematics', '2018-10-25 10:25:56', '0000-00-00 00:00:00'),
(100, 'Physics', '2018-10-25 10:25:59', '0000-00-00 00:00:00'),
(101, 'Chemistry', '2018-10-25 10:26:01', '0000-00-00 00:00:00'),
(103, 'Science', '2018-10-25 10:26:07', '0000-00-00 00:00:00'),
(104, 'Biology', '2018-10-25 10:26:10', '0000-00-00 00:00:00'),
(105, 'English', '2018-10-25 10:26:44', '0000-00-00 00:00:00'),
(106, 'Environment', '2018-10-25 10:26:56', '0000-00-00 00:00:00'),
(107, 'Hindi', '2018-10-25 10:27:02', '0000-00-00 00:00:00');

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
(11, 'kuldeep Sharma', 'kuldeep_Sharma', 14, '2018-10-15 10:54:00', '0000-00-00 00:00:00'),
(12, 'dsdasda', 'dsdasda', 15, '2018-10-15 17:05:09', '0000-00-00 00:00:00'),
(17, 'jitendra', 'jitendra', 14, '2018-10-23 07:40:49', '0000-00-00 00:00:00'),
(18, 'gfgh', 'gfgh', 20, '2018-10-23 09:04:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_topic`
--

CREATE TABLE `tbl_topic` (
  `id` int(11) NOT NULL,
  `topic_name` varchar(30) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_topic`
--

INSERT INTO `tbl_topic` (`id`, `topic_name`, `subject_id`, `class_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Height and Distance', 99, 6, 'The angle of elevation of the top of the lighthouse is observed from the ships are 30º and 45º respectively. If the lighthouse is 100 m high, the distance between the two ships is: A. 300 m', '2018-10-25 16:17:20', '2018-10-25 10:47:20'),
(2, 'Mechanics', 100, 6, 'Mechanics (Greek ????????) is that area of science concerned with the behaviour of physical bodies when subjected to forces or displacements, and the subsequent effects of the bodies on their environment.', '2018-10-25 16:18:27', '2018-10-25 10:48:27'),
(3, 'Topic Desc', 103, 3, 'Science (from Latin scientia, meaning &quot;knowledge&quot;)[1] is a systematic enterprise that builds and organizes knowledge in the form of testable explanations and predictions about the universe', '2018-10-25 16:21:56', '2018-10-25 10:51:56'),
(4, 'Biology', 104, 5, 'Biology is the natural science that studies life and living organisms, including their physical structure, chemical processes, molecular interactions, physiological mechanisms, development and evolution.', '2018-10-25 17:13:53', '2018-10-25 11:44:19'),
(5, 'Parts of Speech', 105, 3, 'a category to which a word is assigned in accordance with its syntactic functions. In English the main parts of speech are noun, pronoun, adjective, determiner, verb, adverb, preposition, conjunction, and interjection', '2018-10-25 17:15:31', '2018-10-25 11:45:31'),
(6, 'Environment Topic', 106, 5, 'The natural environment encompasses all living and non-living things occurring naturally, meaning in this case not artificial. The term is most often applied to the Earth or some parts of Earth', '2018-10-25 17:17:29', '2018-10-25 11:47:29'),
(9, 'er3wrer', 104, 5, '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '2018-10-25 17:29:06', '2018-10-31 11:19:06'),
(10, 'my topic', 107, 4, 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', '2018-10-26 11:07:54', '2018-10-31 11:19:23'),
(11, 'topicss', 103, 4, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '2018-10-26 11:08:40', '2018-10-31 11:19:40'),
(12, 'Tense', 105, 6, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia', '2018-10-26 15:31:59', '2018-10-31 11:18:47'),
(13, 'Atomic Structure', 101, 4, 'Atoms are composed of protons, neutrons, and electrons. Protons and neutrons form the nucleus of the atom, with electrons moving around this core. The study of atomic structure involves understanding the composition of atoms, isotopes, and ions.', '2018-10-26 15:39:23', '2018-10-26 10:09:23'),
(14, 'Motion in a straight line', 100, 5, 'First, we will talk about one of the most basic concepts of physics, position. There are many ways to express the position of a point particle, one of the simplest and most well known way being the Cartesian Coordinate System. In a Cartesian Coordinate System, the position of a particle is expressed as an ordered pair, the x-coordinate, a y-coordinate in a two or three dimensional space, and a z-coordinate in a three dimensional space.', '2018-10-26 15:41:13', '2018-10-26 10:11:13'),
(15, 'Calculus', 99, 6, 'Calculus (from Latin calculus, literally &#x27;small pebble&#x27;, used for counting and calculations, as on an abacus) is the mathematical study of continuous change, in the same way that geometry is the study of shape and algebra is the study of generalizations of arithmetic operations.', '2018-10-31 12:47:16', '2018-10-31 07:17:16'),
(16, 'Number System', 99, 3, 'Review of representation of natural numbers\r\n\r\nIntegers\r\n\r\nRational numbers on the number line', '2018-10-31 14:14:39', '2018-10-31 08:44:39'),
(17, 'Trigonometry', 99, 4, 'Trigonometric ratios of an acute angle of a right-angled triangle', '2018-10-31 14:35:13', '2018-10-31 09:05:13'),
(18, 'Sets and Functions', 99, 5, 'In mathematics, a set function is a function whose input is a set. The output is usually a number. Often the input is a set of real numbers, a set of points in Euclidean space, or a set of points in some measure space.', '2018-10-31 14:37:15', '2018-10-31 09:07:15'),
(19, 'Motion', 100, 3, 'In physics, motion is a change in position of an object over time. Motion is mathematically described in terms of displacement, distance, velocity, acceleration, time, and speed.', '2018-10-31 14:39:31', '2018-10-31 09:09:31'),
(20, 'Human Eye', 100, 4, 'The Cornea: Imagine this to be like a window to a human eye. The cornea contributes to major refraction of light (bending of light rays) entering our eyes. It forms the clear front surface of a human eye. It also makes sure that foreign substances do not enter the eye.\r\n\r\nThe Iris: This lies right behind the cornea. It controls the circular opening called the pupil (aperture). It functions like an automatic camera shutter, controlling the amount of light entering a human eye.\r\n\r\nThe Crystalline Lens: The lens further focuses the light rays entering our eyes. Again, we can compare this to how an autofocus lens functions in a camera. This is called the accommodating power of the eye. Depending on where the object lies, the lens tries to focus that object.\r\n\r\nThe Vitreous Humor: This is a jelly like substance that fills most of the inner chamber of the eye. IT helps the eye maintain its spherical nature. The light rays after passing through the opening, travel through the vitreous humor before striking the retina.\r\n\r\nThe Retina: It is a light-sensitive inner lining of the human eye. Ideally, light rays should focus on the retina forming an image', '2018-10-31 14:41:30', '2018-10-31 09:12:45'),
(21, 'Chemical Equation', 101, 3, 'The representation of a chemical reaction in the form of symbols (substances) is known as a chemical equation.', '2018-10-31 14:45:15', '2018-10-31 09:15:15'),
(22, 'Chemical Bonding and Molecular', 101, 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2018-10-31 14:51:08', '2018-10-31 09:21:08'),
(23, 'Chemical Kinetics', 101, 6, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English.', '2018-10-31 14:54:19', '2018-10-31 09:24:19'),
(24, 'NUCLEUS', 104, 3, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.', '2018-10-31 15:05:40', '2018-10-31 09:35:40'),
(25, 'Biogas fuel', 104, 4, 'Biogas refers to a mixture of different gases produced by the breakdown of organic matter in the absence of oxygen. Biogas can be produced from raw materials such as agricultural waste, manure, municipal waste, plant material, sewage, green waste or food waste.', '2018-10-31 15:07:03', '2018-10-31 09:37:03'),
(26, 'Molecular Basis of Inheritance', 104, 6, 'A nitrogenous base is linked to the pentose sugar through a N-glycosidic linkage to form a nucleoside, i.e. adenosine and guanosine, etc.', '2018-10-31 15:09:41', '2018-10-31 09:39:41'),
(27, 'Letter Writing', 105, 4, 'Writing letters to the editor is a great way to engage with a topic you are passionate about and to influence public opinion.', '2018-10-31 15:13:02', '2018-10-31 09:43:02'),
(28, 'Grammer', 105, 5, 'CBSE important concepts and questions for chapter - Grammar in CBSE Class XI English. Based on CBSE and CCE guidelines. The students should read these basic concepts and practice the assignments to gain perfection which will help them to get more marks in CBSE examination.', '2018-10-31 15:15:43', '2018-10-31 09:45:43'),
(29, 'Textiles', 106, 3, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable.', '2018-10-31 15:25:00', '2018-10-31 09:55:00'),
(30, 'EcoSystem', 106, 4, 'All the Organism in an area Together with the non-living constituent', '2018-10-31 16:34:34', '2018-10-31 11:04:34'),
(31, 'Renewable resources', 106, 5, 'Renewable resources are those which can be used without the possibility of the resource becoming depleted or exhausted. That is, a continuous supply of resource remains available for e.g. tress in forest and the fish in the oceans.', '2018-10-31 16:37:03', '2018-10-31 11:07:03'),
(32, 'Global warming', 106, 6, 'Global warming is a gradual increase in the average temperature of the earth’s lower atmosphere.\r\nGlobal warming is caused by man-made increase in carbon dioxide (Co2) and other greenhouse gases through the burning of fossil fuels and deforestation.', '2018-10-31 16:38:15', '2018-10-31 11:08:15'),
(33, 'What is Lorem Ipsum?', 107, 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2018-10-31 16:52:58', '2018-10-31 11:22:58'),
(34, 'Why do we use it?', 107, 4, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#x27;Content here, content here&#x27;, making it look like readable English.', '2018-10-31 16:53:27', '2018-10-31 11:23:27'),
(35, 'Where does it come from?', 107, 5, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.', '2018-10-31 16:53:57', '2018-10-31 11:23:57'),
(36, 'Where can I get some?', 107, 6, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable.', '2018-10-31 16:54:24', '2018-10-31 11:24:24'),
(37, 'What is Lorem Ipsum?', 103, 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#x27;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '2018-11-02 10:19:28', '2018-11-02 04:49:28'),
(38, 'Where can I get some?', 103, 6, 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#x27;t look even slightly believable.', '2018-11-02 10:19:51', '2018-11-02 04:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `role`, `created_at`) VALUES
(5, 'jitendra', 'Kumar', 'jitendra.innox@gmail.com', '2147483647', '123', 'U', '2018-10-23 15:14:36'),
(11, 'jitendra', 'Kumar', 'jitendra.innox@gmail.com', '2147483647', '123', 'U', '2018-10-23 18:30:43'),
(12, 'jitendra', 'Kumar', 'kush@gamil.com', '2147483647', '123', 'U', '2018-11-02 06:13:05'),
(13, 'Kuldeep', 'Kumar', 'jitendra.innox@gmail.com', '8123458421', '1234', 'U', '2018-11-02 06:31:57');

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
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_boards`
--
ALTER TABLE `tbl_boards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_categories`
--
ALTER TABLE `tbl_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tbl_class`
--
ALTER TABLE `tbl_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_contents`
--
ALTER TABLE `tbl_contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_nano_category`
--
ALTER TABLE `tbl_nano_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tbl_sub_categories`
--
ALTER TABLE `tbl_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_topic`
--
ALTER TABLE `tbl_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
