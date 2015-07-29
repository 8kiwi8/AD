-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2015 at 07:35 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cfms`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `adminName` varchar(255) NOT NULL,
  `emailAdd` varchar(255) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `position` varchar(255) NOT NULL,
  `userID` int(11) NOT NULL,
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`adminName`, `emailAdd`, `phoneNo`, `position`, `userID`) VALUES
('Abdullah bin Ahmad', 'abdullah1990@live.com.my', '161234567', 'Admin', 1),
('Hassan bin Hussein', 'hassan89@yahoo.com', '178899657', 'Executive Admin', 1),
('Lo King Wei', 'lokingwei@gmail.com', '123567219', 'Assistant Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseCode` varchar(10) NOT NULL,
  `courseName` varchar(30) NOT NULL,
  `courseID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3564 ;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseCode`, `courseName`, `courseID`) VALUES
('SCSJ', 'PROGRAMMING TECHNIQUE I', 1013),
('SCSJ', 'PROGRAMMING TECHNIQUE II', 1023),
('SCSI', 'COMPUTATIONAL MATHEMATICS', 1113),
('SCSR', 'NETWORK COMMUNICATION', 1213),
('SCSV', 'WEB PROGRAMMING', 1223),
('SCSD', 'INFORMATION SYSTEM AND TECHNOL', 1513),
('SCSI', 'PROBABILITY AND STATISTICAL DA', 2143),
('SCSJ', 'OBJECT ORIENTED PROGRAMMING', 2154),
('SCSJ', 'SOFTWARE ENGINEERING', 2203),
('SCSJ', 'COMPUTATIONAL INTELLIGENCE', 3563);

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `filesID` int(11) NOT NULL AUTO_INCREMENT,
  `filesDir` varchar(200) NOT NULL,
  PRIMARY KEY (`filesID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`filesID`, `filesDir`) VALUES
(1, 'C:\\Users\\zavie_000\\Documents\\GitHub\\AD\\Course File Management System\\Files\\kiwi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `userID` int(11) NOT NULL,
  `lectName` varchar(50) NOT NULL,
  `emailAdd` varchar(100) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `department` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lecturer`
--

INSERT INTO `lecturer` (`userID`, `lectName`, `emailAdd`, `phoneNo`, `department`, `status`) VALUES
(0, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Computer Science', 1),
(1, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Software Engineering', 1),
(0, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Computer Science', 1),
(1, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Software Engineering', 1),
(0, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Computer Science', 1),
(1, 'Ahmad Rafiuddin', 'ahmad@gmail.com', '0123456789', 'Software Engineering', 1);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `sectionID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `filesID` int(11) NOT NULL,
  `courseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`sectionID`),
  UNIQUE KEY `userID` (`userID`),
  KEY `filesID` (`filesID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionID`, `userID`, `filesID`, `courseID`) VALUES
(1, 0, 1, 1013),
(2, 1, 1, 1023);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `semesterID` int(11) NOT NULL AUTO_INCREMENT,
  `semesterDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`semesterID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=201420154 ;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semesterID`, `semesterDescription`) VALUES
(200620071, 'awesome'),
(200620072, 'Good'),
(200620073, 'Fantastic'),
(200720081, 'Pretty'),
(200720082, 'Bravo'),
(200720083, 'Worth it'),
(200820091, 'Handsome'),
(200820092, 'Cute'),
(200820093, 'Effective'),
(200920101, 'Efficient'),
(200920102, 'Adorable'),
(200920103, 'Cool'),
(201020111, 'Great'),
(201020112, 'Amazing'),
(201020113, 'Stupendous'),
(201120121, 'Sensational'),
(201120122, 'Marvelous'),
(201120123, 'Outstanding'),
(201220131, 'Excellent'),
(201220132, 'Exceptional'),
(201220133, 'Superb'),
(201320141, 'Radical'),
(201320142, 'Top Notch'),
(201320143, 'Wonderful'),
(201420151, 'Perfect'),
(201420152, 'Dedication'),
(201420153, 'Incredible');

-- --------------------------------------------------------

--
-- Table structure for table `semester_course`
--

CREATE TABLE IF NOT EXISTS `semester_course` (
  `semesterID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL,
  PRIMARY KEY (`semesterID`,`courseID`),
  KEY `semesterID` (`semesterID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester_course`
--

INSERT INTO `semester_course` (`semesterID`, `courseID`) VALUES
(201420151, 1213),
(201420151, 1223),
(201420151, 1513),
(201420152, 1013),
(201420152, 1023),
(201420152, 1113);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` int(1) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`userID`, `username`, `password`, `usertype`) VALUES
(1, 'admin', '12345', 0),
(2, 'lecturer', '11111', 1),
(3, 'pentadbir', '22222', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `userlogin` (`userID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`filesID`) REFERENCES `files` (`filesID`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `lecturer` (`userID`),
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`);

--
-- Constraints for table `semester_course`
--
ALTER TABLE `semester_course`
  ADD CONSTRAINT `semester_course_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  ADD CONSTRAINT `semester_course_ibfk_2` FOREIGN KEY (`semesterID`) REFERENCES `semester` (`semesterID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
