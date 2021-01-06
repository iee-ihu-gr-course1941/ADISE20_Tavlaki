-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2021 at 10:49 AM
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
  `piece_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `pieces` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `board`
--

INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `pieces`) VALUES
(1, 1, '', '', 1),
(2, 0, '', '', 0),
(3, 0, '', '', 3),
(4, 0, '', '', 4),
(5, 0, '', '', 5),
(6, 0, '', '', 0),
(7, 0, '', '', 0),
(8, 0, '', '', 0),
(9, 0, '', '', 0),
(10, 0, '', '', 0),
(11, 0, '', '', 0),
(12, 0, '', '', 0),
(13, 0, '', '', 0),
(14, 0, '', '', 0),
(15, 0, '', '', 0),
(16, 0, '', '', 0),
(17, 0, '', '', 0),
(18, 0, '', '', 0),
(19, 0, '', '', 0),
(20, 0, '', '', 5),
(21, 0, '', '', 4),
(22, 0, '', '', 3),
(23, 0, '', '', 2),
(24, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(11) NOT NULL,
  `y` tinyint(11) NOT NULL,
  `b_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `piece_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `pieces` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `pieces`) VALUES
(1, 1, '', '', 1),
(2, 0, '', '', 0),
(3, 0, '', '', 3),
(4, 0, '', '', 4),
(5, 0, '', '', 5),
(6, 0, '', '', 0),
(7, 0, '', '', 0),
(8, 0, '', '', 0),
(9, 0, '', '', 0),
(10, 0, '', '', 0),
(11, 0, '', '', 0),
(12, 0, '', '', 0),
(13, 0, '', '', 0),
(14, 0, '', '', 0),
(15, 0, '', '', 0),
(16, 0, '', '', 0),
(17, 0, '', '', 0),
(18, 0, '', '', 0),
(19, 0, '', '', 0),
(20, 0, '', '', 5),
(21, 0, '', '', 4),
(22, 0, '', '', 3),
(23, 0, '', '', 2),
(24, 0, '', '', 1);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`piece_color`);

--
-- Indexes for table `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`x`,`piece_color`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`p_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
