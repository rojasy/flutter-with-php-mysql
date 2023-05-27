-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2022 at 12:21 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikes_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `bikeID` varchar(6) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`bikeID`, `name`) VALUES
('bike1', 'Monster Bike'),
('bike2', 'swih swih'),
('bike3', 'Anita'),
('bike4', 'guta');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(30) NOT NULL,
  `nationality` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `firstname`, `lastname`, `gender`, `phone`, `address`, `nationality`) VALUES
(14, 'Rojasy', 'charles', 'male', '0678765432', 'mikocheni', 'Tanzanian'),
(15, 'jenipher', 'siriwaaa', 'female', '0742400177', 'kigamboni', 'Tanzanian'),
(16, 'Tony', 'Ngaiza', 'male', '0765432122', 'Mgudeni', 'Tanzania'),
(17, 'Jack', 'Ngaiza', 'female', '0765432122', 'Bagamoyo', 'Tanzania'),
(18, 'James', 'Rojasy', 'male', '0628746322', 'UAUT', 'Tanzania'),
(19, 'Simon', 'Mbise', 'male', '0762543211', 'Arusha', 'Tanzania'),
(20, 'Farid', 'mussa', 'male', '0745667755', 'UAUT', 'Tanzania'),
(21, 'Theresia', 'kasela', 'female', '0754227812', 'Mgudeni', 'tanzania'),
(22, 'Rahma', 'fadhil', 'frmale', '0765432122', 'mgudeni', 'Tanzania'),
(23, 'Tishi', 'jackson', 'male', '0788997766', 'Mgudeni', 'Tanzanian'),
(24, 'Tony', 'Ngaiza', 'male', '0745057633', 'Bagamoyo', 'Tanzanian'),
(25, 'Simon', 'Mbise', 'male', '0788997766', 'UAUT', 'Tanzanian'),
(26, 'Kelvin', 'Okechi', 'male', '0745057633', 'UAUT', 'Tanzanian');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
--

CREATE TABLE `owners` (
  `ownerID` varchar(8) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `address` varchar(30) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`ownerID`, `firstname`, `lastname`, `gender`, `phone`, `address`, `nationality`, `password`) VALUES
('owner1', 'rojasy', 'ngaiza', 'male', '0745057633', 'UAUT', 'Tanzania', '12345'),
('owner3', 'Gift', 'Servas', 'male', '0745057633', 'kigamboni', 'Tanzanian', '12345'),
('owner4', 'Jackline', 'James', 'female', '0788997766', 'Mgudeni', 'Tanzania', '12345'),
('owner5', 'Costa', 'Mlekwa', 'male', '0745057633', 'kigamboni', 'Tanzanian', '12345'),
('owner6', 'Rosemary', 'Athuman', 'female', '0745057633', 'Bagamoyo', 'Tanzanian', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rentID` int(11) NOT NULL,
  `ownerID` varchar(8) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `bikeID` varchar(6) NOT NULL,
  `time` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `status` text NOT NULL,
  `time_out` datetime NOT NULL,
  `time_in` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rentID`, `ownerID`, `customerID`, `bikeID`, `time`, `price`, `status`, `time_out`, `time_in`) VALUES
(15, 'owner1', 15, 'bike1', 4, 4000, 'not paid', '2022-10-02 09:28:00', '2022-10-02 11:28:00'),
(22, 'owner1', 22, 'bike2', 2, 2000, 'paid', '2022-10-30 10:00:00', '2022-10-30 00:01:00'),
(23, 'owner1', 23, 'bike1', 2, 2000, 'paid', '2022-11-01 21:39:00', '2022-11-01 22:39:00'),
(24, 'owner1', 24, 'bike2', 1, 1000, 'paid', '2022-11-01 21:40:00', '2022-11-01 22:40:00'),
(25, 'owner1', 25, 'bike3', 4, 4000, 'not paid', '2022-11-01 21:41:00', '2022-11-01 12:41:00'),
(26, 'owner1', 26, 'bike2', 2, 2000, 'not paid', '2022-11-01 21:42:00', '2022-11-01 23:42:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`bikeID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`ownerID`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rentID`),
  ADD KEY `ownerID` (`ownerID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `bikeID` (`bikeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `owners` (`ownerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customers` (`customerID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_ibfk_3` FOREIGN KEY (`bikeID`) REFERENCES `bikes` (`bikeID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
