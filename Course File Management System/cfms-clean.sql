-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2015 at 11:56 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cfms-clean`
--

-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE IF NOT EXISTS `batch` (
  `intake` varchar(255) NOT NULL,
  `batchID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`batchID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` (`intake`, `batchID`) VALUES
('20122013', 1),
('20132014', 2),
('20142015', 3),
('20152016', 4);

-- --------------------------------------------------------

--
-- Table structure for table `batch_courses`
--

CREATE TABLE IF NOT EXISTS `batch_courses` (
  `batchID` int(11) NOT NULL,
  `sem` int(2) NOT NULL,
  `courseCode` varchar(255) NOT NULL,
  `courseID` int(11) NOT NULL,
  `label` int(2) NOT NULL,
  `major` varchar(10) NOT NULL,
  PRIMARY KEY (`batchID`,`courseID`,`courseCode`),
  KEY `courseID` (`courseID`),
  KEY `courses_ID` (`courseCode`,`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batch_courses`
--

INSERT INTO `batch_courses` (`batchID`, `sem`, `courseCode`, `courseID`, `label`, `major`) VALUES
(2, 1, 'SCSI', 1013, 0, 'SCSJ'),
(2, 1, 'SCSJ', 1013, 0, 'SCSJ'),
(2, 1, 'SCSR', 1013, 0, 'SCSJ'),
(2, 2, 'SCSJ', 1023, 0, 'SCSJ'),
(2, 2, 'SCSI', 1113, 0, 'SCSJ'),
(2, 2, 'SCSR', 1213, 0, 'SCSJ'),
(2, 2, 'SCSV', 1223, 0, 'SCSJ'),
(2, 1, 'SCSD', 1513, 0, 'SCSJ'),
(2, 3, 'SCSJ', 2013, 0, 'SCSJ'),
(2, 3, 'SCSR', 2033, 0, 'SCSJ'),
(2, 4, 'SCSR', 2043, 0, 'SCSJ'),
(2, 3, 'SCSV', 2113, 0, 'SCSJ'),
(2, 4, 'SCSI', 2143, 0, 'SCSJ'),
(2, 4, 'SCSJ', 2154, 0, 'SCSJ'),
(2, 4, 'SCSJ', 2203, 0, 'SCSJ'),
(2, 4, 'SCSJ', 2253, 0, 'SCSJ'),
(2, 4, 'SCSJ', 2363, 0, 'SCSJ'),
(2, 3, 'SCSD', 2523, 0, 'SCSJ'),
(2, 3, 'SCSD', 2613, 0, 'SCSJ'),
(2, 6, 'SCSJ', 3032, 2, 'SCSJ'),
(2, 5, 'SCSJ', 3104, 1, 'SCSJ'),
(2, 5, 'SCSJ', 3203, 1, 'SCSJ'),
(2, 6, 'SCSJ', 3253, 2, 'SCSJ'),
(2, 5, 'SCSJ', 3303, 1, 'SCSJ'),
(2, 6, 'SCSJ', 3323, 2, 'SCSJ'),
(2, 5, 'SCSJ', 3343, 1, 'SCSJ'),
(2, 6, 'SCSJ', 3403, 2, 'SCSJ'),
(2, 5, 'SCSJ', 3553, 1, 'SCSJ'),
(2, 6, 'SCSJ', 3563, 2, 'SCSJ'),
(2, 5, 'SCSJ', 3603, 1, 'SCSJ'),
(2, 6, 'SCSD', 3761, 2, 'SCSJ'),
(2, 7, 'SCSJ', 4114, 3, 'SCSJ'),
(2, 7, 'SCSJ', 4118, 3, 'SCSJ'),
(2, 8, 'SCSJ', 4134, 4, 'SCSJ'),
(2, 8, 'SCSJ', 4383, 4, 'SCSJ'),
(2, 8, 'SCSJ', 4423, 4, 'SCSJ'),
(2, 8, 'SCSJ', 4463, 4, 'SCSJ'),
(2, 8, 'SCSJ', 4483, 4, 'SCSJ');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseCode` varchar(5) NOT NULL,
  `courseID` int(11) NOT NULL,
  `courseName` varchar(255) NOT NULL,
  `shortForm` varchar(255) NOT NULL,
  `creditHours` int(1) NOT NULL,
  PRIMARY KEY (`courseCode`,`courseID`),
  KEY `courseCode` (`courseCode`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseCode`, `courseID`, `courseName`, `shortForm`, `creditHours`) VALUES
('SCSB', 2103, 'Bioinformatics I', 'Bioinformatics I', 3),
('SCSB', 3032, 'Bioinformatic Project I', 'Bioinformatic Project I', 2),
('SCSB', 3103, 'Bioinformatics II', 'Bioinformatics II', 3),
('SCSB', 3133, 'Computational Biology I', 'Comp Biology I', 3),
('SCSB', 3203, 'Programming for Bioinformatics', 'Programming for Bioinformatics', 3),
('SCSB', 3213, 'Bioinformatics Database', 'Bioinformatics Database', 3),
('SCSB', 3223, 'Computational Biology II', 'Comp Biology II', 3),
('SCSB', 4114, 'Industrial Training Report', 'LI Report', 4),
('SCSB', 4118, 'Industrial Training (HW)', 'LI (HW)', 8),
('SCSB', 4134, 'Bioinformatics Project II', 'Bioinformatics Project II', 4),
('SCSB', 4213, 'Bioinformatics Visualization', 'Bioinformatics Visualization', 3),
('SCSB', 4243, 'Special Topics in Bioinformatics', 'Special Topics in Bioinformatics', 3),
('SCSB', 4313, 'Bioinformatics Modelling and Simulation', 'Bioinformatics Modelling and Simulation', 3),
('SCSD', 1513, 'Technology & Information System', 'TIS', 3),
('SCSD', 2523, 'Database', 'DB', 3),
('SCSD', 2613, 'System Analysis and  Design', 'SADM', 3),
('SCSD', 2623, 'Database Programming', 'Database Programming', 3),
('SCSD', 3761, 'Technopreneurship Seminar', 'Technopreneurship Seminar', 1),
('SCSI', 1013, 'Discrete Structure', 'Discrete Structure', 3),
('SCSI', 1113, 'Computational Mathematics', 'Comp Maths', 3),
('SCSI', 2143, 'Probability & Statistical Data Analysis', 'PSDA', 3),
('SCSJ', 1013, 'Programming Technique I', 'PT I', 3),
('SCSJ', 1023, 'Programming Technique II', 'PT II', 3),
('SCSJ', 2013, 'Data Structure and Algorithm', 'Data Structure and Algorithm', 3),
('SCSJ', 2154, 'Object-Oriented Programming', 'OOP', 4),
('SCSJ', 2203, 'Software Engineering', 'SE', 3),
('SCSJ', 2253, 'Requirement Engineering & Software Modelling', 'RESM', 3),
('SCSJ', 2363, 'Software Project Management', 'Software Project Management', 3),
('SCSJ', 3032, 'Software Engineering Project I', 'SE Project I', 2),
('SCSJ', 3104, 'Applications Development', 'AD', 4),
('SCSJ', 3203, 'Computer Science Theory', 'CST', 3),
('SCSJ', 3253, 'Programming Technique III', 'PT III', 3),
('SCSJ', 3303, 'Internet Programming', 'IP', 3),
('SCSJ', 3323, 'Software Design & Architecture', 'SDA', 3),
('SCSJ', 3343, 'Software Quality Assurance', 'SQA', 3),
('SCSJ', 3403, 'Special Topics in Software Engineering', 'Special Topics in SE', 3),
('SCSJ', 3553, 'Artificial Intelligence', 'AI', 3),
('SCSJ', 3563, 'Computational Intelligence', 'CI', 3),
('SCSJ', 3603, 'Knowledge-based Expert System', 'Knowledge-based Expert System', 3),
('SCSJ', 4114, 'Industrial Training Report', 'LI Report', 4),
('SCSJ', 4118, 'Industrial Training (HW)', 'LI (HW)', 8),
('SCSJ', 4134, 'Software Engineering Project II', 'SE Project II', 4),
('SCSJ', 4383, 'Software Construction', 'Software Construction', 3),
('SCSJ', 4423, 'Real-time Software Engineering', 'Real-time SE', 3),
('SCSJ', 4463, 'Agent-Oriented Software Engineering', 'Agent-Oriented Software Engineering', 3),
('SCSJ', 4483, 'Web Technology', 'Web Technology', 3),
('SCSR', 1013, 'Digital Logic', 'Digital Logic', 3),
('SCSR', 1213, 'Network Communications', 'Net Comm', 3),
('SCSR', 2033, 'Computer Organisation & Architecture', 'COA', 3),
('SCSR', 2043, 'Operating Systems', 'OS', 3),
('SCSR', 2233, 'Network', 'Network', 3),
('SCSR', 2242, 'Computer Networks', 'Computer Networks', 3),
('SCSR', 2941, 'Computer Networks Lab', 'Computer Networks Lab', 3),
('SCSR', 3032, 'Computer Network & Security Project I', 'Computer Network & Security Project I', 2),
('SCSR', 3104, 'Applications Development', 'AD', 4),
('SCSR', 3242, 'Inter Networking Technology', 'Inter Networking Technology', 2),
('SCSR', 3243, 'Netcentric Computing', 'Netcentric Computing', 3),
('SCSR', 3253, 'Network Programming', 'Network Programming', 3),
('SCSR', 3413, 'Computer Security', 'Computer Security', 3),
('SCSR', 3443, 'Cryptography', 'Cryptography', 3),
('SCSR', 3941, 'Inter Networking Technology Lab', 'Inter Networking Technology Lab', 1),
('SCSR', 4114, 'Industrial Training Report', 'LI Report', 4),
('SCSR', 4118, 'Industrial Training (HW)', 'LI (HW)', 8),
('SCSR', 4273, 'Network Administration and Management', 'Network Administration and Management', 3),
('SCSR', 4283, 'Network Analysis and Design Simulation', 'Network Analysis and Design Simulation', 3),
('SCSR', 4453, 'Network Security', 'Network Security', 3),
('SCSR', 4473, 'Security Management', 'Security Management', 3),
('SCSR', 4483, 'Security Programming', 'Security Prog', 3),
('SCSR', 4493, 'Computer Forensic', 'Computer Forensic', 3),
('SCSR', 4973, 'Computer Network & Security Special Topic', 'Computer Network & Security Special Topic', 3),
('SCSV', 1113, 'Mathematics for Computer Graphics', 'Mathematics for Computer Graphics', 3),
('SCSV', 1223, 'Web Programming', 'Web Prog', 3),
('SCSV', 2013, 'Graphic Design', 'Graphic Design', 3),
('SCSV', 2113, 'Human Computer Interaction', 'HCI', 3),
('SCSV', 2122, 'Fundamental of image Processing', 'Fundamental of image Processing', 3),
('SCSV', 3032, 'Graphics and Multimedia Software Project I', 'Graphics and Multimedia Software Project I', 2),
('SCSV', 3104, 'Applications Development', 'AD', 4),
('SCSV', 3113, 'Geometric Modelling', 'Geometric Modelling', 3),
('SCSV', 3123, 'Real-time Computer Graphics', 'Real-time Computer Graphics', 3),
('SCSV', 3213, 'Fundamental of Image Processing', 'Fundamental of Image Processing', 3),
('SCSV', 3223, 'Multimedia Data Processing', 'Multimedia Data Processing', 3),
('SCSV', 3233, 'Multimedia Networking', 'Multimedia Networking', 3),
('SCSV', 4114, 'Industrial Training Report', 'LI Report', 4),
('SCSV', 4118, 'Industrial Training (HW)', 'LI (HW)', 8),
('SCSV', 4213, 'Computer Games Development', 'Computer Games Development', 3),
('SCSV', 4233, 'Data Visualization', 'Data Visualization', 3),
('SCSV', 4263, 'Multimedia Web Programming', 'Multimedia Web Programming', 3),
('SCSV', 4273, 'Introduction to Speech Recognition', 'Introduction to Speech Recognition', 3),
('SCSV', 4283, 'Windows Programming', 'Windows Programming', 3),
('UCSD', 2762, 'Fundamental of Technopreneurship', 'Fundamental of Technopreneurship', 2),
('UHAS', 1162, 'Art, Custom and Beliefs of Malaysia', 'Art, Custom and Beliefs of Malaysia', 2),
('UHAS', 1172, 'Malaysia Dynamic', 'Malaysia Dynamic', 2),
('UICI', 1022, 'Islamic & Aisan Civilisation (TITAS)', 'TITAS', 2),
('UICI', 2032, 'Science, Technology & Human', 'STM', 2),
('ULAB', 1112, 'Academic English Skills', 'Academic English Skills', 2),
('ULAB', 2122, 'Advanced Academic English Skills', 'Advanced Academic English Skills', 2),
('ULAB', 3162, 'English for Professional Purpose', 'English for Professional Purpose', 2),
('ULAM', 1112, 'Bahasa Melayu untuk Komunikasi', 'Bahasa Melayu untuk Komunikasi', 2);

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
  KEY `username` (`username`),
  KEY `course_ID` (`courseCode`,`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `departmentID` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(255) NOT NULL,
  `major` varchar(255) NOT NULL,
  PRIMARY KEY (`departmentID`),
  KEY `department` (`department`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentID`, `department`, `major`) VALUES
(2, 'Software Engineering', 'Software Engineering'),
(3, 'Computer Science', 'Computer Science'),
(4, 'Information System', 'Information System');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
  `fileID` int(255) NOT NULL AUTO_INCREMENT,
  `fileDirectory` varchar(255) NOT NULL,
  PRIMARY KEY (`fileID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer_upload`
--

CREATE TABLE IF NOT EXISTS `lecturer_upload` (
  `fileID` int(11) NOT NULL,
  `sectionID` int(11) NOT NULL,
  `checklistID` int(11) NOT NULL,
  PRIMARY KEY (`fileID`,`sectionID`),
  KEY `sectionID` (`sectionID`),
  KEY `checklistID` (`checklistID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `name` varchar(255) NOT NULL,
  `emailAdd` varchar(255) NOT NULL,
  `phoneNo` varchar(20) NOT NULL,
  `departmentID` int(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  KEY `username` (`username`),
  KEY `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`name`, `emailAdd`, `phoneNo`, `departmentID`, `status`, `username`) VALUES
('ADMIN', 'admin@admin.com', '999', 4, 'Active', 'admin'),
('Super!!', 'super@gmail.com!!', '999', 2, 'Active', 'super');

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
  `sectionMajor` varchar(20) NOT NULL,
  PRIMARY KEY (`sectionID`),
  UNIQUE KEY `course_section` (`course_offered_ID`,`sectionNo`),
  KEY `username` (`username`),
  KEY `course_offered_ID` (`course_offered_ID`),
  KEY `semesterID` (`semesterID`),
  KEY `courseID` (`courseID`),
  KEY `coursess_ID` (`courseCode`,`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `section_lecturer`
--

CREATE TABLE IF NOT EXISTS `section_lecturer` (
  `section_lecturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `sectionID` int(11) NOT NULL,
  PRIMARY KEY (`section_lecturer_id`),
  KEY `username` (`username`),
  KEY `sectionID` (`sectionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `upload_checklist`
--

CREATE TABLE IF NOT EXISTS `upload_checklist` (
  `checklistID` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`checklistID`),
  UNIQUE KEY `label_2` (`label`),
  KEY `label` (`label`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `upload_checklist`
--

INSERT INTO `upload_checklist` (`checklistID`, `label`, `description`, `status`) VALUES
(1, 'Appointment Letter', 'Appointment Letter of Lecturer', 'active'),
(2, 'L1', 'L1', 'active'),
(3, 'Student List', 'Student List', 'active'),
(4, 'Slides', 'Copy of Teaching Material', 'active'),
(5, 'Course Work', 'Assignments/Tutorials/Labs Related/Others', 'active'),
(6, 'Quizes and Mid-Term', 'Quizes/Mid-Term Exams papers with answer scheme', 'active'),
(7, 'Final Exam', 'Final Exam Papers with answer scheme', 'active'),
(8, 'Course work grades', 'Course work grades', 'active'),
(9, 'Grade Report', 'Grade sheet and statistical report', 'active'),
(10, 'Attendance Report', 'Attendance list and record of consultation with problematic students', 'active'),
(11, 'E-learning', 'A snapshot of e-learning/individual website for course management', 'active'),
(12, 'Questionaire', 'Course survey questionnaires and results', 'active'),
(13, 'Others teaching materials', 'Other materials related to teaching', 'active'),
(14, 'Course coordinator report', 'Course coordinator report', 'active'),
(15, 'Course Review Report', 'Course Review Report', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` varchar(20) NOT NULL,
  `viewPermission` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `usertype`, `viewPermission`) VALUES
('admin', 'admin', 'root', 'PENTADBIR'),
('super', '12345', 'super', 'PENTADBIR');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=101 ;

--
-- Dumping data for table `year_semester`
--

INSERT INTO `year_semester` (`semesterID`, `year`, `semester`) VALUES
(100, '20152016', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_offered`
--
ALTER TABLE `course_offered`
  ADD CONSTRAINT `course_ID` FOREIGN KEY (`courseCode`, `courseID`) REFERENCES `course` (`courseCode`, `courseID`),
  ADD CONSTRAINT `course_offered_ibfk_1` FOREIGN KEY (`semesterID`) REFERENCES `year_semester` (`semesterID`),
  ADD CONSTRAINT `course_offered_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `lecturer_upload`
--
ALTER TABLE `lecturer_upload`
  ADD CONSTRAINT `lecturer_upload_ibfk_2` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`),
  ADD CONSTRAINT `lecturer_upload_ibfk_3` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`),
  ADD CONSTRAINT `lecturer_upload_ibfk_4` FOREIGN KEY (`checklistID`) REFERENCES `upload_checklist` (`checklistID`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`);

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `coursess_ID` FOREIGN KEY (`courseCode`, `courseID`) REFERENCES `course` (`courseCode`, `courseID`),
  ADD CONSTRAINT `section_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `section_ibfk_2` FOREIGN KEY (`semesterID`) REFERENCES `year_semester` (`semesterID`),
  ADD CONSTRAINT `section_ibfk_3` FOREIGN KEY (`course_offered_ID`) REFERENCES `course_offered` (`course_offered_ID`);

--
-- Constraints for table `section_lecturer`
--
ALTER TABLE `section_lecturer`
  ADD CONSTRAINT `section_lecturer_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `section_lecturer_ibfk_2` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
