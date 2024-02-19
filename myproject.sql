-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2024 at 09:15 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_popular_courses`
-- (See below for the actual view)
--
CREATE TABLE `all_popular_courses` (
`ID` int(11)
,`courses_name` varchar(255)
,`about_this_course` varchar(1000)
,`skill_level` varchar(255)
,`students_count` int(11)
,`course_language` varchar(255)
,`lecture_Count` int(11)
,`total_video_time` float
,`Certificates` varchar(1000)
,`Features` varchar(1000)
,`Description` varchar(3000)
,`mentor_id` int(11)
,`cat_ID` int(11)
,`image` varchar(255)
,`cat_name_en` varchar(255)
,`cat_name_ar` varchar(255)
,`Mentor_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_ID` int(11) NOT NULL,
  `cat_name_en` varchar(255) NOT NULL,
  `cat_name_ar` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_ID`, `cat_name_en`, `cat_name_ar`, `image`) VALUES
(1, '3D_Design', 'efd', '3D_Design.png'),
(2, 'web_Development', '', 'web_Development.png'),
(3, 'finance_&_Accounting', '', 'finance_&_Accounting.png'),
(4, 'graphic_Design', '', 'graphic_Design.png'),
(5, 'hR_Management', '', 'hR_Management.png'),
(6, 'office_Productivity', '', 'office_Productivity.png'),
(7, 'personal_Development', '', 'personal_Development.png'),
(8, 'SEO_&_Marketing', '', 'SEO_&_Marketing.png');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `ID` int(11) NOT NULL,
  `mentor_id` int(255) NOT NULL,
  `course_id` int(255) NOT NULL,
  `comment` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `courses_name` varchar(255) NOT NULL,
  `about_this_course` varchar(1000) NOT NULL,
  `skill_level` varchar(255) NOT NULL,
  `students_count` int(11) NOT NULL,
  `course_language` varchar(255) NOT NULL,
  `lecture_Count` int(11) NOT NULL,
  `total_video_time` float NOT NULL,
  `Certificates` varchar(1000) NOT NULL,
  `Features` varchar(1000) NOT NULL,
  `Description` varchar(3000) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `cat_ID` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID`, `courses_name`, `about_this_course`, `skill_level`, `students_count`, `course_language`, `lecture_Count`, `total_video_time`, `Certificates`, `Features`, `Description`, `mentor_id`, `cat_ID`, `image`) VALUES
(1, 'flutter', 'hggfrdfsbn', 'no level', 9865, 'arabic', 9865, 5, 'sdfcvios', 'ios and android', '[pofkjgngfdlkbv', 2, 1, 'imag.png'),
(2, 'design', 'df', 'fd', 1000, 'fd', 510, 2152, '9854', '8+965', '9865', 2, 8, '984'),
(3, 'fd', 'df', 'fd', 500, 'fd', 510, 2152, '9854', '8+965', '9865', 2, 4, '984'),
(4, '89654', 'df', 'fd', 100, 'fd', 510, 2152, '9854', '8+965', '9865', 1, 1, '984'),
(5, 'fd', 'df', 'fd', 120, 'fd', 510, 2152, '9854', '8+965', '9865', 2, 6, '984'),
(6, 'fd', 'df', 'fd', 1010, 'fd', 510, 2152, '9854', '8+965', '9865', 2, 2, '984'),
(7, 'fd', 'df', 'fd', 1000, 'fd', 510, 2152, '9854', '8+965', '9865', 2, 5, '984');

-- --------------------------------------------------------

--
-- Table structure for table `course_departments`
--

CREATE TABLE `course_departments` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numbering` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_departments`
--

INSERT INTO `course_departments` (`ID`, `name`, `numbering`, `course_id`) VALUES
(1, 'dep1', 1, 2),
(2, 'dep2', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_courses`
--

CREATE TABLE `enrollment_courses` (
  `ID` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `id_users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment_courses`
--

INSERT INTO `enrollment_courses` (`ID`, `id_course`, `id_users`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mentors`
--

CREATE TABLE `mentors` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title_job_en` varchar(255) DEFAULT NULL,
  `title_job_ar` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `courses_count` int(11) DEFAULT NULL,
  `students_count` int(11) DEFAULT NULL,
  `rating_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mentors`
--

INSERT INTO `mentors` (`ID`, `name`, `title_job_en`, `title_job_ar`, `image`, `courses_count`, `students_count`, `rating_count`) VALUES
(1, 'ah', 'fd', 'fd', 'fd', 10, 2000, 20),
(2, 'Asmaa', 'adfgh', 'الينتعلغ', 'dfhjjj', 10, 20, 15),
(5, 'b', NULL, NULL, NULL, NULL, NULL, 10),
(6, 'p', NULL, NULL, NULL, NULL, NULL, 9),
(9, 'e', NULL, NULL, NULL, NULL, NULL, 13),
(10, 'a', NULL, NULL, NULL, NULL, NULL, 23),
(11, 'c', NULL, NULL, NULL, NULL, NULL, 50),
(12, 'd', NULL, NULL, NULL, NULL, NULL, 23);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `ID` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `desc_en` varchar(1000) NOT NULL,
  `desc_ar` varchar(1000) NOT NULL,
  `prec` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`ID`, `title_en`, `title_ar`, `desc_en`, `desc_ar`, `prec`) VALUES
(0, 'en', 'ar', 'dsaewds', 'fdds', 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `popular_mentors`
-- (See below for the actual view)
--
CREATE TABLE `popular_mentors` (
`ID` int(11)
,`name` varchar(255)
,`title_job_en` varchar(255)
,`title_job_ar` varchar(255)
,`image` varchar(255)
,`courses_count` int(11)
,`students_count` int(11)
,`rating_count` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `spacific_course`
-- (See below for the actual view)
--
CREATE TABLE `spacific_course` (
`course_id` int(11)
,`course_name` varchar(255)
,`courses.about_this_course` varchar(1000)
,`courses_skill_level` varchar(255)
,`courses.students_count` int(11)
,`courses_course_language` varchar(255)
,`lecture_Count` int(11)
,`courses_total_video_time` float
,`courses_Certificates` varchar(1000)
,`courses_Features` varchar(1000)
,`courses_Description` varchar(3000)
,`course_image` varchar(255)
,`mentor_id` int(11)
,`mentor_name` varchar(255)
,`mentor_title_job_en` varchar(255)
,`mentor_title_job_ar` varchar(255)
,`mentors_image` varchar(255)
,`mentor_courses_count` int(11)
,`mentors_students_count` int(11)
,`category_id` int(11)
,`category_name_en` varchar(255)
,`category_name_ar` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `usersName` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `userVefiyCode` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday_date` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 0 COMMENT '0 : not choice\r\n1 : male\r\n2 - female',
  `time_signUpp` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `usersName`, `pass`, `userVefiyCode`, `full_name`, `nick_name`, `birthday_date`, `email`, `phone`, `gender`, `time_signUpp`) VALUES
(1, 'ahmed', 'pass2', 18022, 'ahmed el-said', 'AEA', '8-8-2001', 'ahmed122727727@gmail.com', '01001398831', 1, '2023-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `videos_courses`
--

CREATE TABLE `videos_courses` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `videos_courses`
--

INSERT INTO `videos_courses` (`ID`, `name`, `video`, `time`, `department_id`) VALUES
(1, 'vid1', 'video.mp4', '00:00:00', 1),
(2, 'vid2', '', '00:00:00', 1),
(3, 'fd', 'fg', '00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure for view `all_popular_courses`
--
DROP TABLE IF EXISTS `all_popular_courses`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_popular_courses`  AS SELECT `courses`.`ID` AS `ID`, `courses`.`courses_name` AS `courses_name`, `courses`.`about_this_course` AS `about_this_course`, `courses`.`skill_level` AS `skill_level`, `courses`.`students_count` AS `students_count`, `courses`.`course_language` AS `course_language`, `courses`.`lecture_Count` AS `lecture_Count`, `courses`.`total_video_time` AS `total_video_time`, `courses`.`Certificates` AS `Certificates`, `courses`.`Features` AS `Features`, `courses`.`Description` AS `Description`, `courses`.`mentor_id` AS `mentor_id`, `courses`.`cat_ID` AS `cat_ID`, `courses`.`image` AS `image`, `category`.`cat_name_en` AS `cat_name_en`, `category`.`cat_name_ar` AS `cat_name_ar`, `mentors`.`name` AS `Mentor_name` FROM ((`courses` join `category` on(`category`.`cat_ID` = `courses`.`cat_ID`)) join `mentors` on(`mentors`.`ID` = `courses`.`mentor_id`)) ORDER BY `courses`.`students_count` DESC LIMIT 0, 6 ;

-- --------------------------------------------------------

--
-- Structure for view `popular_mentors`
--
DROP TABLE IF EXISTS `popular_mentors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popular_mentors`  AS SELECT `mentors`.`ID` AS `ID`, `mentors`.`name` AS `name`, `mentors`.`title_job_en` AS `title_job_en`, `mentors`.`title_job_ar` AS `title_job_ar`, `mentors`.`image` AS `image`, `mentors`.`courses_count` AS `courses_count`, `mentors`.`students_count` AS `students_count`, `mentors`.`rating_count` AS `rating_count` FROM `mentors` ORDER BY `mentors`.`rating_count` DESC LIMIT 0, 6 ;

-- --------------------------------------------------------

--
-- Structure for view `spacific_course`
--
DROP TABLE IF EXISTS `spacific_course`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `spacific_course`  AS SELECT `courses`.`ID` AS `course_id`, `courses`.`courses_name` AS `course_name`, `courses`.`about_this_course` AS `courses.about_this_course`, `courses`.`skill_level` AS `courses_skill_level`, `courses`.`students_count` AS `courses.students_count`, `courses`.`course_language` AS `courses_course_language`, `courses`.`lecture_Count` AS `lecture_Count`, `courses`.`total_video_time` AS `courses_total_video_time`, `courses`.`Certificates` AS `courses_Certificates`, `courses`.`Features` AS `courses_Features`, `courses`.`Description` AS `courses_Description`, `courses`.`image` AS `course_image`, `mentors`.`ID` AS `mentor_id`, `mentors`.`name` AS `mentor_name`, `mentors`.`title_job_en` AS `mentor_title_job_en`, `mentors`.`title_job_ar` AS `mentor_title_job_ar`, `mentors`.`image` AS `mentors_image`, `mentors`.`courses_count` AS `mentor_courses_count`, `mentors`.`students_count` AS `mentors_students_count`, `category`.`cat_ID` AS `category_id`, `category`.`cat_name_en` AS `category_name_en`, `category`.`cat_name_ar` AS `category_name_ar` FROM ((`courses` join `mentors`) join `category`) WHERE `mentors`.`ID` = `courses`.`mentor_id` AND `category`.`cat_ID` = `courses`.`cat_ID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_ID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mentor_id` (`mentor_id`,`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `mentor_id` (`mentor_id`),
  ADD KEY `cat_ID` (`cat_ID`);

--
-- Indexes for table `course_departments`
--
ALTER TABLE `course_departments`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `enrollment_courses`
--
ALTER TABLE `enrollment_courses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_course` (`id_course`,`id_users`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `mentors`
--
ALTER TABLE `mentors`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `usersName` (`usersName`);

--
-- Indexes for table `videos_courses`
--
ALTER TABLE `videos_courses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `course_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_departments`
--
ALTER TABLE `course_departments`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `enrollment_courses`
--
ALTER TABLE `enrollment_courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos_courses`
--
ALTER TABLE `videos_courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`ID`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `mentors` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`cat_ID`) REFERENCES `category` (`cat_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_departments`
--
ALTER TABLE `course_departments`
  ADD CONSTRAINT `course_departments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `enrollment_courses`
--
ALTER TABLE `enrollment_courses`
  ADD CONSTRAINT `enrollment_courses_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollment_courses_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `courses` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `videos_courses`
--
ALTER TABLE `videos_courses`
  ADD CONSTRAINT `videos_courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `course_departments` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
