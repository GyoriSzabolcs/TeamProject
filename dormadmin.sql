-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2019 at 10:10 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dormadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `pass`, `email`) VALUES
('adiminune', 'adiaditzu', 'maneleeviata@yahoo.com'),
('gratzzie', 'abcd1234', 'spaghetii@hotmail.com'),
('marius23', 'anaaremere', 'marius.nume@gmail.com'),
('username1', 'ijdsa656', 'llalalla@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `CNP` varchar(14) NOT NULL,
  `fName` char(30) NOT NULL,
  `lName` char(30) NOT NULL,
  `faculty` char(30) NOT NULL,
  `facCode` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`CNP`, `fName`, `lName`, `faculty`, `facCode`) VALUES
('1940330254653', 'Raul', 'Andreescu', 'Sociology-Psychology', 'SP222'),
('1960425856325', 'Alex', 'Dorin', 'Mathematics-Informatics', 'IE456'),
('1970303524476', 'Alex', 'Marin', 'History', 'HI356'),
('1990213350047', 'Thomas', 'Gurtler', 'Mathematics-Informatics', 'IE945'),
('1990614302515', 'Marius', 'Stanescu', 'Literature', 'LT634'),
('2971122685326', 'Daniela', 'Carici', 'Literature', 'LT888'),
('2981028345876', 'Andreea', 'Manea', 'Literature', 'LT685'),
('2990202625342', 'Maria', 'Grigore', 'Geography', 'GE369');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `CNP` varchar(14) NOT NULL,
  `username` varchar(30) NOT NULL,
  `enrollDate` date DEFAULT NULL,
  `nextPaymentDate` date DEFAULT NULL,
  `nextPaymentSum` float DEFAULT NULL,
  `roomNumber` int(3) DEFAULT NULL,
  `details` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`CNP`, `username`, `enrollDate`, `nextPaymentDate`, `nextPaymentSum`, `roomNumber`, `details`) VALUES
('1990614302515', 'marius23', '2019-04-03', NULL, 200, 7, NULL),
('2971122685326', 'gratzzie', '2019-04-03', NULL, 230, 22, NULL),
('1970303524476', 'adiminune', '2019-04-03', NULL, 250, 13, NULL),
('1940330254653', 'username1', '2019-04-03', NULL, 200, 7, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`CNP`),
  ADD UNIQUE KEY `facCode` (`facCode`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD KEY `username` (`username`),
  ADD KEY `CNP` (`CNP`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`username`) REFERENCES `login` (`username`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`CNP`) REFERENCES `students` (`CNP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
