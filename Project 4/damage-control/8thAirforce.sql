-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 27, 2018 at 07:14 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `8thAirforce`
--

-- --------------------------------------------------------

--
-- Table structure for table `Important_Events`
--

CREATE TABLE `Important_Events` (
  `ID` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Title` text NOT NULL,
  `Details` text NOT NULL,
  `Date_Created` date NOT NULL,
  `Person_Id` int(10) NOT NULL,
  `Creater_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Soldiers`
--

CREATE TABLE `Soldiers` (
  `ID` int(10) NOT NULL,
  `First_Name` text NOT NULL,
  `Last_Name` text NOT NULL,
  `Rank` text NOT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Date_of_Death` date DEFAULT NULL,
  `Creator_Id` int(11) NOT NULL,
  `Crew` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `Important_Events`
--
ALTER TABLE `Important_Events`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Person_Id` (`Person_Id`);

--
-- Indexes for table `Soldiers`
--
ALTER TABLE `Soldiers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Important_Events`
--
ALTER TABLE `Important_Events`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `Soldiers`
--
ALTER TABLE `Soldiers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Important_Events`
--
ALTER TABLE `Important_Events`
  ADD CONSTRAINT `Important_Events_ibfk_1` FOREIGN KEY (`Person_Id`) REFERENCES `Soldiers` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
