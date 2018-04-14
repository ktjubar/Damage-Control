-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2018 at 01:36 AM
-- Server version: 5.6.39
-- PHP Version: 7.0.27

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
  `ID` int(5) UNSIGNED NOT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Nickname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Creator_ID` int(11) UNSIGNED DEFAULT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Crews`
--

INSERT INTO `Crews` (`ID`, `Name`, `Nickname`, `Creator_ID`, `Date_Created`) VALUES
(91, '91st Bomb Group', 'The Ragged Irregulars', 1, '2018-03-29 19:03:29'),
(381, '381st Bomb Group', NULL, 1, '2018-03-29 19:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `Feed_Activity`
--

CREATE TABLE `Feed_Activity` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Creator_ID` int(11) UNSIGNED NOT NULL,
  `User_Name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `Soldier_ID` int(11) UNSIGNED DEFAULT NULL,
  `Crew_ID` int(11) UNSIGNED DEFAULT NULL,
  `Delete_Name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Feed_Activity`
--

INSERT INTO `Feed_Activity` (`ID`, `Type`, `Creator_ID`, `User_Name`, `Soldier_ID`, `Crew_ID`, `Delete_Name`, `Date_Created`) VALUES
(3, 'addSoldier', 1, '', 3, NULL, NULL, '2018-04-12 18:44:01');

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
  `Creator_ID` int(11) UNSIGNED DEFAULT NULL,
  `Date_Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Soldiers`
--

INSERT INTO `Soldiers` (`ID`, `First_Name`, `Last_Name`, `Rank`, `Date_of_Birth`, `Date_of_Death`, `Crew_ID`, `Creator_ID`, `Date_Created`) VALUES
(1000, 'Stanley', 'Wray', 6, '1907-09-15', '1986-09-13', 91, 1, '2018-03-29 20:13:25'),
(1001, 'Baskin', 'Lawrence', 9, '1905-03-25', NULL, 91, 1, '2018-03-29 20:29:50'),
(1002, 'Claude', 'Putnam', 6, '1915-10-07', '1965-05-06', 91, 1, '2018-03-29 20:33:55'),
(1003, 'Harry', 'Leber', 6, '1911-07-14', '1966-02-16', 381, 1, '2018-03-29 20:36:41'),
(1004, 'Melvin', 'Hecker', 4, NULL, '1975-03-01', 381, 1, '2018-03-29 20:39:58'),
(1005, 'Conway', 'Hall', 6, NULL, NULL, 381, 1, '2018-03-29 20:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `ID` int(11) UNSIGNED NOT NULL,
  `User` varchar(40) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `Pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `First_Name` varchar(100) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `Last_Name` varchar(100) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `Middle_Name` varchar(100) CHARACTER SET latin7 COLLATE latin7_general_cs DEFAULT NULL,
  `Gender` int(1) UNSIGNED NOT NULL DEFAULT '2',
  `Email` varchar(100) CHARACTER SET latin7 COLLATE latin7_general_cs NOT NULL,
  `Auth_Level` int(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`ID`, `User`, `Pass`, `First_Name`, `Last_Name`, `Middle_Name`, `Gender`, `Email`, `Auth_Level`) VALUES
(1, 'admin', '$2y$10$a8w/B8SI8PrV3DGYot854.UnjXUpMOuM1idbpcbnd.YDVhTAraKcy', 'Kaleb', 'Jubar', NULL, 0, 'mmk9624@vt.edu', 2);

-- --------------------------------------------------------

--
-- Table structure for table `User_Relations`
--

CREATE TABLE `User_Relations` (
  `User1` int(11) UNSIGNED NOT NULL,
  `User2` int(11) UNSIGNED NOT NULL,
  `Relationship` int(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Crews`
--
ALTER TABLE `Crews`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Creator_ID` (`Creator_ID`);

--
-- Indexes for table `Feed_Activity`
--
ALTER TABLE `Feed_Activity`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Creator_ID` (`Creator_ID`),
  ADD KEY `Soldier_ID` (`Soldier_ID`),
  ADD KEY `Crew_ID` (`Crew_ID`);

--
-- Indexes for table `Soldiers`
--
ALTER TABLE `Soldiers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Crew_ID` (`Crew_ID`),
  ADD KEY `Creator_ID` (`Creator_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `User_Relations`
--
ALTER TABLE `User_Relations`
  ADD UNIQUE KEY `User2` (`User2`),
  ADD KEY `User1` (`User1`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Feed_Activity`
--
ALTER TABLE `Feed_Activity`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Soldiers`
--
ALTER TABLE `Soldiers`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Crews`
--
ALTER TABLE `Crews`
  ADD CONSTRAINT `Crew_Creator` FOREIGN KEY (`Creator_ID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL;

--
-- Constraints for table `Soldiers`
--
ALTER TABLE `Soldiers`
  ADD CONSTRAINT `Soldier_Creator` FOREIGN KEY (`Creator_ID`) REFERENCES `Users` (`ID`) ON DELETE SET NULL,
  ADD CONSTRAINT `Soldier_Crew` FOREIGN KEY (`Crew_ID`) REFERENCES `Crews` (`ID`);

--
-- Constraints for table `User_Relations`
--
ALTER TABLE `User_Relations`
  ADD CONSTRAINT `User1` FOREIGN KEY (`User1`) REFERENCES `Users` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `User2` FOREIGN KEY (`User2`) REFERENCES `Users` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
