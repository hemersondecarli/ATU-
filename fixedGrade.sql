-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 07:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `atu`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ppsn` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `course_fk` int(11) DEFAULT NULL,
  `role_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `surname`, `birthday`, `phone`, `email`, `password`, `ppsn`, `address`, `course_fk`, `role_fk`) VALUES
(24, 'staff', 'staff', '2024-04-08', 666999666, 'staff@gmail.com', 'staff', 'ppsn', 'address', NULL, 3),
(31, 'Hemerson', 'De Carli', '1996-04-19', 12345678, 'hemerson@gmail.com', 'hemerson', '124566H', 'Galway', 12, 1),
(32, 'teacher', 'tea', '1997-04-18', 12344213, 'teacher@gmail.com', 'teacher', '1213321', 'Galway', NULL, 2),
(33, 'Nelson', 'Almeida', '1995-04-14', 12345678, 'nelson@gmail.com', 'nelson', '1324231N', 'Galway', 12, 1),
(35, 'Estevan', 'Sobrinho', '2004-04-15', 12435342, 'estevan@gmail.com', 'estevan', '121322332E', 'Galway', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_booking`
--

CREATE TABLE `account_booking` (
  `id` int(11) NOT NULL,
  `account_fk` int(11) DEFAULT NULL,
  `booking_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_module`
--

CREATE TABLE `account_module` (
  `id` int(11) NOT NULL,
  `account_fk` int(11) DEFAULT NULL,
  `module_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_module`
--

INSERT INTO `account_module` (`id`, `account_fk`, `module_fk`) VALUES
(23, 32, 18);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `current_slot` int(11) DEFAULT 0,
  `max_slot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `name`, `current_slot`, `max_slot`) VALUES
(10, 'Nothern Car Park', 0, 5),
(11, 'Soulth Car Park', 0, 15),
(12, 'Library Room', 0, 7),
(13, 'South east Car park', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `message_date` datetime DEFAULT current_timestamp(),
  `account_sender_fk` int(11) NOT NULL,
  `account_receiver_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `message`, `message_date`, `account_sender_fk`, `account_receiver_fk`) VALUES
(56, 'thanks for feedback', '2024-04-26 05:21:47', 31, 32),
(57, 'No problem', '2024-04-26 05:22:22', 32, 31);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `code`) VALUES
(12, 'Software Development', 'Soft123'),
(14, 'Business', 'Bs12'),
(15, 'Software Engineer', 'SoftEng');

-- --------------------------------------------------------

--
-- Table structure for table `course_module`
--

CREATE TABLE `course_module` (
  `id` int(11) NOT NULL,
  `course_fk` int(11) DEFAULT NULL,
  `module_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_module`
--

INSERT INTO `course_module` (`id`, `course_fk`, `module_fk`) VALUES
(38, 12, 18),
(40, 14, 20),
(41, 15, 21);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `exam_date` datetime DEFAULT NULL,
  `course_module_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`id`, `name`, `exam_date`, `course_module_fk`) VALUES
(22, 'JUnit', '2024-04-26 00:00:00', 38);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `result` double DEFAULT NULL,
  `report_fk` int(11) DEFAULT NULL,
  `account_fk` int(11) DEFAULT NULL,
  `exam_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`id`, `result`, `report_fk`, `account_fk`, `exam_fk`) VALUES
(31, 9, 18, 31, 22),
(32, NULL, NULL, 33, 22),
(33, NULL, NULL, 35, 22);

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `name`) VALUES
(20, 'Business Law'),
(21, 'Mathematics'),
(18, 'Software Testing');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `report_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `title`, `description`, `report_date`) VALUES
(18, 'Exam Report', 'Excellent Result! well done!', '2024-04-26 05:20:27');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday') DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  `course_module_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `day_of_week`, `start_hour`, `end_hour`, `course_module_fk`) VALUES
(11, 'Wednesday', '15:00:00', '17:00:00', 38),
(12, 'Tuesday', '13:00:00', '14:00:00', 38),
(13, 'Tuesday', '10:00:00', '11:00:00', 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ppsn_UNIQUE` (`ppsn`),
  ADD KEY `course_fk` (`course_fk`),
  ADD KEY `role_fk` (`role_fk`);

--
-- Indexes for table `account_booking`
--
ALTER TABLE `account_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_fk` (`account_fk`),
  ADD KEY `booking_fk` (`booking_fk`);

--
-- Indexes for table `account_module`
--
ALTER TABLE `account_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_fk` (`account_fk`),
  ADD KEY `module_fk` (`module_fk`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_sender_fk` (`account_sender_fk`),
  ADD KEY `account_receiver_fk` (`account_receiver_fk`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `course_module`
--
ALTER TABLE `course_module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_fk` (`course_fk`),
  ADD KEY `module_fk` (`module_fk`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_module_ibfk_1_idx` (`course_module_fk`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_fk` (`report_fk`),
  ADD KEY `account_fk` (`account_fk`),
  ADD KEY `exam_fk` (`exam_fk`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_module_fk_idx` (`course_module_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `account_booking`
--
ALTER TABLE `account_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `account_module`
--
ALTER TABLE `account_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `course_module`
--
ALTER TABLE `course_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`course_fk`) REFERENCES `course` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `account_ibfk_2` FOREIGN KEY (`role_fk`) REFERENCES `role` (`id`);

--
-- Constraints for table `account_booking`
--
ALTER TABLE `account_booking`
  ADD CONSTRAINT `account_booking_ibfk_1` FOREIGN KEY (`account_fk`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_booking_ibfk_2` FOREIGN KEY (`booking_fk`) REFERENCES `booking` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_module`
--
ALTER TABLE `account_module`
  ADD CONSTRAINT `account_module_ibfk_1` FOREIGN KEY (`account_fk`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_module_ibfk_2` FOREIGN KEY (`module_fk`) REFERENCES `module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`account_sender_fk`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`account_receiver_fk`) REFERENCES `account` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_module`
--
ALTER TABLE `course_module`
  ADD CONSTRAINT `course_module_ibfk_1` FOREIGN KEY (`course_fk`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_module_ibfk_2` FOREIGN KEY (`module_fk`) REFERENCES `module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `course_module_fk` FOREIGN KEY (`course_module_fk`) REFERENCES `course_module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`report_fk`) REFERENCES `report` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`account_fk`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`exam_fk`) REFERENCES `exam` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `timetable`
--
ALTER TABLE `timetable`
  ADD CONSTRAINT `course_module_fgk` FOREIGN KEY (`course_module_fk`) REFERENCES `course_module` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
