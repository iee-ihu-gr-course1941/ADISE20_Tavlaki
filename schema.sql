-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2021 at 06:45 PM
-- Server version: 10.1.47-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `schema`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN
REPLACE INTO board SELECT * FROM board_empty;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `board`
--
DROP TABLE IF EXISTS `board`;

/* CREATE TABLE `board` (
  `Position` int(11) NOT NULL,
  `p_color` enum('G','R') COLLATE utf8_bin NOT NULL,
  `pieces` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
*/

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `b_color` enum('G','R') NOT NULL,
  `first_color` enum('R','G') DEFAULT NULL,
  `second_color` enum('R','G') DEFAULT NULL,
  `total_pieces` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY ('x')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`x`, `p_color`, `first_color`, 'second_color', 'total_pieces') VALUES
(1, 'R', 'R', 'R', 15),
(2, 'G', '', '' , 0),
(3, 'R', '', '' , 0)),
(4, 'G', '', '' , 0)),
(5, 'R', '', '' , 0)),
(6, 'G', '', '' , 0)),
(7, 'R', '', '' , 0)),
(8, 'G', '', '' , 0)),
(9, 'R', '', '' , 0)),
(10, 'G', '', '' , 0)),
(11, 'R', '', '' , 0)),
(12, 'G', '', '' , 0)),
(13, 'R', '', '' , 0)),
(14, 'G', '', '' , 0)),
(15, 'R', '', '' , 0)),
(16, 'G', '', '' , 0)),
(17, 'R', '', '' , 0)),
(18, 'G', '', '' , 0)),
(19, 'R', '', '' , 0)),
(20, 'G', '', '' , 0)),
(21, 'R', '', '' , 0)),
(22, 'G', '', '' , 0)),
(23, 'R', '', '' , 0)),
(24, 'G', 'G','G', 15);

-- --------------------------------------------------------

--
-- Table structure for table `board_empty`
--
DROP TABLE IF EXISTS `board_empty`;


CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `b_color` enum('G','R') NOT NULL,
  `first_color` enum('R','G') DEFAULT NULL,
  `second_color` enum('R','G') DEFAULT NULL,
  `total_pieces` tinyint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY ('x')
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `board_empty`
--
INSERT INTO `board_empty` (`x`, `p_color`, `first_color`, 'second_color', 'total_pieces') VALUES
(1, 'R', 'R', 'R', 15),
(2, 'G', '', '' , 0),
(3, 'R', '', '' , 0)),
(4, 'G', '', '' , 0)),
(5, 'R', '', '' , 0)),
(6, 'G', '', '' , 0)),
(7, 'R', '', '' , 0)),
(8, 'G', '', '' , 0)),
(9, 'R', '', '' , 0)),
(10, 'G', '', '' , 0)),
(11, 'R', '', '' , 0)),
(12, 'G', '', '' , 0)),
(13, 'R', '', '' , 0)),
(14, 'G', '', '' , 0)),
(15, 'R', '', '' , 0)),
(16, 'G', '', '' , 0)),
(17, 'R', '', '' , 0)),
(18, 'G', '', '' , 0)),
(19, 'R', '', '' , 0)),
(20, 'G', '', '' , 0)),
(21, 'R', '', '' , 0)),
(22, 'G', '', '' , 0)),
(23, 'R', '', '' , 0)),
(24, 'G', 'G','G', 15);
/*
INSERT INTO `board_empty` (`Position`, `p_color`, `pieces`) VALUES
(1, 'G', 'P1'),
(2, 'G', 'P2'),
(3, 'G', 'P3'),
(4, 'G', 'P4'),
(5, 'G', 'P5'),
(6, '', ''),
(7, '', ''),
(8, '', ''),
(9, '', ''),
(10, '', ''),
(11, '', ''),
(12, '', ''),
(13, '', ''),
(14, '', ''),
(15, '', ''),
(16, '', ''),
(17, '', ''),
(18, '', ''),
(19, '', ''),
(20, 'R', 'P5'),
(21, 'R', 'P4'),
(22, 'R', 'P3'),
(23, 'R', 'P2'),
(24, 'R', 'P1');
*/
-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--
DROP TABLE IF EXISTS `game_status`;


CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') COLLATE utf8_bin NOT NULL,
  `p_turn` enum('R','G') COLLATE utf8_bin DEFAULT NULL,
  `result` enum('B','W','D') COLLATE utf8_bin NOT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Triggers `game_status`
--

/*
LOCK TABLES `game_status` WRITE;

INSERT INTO `game_status` VALUES ('started','B',NULL,'2020-12-17 13:22:25');

UNLOCK TABLES;
*/

DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
SET NEW.last_change = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--
DROP TABLE IF EXISTS `players`;


CREATE TABLE `players` (
  `Username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `p_color` enum('R','G') COLLATE utf8_bin NOT NULL,
  `Token` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`Username`, `p_color`, `Token`, `last_action`) VALUES
(NULL, 'R', '', '2021-01-04 16:41:44'),
(NULL, 'G', '', '2021-01-04 16:42:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`Position`,`p_color`);

--
-- Indexes for table `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`Position`,`p_color`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`p_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
