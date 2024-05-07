-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2024 at 01:21 PM
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
-- Database: `loanapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `account_no` int(8) DEFAULT NULL,
  `purok_no` varchar(8) DEFAULT NULL,
  `barangay` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `country` varchar(20) NOT NULL DEFAULT 'Romblon',
  `postal_code` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`account_no`, `purok_no`, `barangay`, `city`, `province`, `country`, `postal_code`) VALUES
(11000, '2', 'Madalag', 'Banton', 'Romblon', 'Philippines', 5509),
(11001, '1', 'Sampaguita', 'Odiongan', 'Romblon', 'Philippines', 5509),
(11002, '2', 'Madalag', 'Banton', 'Romblon', 'Philippines', 5509),
(11003, '1', 'Madalag', 'Alcantara', 'Romblon', 'Romblon', 5509),
(11004, '1', 'Madalag', 'Odiongan', 'Romblon', 'Romblon', 5505),
(11005, '1', 'Madalag', 'Alcantara', 'Romblon', 'Romblon', 5509),
(11006, '1200', 'Sibay', 'Madalag', 'Alcantara', 'Romblon', 5509),
(11007, '1220', 'Sibay', 'Madalag', 'Alcantara', 'Romblon', 5509),
(11008, '102', 'Quaipo', 'Banton', 'Banton', 'Romblon', 5509),
(11009, 'sample', 'sample', 'sample', 'sample', 'Romblon', 4021),
(11010, '231', 'asd', 'asdasd', 'asd', 'Romblon', 12321),
(11011, '231', 'hgdh', 'hgdh', 'hghgt', 'Romblon', 4024),
(11012, '123', '123', '123', 'asd', 'Romblon', 123),
(11013, '213', '123213', '132', '2132131', 'Romblon', 123),
(11014, '123', '2131', '2123', '213213132', 'Romblon', 123),
(11015, '3316416', 'asdsad', 'adsasd', 'asd', 'Romblon', 123),
(11016, '52', '21', 'asdsad', 'asd', 'Romblon', 40214),
(11017, 'asd', '123', 'asd', 'asd', 'Romblon', 123),
(11019, '1231', '32sa', 'sadas', 'asdasd', 'Romblon', 1233),
(11020, 'adsas12', 'asd12', 'sadsa21', 'asd12sa', 'Romblon', 123),
(11021, '213', '123', '123', '123', 'Romblon', 12),
(11022, '123', '12', '123', '123', 'Romblon', 123),
(11023, 'asd', '123', 'asd', '123', 'Romblon', 123);

-- --------------------------------------------------------

--
-- Table structure for table `approved_loans`
--

CREATE TABLE `approved_loans` (
  `loan_no` varchar(20) DEFAULT NULL,
  `date_approved` date DEFAULT NULL,
  `loan_started` date DEFAULT NULL,
  `daily_payment` decimal(8,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `approved_loans`
--

INSERT INTO `approved_loans` (`loan_no`, `date_approved`, `loan_started`, `daily_payment`, `due_date`, `status`) VALUES
('L1000', '2024-01-09', '2024-01-09', 400.00, '2024-03-09', 'new'),
('L1001', '2024-01-11', '2024-01-11', 2000.00, '2024-03-11', 'new'),
('L1001', '2024-01-11', '2024-01-11', 2000.00, '2024-03-11', 'new'),
('L1001', '2024-01-11', '2024-01-11', 2000.00, '2024-03-11', 'new'),
('L1001', '2024-01-11', '2024-01-11', 2000.00, '2024-03-11', 'new'),
('L1002', '2024-01-11', '2024-01-11', 200.00, '2024-03-11', 'Paid'),
('L1003', '2024-01-22', '2024-01-22', 400.00, '2024-03-22', 'new'),
('L1003', '2024-01-22', '2024-01-22', 400.00, '2024-03-22', 'new'),
('L1003', '2024-01-22', '2024-01-22', 400.00, '2024-03-22', 'new'),
('L1004', '2024-01-24', '2024-01-24', 40.00, '2024-03-24', 'new'),
('L1004', '2024-01-24', '2024-01-24', 40.00, '2024-03-24', 'new'),
('L1005', '2024-01-25', '2024-01-25', 40.00, '2024-03-25', 'Paid'),
('L1005', '2024-01-25', '2024-01-25', 40.00, '2024-03-25', 'Paid'),
('L1005', '2024-01-25', '2024-01-25', 40.00, '2024-03-25', 'Paid'),
('L1006', '2024-01-25', '2024-01-25', 40.00, '2024-03-25', 'new'),
('L1006', '2024-01-25', '2024-01-25', 40.00, '2024-03-25', 'new'),
('L1007', '2024-04-20', '2024-04-28', 220.00, '2024-06-27', 'new'),
('L1008', '2024-04-28', '2024-04-28', 20.00, '2024-06-27', 'new'),
('L1009', '2024-04-28', '2024-04-28', 24.24, '2024-06-27', 'new'),
('L1009', '2024-04-28', '2024-04-28', 24.24, '2024-06-27', 'new'),
('L1010', '2024-04-28', '2024-04-28', 0.24, '2024-06-27', 'new'),
('L1011', '2024-04-28', '2024-04-28', 24.24, '2024-06-27', 'new'),
('L1014', '2024-04-28', '2024-04-28', 0.24, '2024-06-27', 'new');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `account_no` int(8) NOT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `number1` varchar(20) DEFAULT NULL,
  `number2` varchar(20) DEFAULT NULL,
  `birthdate` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `added_info` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT 'New'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`account_no`, `profile_img`, `email`, `number1`, `number2`, `birthdate`, `gender`, `added_info`, `status`) VALUES
(11000, '662dc3c056512.jpg', 'thatsexypersonisme@gmail.com', '09950613692', '', '2024-01-09', 'Male', 'ss0', 'Verified'),
(11001, NULL, 'novarosas@gmail.com', '09999999999', '09999999999', '2024-01-01', 'Female', '', 'Verified'),
(11002, NULL, 'davelota@gmail.com', '09950613692', '', '2024-01-09', 'Male', '', 'Verified'),
(11003, NULL, 'hihi@gmail.com', '09950613692', '', '2024-01-25', 'Female', 'gfhvj', 'New'),
(11004, NULL, 'thatsexypersonismee@gmail.com', '09950613692', '', '2024-01-25', 'Female', 'fdgh', 'New'),
(11005, NULL, 'hihi@gmail.com', '09950613692', '', '2024-01-25', 'Female', 'dfghj', 'New'),
(11006, NULL, 'thatsexypersonismee@gmail.com', '09950613692', '', '2024-01-25', 'Female', '', 'New'),
(11007, NULL, 'thatsexypersonismee@gmail.com', '09950613692', '', '2024-01-25', 'Female', '', 'New'),
(11008, NULL, 'francismykoferranco20@gmail.co', '09950613692', '', '2024-01-25', 'Female', '', 'Verified'),
(11009, NULL, 'sample@asdads', '94663755997', '', '2024-04-10', 'Male', '', 'New'),
(11010, NULL, 'as@gmail.com', '09463755997', '', '2024-04-22', 'Male', 'sadsad', 'New'),
(11011, NULL, 'gfgf@gmail.com', '09645646654', '009445564564565', '2024-04-10', NULL, 'hgfhg', 'Verified'),
(11012, NULL, 'sad', '123', '09463755997', '2024-05-02', 'Female', 'asdsad', 'New'),
(11013, NULL, '12332@gmail.com', '1232133', '213213', '2024-04-16', 'Male', '', 'New'),
(11014, NULL, 'aasda', '213231', '123', '1123-12-31', 'Male', '', 'New'),
(11015, '6627a9e935e56.jpg', 'budejas@gmail.asdasdsa', '3316416', '3316416', '2024-04-23', 'Male', '', 'Verified'),
(11016, '662dd55dc61c4.jpg', 'budejasryzen72@gmail.com', '098565646465', '56456465465', '2024-04-17', 'Male', 'asdad', 'Verified'),
(11017, '662dd917787f2.jpg', 'asda', '12313', '123123', '2024-04-11', 'Male', 'asdasd', 'New'),
(11019, '662dda01bf87b.jpg', 'asdasd', '123', '213', '2024-04-24', 'Male', 'asdasd', 'Verified'),
(11020, '', 'sample', '1231321', '213132321', '2024-04-29', 'Male', 'sadsad', 'Verified'),
(11021, '662ddea82d5e2.jpg', 'asds@gmail.com', '12313', '21312', '2024-04-29', 'Male', '', 'Verified'),
(11022, '662dfaccad38c.jpg', 'asdsa2saasda@sad', '123', '123', '2024-04-30', 'Male', 'asdadsad', 'New'),
(11023, '662dfcaaa09d7.JPG', 'asdsa', '123213', '1312321', '2024-04-14', 'Male', '', 'New');

-- --------------------------------------------------------

--
-- Table structure for table `co_maker`
--

CREATE TABLE `co_maker` (
  `co_maker_no` int(8) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `cedula_no` varchar(30) DEFAULT NULL,
  `date_issued` varchar(30) DEFAULT NULL,
  `address_issued` varchar(30) DEFAULT NULL,
  `loan_no` varchar(20) DEFAULT NULL,
  `account_no` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `co_maker`
--

INSERT INTO `co_maker` (`co_maker_no`, `name`, `cedula_no`, `date_issued`, `address_issued`, `loan_no`, `account_no`) VALUES
(435, 'Dave Lota', '12990', '2024-01-09', 'Odiongan, Romblon', 'L1000', 11001),
(436, 'Dave Lota', '51261', '2024-01-09', 'Odiongan, Romblon', 'L1001', 11000),
(437, 'Dave Lota', '51261', '2024-01-11', 'Odiongan, Romblon', 'L1002', 11001),
(438, 'dfgh', 'fgchvjb', '2024-01-23', 'Odiongan', 'L1003', 11002),
(439, 'dfgh', 'fgchvjb', '2024-01-25', 'Odiongan', 'L1004', 11002),
(440, 'Angeli Cleofe Bantugan', 'Liwanag', '2024-01-25', 'Friend', 'L1005', 11008),
(441, 'Angeli Cleofe Bantugan', 'Liwanag', '2024-01-25', 'Friend', 'L1006', 11008),
(442, 'asd', 'asdas', '2024-04-23', 'asdsad', 'L1007', 11011),
(444, 'asd', 'asd', '2024-04-29', 'asdasd', 'L1008', 11015),
(446, '12', '1212', '0221-12-11', '1212', 'L1009', 11000),
(449, '2112', '121', '0121-02-12', '21', 'L1010', 11001),
(451, '1221', '12', '2024-04-30', '122121', 'L1011', 11000),
(454, 'asd', 'asd', '2024-04-16', 'asdasd', 'L1013', 11016),
(458, 'asd', 'asd', '2024-04-29', '1212', 'L1014', 11021);

-- --------------------------------------------------------

--
-- Table structure for table `debtor_business`
--

CREATE TABLE `debtor_business` (
  `business_no` int(8) NOT NULL,
  `business_name` varchar(30) DEFAULT NULL,
  `business_address` varchar(50) NOT NULL,
  `loan_no` varchar(20) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `debtor_business`
--

INSERT INTO `debtor_business` (`business_no`, `business_name`, `business_address`, `loan_no`, `account_no`) VALUES
(309, 'Test', 'Purok 1, Sampaguita, Odiongan, Romblon, 5509', 'L1000', 11001),
(310, 'Test', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1001', 11000),
(311, 'Milktea', 'Purok 1, Sampaguita, Odiongan, Romblon, 5509', 'L1002', 11001),
(312, 'Secret', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1003', 11002),
(313, 'Romblon State University', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1004', 11002),
(314, 'Romblon State University', 'Purok 102, Quaipo, Banton, Banton, 5509', 'L1005', 11008),
(315, 'Free', 'Purok 102, Quaipo, Banton, Banton, 5509', 'L1006', 11008),
(316, '123', 'Purok 231, hgdh, hgdh, hghgt, 4024', 'L1007', 11011),
(318, '12121', 'Purok 3316416, asdsad, adsasd, asd, 123', 'L1008', 11015),
(320, '1221', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1009', 11000),
(323, '2121', 'Purok 1, Sampaguita, Odiongan, Romblon, 5509', 'L1010', 11001),
(325, '1212', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1011', 11000),
(328, 'asd', 'Purok 52, 21, asdsad, asd, 40214', 'L1013', 11016),
(332, '123as', 'Purok 213, 123, 123, 123, 12', 'L1014', 11021);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_no` varchar(20) NOT NULL,
  `account_no` int(8) DEFAULT NULL,
  `area` varchar(20) DEFAULT NULL,
  `loan_amount` decimal(8,2) DEFAULT NULL,
  `interest` int(8) DEFAULT NULL,
  `collector` varchar(20) DEFAULT NULL,
  `date_loan` date DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'Waiting for approval',
  `verified` varchar(20) NOT NULL,
  `reason` varchar(20) DEFAULT 'New loan',
  `approved` varchar(20) DEFAULT NULL,
  `terms` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_no`, `account_no`, `area`, `loan_amount`, `interest`, `collector`, `date_loan`, `status`, `verified`, `reason`, `approved`, `terms`) VALUES
('L1000', 11001, 'Odiongan', 20000.00, 0, 'Gerica', '2024-01-09', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1001', 11000, 'Odiongan', 100000.00, 2, 'Gerica', '2024-01-09', 'Active', 'Rona ', NULL, 'admin', NULL),
('L1002', 11001, 'Odiongan', 10000.00, 3, 'Gerica', '2024-01-11', 'Paid', 'Rona ', 'New loan', 'admin', NULL),
('L1003', 11002, NULL, 20000.00, 2, 'Gerica', '2024-01-23', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1004', 11002, NULL, 2000.00, 2, 'Gerica', '2024-01-25', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1005', 11008, NULL, 2000.00, 12, 'Gerica', '2024-01-25', 'Paid', 'Rona ', 'New loan', 'admin', NULL),
('L1006', 11008, NULL, 2000.00, 1, 'Gerica', '2024-01-25', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1007', 11011, NULL, 11000.00, 12, 'Gerica', '2024-04-21', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1008', 11015, NULL, 1000.00, 12, 'Gerica', '2024-04-28', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1009', 11000, NULL, 1212.00, 12, 'Gerica', '2024-04-28', 'Active', 'Rona ', 'New loan', 'admin', NULL),
('L1010', 11001, '1212', 12.00, 1221, 'Gerica', '2024-04-28', 'Active', 'Rona ', 'New loan', 'admin', '3'),
('L1011', 11000, '121', 1212.00, 121, 'Gerica', '2024-04-28', 'Active', 'Rona ', 'New loan', 'admin', '3'),
('L1013', 11016, '12', 12.00, 12, 'Gerica', '2024-04-28', 'Waiting for approval', 'Rona ', 'New loan', NULL, '6'),
('L1014', 11021, '12', 12.00, 12, 'Gerica', '2024-04-28', 'Active', 'Rona ', 'New loan', 'admin', '3');

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--

CREATE TABLE `loan_plan` (
  `id` int(30) NOT NULL,
  `months` int(11) NOT NULL,
  `interest_percentage` float NOT NULL,
  `penalty_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_plan`
--

INSERT INTO `loan_plan` (`id`, `months`, `interest_percentage`, `penalty_rate`) VALUES
(1, 36, 8, 3),
(2, 24, 5, 2),
(3, 27, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` int(30) NOT NULL,
  `type_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `type_name`, `description`) VALUES
(1, 'Salary Loan', ''),
(2, 'Multi-Purpose Loan', ''),
(3, 'Short Term', '');

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

CREATE TABLE `names` (
  `account_no` int(8) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `names`
--

INSERT INTO `names` (`account_no`, `firstname`, `middlename`, `lastname`) VALUES
(11000, 'Angeli', 'Cleofe', 'Bantugan'),
(11001, 'Nova Marie', 'Faeldan', 'Rosas'),
(11002, 'Dave', 'F', 'Lota'),
(11003, 'Angeli', 'Bantugan', 'Miñeque'),
(11004, 'Angeli', 'Cleofe', 'Bantugan'),
(11005, 'Angeli', 'Bantugan', 'Miñeque'),
(11006, 'Angeli', 'Cleofe', 'Bantugan'),
(11007, 'Angeli', 'Cleofe', 'Bantugan'),
(11008, 'Francis ', 'Myko', 'Ferranco'),
(11021, 'a', 'asd', 'asd'),
(11022, 'asdasda', 'asdas', 'asadsa'),
(11023, '123123', '3123', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `payment_transactions`
--

CREATE TABLE `payment_transactions` (
  `transaction_id` int(8) NOT NULL,
  `loan_no` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `payment_no` int(11) NOT NULL,
  `notes` varchar(20) DEFAULT NULL,
  `payment_month` enum('January','February','March','April','May','June','July','August','September','October','November','December') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_transactions`
--

INSERT INTO `payment_transactions` (`transaction_id`, `loan_no`, `date`, `amount`, `payment_no`, `notes`, `payment_month`) VALUES
(90, 'L1000', '2024-01-09', 400.00, 1, 'Monthly Payment', 'May'),
(91, 'L1000', '2024-01-09', 400.00, 1, 'Monthly Payment', 'November'),
(92, 'L1000', '2024-01-25', 400.00, 17, 'Monthly Payment', 'June'),
(93, 'L1000', '2024-01-25', 400.00, 17, 'Monthly Payment', 'October'),
(94, 'L1002', '2024-01-31', 200.00, 1, 'Monthly Payment', 'March'),
(95, 'L1002', '2024-01-31', 200.00, 2, 'Monthly Payment', 'January'),
(96, 'L1002', '2024-01-31', 200.00, 3, 'Monthly Payment', 'April'),
(97, 'L1002', '2024-01-31', 200.00, 4, 'Monthly Payment', 'August'),
(98, 'L1002', '2024-01-31', 200.00, 5, 'Monthly Payment', 'January'),
(99, 'L1002', '2024-01-31', 200.00, 6, 'Monthly Payment', NULL),
(100, 'L1000', '2024-02-09', 400.00, 33, 'Monthly Payment', NULL),
(101, 'L1000', '2024-02-09', 400.00, 34, 'Monthly Payment', NULL),
(102, 'L1000', '2024-02-09', 400.00, 35, 'Monthly Payment', NULL),
(103, 'L1000', '2024-02-09', 400.00, 36, 'Monthly Payment', NULL),
(104, 'L1000', '2024-02-09', 400.00, 37, 'Monthly Payment', NULL),
(105, 'L1000', '2024-02-09', 400.00, 38, 'Monthly Payment', NULL),
(106, 'L1000', '2024-02-09', 400.00, 39, 'Monthly Payment', NULL),
(107, 'L1000', '2024-02-09', 400.00, 40, 'Monthly Payment', NULL),
(108, 'L1000', '2024-02-09', 400.00, 41, 'Monthly Payment', NULL),
(109, 'L1000', '2024-02-09', 400.00, 42, 'Monthly Payment', NULL),
(110, 'L1000', '2024-02-09', 400.00, 43, 'Monthly Payment', NULL),
(111, 'L1000', '2024-02-09', 400.00, 44, 'Monthly Payment', NULL),
(112, 'L1000', '2024-02-09', 400.00, 45, 'Monthly Payment', NULL),
(113, 'L1008', '2024-04-28', 20.00, 1, 'Monthly Payment', 'March'),
(114, 'L1008', '2024-04-28', 20.00, 1, 'Monthly Payment', 'February'),
(115, 'L1008', '2024-04-28', 20.00, 1, 'Monthly Payment', 'February'),
(116, 'L1008', '2024-04-28', 20.00, 1, 'Monthly Payment', 'October'),
(117, 'L1008', '2024-04-28', 20.00, 1, 'Monthly Payment', 'December'),
(130, 'L1014', '2024-04-28', 0.24, 1, 'Monthly Payment', 'March');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(20) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `number` int(8) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `position` varchar(30) NOT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `profile_img` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `firstname`, `middlename`, `lastname`, `number`, `address`, `email`, `position`, `bio`, `profile_img`) VALUES
('Rona', 'Maria Rona', NULL, NULL, 2147483647, 'Somewhere', 'tangorona@gmail.com', 'Loan Officer', NULL, NULL),
('Gerica', 'Gerica Martinez', NULL, NULL, 2147483647, 'Somewhere', 'martinezgerica@gmail.com', 'Collector', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Unfinished'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `user_type`) VALUES
('admin', 'password', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD UNIQUE KEY `account_no` (`account_no`);

--
-- Indexes for table `approved_loans`
--
ALTER TABLE `approved_loans`
  ADD KEY `approved_loans_ibfk_1` (`loan_no`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`account_no`);

--
-- Indexes for table `co_maker`
--
ALTER TABLE `co_maker`
  ADD PRIMARY KEY (`co_maker_no`),
  ADD KEY `co_maker_ibfk_1` (`loan_no`);

--
-- Indexes for table `debtor_business`
--
ALTER TABLE `debtor_business`
  ADD PRIMARY KEY (`business_no`),
  ADD KEY `debtor_business_ibfk_1` (`loan_no`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_no`),
  ADD KEY `account_no` (`account_no`),
  ADD KEY `loan_ibfk_2` (`verified`),
  ADD KEY `loan_ibfk_3` (`collector`);

--
-- Indexes for table `loan_plan`
--
ALTER TABLE `loan_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `names`
--
ALTER TABLE `names`
  ADD UNIQUE KEY `account_no` (`account_no`);

--
-- Indexes for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `payment_transactions_ibfk_1` (`loan_no`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `co_maker`
--
ALTER TABLE `co_maker`
  MODIFY `co_maker_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=459;

--
-- AUTO_INCREMENT for table `debtor_business`
--
ALTER TABLE `debtor_business`
  MODIFY `business_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `loan_plan`
--
ALTER TABLE `loan_plan`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `transaction_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `clients` (`account_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `approved_loans`
--
ALTER TABLE `approved_loans`
  ADD CONSTRAINT `approved_loans_ibfk_1` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `co_maker`
--
ALTER TABLE `co_maker`
  ADD CONSTRAINT `co_maker_ibfk_1` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `debtor_business`
--
ALTER TABLE `debtor_business`
  ADD CONSTRAINT `debtor_business_ibfk_1` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `clients` (`account_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `names`
--
ALTER TABLE `names`
  ADD CONSTRAINT `names_ibfk_1` FOREIGN KEY (`account_no`) REFERENCES `clients` (`account_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  ADD CONSTRAINT `payment_transactions_ibfk_1` FOREIGN KEY (`loan_no`) REFERENCES `loan` (`loan_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
