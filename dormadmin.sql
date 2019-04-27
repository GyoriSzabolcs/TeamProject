-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2019 at 05:05 PM
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
('raul123', '1234', 'abc@gmail.com'),
('Thomas13', '8426', 'thomas.g@gmail.com');

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
('1930230253536', 'Raul', 'Borza', 'Geography', 'GE025'),
('1950718023521', 'Andrei', 'Cozma', 'ComputerScience', 'IE301'),
('1961010365262', 'Mihai', 'Georgescu', 'Physics', 'PH111'),
('1970228136529', 'Edwin', 'Vicze', 'ComputerScience', 'IE300'),
('1980325475458', 'George', 'Preda', 'History', 'HI285'),
('1990213350047', 'Thomas', 'Gurtler', 'ComputerScience', 'IE945'),
('2000630452152', 'Angela', 'Roibu', 'Literature', 'LT370'),
('2960915258744', 'Andreea', 'Borza', 'Mathematics', 'MI785'),
('2990202352698', 'Raluca', 'Birca', 'Biology', 'BG475'),
('2990702359865', 'Maria', 'Apreutesii', 'Literature', 'LT336');

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
('1930230253536', 'raul123', '2019-04-16', '2019-05-22', 200, 103, NULL),
('1990213350047', 'Thomas13', '2019-04-01', '2019-05-01', 250, 109, 'asjdhkjafkjasgjkahgwahh');

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
  ADD KEY `users_cnp_constraint` (`CNP`),
  ADD KEY `users_username_constraint` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cnp_constraint` FOREIGN KEY (`CNP`) REFERENCES `students` (`CNP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_username_constraint` FOREIGN KEY (`username`) REFERENCES `login` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
