-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2024 at 01:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
(25, 'hemerson', 'de carli', '1998-04-16', 1234554322, 'hemerson@gmail.com', 'hemerson', '1235432h', 'galway rd, Co.Galway', 8, 1),
(26, 'teacher', 'teacher', '2001-04-12', 121213232, 'teacher@gmail.com', 'teacher', '12322ds', 'galway', NULL, 2),
(27, 'nelson', 'mandela', '1990-04-13', 12334433, 'nelson@gmail.com', 'nelson', '1221213d', 'portugal', 8, 1),
(28, 'test', 'testz', '2024-04-01', 12212121, 'test@gmail.com', 'test', '2112s', 'test', 9, 1);

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
(22, 26, 12);

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
(7, 'Library studying room', 0, 5),
(8, 'car park', 0, 2);

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
(15, 'hi ! how are you', '2024-04-08 21:43:57', 27, 26),
(16, 'hey, you failed', '2024-04-08 21:44:08', 26, 27),
(17, 'hi', '2024-04-08 23:26:24', 25, 26),
(18, 'hello', '2024-04-08 23:26:44', 26, 25);

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
(8, 'Software Development', 'Soft2024'),
(9, 'Software Engineering', 'SofEng123'),
(10, 'test', 'test');

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
(33, 8, 12),
(34, 8, 13),
(35, 9, 14),
(36, 10, 15);

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
(17, 'first inclass assignment', '2024-04-08 00:00:00', 33),
(18, 'testing', '2024-04-12 00:00:00', 33),
(19, 'test', '2023-04-12 00:00:00', 33);

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
(17, NULL, NULL, 25, 17),
(18, NULL, NULL, 27, 17),
(20, NULL, NULL, 25, 18),
(21, NULL, NULL, 27, 18),
(23, NULL, NULL, 25, 19),
(24, NULL, NULL, 27, 19);

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
(14, 'Electronics'),
(13, 'Mathematics'),
(12, 'Software Testing'),
(15, 'test');

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
(8, 'Wednesday', '09:00:00', '10:00:00', 35),
(9, 'Monday', '14:00:00', '15:00:00', 33);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `account_booking`
--
ALTER TABLE `account_booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `account_module`
--
ALTER TABLE `account_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `course_module`
--
ALTER TABLE `course_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
