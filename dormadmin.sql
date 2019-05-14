-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 Mai 2019 la 11:09
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
  `pass` text NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `login`
--

INSERT INTO `login` (`username`, `pass`, `email`) VALUES
('00', '$2a$10$dIxMAChJH7WvMAsE4dBc7e5', ''),
('000', '$2a$10$Rq0aRjoohc5uydtpyuRSA.e', ''),
('0000', '$2a$10$t6drAiPwpIVpd.Rlmt9meO2', ''),
('00000', '$2a$10$GXZv0Jy10FQFhPxMAJe5NuJ', ''),
('1', '$2a$10$yiHySZ93j/d3r7ZjMStMT.C', ''),
('11', '$2a$10$7cELdxXxI/HFrZ8L9FaE2O5', ''),
('11212', '$2a$10$7BNQ74LU7B42jVN7msjqlOB', ''),
('121', '$2a$10$xJEETdN860rUwqj6oC0qPeC', ''),
('12111', '$2a$10$hRfjmgbdILPMErEqYXghJ.L', ''),
('121323', '$2a$10$LPpD4rdYL4kjK.RtGapHwuw', ''),
('123123', '$2a$10$7jwr/U6bvHekdimm59eZ8.4', ''),
('3216513', '$2a$10$1tei6Dq..lCbH.AFs5JbLuj', ''),
('32165131', '$2a$10$Mc4LtxLpuqXQUJpafUiEWeJ', ''),
('321651311', '$2a$10$LX7KnJjHB.Q.pdooUJLus.X', ''),
('3216513111', '$2a$10$MpW538myRX0urApuWcKyPeo', ''),
('32165131111', '$2a$10$kGyKVvS0AAhht4b2wsPske7', ''),
('321651311111', '$2a$10$t5f030alX.3j/9JJ.mRHUOJ', ''),
('3216513111111', '$2a$10$iMyMfakX8mhoYsYeB/0FNO0', ''),
('32165131111111', '$2a$10$gDKUv/kJGeJSFnkIGsRk/u8', ''),
('321651311111111', '$2a$10$0BFE5F8qI2dHVx1gZuW/J.1', ''),
('3442342', '$2a$10$QSSk88QOws.0eT.8ro5aVOO', ''),
('34423422', '$2a$10$7ZlYtxjv/dnpKqX4Tjt20Od', ''),
('99', '$2a$10$h5soOgsKyFnNd6W652MHLeO', ''),
('lllll', '$2a$10$NvBzJ0/iD4pM3PZ8EqAtU.p', ''),
('llllll', '$2a$10$gFqOt7YAxWo/.5hgWVl6Oef', ''),
('lllllll', '$2a$10$hDUHMQgLzNPMB3Uc.Y2oYuE', ''),
('llllllll', '$2a$10$6IpLp8ZgxyNXIlbUq/j6muW', ''),
('lllllllll', '$2a$10$FiJy3TGt60DXKuBNb0uz7Os', ''),
('llllllllll', '$2a$10$h5gn9gBiuj8eDZRrOUaUHuo', ''),
('lllllllllll', '$2a$10$8TTvFLZsWBSYj45em8gDAu.', ''),
('raul123', '1234', 'abc@gmail.com'),
('test1', '$2a$10$wZi3nAtWM92ZPNoV683hW.5Wuli.OJpCgiw9ot2T/HSg/RTrbNEQS', ''),
('test9', '$2a$10$sorgs0hR.kHwHF6hU/NgfOfd/3I/nJhavS/T10ucJetAKchoMMfA.', ''),
('testUser', '$2a$10$6QtuTY9hLHiTOzJCHe.jv.H', ''),
('Thomas13', '8426', 'thomas.g@gmail.com'),
('xbvcbxcv', '$2a$10$OA253bDr8xWjbJrSi0fUdex', ''),
('xbvcbxcv1', '$2a$10$/2/RWdy7/IlohEhOqfD0D.l', ''),
('xbvcbxcv11', '$2a$10$VEjdHcvSkrugmczku9SPh.T', ''),
('xvcbxcv', '$2a$10$g.K/wrY1mQ0.EeK4OKKWqeu', '');

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
(7, 'George', 'Preda', 'HI285', 'complaint', 'asfasvjnasklj njksbjsa bj bjasb', '', 1),
(8, 'Andrei', 'Cozma', 'IE301', 'complaint', 'dkankljsa sndskjan jasdjlk dlkjasbdjksab ksa dlkanskldnljsanf lksdlfjh sajkdbjkldsfjkdjfs', NULL, 0),
(9, 'test', 'test', 'LT336', '', 'some random message numeros dos', NULL, 0),
(10, 'test', 'test', 'LT336', '', 'some random message numeros dos', NULL, 0),
(11, 'asda', 'asdas', 'LT336', '', 'bfghfsdghdfgh', NULL, 0),
(12, 'asdasda', 'asdasdasd', 'LT336', '', 'jhnfdgjhdfgjfdgh', NULL, 0),
(13, 'Raul', 'Borza', 'GE025', 'proposal', 'asdf', NULL, 0);

-- --------------------------------------------------------

--
-- Structura de tabel pentru tabelul `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `author` text NOT NULL,
  `text` text NOT NULL,
  `datePosted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Salvarea datelor din tabel `news`
--

INSERT INTO `news` (`id`, `author`, `text`, `datePosted`) VALUES
(3, 'admin', 'kasdjlk lksd lksa a', '2019-05-13');

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
(1, 0, 3, 4, 'M', NULL),
(2, 0, 4, 4, 'M', NULL),
(3, 0, 1, 4, 'M', NULL),
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
(103, 1, 2, 4, 'F', NULL),
(104, 1, 0, 4, 'F', NULL),
(105, 1, 0, 4, 'F', NULL),
(106, 1, 0, 4, 'F', NULL),
(107, 1, 0, 3, 'F', NULL),
(108, 1, 0, 3, 'F', NULL),
(109, 1, 0, 3, 'F', NULL),
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
(210, 2, 1, 3, 'F', NULL),
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
('1990213350047', 'Thomas13', '2019-04-01', '2019-05-01', 250, 103, 'asjdhkjafkjasgjkahgwahh'),
('1930230253536', '123123', '0000-00-00', '0000-00-00', 6, 200, NULL),
('1930230253536', '121', '0000-00-00', '0000-00-00', 6, 200, NULL),
('1930230253536', '11212', '0000-00-00', '0000-00-00', 6, 200, NULL),
('1930230253536', 'xvcbxcv', '0000-00-00', '0000-00-00', 200, NULL, NULL),
('1930230253536', '121323', '2019-05-11', '0000-00-00', 200, NULL, NULL),
('1930230253536', '3442342', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '34423422', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '00', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '000', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '0000', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '00000', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '1', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '11', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '99', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '12111', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', 'xbvcbxcv', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', 'xbvcbxcv1', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', 'xbvcbxcv11', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '3216513', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '32165131', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '321651311', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '3216513111', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '32165131111', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '321651311111', '2019-05-11', '2019-06-11', 200, NULL, NULL),
('1930230253536', '3216513111111', '2019-05-11', '2019-06-11', 200, 0, NULL),
('1930230253536', '32165131111111', '2019-05-11', '2019-06-11', 200, 0, NULL),
('1930230253536', '321651311111111', '2019-05-11', '2019-06-11', 200, 1, NULL),
('1930230253536', 'lllll', '2019-05-11', '2019-06-11', 200, 1, NULL),
('1930230253536', 'llllll', '2019-05-11', '2019-06-11', 200, 1, NULL),
('1930230253536', 'lllllll', '2019-05-11', '2019-06-11', 200, 1, NULL),
('1930230253536', 'llllllll', '2019-05-11', '2019-06-11', 200, 1, NULL),
('1930230253536', 'lllllllll', '2019-05-11', '2019-06-11', 200, 210, NULL),
('1930230253536', 'llllllllll', '2019-05-11', '2019-06-11', 200, 2, NULL),
('1930230253536', 'lllllllllll', '2019-05-11', '2019-06-11', 200, 2, NULL),
('1930230253536', 'testUser', '2019-05-11', '2019-06-11', 200, 2, NULL),
('1930230253536', 'test1', '2019-05-11', '2019-06-11', 200, 2, NULL),
('1930230253536', 'test9', '2019-05-11', '2019-06-11', 200, 3, NULL);

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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
