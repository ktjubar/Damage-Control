-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2018 at 04:04 AM
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
-- Database: `familyspy`
--

-- --------------------------------------------------------

--
-- Table structure for table `important_event`
--

CREATE TABLE `important_event` (
  `id` int(11) NOT NULL,
  `year` smallint(5) UNSIGNED NOT NULL,
  `month` tinyint(3) UNSIGNED DEFAULT NULL,
  `day` tinyint(3) UNSIGNED DEFAULT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `person_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `important_event`
--

INSERT INTO `important_event` (`id`, `year`, `month`, `day`, `title`, `details`, `date_created`, `person_id`, `creator_id`) VALUES
(1000, 1977, 8, 18, 'Survived Childhood Cancer', 'When he was younger, Guy had a terrible battle with elbow cancer. After a long, grueling fight, it finally went into remission and he is now cancer-free.', '2018-03-15 20:35:51', 1000, 1),
(1001, 1998, 12, 20, 'Ate Cheeto Dust-fried Mac \'n\' Cheese', 'A quite impressive and very important feat to note, Guy once had fried mac and cheese that was fried in Cheeto dust instead of bread crumbs. It became his favorite dish, and he still loves it to this day.', '2018-03-15 20:35:51', 1000, 1),
(1002, 2002, 2, 1, 'Learned to Pole Vault While Throwing Shotput', 'Guy Fieri is now a world-renowned pole vaulter. While he isn\'t the best at it, in 2002 he learned how to do it simultaneously while throwing shotput. He has competed in the Olympics before on the Flavortown team, but has never won a medal.', '2018-03-15 20:36:48', 1000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birth_year` smallint(5) UNSIGNED DEFAULT NULL,
  `birth_month` tinyint(3) UNSIGNED DEFAULT NULL,
  `birth_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `death_year` smallint(5) UNSIGNED DEFAULT NULL,
  `death_month` tinyint(3) UNSIGNED DEFAULT NULL,
  `death_day` tinyint(3) UNSIGNED DEFAULT NULL,
  `age` tinyint(3) UNSIGNED NOT NULL,
  `gender` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `first_name`, `middle_name`, `last_name`, `birth_year`, `birth_month`, `birth_day`, `death_year`, `death_month`, `death_day`, `age`, `gender`, `file_name`, `timestamp`, `creator_id`) VALUES
(1000, 'Guy', 'Ramsay', 'Fieri', 1968, 1, 22, NULL, NULL, NULL, 50, 'male', 'guy.jpg', '2018-03-15 20:27:09', 1),
(1001, 'Lori', NULL, 'Fieri', 1973, NULL, NULL, NULL, NULL, NULL, 45, 'female', 'lori.jpg', '2018-03-15 20:27:09', 1),
(1002, 'Hunter', NULL, 'Fieri', 1996, 8, 7, NULL, NULL, NULL, 21, 'male', 'hunter.jpg', '2018-03-15 20:28:17', 1),
(1003, 'Ryder', NULL, 'Fieri', 2005, NULL, NULL, NULL, NULL, NULL, 13, 'male', 'ryder.jpg', '2018-03-15 20:29:01', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `important_event`
--
ALTER TABLE `important_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `important_event`
--
ALTER TABLE `important_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `important_event`
--
ALTER TABLE `important_event`
  ADD CONSTRAINT `important_event_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
