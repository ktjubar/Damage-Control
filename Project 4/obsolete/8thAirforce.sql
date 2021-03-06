-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 29, 2018 at 03:58 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

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
-- Table structure for table `Crews`
--

CREATE TABLE `Crews` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Creator_ID` int(11) UNSIGNED NOT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
--
-- Dumping data for table `Crews`
--

INSERT INTO `Crews` (`ID`, `Name`, `Creator_ID`, `Date_Created`) VALUES
(91, '91st Bomb Group: The Ragged Irregulars', 1, '2018-03-29 19:03:29'),
(381, '381st Bomb Group', 1, '2018-03-29 19:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `Soldiers`
--

CREATE TABLE `Soldiers` (
  `ID` int(11) UNSIGNED NOT NULL,
  `First_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Last_Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Rank` int(2) UNSIGNED NOT NULL,
  `Date_of_Birth` date DEFAULT NULL,
  `Date_of_Death` date DEFAULT NULL,
  `Crew_ID` int(11) UNSIGNED DEFAULT NULL,
  `Creator_ID` int(11) UNSIGNED NOT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Soldiers`
--

INSERT INTO `Soldiers` (`ID`, `First_Name`, `Last_Name`, `Rank`, `Date_of_Birth`, `Date_of_Death`, `Crew_ID`, `Creator_ID`, `Date_Created`) VALUES
(1, 'Stanley', 'Wray', 6, '1907-09-15', '1986-09-13', 91, 1, '2018-03-29 20:13:25'),
(2, 'Baskin', 'Lawrence', 9, '1905-03-25', NULL, 91, 1, '2018-03-29 20:29:50'),
(3, 'Claude', 'Putnam', 6, '1915-10-07', '1965-05-06', 91, 1, '2018-03-29 20:33:55'),
(4, 'Harry', 'Leber', 6, '1911-07-14', '1966-02-16', 381, 1, '2018-03-29 20:36:41'),
(5, 'Melvin', 'Hecker', 4, NULL, '1975-03-01', 381, 1, '2018-03-29 20:39:58'),
(6, 'Conway', 'Hall', 6, NULL, NULL, 381, 1, '2018-03-29 20:44:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Crews`
--
ALTER TABLE `Crews`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `Soldiers`
--
ALTER TABLE `Soldiers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Crew_ID` (`Crew_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Crews`
--
ALTER TABLE `Crews`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Soldiers`
--
ALTER TABLE `Soldiers`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
