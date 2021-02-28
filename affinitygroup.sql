-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 28, 2021 at 04:11 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobpostingsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `affinitygroup`
--

CREATE TABLE `affinitygroup` (
  `groupid` int(11) NOT NULL,
  `grouptitle` varchar(50) NOT NULL,
  `groupdescription` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affinitygroup`
--

INSERT INTO `affinitygroup` (`groupid`, `grouptitle`, `groupdescription`) VALUES
(1, 'Students', 'A group for students to come together and try to get jobs'),
(2, 'Employers', 'Group for employers'),
(3, 'Java', 'Group for java developers');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affinitygroup`
--
ALTER TABLE `affinitygroup`
  ADD PRIMARY KEY (`groupid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affinitygroup`
--
ALTER TABLE `affinitygroup`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
