-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2022 at 08:27 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CID` int(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Pic` varchar(255) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CID`, `Name`, `Description`, `Pic`, `Date`) VALUES
(1, 'Java Programming Language', 'Java programming is most popular language in the world java language is based on class and object.', 'java.png', '2022-11-10 06:17:47'),
(2, 'Python', 'Python is popular language for machine learning.', 'python.png', '2022-11-10 06:17:47'),
(3, 'Web Development ', 'This technology used for developing the websites and web applications ', 'website.png', '2022-11-10 06:17:47'),
(4, 'HTML', 'HTML stands Haper Mark up Language which is specially designed to built the website ', 'html.png', '2022-11-10 06:17:47'),
(5, 'CSS', 'This is special used for Website it\'s used for design purposes ', 'Css.png', '2022-11-11 10:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CID` int(255) NOT NULL,
  `comment` longtext NOT NULL,
  `postId` int(50) NOT NULL,
  `userID` int(50) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CID`, `comment`, `postId`, `userID`, `Date`) VALUES
(1, 'This is best answer of this question', 1, 6, '2022-11-15 08:54:03'),
(2, 'Hello', 5, 6, '2022-11-15 09:01:59'),
(3, 'String pool is type of garbage Collection in java...', 1, 1, '2022-11-15 09:04:23'),
(4, 'A Java object is a member (also called an instance) of a Java class. Each object has an identity, a behavior and a state. The state of an object is stored in fields (variables), while methods (functions) display the object\'s behavior. Objects are created at runtime from templates, which are also known as classes', 12, 5, '2022-11-16 06:54:48'),
(5, 'A Java object is a member (also called an instance) of a Java class. Each object has an identity, a behavior and a state. The state of an object is stored in fields (variables), while methods (functions) display the object\'s behavior. Objects are created at runtime from templates, which are also known as classes', 12, 5, '2022-11-16 07:04:05'),
(6, 'Majid', 12, 5, '2022-11-16 07:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `FID` int(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `feedback` longtext NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `liked`
--

CREATE TABLE `liked` (
  `LID` int(50) NOT NULL,
  `pid` int(50) NOT NULL,
  `userID` int(50) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `liked`
--

INSERT INTO `liked` (`LID`, `pid`, `userID`, `Date`) VALUES
(75, 1, 5, '2022-11-15 08:36:48'),
(77, 4, 5, '2022-11-15 08:40:10'),
(79, 5, 5, '2022-11-15 10:56:54'),
(82, 12, 5, '2022-11-16 06:11:47'),
(83, 15, 5, '2022-11-17 10:36:50');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `PID` int(25) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `code` longtext NOT NULL,
  `pic` varchar(100) NOT NULL,
  `CID` int(25) NOT NULL,
  `userID` int(25) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`PID`, `title`, `content`, `code`, `pic`, `CID`, `userID`, `Date`) VALUES
(1, 'What is String pool', 'this is special memory of string that stores only string value that we create by literal way', 'Example:\r\n\r\nString name = \"Majid Hussain\";\r\nString fName = \"Manzoor Ahmed\";', 'blog.jpg', 1, 5, '2022-11-11 16:28:52'),
(2, 'What is heap memory', 'heap memory is type of memory that store the objects of all creating Like Class, String, etc..', 'Examples\r\nString name = new String(\"Majid Hussain\");\r\n\r\nMajid Hussain will store into the heap memory..', 'blog.jpg', 1, 5, '2022-11-11 16:28:57'),
(3, 'What is python programming language?', 'Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation. Python is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured, object-oriented and functional programming', '# This program prints Hello, world!\r\n\r\nprint(\'Hello, world!\')\r\n', 'blog.jpg', 2, 6, '2022-11-11 16:28:59'),
(4, 'What is web development', 'Web development is the work involved in developing a website for the Internet or an intranet. Web development can range from developing a simple single static page of plain text to complex web applications, electronic businesses, and social network services.', '<html>\r\n    <title>\r\n       Test Work\r\n    </title>\r\n</html>', 'blog.jpg', 3, 5, '2022-11-11 16:29:00'),
(5, 'What is HTML Language', 'The Hypertext Markup Language or HTML is the standard markup language for documents designed to be displayed in a web browser. It can be assisted by technologies such as Cascading Style Sheets and scripting languages such as JavaScript', 'lksfjds', 'blog.jpg', 4, 5, '2022-11-11 16:29:02'),
(12, 'what is object?', 'object is instance of class', 'Example\r\nString name = new String(\'\');', 'blog.jpg', 1, 1, '2022-11-11 16:29:06'),
(15, 'What is string non pool?', 'String pool is type that mean if once object create it can\'t be created if we change then object will change.\r\n\r\nnon String pool is Your like BufferString  it\'s mean changing of many times. ', 'No codes', 'bg-4.jpg', 1, 5, '2022-11-11 16:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UID` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `joinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `name`, `gender`, `email`, `password`, `description`, `profile`, `joinDate`) VALUES
(1, 'Zoya Naz', 'Female', 'zoyaQutriyo@gmail.com', 'zoya', 'I\'m assistant Teacher in shah abdul latif university', 'user_1.png', '2022-11-11 06:22:41'),
(2, '0', 'male', 'majid.hussainQutriyo@gmail.com', '232231', 'fljsdfslfjslfj', 'user_1.png', '2022-11-09 17:58:29'),
(3, '0', 'male', 'majid.hussainQutriyo@gmail.com', '232231', 'fljsdfslfjslfj', 'user_1.png', '2022-11-09 17:58:32'),
(4, 'dsfsdfsdf', 'fdsfsf', 'sdfdfsdf', 'fddfdsfdsf', 'sdfdfsfsdf', 'user_1.png', '2022-11-09 17:58:35'),
(5, 'Majid', 'Male', 'majid.hussainqutriyo@gmail.com', '11', 'I\'m java Developer + web developer I\'m doing code from 10 years I love doing code..', 'IMG-20190706-WA0005.jpg', '2022-11-11 11:46:36'),
(6, 'Faraz ', 'Male', 'faraz.ali123@gmail.com', '1234', 'I\'m doing bachelor\'s In English Literature This is very interesting Department even I\'m loving   ', 'arrow-down.png', '2022-11-09 17:59:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`FID`);

--
-- Indexes for table `liked`
--
ALTER TABLE `liked`
  ADD PRIMARY KEY (`LID`),
  ADD KEY `liked_ibfk_1` (`pid`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `CID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `FID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `liked`
--
ALTER TABLE `liked`
  MODIFY `LID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `PID` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `posts` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `liked`
--
ALTER TABLE `liked`
  ADD CONSTRAINT `liked_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `posts` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `liked_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `categories` (`CID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
