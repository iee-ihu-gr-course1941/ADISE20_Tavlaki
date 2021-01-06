-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2021 at 06:13 PM
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

CREATE TABLE `board` (
  `x` tinyint(11) NOT NULL,
  `y` tinyint(11) NOT NULL,
  `b_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `piece_color` enum('B','W') COLLATE utf8_bin DEFAULT NULL,
  `pieces` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `pieces`) VALUES
(1, 1, 'B', 'W', 1),
(1, 2, 'B', 'W', 2),
(1, 3, 'B', 'W', 3),
(1, 4, 'B', 'W', 4),
(1, 5, 'B', 'W', 5),
(1, 6, 'B', 'W', 6),
(1, 7, 'B', 'W', 7),
(1, 8, 'B', 'W', 8),
(1, 9, 'B', 'W', 9),
(1, 10, 'B', 'W', 10),
(1, 11, 'B', 'W', 11),
(1, 12, 'B', 'W', 12),
(1, 13, 'B', 'W', 13),
(1, 14, 'B', 'W', 14),
(1, 15, 'B', 'W', 15),
(2, 1, 'W', NULL, NULL),
(3, 1, 'B', NULL, NULL),
(4, 1, 'W', NULL, NULL),
(5, 1, 'B', NULL, NULL),
(6, 1, 'W', NULL, NULL),
(7, 1, 'B', NULL, NULL),
(8, 1, 'W', NULL, NULL),
(9, 1, 'B', NULL, NULL),
(10, 1, 'W', NULL, NULL),
(11, 1, 'B', NULL, NULL),
(12, 1, 'W', NULL, NULL),
(13, 1, 'B', NULL, NULL),
(14, 1, 'W', NULL, NULL),
(15, 1, 'B', NULL, NULL),
(16, 1, 'W', NULL, NULL),
(17, 1, 'B', NULL, NULL),
(18, 1, 'W', NULL, NULL),
(19, 1, 'B', NULL, NULL),
(20, 1, 'W', NULL, NULL),
(21, 1, 'B', NULL, NULL),
(22, 1, 'W', NULL, NULL),
(23, 1, 'B', NULL, NULL),
(24, 1, 'W', 'W', 1),
(24, 2, 'W', 'W', 2),
(24, 3, 'W', 'W', 3),
(24, 4, 'W', 'W', 4),
(24, 5, 'W', 'W', 5),
(24, 6, 'W', 'W', 6),
(24, 7, 'W', 'W', 7),
(24, 8, 'W', 'W', 8),
(24, 9, 'W', 'W', 9),
(24, 10, 'W', 'W', 10),
(24, 11, 'W', 'W', 11),
(24, 12, 'W', 'W', 12),
(24, 13, 'W', 'W', 13),
(24, 14, 'W', 'W', 14),
(24, 15, 'W', 'W', 15);

-- --------------------------------------------------------

--
-- Table structure for table `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(11) NOT NULL,
  `y` tinyint(11) NOT NULL,
  `b_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `piece_color` enum('B','W') COLLATE utf8_bin DEFAULT NULL,
  `pieces` tinyint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `pieces`) VALUES
(1, 1, 'B', 'W', 1),
(1, 2, 'B', 'W', 2),
(1, 3, 'B', 'W', 3),
(1, 4, 'B', 'W', 4),
(1, 5, 'B', 'W', 5),
(1, 6, 'B', 'W', 6),
(1, 7, 'B', 'W', 7),
(1, 8, 'B', 'W', 8),
(1, 9, 'B', 'W', 9),
(1, 10, 'B', 'W', 10),
(1, 11, 'B', 'W', 11),
(1, 12, 'B', 'W', 12),
(1, 13, 'B', 'W', 13),
(1, 14, 'B', 'W', 14),
(1, 15, 'B', 'W', 15),
(2, 1, 'W', NULL, NULL),
(3, 1, 'B', NULL, NULL),
(4, 1, 'W', NULL, NULL),
(5, 1, 'B', NULL, NULL),
(6, 1, 'W', NULL, NULL),
(7, 1, 'B', NULL, NULL),
(8, 1, 'W', NULL, NULL),
(9, 1, 'B', NULL, NULL),
(10, 1, 'W', NULL, NULL),
(11, 1, 'B', NULL, NULL),
(12, 1, 'W', NULL, NULL),
(13, 1, 'B', NULL, NULL),
(14, 1, 'W', NULL, NULL),
(15, 1, 'B', NULL, NULL),
(16, 1, 'W', NULL, NULL),
(17, 1, 'B', NULL, NULL),
(18, 1, 'W', NULL, NULL),
(19, 1, 'B', NULL, NULL),
(20, 1, 'W', NULL, NULL),
(21, 1, 'B', NULL, NULL),
(22, 1, 'W', NULL, NULL),
(23, 1, 'B', NULL, NULL),
(24, 1, 'W', 'W', 1),
(24, 2, 'W', 'W', 2),
(24, 3, 'W', 'W', 3),
(24, 4, 'W', 'W', 4),
(24, 5, 'W', 'W', 5),
(24, 6, 'W', 'W', 6),
(24, 7, 'W', 'W', 7),
(24, 8, 'W', 'W', 8),
(24, 9, 'W', 'W', 9),
(24, 10, 'W', 'W', 10),
(24, 11, 'W', 'W', 11),
(24, 12, 'W', 'W', 12),
(24, 13, 'W', 'W', 13),
(24, 14, 'W', 'W', 14),
(24, 15, 'W', 'W', 15);

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') COLLATE utf8_bin NOT NULL,
  `p_turn` enum('B','W') COLLATE utf8_bin DEFAULT NULL,
  `result` enum('B','W','D') COLLATE utf8_bin NOT NULL,
  `last_change` timestamp NULL DEFAULT NULL,
  `dice1` tinyint(6) NOT NULL,
  `dice2` tinyint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Triggers `game_status`
--
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

CREATE TABLE `players` (
  `Username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `p_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `Token` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`Username`, `p_color`, `Token`, `last_action`) VALUES
(NULL, '', '', '2021-01-06 13:42:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`p_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
