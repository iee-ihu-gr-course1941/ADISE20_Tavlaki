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
(1, 1, 'W', 'B', 1),
(1, 2, 'W', 'B', 2),
(1, 3, 'W', 'B', 3),
(1, 4, 'W', 'B', 4),
(1, 5, 'W', 'B', 5),
(1, 6, 'W', 'B', 6),
(1, 7, 'W', 'B', 7),
(1, 8, 'W', 'B', 8),
(1, 9, 'W', 'B', 9),
(1, 10, 'W', 'B', 10),
(1, 11, 'W', 'B', 11),
(1, 12, 'W', 'B', 12),
(1, 13, 'W', 'B', 13),
(1, 14, 'W', 'B', 14),
(1, 15, 'W', 'B', 15),
(2, 0, 'B', '', 0),
(3, 0, 'W', '', 0),
(4, 0, 'B', '', 0),
(5, 0, 'W', '', 0),
(6, 0, 'B', '', 0),
(7, 0, 'W', '', 0),
(8, 0, 'B', '', 0),
(9, 0, 'W', '', 0),
(10, 0, 'B', '', 0),
(11, 0, 'W', '', 0),
(12, 0, 'B', '', 0),
(13, 0, 'W', '', 0),
(14, 0, 'B', '', 0),
(15, 0, 'W', '', 0),
(16, 0, 'B', '', 0),
(17, 0, 'W', '', 0),
(18, 0, 'B', '', 0),
(19, 0, 'W', '', 0),
(20, 0, 'B', '', 0),
(21, 0, 'W', '', 0),
(22, 0, 'B', '', 0),
(23, 0, 'W', '', 0),
(24, 1, 'B', 'W', 1);
(24, 2, 'B', 'W', 2);
(24, 3, 'B', 'W', 3);
(24, 4, 'B', 'W', 4);
(24, 5, 'B', 'W', 5);
(24, 6, 'B', 'W', 6);
(24, 7, 'B', 'W', 7);
(24, 8, 'B', 'W', 8);
(24, 9, 'B', 'W', 9);
(24, 10, 'B', 'W', 10);
(24, 11, 'B', 'W', 11);
(24, 12, 'B', 'W', 12);
(24, 13, 'B', 'W', 13);
(24, 14, 'B', 'W', 14);
(24, 15, 'B', 'W', 15);


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
(1, 1, 'W', 'B', 1),
(1, 2, 'W', 'B', 2),
(1, 3, 'W', 'B', 3),
(1, 4, 'W', 'B', 4),
(1, 5, 'W', 'B', 5),
(1, 6, 'W', 'B', 6),
(1, 7, 'W', 'B', 7),
(1, 8, 'W', 'B', 8),
(1, 9, 'W', 'B', 9),
(1, 10, 'W', 'B', 10),
(1, 11, 'W', 'B', 11),
(1, 12, 'W', 'B', 12),
(1, 13, 'W', 'B', 13),
(1, 14, 'W', 'B', 14),
(1, 15, 'W', 'B', 15),
(2, 0, 'B', '', 0),
(3, 0, 'W', '', 0),
(4, 0, 'B', '', 0),
(5, 0, 'W', '', 0),
(6, 0, 'B', '', 0),
(7, 0, 'W', '', 0),
(8, 0, 'B', '', 0),
(9, 0, 'W', '', 0),
(10, 0, 'B', '', 0),
(11, 0, 'W', '', 0),
(12, 0, 'B', '', 0),
(13, 0, 'W', '', 0),
(14, 0, 'B', '', 0),
(15, 0, 'W', '', 0),
(16, 0, 'B', '', 0),
(17, 0, 'W', '', 0),
(18, 0, 'B', '', 0),
(19, 0, 'W', '', 0),
(20, 0, 'B', '', 0),
(21, 0, 'W', '', 0),
(22, 0, 'B', '', 0),
(23, 0, 'W', '', 0),
(24, 1, 'B', 'W', 1);
(24, 2, 'B', 'W', 2);
(24, 3, 'B', 'W', 3);
(24, 4, 'B', 'W', 4);
(24, 5, 'B', 'W', 5);
(24, 6, 'B', 'W', 6);
(24, 7, 'B', 'W', 7);
(24, 8, 'B', 'W', 8);
(24, 9, 'B', 'W', 9);
(24, 10, 'B', 'W', 10);
(24, 11, 'B', 'W', 11);
(24, 12, 'B', 'W', 12);
(24, 13, 'B', 'W', 13);
(24, 14, 'B', 'W', 14);
(24, 15, 'B', 'W', 15);

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
DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `Username` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `piece_color` enum('B','W') COLLATE utf8_bin NOT NULL,
  `Token` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_action` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--
LOCK TABLES `players` WRITE;

INSERT INTO `players` VALUES ('bbbb','B','08d309a346b72c2eca5281014e8d3cad',NULL),('wwww','W','e073c6b1f674e1df58891cc2b7133cbc',NULL);

UNLOCK TABLES;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board`()
BEGIN
  replace into board select * from board_empty;
  update `players` set username=null, token=null;
    update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END ;;
DELIMITER ;
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
