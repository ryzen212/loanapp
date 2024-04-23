-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2024 at 03:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `purok_no` int(8) DEFAULT NULL,
  `barangay` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `province` varchar(30) DEFAULT NULL,
  `country` varchar(20) NOT NULL DEFAULT 'Philippines',
  `postal_code` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`account_no`, `purok_no`, `barangay`, `city`, `province`, `country`, `postal_code`) VALUES
(11000, 2, 'Madalag', 'Banton', 'Romblon', 'Philippines', 5509),
(11001, 2, 'Madalag', 'Alcantara', 'Romblon', 'Philippines', 5509);

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
('L1000', '2024-01-01', '2024-01-01', 80.00, '2024-03-01', 'new'),
('L1000', '2024-01-01', '2024-01-01', 80.00, '2024-03-01', 'new'),
('L1000', '2024-01-01', '2024-01-01', 80.00, '2024-03-01', 'new'),
('L1001', '2024-01-01', '2024-01-01', 400.00, '2024-03-01', 'new'),
('L1003', '2024-01-01', '2024-01-01', 90.00, '2024-03-01', 'new'),
('L1002', '2024-01-01', '2024-01-01', 400.00, '2024-03-01', 'new'),
('L1004', '2024-01-02', '2024-01-02', 1340.00, '2024-03-02', 'new'),
('L1005', '2024-01-02', '2024-01-02', 160.00, '2024-03-02', 'new'),
('L1006', '2024-01-02', '2024-01-02', 400.00, '2024-03-02', 'new'),
('L1007', '2024-01-02', '2024-01-02', 500.00, '2024-03-02', 'new'),
('L1008', '2024-01-02', '2024-01-02', 120.00, '2024-03-02', 'new'),
('L1009', '2024-01-02', '2024-01-02', 460.00, '2024-03-02', 'new'),
('L1009', '2024-01-02', '2024-01-02', 460.00, '2024-03-02', 'new'),
('L1010', '2024-01-02', '2024-01-02', 400.00, '2024-03-02', 'new'),
('L1011', '2024-01-02', '2024-01-02', 400.00, '2024-03-02', 'new'),
('L1012', '2024-01-04', '2024-01-04', 240.00, '2024-03-04', 'new'),
('L1012', '2024-01-04', '2024-01-04', 240.00, '2024-03-04', 'new'),
('L1012', '2024-01-04', '2024-01-04', 240.00, '2024-03-04', 'new'),
('L1013', '2024-01-04', NULL, 680.00, NULL, 'new'),
('L1013', '2024-01-04', NULL, 680.00, NULL, 'new'),
('L1013', '2024-01-04', NULL, 680.00, NULL, 'new');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `account_no` int(8) NOT NULL,
  `profile_img` varchar(40) NOT NULL DEFAULT 'person.png',
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
(11000, '', 'thatsexypersonismee@gmail.com', '09950613692', '', '2002-06-30', 'Female', '', 'Verified'),
(11001, '', 'juandelacruz@gmail.com', '09950613692', '09950613692', '2024-01-02', 'Female', '', 'Verified');

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
(435, 'vghbjn', 'tfygh', '2024-01-01', 'dxfcgvhbj', 'L1000', 11000),
(436, 'dgfhjk', 'fdghvbj', '2024-01-02', 'sfdghj', 'L1001', 11000),
(437, 'szfdxgchv', 'dxfcgvh', '2024-01-02', 'sfdxgch', 'L1002', 11000),
(438, '', '', '', '', 'L1002', 11000),
(439, 'sdfgh', 'sdfgh', '2024-01-02', 'sredtfyg', 'L1003', 11000),
(440, '', '', '', '', 'L1003', 11000),
(441, 'szrdtfcgh', 'dfgfchv', '2024-01-02', 'gfchvj', 'L1004', 11000),
(442, '', '', '', '', 'L1004', 11000),
(443, 'fghj', '54', '2024-01-02', 'dtfghjk', 'L1005', 11000),
(444, 'tfchvhbj', 'fgvh', '2024-01-02', 'cfghvbj', 'L1006', 11000),
(445, 'sfdgh', 'vcbn', '2024-01-02', 'sdfghj', 'L1007', 11000),
(446, 'fdghj', 'gcvjhb', '2024-01-02', 'dgfhjk', 'L1008', 11000),
(447, 'waerstdyf', 'waerstd', '2024-01-02', 'aerh', 'L1009', 11001),
(448, 'John Smith', 'C-1245', '2024-01-02', 'Odiongan, Romblon', 'L1010', 11001),
(449, 'John Smith', 'C-1245', '2024-01-02', 'Odiongan, Romblon', 'L1011', 11001),
(450, 'dtfgh', 'wesrdtfyg', '2024-01-04', 'srdtfygh', 'L1012', 11001),
(451, 'fghvjb', 'dfgchvbj', '2024-01-04', 'sdfgjhk', 'L1013', 11000);

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
(309, 'rftyguh', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1000', 11000),
(310, 'zfgchvjb', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1001', 11000),
(311, 'gchvjbkn', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1002', 11000),
(312, 'ssdfgh', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1003', 11000),
(313, 'gchvjb', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1004', 11000),
(314, 'dfcghvjb', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1005', 11000),
(315, 'szdfdxgchj', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1006', 11000),
(316, 'sdfghjk', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1007', 11000),
(317, 'dfgchvjbk', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1008', 11000),
(318, 'ssdfgh', 'Purok 2, Madalag, Alcantara, Romblon, 5509', 'L1009', 11001),
(319, 'E-shop', 'Purok 2, Madalag, Alcantara, Romblon, 5509', 'L1010', 11001),
(320, 'E-shop', 'Purok 2, Madalag, Alcantara, Romblon, 5509', 'L1011', 11001),
(321, 'sfdghbj', 'Purok 2, Madalag, Alcantara, Romblon, 5509', 'L1012', 11001),
(322, 'sdfghj', 'Purok 2, Madalag, Banton, Romblon, 5509', 'L1013', 11000);

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
  `terms` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_no`, `account_no`, `area`, `loan_amount`, `interest`, `collector`, `date_loan`, `status`, `verified`, `reason`, `approved`, `terms`) VALUES
('L1000', 11000, 'esdrftyg', 4000.00, 10, 'ffsdfsdff', '2024-01-01', 'Active', 'james ', 'New loan', 'admin', 60),
('L1001', 11000, 'sfdghj', 20000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1002', 11000, 'dfgfhjk', 20000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1003', 11000, 'fgh', 4500.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1004', 11000, 'szdfdxgh', 67000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1005', 11000, 'fghcvjb', 8000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1006', 11000, 'fdxgchv', 20000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1007', 11000, '', 25000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1008', 11000, 'vhbdgf', 6000.00, 10, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', 60),
('L1009', 11001, 'asdfg', 23000.00, NULL, 'ffsdfsdff', '2024-01-02', 'Active', 'james ', 'New loan', 'admin', NULL),
('L1010', 11001, 'Odiongan', 20000.00, 0, 'Mike ', '2024-01-02', 'Active', 'Mary Joy ', 'New loan', 'admin', NULL),
('L1011', 11001, 'Odiongan', 20000.00, 2, 'Mike ', '2024-01-02', 'Active', 'Mary Joy ', 'New loan', 'admin', NULL),
('L1012', 11001, 'gcv', 12000.00, 2, 'Mike ', '2024-01-04', 'Active', 'Mary Joy ', 'New loan', 'admin', NULL),
('L1013', 11000, 'sdgfhj', 34000.00, 2, 'Mike ', '2024-01-04', 'Approved', 'Mary Joy ', 'New loan', 'admin', NULL);

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
(11001, 'Juan', 'Mendoza', 'De la Cruz');

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
  `notes` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_transactions`
--

INSERT INTO `payment_transactions` (`transaction_id`, `loan_no`, `date`, `amount`, `payment_no`, `notes`) VALUES
(90, 'L1001', '2024-01-02', 400.00, 1, 'Monthly Payment'),
(91, 'L1002', '2024-01-02', 400.00, 1, 'Monthly Payment'),
(92, 'L1012', '2024-01-04', 240.00, 1, 'Monthly Payment'),
(93, 'L1009', '2024-01-04', 460.00, 1, 'Monthly Payment');

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
('Mary Joy', 'Mary Joy Sadiasa', NULL, NULL, 999876097, 'Odiongan, Romblon', 'maryjoysadiasa@gmail.com', 'Loan Officer', NULL, NULL),
('Mike ', 'Mike Dulce', NULL, NULL, 999876097, 'Odiongan, Romblon', 'mikedulce@gmail.com', 'Collector', NULL, NULL);

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
('admin', 'password', 'Admin'),
('John Smith', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Admin'),
('ron', 'password', 'Admin');

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
  MODIFY `co_maker_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `debtor_business`
--
ALTER TABLE `debtor_business`
  MODIFY `business_no` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `payment_transactions`
--
ALTER TABLE `payment_transactions`
  MODIFY `transaction_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
