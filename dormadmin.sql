-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 Mai 2019 la 16:00
-- Versiune server: 10.1.31-MariaDB
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
-- Structura de tabel pentru tabelul `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `login`
--

INSERT INTO `login` (`username`, `pass`, `email`) VALUES
('raul123', '1234', 'abc@gmail.com'),
('Thomas13', '8426', 'thomas.g@gmail.com');

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `messages`
--

CREATE TABLE `messages` (
  `ID` int(11) NOT NULL,
  `fName` varchar(30) NOT NULL,
  `lName` varchar(30) NOT NULL,
  `facCode` varchar(30) NOT NULL,
  `type` varchar(14) NOT NULL,
  `msg` text NOT NULL,
  `response` text,
  `answered` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `messages`
--

INSERT INTO `messages` (`ID`, `fName`, `lName`, `facCode`, `type`, `msg`, `response`, `answered`) VALUES
(1, 'Raul', 'Borza', 'GE025', 'question', 'KJajkjdnljadjkNCL DKLSNAFKJA N SJND JKJANSD  S\r\n A\r\nS D\r\nSA F JOAJEGJSDKJGNAKSN', 'ana are mere', 1),
(2, 'Mihai', 'Georgescu', 'PH111', 'complaint', 'lkjnasfknasknf sk d a\r\n sd\r\n ad a', 'kansf sam, m,das f;,mnsd lk;', 1),
(4, 'Raul', 'Borza', 'GE025', 'question', 'kjdhnfkjnaskf;jbs;jafjk abfjs\'dfads\r\nf\r\nasdf\r\nasdfsadfsda', 'ana are mere', 1),
(6, 'Edwin', 'Vicze', 'IE300', 'question', 'ala bala portocala', NULL, 0),
(7, 'George', 'Preda', 'HI285', 'complaint', 'asfasvjnasklj njksbjsa bj bjasb', NULL, 0),
(8, 'Andrei', 'Cozma', 'IE301', 'complaint', 'dkankljsa sndskjan jasdjlk dlkjasbdjksab ksa dlkanskldnljsanf lksdlfjh sajkdbjkldsfjkdjfs', NULL, 0);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `rooms`
--

CREATE TABLE `rooms` (
  `ID` int(10) NOT NULL,
  `floor` int(10) NOT NULL,
  `currCapacity` int(10) NOT NULL,
  `maxCapacity` int(10) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `comments` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `rooms`
--

INSERT INTO `rooms` (`ID`, `floor`, `currCapacity`, `maxCapacity`, `sex`, `comments`) VALUES
(1, 0, 0, 4, 'M', NULL),
(2, 0, 0, 4, 'M', NULL),
(3, 0, 0, 4, 'M', NULL),
(4, 0, 0, 4, 'M', NULL),
(5, 0, 0, 4, 'M', NULL),
(6, 0, 0, 4, 'M', NULL),
(7, 0, 0, 3, 'M', NULL),
(8, 0, 0, 3, 'M', NULL),
(9, 0, 0, 3, 'M', NULL),
(10, 0, 0, 3, 'M', NULL),
(11, 0, 0, 2, 'M', NULL),
(12, 0, 0, 2, 'M', NULL),
(13, 0, 0, 2, 'M', NULL),
(14, 0, 0, 2, 'M', NULL),
(15, 0, 0, 2, 'M', NULL),
(101, 1, 0, 4, 'F', NULL),
(102, 1, 0, 4, 'F', NULL),
(103, 1, 1, 4, 'F', NULL),
(104, 1, 0, 4, 'F', NULL),
(105, 1, 0, 4, 'F', NULL),
(106, 1, 0, 4, 'F', NULL),
(107, 1, 0, 3, 'F', NULL),
(108, 1, 0, 3, 'F', NULL),
(109, 1, 1, 3, 'F', NULL),
(110, 1, 0, 3, 'F', NULL),
(111, 1, 0, 2, 'F', NULL),
(112, 1, 0, 2, 'F', NULL),
(113, 1, 0, 2, 'F', NULL),
(114, 1, 0, 2, 'F', NULL),
(115, 1, 0, 2, 'F', NULL),
(201, 2, 0, 4, 'M', NULL),
(202, 2, 0, 4, 'M', NULL),
(203, 2, 0, 4, 'M', NULL),
(204, 2, 0, 4, 'F', NULL),
(205, 2, 0, 4, 'F', NULL),
(206, 2, 0, 4, 'F', NULL),
(207, 2, 0, 3, 'M', NULL),
(208, 2, 0, 3, 'M', NULL),
(209, 2, 0, 3, 'F', NULL),
(210, 2, 0, 3, 'F', NULL),
(211, 2, 0, 2, 'M', NULL),
(212, 2, 0, 2, 'M', NULL),
(213, 2, 0, 2, 'F', NULL),
(214, 2, 0, 2, 'F', NULL),
(215, 2, 0, 2, 'F', NULL);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `students`
--

CREATE TABLE `students` (
  `CNP` varchar(14) NOT NULL,
  `fName` char(30) NOT NULL,
  `lName` char(30) NOT NULL,
  `faculty` char(30) NOT NULL,
  `facCode` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `students`
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
-- Structura de tabel pentru tabelul `users`
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
-- Salvarea datelor din tabel `users`
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
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`ID`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrictii pentru tabele sterse
--

--
-- Restrictii pentru tabele `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_cnp_constraint` FOREIGN KEY (`CNP`) REFERENCES `students` (`CNP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_username_constraint` FOREIGN KEY (`username`) REFERENCES `login` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
