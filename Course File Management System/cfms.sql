-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: sql6.freesqldatabase.com
-- Generation Time: Aug 04, 2015 at 09:56 AM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sql685415`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--


CREATE TABLE IF NOT EXISTS `course` (
  `courseCode` varchar(5) NOT NULL,
  `courseID` int(11) NOT NULL,
  `courseName` varchar(255) NOT NULL,
  `creditHours` int(1) NOT NULL,
  PRIMARY KEY (`courseCode`,`courseID`),
  KEY `courseCode` (`courseCode`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseCode`, `courseID`, `courseName`, `creditHours`) VALUES
('SCSB', 1203, 'Database', 3),
('SCSJ', 1013, 'Computational Math.', 3),
('SCSR', 2233, 'Network', 3),
('SCSV', 2013, 'Graphic Desgin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `course_offered`
--

CREATE TABLE IF NOT EXISTS `course_offered` (
  `semesterID` int(11) NOT NULL,
  `courseCode` varchar(5) NOT NULL,
  `courseID` int(11) NOT NULL,
  `username` varchar(225) DEFAULT NULL,
  `course_offered_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`course_offered_ID`),
  KEY `semesterID` (`semesterID`),
  KEY `courseCode` (`courseCode`),
  KEY `courseID` (`courseID`),
  KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fileID` int(255) NOT NULL AUTO_INCREMENT,
  `fileDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fileID`, `fileDirectory`) VALUES
(1, 'abc'),
(2, 'def');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `name` varchar(255) NOT NULL,
  `emailAdd` varchar(255) NOT NULL,
  `phoneNo` varchar(10) NOT NULL,
  `department` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`emailAdd`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`name`, `emailAdd`, `phoneNo`, `department`, `status`, `username`) VALUES
('Yan Xin', 'abc@gmail.com', '123456789', 'Software Engineering', 'Active', 'yxng'),
('HAHAHA', 'lecturer@utm.my', '123456789', 'Software Engineering', 'Active', 'lecturer'),
('Pensyarah Hebat', 'pensyarah@utm.my', '102227827', 'Computer Graphics & Multimedia', 'Active', 'pensyarah');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE IF NOT EXISTS `section` (
  `username` varchar(255) NOT NULL,
  `semesterID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL AUTO_INCREMENT,
  `course_offered_ID` int(11) NOT NULL,
  `courseCode` varchar(5) NOT NULL,
  `courseID` int(5) NOT NULL,
  `sectionNo` int(2) NOT NULL,
  PRIMARY KEY (`sectionID`),
  KEY `username` (`username`),
  KEY `course_offered_ID` (`course_offered_ID`),
  KEY `semesterID` (`semesterID`),
  KEY `courseCode` (`courseCode`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE IF NOT EXISTS `upload` (
  `fileID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `checklist` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`,`sectionID`),
  KEY `sectionID` (`sectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `usertype`) VALUES
('lecturer', '123456', 'lecturer'),
('pensyarah', 'test', 'lecturer'),
('pentadbir', '12345678', 'admin'),
('yxng', '12345', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `year_semester`
--

CREATE TABLE IF NOT EXISTS `year_semester` (
  `semesterID` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(10) NOT NULL,
  `semester` int(1) NOT NULL,
  PRIMARY KEY (`semesterID`),
  UNIQUE KEY `session` (`year`,`semester`),
  KEY `semester` (`semester`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `year_semester`
--

INSERT INTO `year_semester` (`semesterID`, `year`, `semester`) VALUES
(100, '20142015', 1),
(101, '20142015', 2),
(102, '20142015', 3),
(103, '20152016', 1),
(104, '20152016', 2),
(105, '20152016', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_offered`
--
ALTER TABLE `course_offered`
  ADD CONSTRAINT `course_offered_ibfk_4` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  ADD CONSTRAINT `course_offered_ibfk_1` FOREIGN KEY (`semesterID`) REFERENCES `year_semester` (`semesterID`),
  ADD CONSTRAINT `course_offered_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `course_offered_ibfk_3` FOREIGN KEY (`courseCode`) REFERENCES `course` (`courseCode`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`semesterID`) REFERENCES `year_semester` (`semesterID`),
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`course_offered_ID`) REFERENCES `course_offered` (`course_offered_ID`),
  ADD CONSTRAINT `section_ibfk_4` FOREIGN KEY (`courseCode`) REFERENCES `course` (`courseCode`),
  ADD CONSTRAINT `section_ibfk_5` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`);

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `upload_ibfk_2` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`),
  ADD CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
