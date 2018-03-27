-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2018 at 04:46 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project3`
--

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `id` int(11) NOT NULL,
  `first` text NOT NULL,
  `middle` text,
  `last` text NOT NULL,
  `picture` text,
  `date` date DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL,
  `married` date DEFAULT NULL,
  `gender` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `family`
--

INSERT INTO `family` (`id`, `first`, `middle`, `last`, `picture`, `date`, `creator_id`, `birth`, `death`, `married`, `gender`) VALUES
(27, 'Holly', 'D', 'Groesbeck', 'Holly-Groesbeck-female20091023351192749.jpg', NULL, 1, '1995-10-02', NULL, NULL, 'Female'),
(28, 'Carmela', 'S', 'Patterson', 'Carmela-Patterson-female20161025036506073.jpg', NULL, 1, '1993-12-27', NULL, NULL, 'Female'),
(29, 'Todd', 'E', 'Nichols', 'Todd-Nichols-male108572482764.jpg', NULL, 1, '1979-10-10', NULL, NULL, 'Male'),
(30, 'Scott', 'A', 'Hutson', 'Scott-Hutson-male1084179421967.jpg', NULL, 1, '1983-10-25', NULL, NULL, 'Male'),
(31, 'Tricia', 'R', 'Owens', 'Tricia-Owens-female1021886416229.jpg', NULL, 1, '1962-02-13', NULL, NULL, 'Female'),
(32, 'Glen', 'J', 'Hartley', 'Glen-Hartley-male1084956637451.jpg', NULL, 1, '1969-11-02', '2016-12-03', NULL, 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `family`
--
ALTER TABLE `family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
