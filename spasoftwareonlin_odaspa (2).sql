-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 07:25 AM
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
-- Database: `spasoftwareonlin_odaspa`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `stage` varchar(200) NOT NULL,
  `details` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `project_id`, `stage`, `details`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 23, 'hosting', 'Pending', 'admin', '2025-06-10 14:03:44', '2025-06-10 14:03:44', NULL),
(6, 23, 'domain', 'Pending', 'admin', '2025-06-10 14:04:00', '2025-06-10 14:04:00', NULL),
(9, 23, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-10 14:08:58', '2025-06-10 14:08:58', NULL),
(10, 23, 'domain', 'Booked', 'admin', '2025-06-10 14:20:20', '2025-06-10 14:20:20', NULL),
(11, 23, 'Engagement Form', 'General Documents', 'admin', '2025-06-10 15:52:17', '2025-06-10 15:52:17', NULL),
(12, 23, 'General Purpose', 'General Documents', 'admin', '2025-06-10 15:55:02', '2025-06-10 15:55:02', NULL),
(13, 23, 'General Documents', 'General Documents', 'admin', '2025-06-10 16:00:59', '2025-06-10 16:00:59', NULL),
(14, 23, 'General Documents', 'General Documents', 'admin', '2025-06-10 17:03:14', '2025-06-10 17:03:14', NULL),
(15, 23, 'General Documents', 'General Documents', 'admin', '2025-06-10 17:06:06', '2025-06-10 17:06:06', NULL),
(16, 23, 'General Documents', 'General Documents', 'admin', '2025-06-10 17:07:30', '2025-06-10 17:07:30', NULL),
(17, 23, 'domain', 'Pending', 'admin', '2025-06-10 17:11:30', '2025-06-10 17:11:30', NULL),
(18, 23, 'General Documents', 'General Documents', 'admin', '2025-06-10 17:11:46', '2025-06-10 17:11:46', NULL),
(19, 30, 'domain', 'Booked', 'admin', '2025-06-18 11:02:34', '2025-06-18 11:02:34', NULL),
(20, 30, 'domain', 'Pending', 'admin', '2025-06-18 11:05:19', '2025-06-18 11:05:19', NULL),
(21, 30, 'domain', 'Booked', 'admin', '2025-06-18 11:05:39', '2025-06-18 11:05:39', NULL),
(22, 30, 'hosting', 'Assigned', 'admin', '2025-06-18 11:05:52', '2025-06-18 11:05:52', NULL),
(23, 29, 'domain', 'Booked', 'admin', '2025-06-18 11:06:31', '2025-06-18 11:06:31', NULL),
(24, 29, 'hosting', 'Assigned', 'admin', '2025-06-18 11:06:33', '2025-06-18 11:06:33', NULL),
(25, 29, 'design', 'In Progress', 'admin', '2025-06-18 11:06:39', '2025-06-18 11:06:39', NULL),
(26, 28, 'domain', 'Booked', 'admin', '2025-06-18 11:21:25', '2025-06-18 11:21:25', NULL),
(27, 28, 'hosting', 'Assigned', 'admin', '2025-06-18 11:21:27', '2025-06-18 11:21:27', NULL),
(28, 28, 'design', 'Done', 'admin', '2025-06-18 11:21:30', '2025-06-18 11:21:30', NULL),
(29, 28, 'madeLive', 'Yes', 'admin', '2025-06-18 11:21:32', '2025-06-18 11:21:32', NULL),
(30, 28, 'madeLive', 'No', 'admin', '2025-06-18 11:26:59', '2025-06-18 11:26:59', NULL),
(31, 28, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-18 11:43:07', '2025-06-18 11:43:07', NULL),
(32, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 11:44:58', '2025-06-18 11:44:58', NULL),
(33, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 11:46:56', '2025-06-18 11:46:56', NULL),
(34, 28, 'Engagement Form', 'Engagement Form With Changes', 'admin', '2025-06-18 11:49:17', '2025-06-18 11:49:17', NULL),
(35, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 12:19:17', '2025-06-18 12:19:17', NULL),
(36, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 12:26:31', '2025-06-18 12:26:31', NULL),
(37, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 12:27:58', '2025-06-18 12:27:58', NULL),
(38, 28, 'Engagement Form', 'Engagement Form With Signature', 'admin', '2025-06-18 12:29:27', '2025-06-18 12:29:27', NULL),
(39, 28, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-18 12:32:12', '2025-06-18 12:32:12', NULL),
(40, 28, 'Acceptance Form', 'Engagement Form For Signature', 'admin', '2025-06-18 12:32:29', '2025-06-18 12:32:29', NULL),
(41, 28, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-18 12:34:04', '2025-06-18 12:34:04', NULL),
(42, 28, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-18 12:37:05', '2025-06-18 12:37:05', NULL),
(43, 28, 'Acceptance Form', 'Acceptance Form With Changes', 'admin', '2025-06-18 12:37:18', '2025-06-18 12:37:18', NULL),
(44, 28, 'Acceptance Form', 'Acceptance Form With Changes', 'admin', '2025-06-18 12:37:29', '2025-06-18 12:37:29', NULL),
(45, 28, 'Acceptance Form', 'Acceptance Form With Changes', 'admin', '2025-06-18 12:38:46', '2025-06-18 12:38:46', NULL),
(46, 28, 'Acceptance Form', 'Acceptance Form With Signature', 'admin', '2025-06-18 12:39:11', '2025-06-18 12:39:11', NULL),
(47, 28, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-18 12:50:53', '2025-06-18 12:50:53', NULL),
(48, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:56:24', '2025-06-18 12:56:24', NULL),
(49, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:56:58', '2025-06-18 12:56:58', NULL),
(50, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:57:23', '2025-06-18 12:57:23', NULL),
(51, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:58:24', '2025-06-18 12:58:24', NULL),
(52, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:59:07', '2025-06-18 12:59:07', NULL),
(53, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 12:59:26', '2025-06-18 12:59:26', NULL),
(54, 28, 'General Documents', 'General Documents', 'admin', '2025-06-18 13:01:09', '2025-06-18 13:01:09', NULL),
(55, 30, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-19 16:32:45', '2025-06-19 16:32:45', NULL),
(56, 30, 'Acceptance Form', 'Acceptance Form With Signature', 'admin', '2025-06-20 16:40:55', '2025-06-20 16:40:55', NULL),
(57, 30, 'General Documents', 'General Documents', 'admin', '2025-06-20 16:41:49', '2025-06-20 16:41:49', NULL),
(58, 40, 'domain', 'Booked', 'admin', '2025-06-27 16:58:00', '2025-06-27 16:58:00', NULL),
(59, 40, 'Engagement Form', 'Engagement Form For Signature', 'admin', '2025-06-27 16:58:20', '2025-06-27 16:58:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `appdate` datetime DEFAULT NULL,
  `customer_phone` bigint(20) NOT NULL,
  `staff_id` bigint(20) UNSIGNED NOT NULL,
  `staff_name` varchar(255) NOT NULL,
  `service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_number` varchar(255) DEFAULT NULL,
  `cart` text DEFAULT NULL,
  `item_total` decimal(10,2) NOT NULL,
  `bill_discount` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `total_duration` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `customer_source` varchar(255) DEFAULT NULL,
  `billed_staff_id` bigint(20) UNSIGNED NOT NULL,
  `billed_staff_name` varchar(255) DEFAULT NULL,
  `membership_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_service` bigint(20) DEFAULT NULL,
  `membership_discount` decimal(10,2) DEFAULT NULL,
  `free_services_used` decimal(10,2) DEFAULT NULL,
  `gst_percent` decimal(10,2) DEFAULT NULL,
  `gst_amount` decimal(10,2) DEFAULT NULL,
  `final_total` decimal(10,2) DEFAULT NULL,
  `voucherCode` varchar(255) DEFAULT NULL,
  `adv_booking` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `customer_name`, `appdate`, `customer_phone`, `staff_id`, `staff_name`, `service_id`, `payment_method`, `transaction_number`, `cart`, `item_total`, `bill_discount`, `grand_total`, `start_time`, `total_duration`, `end_time`, `branch_id`, `customer_source`, `billed_staff_id`, `billed_staff_name`, `membership_id`, `total_service`, `membership_discount`, `free_services_used`, `gst_percent`, `gst_amount`, `final_total`, `voucherCode`, `adv_booking`, `created_at`, `updated_at`) VALUES
(52, 'Ayan', NULL, 7794902298, 90, 'lucky', NULL, 'card', 'ICICI', '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"},{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"}]\"', 102.00, 10.00, 92.00, '2025-09-19 17:52:56', '60', '2025-09-19 18:52:56', 14, 'walkin', 90, 'lucky', NULL, 2, 0.00, 0.00, 18.00, 16.56, 108.56, NULL, 'no', '2025-09-19 17:52:56', '2025-09-19 17:52:56'),
(53, 'Sandy', NULL, 9988775544, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"},{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"},{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 113.00, 0.00, 0.00, '2025-09-19 18:52:56', '120', '2025-09-19 20:52:56', 14, 'walkin', 90, 'lucky', 2, 3, 113.00, 3.00, 5.00, 0.00, 0.00, NULL, 'no', '2025-09-19 17:54:21', '2025-09-19 17:54:21'),
(54, 'Raj', NULL, 8877665544, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"},{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 102.00, 0.00, 0.00, '2025-09-19 20:52:56', '60', '2025-09-19 21:52:56', 14, 'walkin', 90, 'lucky', 2, 2, 102.00, 2.00, 5.00, 0.00, 0.00, NULL, 'no', '2025-09-19 18:09:22', '2025-09-19 18:09:22'),
(55, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 12.00, 12.00, 0.00, '2025-09-19 21:52:56', '35', '2025-09-19 22:27:56', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 'no', '2025-09-19 19:23:37', '2025-09-19 19:23:37'),
(56, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 12.00, 12.00, 0.00, '2025-09-19 22:27:56', '35', '2025-09-19 23:02:56', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 5.00, 0.00, 0.00, NULL, 'no', '2025-09-19 19:26:12', '2025-09-19 19:26:12'),
(57, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 12.00, 12.00, 0.00, '2025-09-19 23:02:56', '35', '2025-09-19 23:37:56', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 'sample123', 'no', '2025-09-19 19:28:11', '2025-09-19 19:28:11'),
(58, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"}]\"', 90.00, 90.00, 0.00, '2025-09-19 23:37:56', '25', '2025-09-20 00:02:56', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 'Sample11', 'no', '2025-09-19 19:37:14', '2025-09-19 19:37:14'),
(59, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 12.00, 12.00, 0.00, '2025-09-20 00:02:56', '35', '2025-09-20 00:37:56', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 0.00, 'Samdkfjkl', 'no', '2025-09-19 19:51:56', '2025-09-19 19:51:56'),
(60, 'Sandy', NULL, 9988775544, 90, 'lucky', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"}]\"', 90.00, 0.00, 0.00, '2025-09-20 00:37:56', '25', '2025-09-20 01:02:56', 14, 'walkin', 89, 'asif', 2, 1, 90.00, 1.00, 5.00, 0.00, 0.00, NULL, 'no', '2025-09-19 19:53:05', '2025-09-19 19:53:05'),
(61, 'asd', NULL, 9988775544, 90, 'lucky', NULL, 'card', 'fdf', '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-22 13:18:32', '60', '2025-09-22 14:18:32', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 11.00, 'dfdfdfd', 'no', '2025-09-22 13:18:32', '2025-09-22 13:18:32'),
(63, 'aa', NULL, 9988554433, 90, 'lucky', NULL, 'card', 'sdsd', '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-28 07:56:00', '60', '2025-09-28 08:56:00', 14, 'walkin', 90, 'lucky', NULL, 1, 0.00, 0.00, 0.00, 0.00, 11.00, NULL, 'yes', '2025-09-22 13:53:10', '2025-09-22 13:53:10'),
(64, 'fdgf', NULL, 9955443322, 90, 'lucky', NULL, 'card', 'fff', '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-28 08:56:00', '60', '2025-09-28 09:56:00', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 11.00, NULL, 'yes', '2025-09-22 13:57:02', '2025-09-22 13:57:02'),
(65, 'xsds', NULL, 1234567897, 90, 'lucky', NULL, 'card', 'cxc', '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 0.00, 2599.00, '2025-09-28 09:56:00', '60', '2025-09-28 10:56:00', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 2599.00, NULL, 'yes', '2025-09-22 14:09:45', '2025-09-22 14:09:45'),
(66, 'asdsf', NULL, 1234567890, 90, 'lucky', NULL, 'card', 'sdss', '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-28 10:56:00', '60', '2025-09-28 11:56:00', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 11.00, NULL, 'yes', '2025-09-22 14:14:28', '2025-09-22 14:14:28'),
(67, 'sdfsd', NULL, 1234567890, 90, 'lucky', NULL, 'other', 'sadas', '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-28 11:56:00', '60', '2025-09-28 12:56:00', 14, 'walkin', 89, 'asif', NULL, 1, 0.00, 0.00, 0.00, 0.00, 11.00, NULL, 'yes', '2025-09-22 16:01:56', '2025-09-22 16:01:56'),
(68, 'csdcfsd', NULL, 1122334455, 90, 'lucky', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 0.00, 2599.00, '2025-09-28 06:06:00', '60', '2025-09-28 07:06:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 16:07:30', '2025-09-22 16:07:30'),
(69, 'wsd', NULL, 1234567890, 90, 'lucky', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"7\\\",\\\"name\\\":\\\"Dimond Leg Wash\\\",\\\"price\\\":\\\"12\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"12\\\",\\\"duration\\\":\\\"35\\\"}]\"', 12.00, 0.00, 12.00, '2025-09-27 05:25:00', '35', '2025-09-27 06:00:00', 14, 'walkin', 90, 'lucky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 16:26:17', '2025-09-22 16:26:17'),
(70, 'dfcsdf', NULL, 1234567890, 90, 'lucky', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"}]\"', 90.00, 0.00, 90.00, '2025-09-26 07:27:00', '25', '2025-09-26 07:52:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 16:31:11', '2025-09-22 16:31:11'),
(71, 'raj', NULL, 1122334455, 90, 'lucky', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 0.00, 2599.00, '2025-09-22 11:01:00', '60', '2025-09-22 12:01:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 16:32:39', '2025-09-22 16:32:39'),
(72, 'asif', NULL, 9440161007, 90, 'lucky', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"6\\\",\\\"name\\\":\\\"Gold Face Wash\\\",\\\"price\\\":\\\"90\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"90\\\",\\\"duration\\\":\\\"25\\\"},{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2689.00, 0.00, 2689.00, '2025-09-22 06:01:00', '85', '2025-09-22 07:26:00', 14, 'walkin', 90, 'lucky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:04:22', '2025-09-22 17:04:22'),
(73, 'dfd', NULL, 794902298, 90, 'lucky', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 0.00, 2599.00, '2025-09-21 20:01:00', '60', '2025-09-21 21:01:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:07:58', '2025-09-22 17:07:58'),
(74, 'sdfsd', NULL, 1234323456, 90, 'lucky', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-22 03:08:00', '60', '2025-09-22 04:08:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:09:31', '2025-09-22 17:09:31'),
(75, 'dfdsf', NULL, 987654321, 92, 'Rani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 11.00, 0.00, '2025-09-22 06:14:00', '60', '2025-09-22 07:14:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:15:22', '2025-09-22 17:15:22'),
(76, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 2599.00, 0.00, '2025-09-22 07:16:00', '60', '2025-09-22 08:16:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:19:39', '2025-09-22 17:19:39'),
(77, 'asif', NULL, 9440161007, 92, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 0.00, 2599.00, '2025-09-22 11:54:00', '60', '2025-09-22 12:54:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:24:43', '2025-09-22 17:24:43'),
(78, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-22 17:33:00', '60', '2025-09-22 18:33:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:37:23', '2025-09-22 17:37:23'),
(79, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-22 18:34:00', '60', '2025-09-22 19:34:00', 14, 'walkin', 90, 'lucky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:38:09', '2025-09-22 17:38:09'),
(80, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2599\\\",\\\"duration\\\":\\\"60\\\"}]\"', 2599.00, 2599.00, 0.00, '2025-09-25 17:39:00', '60', '2025-09-25 18:39:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:41:01', '2025-09-22 17:41:01'),
(81, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 11.00, 0.00, '2025-09-23 13:44:00', '60', '2025-09-23 14:44:00', 14, 'walkin', 90, 'lucky', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:43:21', '2025-09-22 17:43:21'),
(82, 'sdsdf', NULL, 94401616007, 92, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"10\\\",\\\"name\\\":\\\"Test\\\",\\\"price\\\":\\\"2599\\\",\\\"quantity\\\":\\\"2\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5198\\\",\\\"duration\\\":\\\"60\\\"}]\"', 5198.00, 0.00, 5198.00, '2025-09-22 19:43:00', '120', '2025-09-22 21:43:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2025-09-22 17:45:34', '2025-09-22 17:45:34'),
(83, 'dfcsdf', NULL, 1234567890, 92, 'Rani', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"9\\\",\\\"name\\\":\\\"Body Wash\\\",\\\"price\\\":\\\"11\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"11\\\",\\\"duration\\\":\\\"60\\\"}]\"', 11.00, 0.00, 11.00, '2025-09-28 17:46:00', '60', '2025-09-28 18:46:00', 14, 'walkin', 89, 'asif', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yes', '2025-09-22 17:47:19', '2025-09-22 17:47:19'),
(84, 'asif', '2025-10-01 16:36:00', 9988776655, 94, 'Gita', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 0.00, '2025-10-01 16:37:30', '120', '2025-10-01 18:37:30', 17, 'Referance', 95, 'Glory', 6, NULL, NULL, 1.00, NULL, NULL, NULL, NULL, 'no', '2025-10-01 16:37:30', '2025-10-01 16:37:30'),
(85, 'Asif', '2025-10-14 11:21:00', 9440161007, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"62\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 4499.00, 0.00, 4499.00, '2025-10-14 11:22:22', '90', '2025-10-14 12:52:22', 19, 'Referance', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 11:22:22', '2025-10-14 11:22:22'),
(86, 'Ravi', '2025-10-14 14:30:00', 9988776655, 110, 'kalyani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"},{\\\"service_id\\\":\\\"62\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 9998.00, 0.00, 0.00, '2025-10-14 14:31:18', '210', '2025-10-14 18:01:18', 19, 'walkin', 110, 'kalyani', 7, NULL, NULL, 2.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 14:31:18', '2025-10-14 14:31:18'),
(87, 'Asif', '2025-10-14 14:31:00', 9440161007, 110, 'kalyani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"62\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 4499.00, 0.00, 4499.00, '2025-10-14 14:32:10', '90', '2025-10-14 16:02:10', 19, 'Reference', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 14:32:10', '2025-10-14 14:32:10'),
(88, 'Asif', '2025-10-14 18:37:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"62\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 4499.00, 0.00, 4499.00, '2025-10-14 18:38:51', '90', '2025-10-14 20:08:51', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:38:51', '2025-10-14 18:38:51'),
(89, 'asif', '2025-10-14 18:38:00', 9440161007, 110, 'kalyani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"58\\\",\\\"name\\\":\\\"Melting candle therapy\\\",\\\"price\\\":\\\"3499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"3499\\\",\\\"duration\\\":\\\"60\\\"}]\"', 3499.00, 0.00, 3499.00, '2025-10-14 18:40:02', '60', '2025-10-14 19:40:02', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:40:02', '2025-10-14 18:40:02'),
(90, 'Asif', '2025-10-14 18:40:00', 9440161007, 110, 'kalyani', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-14 18:42:01', '120', '2025-10-14 20:42:01', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:42:01', '2025-10-14 18:42:01'),
(91, 'Asif', '2025-10-14 18:42:00', 9440161007, 110, 'kalyani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"61\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 4499.00, 0.00, 4499.00, '2025-10-14 18:50:28', '90', '2025-10-14 20:20:28', 19, 'walkin', 109, 'cddss', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:50:28', '2025-10-14 18:50:28'),
(92, 'Asif', '2025-10-14 17:50:00', 9440161007, 110, 'kalyani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"61\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"},{\\\"service_id\\\":\\\"59\\\",\\\"name\\\":\\\"Melting candle therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 8998.00, 0.00, 8998.00, '2025-10-14 18:55:50', '180', '2025-10-14 21:55:50', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:55:50', '2025-10-14 18:55:50'),
(93, 'Asif', '2025-10-14 18:55:00', 9440161007, 110, 'kalyani', NULL, 'upi', NULL, '\"[{\\\"service_id\\\":\\\"55\\\",\\\"name\\\":\\\"Chocolate massage\\\",\\\"price\\\":\\\"3499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"3499\\\",\\\"duration\\\":\\\"60\\\"}]\"', 3499.00, 0.00, 3499.00, '2025-10-14 18:56:22', '60', '2025-10-14 19:56:22', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-14 18:56:22', '2025-10-14 18:56:22'),
(94, 'Asif', '2025-10-17 17:55:00', 9440161007, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 17:56:18', '120', '2025-10-17 19:56:18', 19, 'walkin', 112, 'bfbhfsb', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 17:56:18', '2025-10-17 17:56:18'),
(95, 'Asif', '2025-10-17 18:03:00', 9440161007, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:04:01', '120', '2025-10-17 20:04:01', 19, 'Google', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:04:01', '2025-10-17 18:04:01'),
(96, 'asif', '2025-10-17 18:16:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:17:06', '120', '2025-10-17 20:17:06', 19, 'walkin', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:17:06', '2025-10-17 18:17:06'),
(97, 'Asif', '2025-10-17 18:17:00', 8919273834, 110, 'kalyani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"60\\\",\\\"name\\\":\\\"Melting candle therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:20:18', '120', '2025-10-17 20:20:18', 19, 'walkin', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:20:18', '2025-10-17 18:20:18'),
(98, 'Asif', '2025-10-17 18:20:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"60\\\",\\\"name\\\":\\\"Melting candle therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:24:38', '120', '2025-10-17 20:24:38', 19, 'walkin', 106, 'aa', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:24:38', '2025-10-17 18:24:38'),
(99, 'Asif', '2025-10-17 18:24:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"61\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"4499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"4499\\\",\\\"duration\\\":\\\"90\\\"}]\"', 4499.00, 0.00, 4499.00, '2025-10-17 18:26:08', '90', '2025-10-17 19:56:08', 19, 'walkin', 109, 'cddss', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:26:08', '2025-10-17 18:26:08'),
(100, 'Mani', '2025-10-17 18:26:00', 9866755883, 110, 'kalyani', NULL, 'cash', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:26:58', '120', '2025-10-17 20:26:58', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:26:58', '2025-10-17 18:26:58'),
(101, 'Asif', '2025-10-17 18:29:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"63\\\",\\\"name\\\":\\\"spearmint oil therapy\\\",\\\"price\\\":\\\"5499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"5499\\\",\\\"duration\\\":\\\"120\\\"}]\"', 5499.00, 0.00, 5499.00, '2025-10-17 18:29:53', '120', '2025-10-17 20:29:53', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:29:53', '2025-10-17 18:29:53'),
(102, 'Asif', '2025-10-17 18:33:00', 8919273834, 108, 'Rani', NULL, 'card', NULL, '\"[{\\\"service_id\\\":\\\"54\\\",\\\"name\\\":\\\"Deep cleaning facial\\\",\\\"price\\\":\\\"2499\\\",\\\"quantity\\\":\\\"1\\\",\\\"discount\\\":\\\"0\\\",\\\"line_total\\\":\\\"2499\\\",\\\"duration\\\":\\\"45\\\"}]\"', 2499.00, 0.00, 2499.00, '2025-10-17 18:33:45', '45', '2025-10-17 19:18:45', 19, 'walkin', 108, 'Rani', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 'no', '2025-10-17 18:33:45', '2025-10-17 18:33:45');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `address`, `phone`, `email`, `manager`, `created_at`, `updated_at`) VALUES
(16, 'MN Corner', '4th floor, MN Corner, Golden Mile Rd, Kokapet, Hyderabad, Telangana 500075', '9515696776', 'odyspakokapet@gmail.com', NULL, '2025-09-24 14:35:09', '2025-09-24 14:35:09'),
(17, 'Raichandani', 'Shop No. 419, 4th Floor, Raichandani Business Bay, opp. RAJAPUSHPA REGALIA, Kokapet, Hyderabad, Telangana 500075', '8919289295', 'odyspa2025@gmail.com', NULL, '2025-09-24 14:37:46', '2025-09-24 14:37:46'),
(19, 'Test Branch Gachabowali', 'Gachabowali', '9988776655', 'Test@branch.com', NULL, '2025-10-11 08:04:25', '2025-10-11 08:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(3, 'ssss', 'brands/NWqSJK8ji6aHvYJ3J7kWNVHGXURTLHa7G11KLtwL.jpg', '2025-08-28 13:51:29', '2025-08-28 15:42:46'),
(4, 'Asif', 'brands/JCgXru2s0gtsP3GDv1hQXbrHnej0V8gAuwIb51Vd.png', '2025-08-28 14:28:07', '2025-08-28 14:28:07'),
(5, 'sdsd', 'brands/pmJkfos5R4uTp8loEpastW32solho5Kbn7BwZmZO.png', '2025-08-28 15:36:59', '2025-08-28 15:36:59'),
(6, 'saas', 'brands/aeESkdDPgZYW5WD2gMExGEUlEFTYLDGdf053QfGZ.jpg', '2025-08-28 15:37:55', '2025-08-28 15:37:55'),
(7, 'dfd', 'brands/bfW6RyhraRNBOwhaRqB84EL93JyyiYGnKrstrowa.png', '2025-08-30 19:42:29', '2025-08-30 19:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `calenders`
--

CREATE TABLE `calenders` (
  `id` bigint(20) NOT NULL,
  `type` enum('task','deadline','meeting') NOT NULL,
  `task_title` varchar(255) DEFAULT NULL,
  `project` varchar(200) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `customer_id` int(20) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `timeSlot` varchar(200) DEFAULT NULL,
  `urgency` varchar(255) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `meetingType` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `staff` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `zoomLink` text DEFAULT NULL,
  `zoomparticipant` text DEFAULT NULL,
  `assignedTo` text DEFAULT NULL,
  `assignToId` text DEFAULT NULL,
  `priority` enum('Medium Priority','Low Priority','High Priority') DEFAULT NULL,
  `saas_id` varchar(255) DEFAULT 'admin',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `calenders`
--

INSERT INTO `calenders` (`id`, `type`, `task_title`, `project`, `project_id`, `customer`, `customer_id`, `date`, `timeSlot`, `urgency`, `stage`, `meetingType`, `status`, `staff`, `notes`, `zoomLink`, `zoomparticipant`, `assignedTo`, `assignToId`, `priority`, `saas_id`, `created_at`, `updated_at`) VALUES
(4, 'task', 'dssdf', 'Demo One', 29, NULL, 0, '2025-06-17', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, '63', NULL, NULL, 'admin', '2025-06-13 18:31:27', '2025-06-13 18:31:27'),
(5, 'task', 'Sikll', 'Node Js App', 26, NULL, 0, '2025-06-17', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, '63', NULL, NULL, 'admin', '2025-06-14 10:27:52', '2025-06-14 10:27:52'),
(6, 'task', 'sdfsdf', 'sdfsdf', 28, NULL, 0, '2025-06-19', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, '63', NULL, NULL, 'admin', '2025-06-14 10:50:14', '2025-06-14 10:50:14'),
(7, 'task', 'sdf', 'sdfsdf', 28, NULL, 0, '2025-06-14', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, '63', NULL, NULL, 'admin', '2025-06-14 12:00:21', '2025-06-14 12:00:21'),
(8, 'meeting', 'sdfsdf', NULL, NULL, 'Asif shaik', 0, '2025-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[66,63]', NULL, NULL, 'admin', '2025-06-14 14:23:26', '2025-06-14 14:23:26'),
(9, 'meeting', 'Asif mee', NULL, NULL, 'Rani', 0, '2025-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"Asif khan\",\"Asif\"]', NULL, NULL, 'admin', '2025-06-14 14:29:06', '2025-06-14 14:29:06'),
(10, 'meeting', 'dsfsdfsdf', NULL, NULL, 'Rani', 0, '2025-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'zoom.line', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 14:39:02', '2025-06-14 14:39:02'),
(11, 'meeting', 'fsdfsdfsd', NULL, NULL, 'Asif shaik', 0, '2025-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://web.whatsapp.com/', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 14:41:29', '2025-06-14 14:41:29'),
(12, 'meeting', 'fsdfsdfsd', NULL, NULL, 'Asif shaik', 0, '2025-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://web.whatsapp.com/', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 14:41:35', '2025-06-14 14:41:35'),
(13, 'meeting', 'sdfsdfsd', NULL, NULL, 'Rani', 0, '2025-06-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://web.whatsapp.com/', NULL, '[\"Asif khan\",\"Asif\"]', NULL, NULL, 'admin', '2025-06-14 14:46:27', '2025-06-14 14:46:27'),
(14, 'meeting', 'dfgdf', NULL, NULL, 'Rani', 0, '2025-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1grIt2v6Lfrzng8KFnNGXDPbQB8K3ulc1jDU9XcS1tHM/edit?usp=sharing', NULL, '[\"Asif khan\",\"Asif\"]', NULL, NULL, 'admin', '2025-06-14 15:18:53', '2025-06-14 15:18:53'),
(15, 'meeting', 'sdfsdfsdf', NULL, NULL, 'Surya', 0, '2025-06-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://docs.google.com/spreadsheets/d/1grIt2v6Lfrzng8KFnNGXDPbQB8K3ulc1jDU9XcS1tHM/edit?usp=sharing', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 15:19:16', '2025-06-14 15:19:16'),
(16, 'task', 'dfgdfgdfgdfg', 'sdfsdf', 28, NULL, 0, '2025-06-26', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, NULL, NULL, '63', NULL, NULL, 'admin', '2025-06-14 15:32:38', '2025-06-14 15:32:38'),
(17, 'meeting', 'fgdfgdf', NULL, NULL, 'Rani', 0, '2025-07-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://admin.pgpaytrack.com/cgi-sys/defaultwebpage.cgi', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 15:42:03', '2025-06-14 15:42:03'),
(18, 'meeting', 'sdfsdf', NULL, NULL, 'Asif shaik', 0, '2025-06-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://tawk.link/5c24a65982491369ba9f9e1c/vc/684d45c2a3c8d40bf991cb38/v/a2fe98c6a27294fa7f16c154a5767e0e65a6b929/image.png', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 15:58:32', '2025-06-14 15:58:32'),
(19, 'meeting', 'sdfsdf', NULL, NULL, 'Rani', 0, '2025-06-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://tawk.link/5c24a65982491369ba9f9e1c/vc/684d45c2a3c8d40bf991cb38/v/a2fe98c6a27294fa7f16c154a5767e0e65a6b929/image.png', NULL, '[\"Asif khan\"]', NULL, NULL, 'admin', '2025-06-14 15:59:07', '2025-06-14 15:59:07'),
(20, 'meeting', 'sdfsd', NULL, NULL, 'Asif shaik', 0, '2025-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://tawk.link/5c24a65982491369ba9f9e1c/vc/684d45c2a3c8d40bf991cb38/v/a2fe98c6a27294fa7f16c154a5767e0e65a6b929/image.png', NULL, '[\"Asif\"]', NULL, NULL, 'admin', '2025-06-14 15:59:52', '2025-06-14 15:59:52'),
(21, 'meeting', 'sdfsdf', NULL, NULL, 'Rani', 0, '2025-06-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://tawk.link/5c24a65982491369ba9f9e1c/vc/684d45c2a3c8d40bf991cb38/v/a2fe98c6a27294fa7f16c154a5767e0e65a6b929/image.png', NULL, '[\"Asif\"]', NULL, NULL, 'admin', '2025-06-14 16:01:17', '2025-06-14 16:01:17'),
(22, 'meeting', 'dsfsdfdf', NULL, NULL, 'Asif shaik', 16, '2025-06-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif khan\",\"Asif\"]', '[66,63]', NULL, 'admin', '2025-06-20 11:37:48', '2025-06-20 11:37:48'),
(25, 'meeting', 'Demo', NULL, NULL, 'Rani', 17, '2025-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\\\"Asif khan\\\"]', '[66,63]', NULL, 'admin', '2025-06-20 12:53:22', '2025-06-20 12:53:22'),
(26, 'meeting', 'Demo', NULL, NULL, 'Rani', 17, '2025-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\\\"Asif khan\\\"]', '[64,63]', NULL, 'admin', '2025-06-20 15:37:26', '2025-06-20 15:37:26'),
(27, 'meeting', 'sdfd', NULL, NULL, 'Rani', 17, '2025-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif khan\",\"Asif\"]', '[66,63]', NULL, 'admin', '2025-06-20 15:38:33', '2025-06-20 15:38:33'),
(28, 'task', 'Ask Payment', NULL, NULL, 'Asif shaik', 16, '2025-06-20', NULL, NULL, NULL, NULL, 'Pending', NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif khan\",\"Asif\"]', '[66,63]', NULL, 'admin', '2025-06-20 16:08:41', '2025-06-20 16:08:41'),
(29, 'meeting', 'dfsdf', NULL, NULL, 'Rani', 17, '2025-06-20', '11:30 AM', NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif khan\",\"Asif\"]', '[66,63]', NULL, 'admin', '2025-06-20 16:10:29', '2025-06-20 16:10:29'),
(30, 'meeting', 'ghkldfghkljdfjdfl', NULL, NULL, 'Anvish', 18, '2025-06-20', '01:00 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif khan\",\"Asif\"]', '[66,63]', NULL, 'admin', '2025-06-20 16:13:32', '2025-06-20 16:13:32'),
(31, 'meeting', 'dsfsdf', NULL, NULL, 'Asif shaik', 16, '2025-06-20', '11:00 AM', NULL, NULL, NULL, NULL, NULL, NULL, 'http://192.168.80.42:8080/dashboard', NULL, '[\"Asif\"]', '[63]', NULL, 'admin', '2025-06-20 16:16:40', '2025-06-20 16:16:40'),
(32, 'meeting', 'Sample Demo', NULL, NULL, 'Asif shaik', 16, '2025-06-26', '12:00 PM', NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.figma.com/design/L29A3TS0j0sQ8EF1Aal3v9/Ozrit---freeplan?node-id=0-1&p=f&t=n4DlXfPjmlAOLZrI-0', NULL, '[\"Asif\"]', '[63]', NULL, 'admin', '2025-06-20 16:24:45', '2025-06-20 16:24:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Fashion dfd', 'Aayan Games', '2025-07-18 18:03:23', '2025-08-30 19:55:05', '2025-07-18 18:39:11'),
(2, 'Electroic', 'NEON SPLATTER ZONE', '2025-07-18 18:21:56', '2025-08-30 19:51:44', NULL),
(3, 'Rice', 'dfkjfh', '2025-07-18 18:22:45', '2025-08-30 19:50:10', '2025-07-18 18:59:37'),
(4, 'Grosary', 'dcfdsfds', '2025-07-18 19:02:02', '2025-08-30 19:48:50', NULL),
(6, 'Vegtables', 'sff', '2025-07-21 14:09:48', '2025-08-30 19:46:42', '2025-07-21 14:09:51'),
(7, 'Fruits', 'SWING', '2025-07-21 18:49:44', '2025-08-30 19:46:02', '2025-07-22 12:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

CREATE TABLE `combos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) NOT NULL,
  `savings_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `product_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`product_ids`)),
  `branch_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`branch_ids`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `companyName` varchar(200) DEFAULT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `notes` text DEFAULT NULL,
  `saas_id` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullName`, `companyName`, `mobile`, `email`, `address`, `notes`, `saas_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(21, 'Suprana', 'Grace N Glam', 9876543210, 'suprana@gmail.com', 'Secunderabad', NULL, 'admin', '2025-06-27 11:40:04', '2025-06-27 11:57:53', '2025-06-27 11:57:53'),
(22, 'Cashsource', 'Hive Space', 7382373824, 'webdzyners@gmail.com', 'cvbgvh', 'bghj', 'admin', '2025-06-27 11:58:06', '2025-06-27 11:58:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `status` enum('paid','unpaid','partial','pending') DEFAULT 'pending',
  `date_incurred` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `has_bill` tinyint(1) DEFAULT 0,
  `bill_file` text DEFAULT NULL,
  `entered_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `title`, `amount`, `category`, `project`, `client`, `status`, `date_incurred`, `due_date`, `has_bill`, `bill_file`, `entered_by`, `created_at`, `updated_at`) VALUES
(5, 'Bill', 2500.00, 'Travel', NULL, NULL, 'paid', NULL, '2025-06-18', 1, 'bills/REfGyFru9MwRbcGjuOl0akXGT7bYSOkfQnu2kY7v.pdf', NULL, '2025-06-19 10:39:47', '2025-06-20 11:28:17'),
(8, 'Internet Bill', 50000000.00, 'Office Supplies', NULL, NULL, 'paid', NULL, '2025-06-26', 0, NULL, NULL, '2025-06-27 14:56:51', '2025-06-27 15:02:18'),
(9, 'test', 800.00, 'Software', NULL, NULL, 'pending', NULL, '2025-06-29', 0, NULL, NULL, '2025-06-27 14:57:33', '2025-06-27 14:57:33');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` float(10,2) NOT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `title`, `description`, `price`, `categories_id`, `genre`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Lazer Maze', 'Lazer Maze', 384.13, 4, 'Maze', '2025-07-18 19:32:50', '2025-07-19 17:27:46', '2025-07-19 17:27:46'),
(2, 'CLIMB', 'CLIMB', 338.14, 4, 'CLIMB', '2025-07-18 19:52:03', '2025-07-21 18:51:10', NULL),
(3, 'ARENA', 'ARENA GAME', 338.14, 4, 'ARENA', '2025-07-19 16:12:34', '2025-07-21 18:50:17', NULL),
(4, 'Push', 'Push', 338.14, 4, 'Push', '2025-08-01 17:45:44', '2025-08-01 17:45:44', NULL),
(5, 'Maze', 'Maze', 338.14, 5, 'Maze', '2025-07-18 19:52:03', '2025-07-18 19:52:03', NULL),
(6, 'Mega Grid', 'Mega Grid', 338.14, 4, 'Mega Grid', '2025-08-01 17:48:19', '2025-08-01 17:48:19', NULL),
(7, 'All 5 Rooms', 'per person', 1399.00, 4, 'PUSH', '2025-07-21 18:51:30', '2025-07-22 12:18:31', NULL),
(8, 'Any 3 Rooms', 'per persob', 999.00, 4, 'LAZER MAZE', '2025-07-21 18:52:07', '2025-07-22 12:17:52', NULL),
(10, 'Corporate /Birthday/Group-Min10', 'Neon Splatter zone  (or) Interactive Games  Min _10', 1299.00, 2, 'Group Activity', '2025-08-01 18:07:06', '2025-08-01 18:07:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `invoiceDate` date NOT NULL,
  `dueDate` date NOT NULL,
  `advancePaid` float(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `services` text NOT NULL,
  `totalAmount` float(10,2) NOT NULL,
  `baseAmount` float(10,2) DEFAULT NULL,
  `balance` float(10,2) NOT NULL,
  `hasGST` tinyint(1) DEFAULT NULL,
  `gstPercent` float(10,2) DEFAULT NULL,
  `gstAmount` float(10,2) DEFAULT NULL,
  `gstNumber` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `project_id`, `invoiceDate`, `dueDate`, `advancePaid`, `notes`, `status`, `services`, `totalAmount`, `baseAmount`, `balance`, `hasGST`, `gstPercent`, `gstAmount`, `gstNumber`, `created_at`, `updated_at`) VALUES
(32, 22, 46, '2025-06-29', '2025-06-30', 2000.00, NULL, 'Unpaid', '[{\"name\":\"Website Design\",\"qty\":1,\"unitPrice\":50000,\"total\":50000},{\"name\":\"SEO\",\"qty\":1,\"unitPrice\":10000,\"total\":10000},{\"name\":\"E-commerce\",\"qty\":1,\"unitPrice\":2500,\"total\":2500},{\"name\":\"Branding\",\"qty\":1,\"unitPrice\":2500,\"total\":2500}]', 74750.00, NULL, 67750.00, 1, 15.00, 9750.00, NULL, '2025-06-29 18:48:53', '2025-06-29');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `expiration` int(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) NOT NULL,
  `service_count` int(11) NOT NULL DEFAULT 0,
  `final_price` decimal(10,2) NOT NULL,
  `discount_percent` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `name`, `expiration`, `price`, `offer_price`, `service_count`, `final_price`, `discount_percent`, `created_at`, `updated_at`) VALUES
(4, 'Bronze', 30, 5000.00, 5000.00, 3, 5000.00, 0.00, '2025-09-24 09:57:14', '2025-09-24 09:57:29'),
(5, 'Silver', 90, 10000.00, 10000.00, 7, 10000.00, 0.00, '2025-09-24 10:04:32', '2025-09-24 10:04:32'),
(6, 'Gold', 180, 15000.00, 15000.00, 12, 15000.00, 0.00, '2025-09-24 10:05:13', '2025-09-24 10:05:13'),
(7, 'Platinum', 270, 25000.00, 25000.00, 23, 25000.00, 0.00, '2025-09-24 19:59:58', '2025-09-24 19:59:58'),
(8, 'Titanium', 365, 50000.00, 50000.00, 60, 50000.00, 0.00, '2025-09-24 20:00:41', '2025-09-24 20:00:41'),
(9, 'Diamond', 730, 100000.00, 100000.00, 135, 100000.00, 0.00, '2025-09-24 20:01:43', '2025-09-24 20:01:43');

-- --------------------------------------------------------

--
-- Table structure for table `membershipspurchase`
--

CREATE TABLE `membershipspurchase` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` bigint(20) NOT NULL,
  `customer_email` varchar(200) NOT NULL,
  `plan_id` bigint(20) NOT NULL,
  `plan_name` varchar(200) DEFAULT NULL,
  `service_count` int(20) DEFAULT NULL,
  `payment_method` varchar(200) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membershipspurchase`
--

INSERT INTO `membershipspurchase` (`id`, `customer_name`, `customer_phone`, `customer_email`, `plan_id`, `plan_name`, `service_count`, `payment_method`, `amount`, `expiration`, `created_at`, `updated_at`) VALUES
(2, 'Asif', 9440161007, 'aaa@gmail.com', 2, 'Dimondd', 6, 'upi', 4000.00, '2025-12-18 11:40:24', '2025-09-17 15:41:20', '2025-09-17 15:41:20'),
(4, 'tet', 9988776655, 'ss@gmail.com', 3, 'Bronz', 6, 'cash', 8800.00, '2025-12-18 11:40:24', '2025-09-19 11:40:24', '2025-09-19 11:40:24'),
(5, 'Asif', 9440161007, 'aa@gmail.com', 3, 'Bronz', 6, 'cash', 8800.00, '2025-12-18 12:43:52', '2025-09-19 12:43:52', '2025-09-19 12:43:52'),
(6, 'Shabarish A', 9000005756, 'sabshabarish@gmail.com', 7, 'Platinum', 23, 'cash', 25000.00, '2026-06-23 23:48:17', '2025-09-26 23:48:17', '2025-09-26 23:48:17'),
(7, 'Aayan', 8877554433, 'aayan@gmail.com', 9, 'Diamond', 135, 'cash', 100000.00, '2027-10-14 14:30:21', '2025-10-14 14:30:21', '2025-10-14 14:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `sender_id`, `receiver_id`, `message`, `created_at`, `updated_at`) VALUES
(35, NULL, 59, 63, 'Hi', '2025-06-20 13:20:39', '2025-06-20 13:20:39'),
(36, NULL, 63, 59, 'hello', '2025-06-20 13:21:58', '2025-06-20 13:21:58'),
(37, NULL, 59, 63, 'Asif', '2025-06-20 13:32:23', '2025-06-20 13:32:23'),
(38, NULL, 59, 63, 'sample', '2025-06-20 13:36:13', '2025-06-20 13:36:13'),
(39, NULL, 63, 59, 'Ho', '2025-06-20 13:37:51', '2025-06-20 13:37:51'),
(40, NULL, 63, 59, 'Hello', '2025-06-20 13:37:55', '2025-06-20 13:37:55'),
(41, NULL, 59, 63, 'ssssss', '2025-06-20 13:40:40', '2025-06-20 13:40:40'),
(42, NULL, 63, 59, 'aaaaaa', '2025-06-20 13:42:24', '2025-06-20 13:42:24'),
(43, NULL, 59, 63, 'sample', '2025-06-20 13:42:50', '2025-06-20 13:42:50'),
(44, NULL, 59, 63, 'sadfsdfsd', '2025-06-20 13:47:17', '2025-06-20 13:47:17'),
(45, NULL, 59, 63, 'fsdfsd', '2025-06-20 13:47:31', '2025-06-20 13:47:31'),
(46, NULL, 63, 59, 'sdfsdfsdfsdfsdfsd', '2025-06-20 13:51:52', '2025-06-20 13:51:52'),
(47, NULL, 59, 63, 'sdsadfsdfsdfsdfsdf sdfsdf sdfsdf', '2025-06-20 13:52:10', '2025-06-20 13:52:10'),
(48, NULL, 59, 63, 'fsdfsdf', '2025-06-20 14:03:32', '2025-06-20 14:03:32'),
(49, NULL, 63, 59, 'sdfsdfsd', '2025-06-20 14:03:42', '2025-06-20 14:03:42'),
(50, NULL, 63, 59, 'Asif Ozrit', '2025-06-20 14:04:16', '2025-06-20 14:04:16'),
(51, NULL, 63, 59, 'sdfsdfsdfsd', '2025-06-20 14:05:46', '2025-06-20 14:05:46'),
(52, NULL, 63, 59, 'dsfsdf', '2025-06-20 14:07:18', '2025-06-20 14:07:18'),
(53, NULL, 63, 59, 'dsfsdfsdf', '2025-06-20 14:09:07', '2025-06-20 14:09:07'),
(54, NULL, 59, 63, 'sdfsdf', '2025-06-20 14:13:50', '2025-06-20 14:13:50');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_10_19_105842_create_messages_table', 1),
(2, '2001_06_20_135146_create_jobs_table', 2),
(3, '2000_06_20_135828_create_failed_jobs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `msg91s`
--

CREATE TABLE `msg91s` (
  `id` bigint(20) NOT NULL,
  `authKey` varchar(200) DEFAULT NULL,
  `senderId` varchar(200) NOT NULL,
  `templateId` varchar(200) NOT NULL,
  `saas_id` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msg91s`
--

INSERT INTO `msg91s` (`id`, `authKey`, `senderId`, `templateId`, `saas_id`, `created_at`, `updated_at`) VALUES
(1, '436223Atnm6DmuFf675a6b3bP1', 'DRVNKY', '677e16c1d6fc052d194f1a02', 'admin', '2025-04-26 06:20:48', NULL),
(2, '425937AD2eEmWFHiY668ccd5dP1', 'N/A', '6690f369d6fc0538920489e3', 'admin1', '2025-06-03 06:46:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `customerId` varchar(255) NOT NULL,
  `customerName` varchar(200) NOT NULL,
  `customerMobile` varchar(200) DEFAULT NULL,
  `items` text NOT NULL,
  `total` int(20) NOT NULL,
  `status` text NOT NULL,
  `staffId` text NOT NULL,
  `staffName` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customerId`, `customerName`, `customerMobile`, `items`, `total`, `status`, `staffId`, `staffName`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, '1753264921788', 'Pranay', '8008002692', '[{\"gameId\":8,\"name\":\"Any 3 Rooms\",\"price\":\"999.00\",\"quantity\":5,\"type\":\"game\",\"id\":\"1753264874147\"}]', 5894, 'completed', '63', 'Pos', '2025-07-23 15:32:02', '2025-07-23 15:32:02', NULL),
(21, '1754048399626', 'rakesh', '9642446655', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"999.00\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754048366352\"}]', 1179, 'completed', '63', 'Pos', '2025-08-01 17:09:59', '2025-08-01 17:09:59', NULL),
(22, '1754048461356', 'sumanth', '9000733849', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"999.00\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754048442944\"}]', 1179, 'completed', '63', 'Pos', '2025-08-01 17:11:01', '2025-08-01 17:11:01', NULL),
(23, '1754051576402', 'madhulika', '6301647325', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754051547860\"}]', 1197, 'completed', '63', 'Pos', '2025-08-01 18:02:56', '2025-08-01 18:02:56', NULL),
(24, '1754051625581', 'pavi', '8886936363', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754051603604\"}]', 1499, 'completed', '63', 'Pos', '2025-08-01 18:03:45', '2025-08-01 18:03:45', NULL),
(25, '1754051730492', 'varshita', '8482480590', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754051642428\"}]', 2998, 'completed', '63', 'Pos', '2025-08-01 18:05:30', '2025-08-01 18:05:30', NULL),
(26, '1754051763016', 'vedha', '8309481516', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754051741212\"}]', 798, 'completed', '63', 'Pos', '2025-08-01 18:06:03', '2025-08-01 18:06:03', NULL),
(27, '1754051792090', 'jeevan', '9966990870', '[{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754051774500\"}]', 798, 'completed', '63', 'Pos', '2025-08-01 18:06:33', '2025-08-01 18:06:33', NULL),
(28, '1754051822248', 'charan', '9885097674', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754051799884\"}]', 5996, 'completed', '63', 'Pos', '2025-08-01 18:07:02', '2025-08-01 18:07:02', NULL),
(29, '1754051859078', 'adrijapaul', '7987137764', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754051834524\"}]', 1499, 'completed', '63', 'Pos', '2025-08-01 18:07:39', '2025-08-01 18:07:39', NULL),
(30, '1754051883197', 'charan', '9885097674', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754051862508\"}]', 1499, 'completed', '63', 'Pos', '2025-08-01 18:08:03', '2025-08-01 18:08:03', NULL),
(31, '1754051912409', 'laxman', '9663021964', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754051893516\"}]', 4497, 'completed', '63', 'Pos', '2025-08-01 18:08:32', '2025-08-01 18:08:32', NULL),
(32, '1754062550043', 'RAKESH', '8121562425', '[{\"productId\":4,\"name\":\"All 5 Rooms\",\"price\":\"1399.00\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754062472078\"}]', 6603, 'completed', '63', 'Pos', '2025-08-01 21:05:50', '2025-08-01 21:05:50', NULL),
(33, '1754149815177', 'ABHI', '9966992399', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754149778659\"}]', 5996, 'completed', '63', 'Pos', '2025-08-02 21:20:15', '2025-08-02 21:20:15', NULL),
(34, '1754559752424', 'NOOR', '8008149082', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754559704183\"}]', 3996, 'completed', '63', 'Pos', '2025-08-07 15:12:30', '2025-08-07 15:12:30', NULL),
(35, '1754560491974', 'Sri Nivas', '9963118611', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754560412696\"}]', 5996, 'completed', '63', 'Pos', '2025-08-07 15:24:49', '2025-08-07 15:24:49', NULL),
(36, '1754561895166', 'Shekhar', '9866072203', '[{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754561863265\"}]', 399, 'completed', '63', 'Pos', '2025-08-07 15:48:12', '2025-08-07 15:48:12', NULL),
(37, '1754570824969', 'Tiya Jain', '9347456381', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754570540656\"}]', 2998, 'completed', '63', 'Pos', '2025-08-07 18:17:02', '2025-08-07 18:17:02', NULL),
(38, '1754578498857', 'PALAK', '7977801038', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754578477974\"}]', 399, 'completed', '63', 'Pos', '2025-08-07 20:24:56', '2025-08-07 20:24:56', NULL),
(39, '1754578548575', 'Sailesh', '9052168888', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754578507494\"}]', 1197, 'completed', '63', 'Pos', '2025-08-07 20:25:46', '2025-08-07 20:25:46', NULL),
(40, '1754639643413', 'KIRAN', '9000778773', '[{\"productId\":4,\"name\":\"All 5 Rooms\",\"price\":\"1185.61\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754639438218\"}]', 1399, 'completed', '63', 'Pos', '2025-08-08 13:24:03', '2025-08-08 13:24:03', NULL),
(41, '1754639669114', 'KIRAN', '9000778773', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754639652523\"}]', 999, 'completed', '63', 'Pos', '2025-08-08 13:24:29', '2025-08-08 13:24:29', NULL),
(42, '1754639703365', 'JOIN', '8106676767', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754639675811\"}]', 5996, 'completed', '63', 'Pos', '2025-08-08 13:25:03', '2025-08-08 13:25:03', NULL),
(43, '1754640684128', 'ROOPA', '9391118098', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754640635124\"}]', 4497, 'completed', '63', 'Pos', '2025-08-08 13:41:24', '2025-08-08 13:41:24', NULL),
(44, '1754640705780', 'ROOPA', '9391118098', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754640690539\"}]', 2997, 'completed', '63', 'Pos', '2025-08-08 13:41:45', '2025-08-08 13:41:45', NULL),
(45, '1754650137912', 'VISHNU', '7989552590', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754650113747\"}]', 3996, 'completed', '63', 'Pos', '2025-08-08 16:18:58', '2025-08-08 16:18:58', NULL),
(46, '1754650183750', 'VAISHANAVI', '9014261493', '[{\"productId\":4,\"name\":\"All 5 Rooms\",\"price\":\"1185.61\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754650148563\"}]', 2798, 'completed', '63', 'Pos', '2025-08-08 16:19:43', '2025-08-08 16:19:43', NULL),
(47, '1754650245286', 'SRI LEKHA', '9985019782', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754650192939\"}]', 4497, 'completed', '63', 'Pos', '2025-08-08 16:20:46', '2025-08-08 16:20:46', NULL),
(48, '1754650263116', 'SRI LEKHA', '9985019782', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754650252227\"}]', 2997, 'completed', '63', 'Pos', '2025-08-08 16:21:03', '2025-08-08 16:21:03', NULL),
(49, '1754650307583', 'MEENU', '7773952905', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":5,\"type\":\"product\",\"id\":\"1754650270939\"}]', 7495, 'completed', '63', 'Pos', '2025-08-08 16:21:47', '2025-08-08 16:21:47', NULL),
(50, '1754650338551', 'SRUTHI', '9701022233', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754650315139\"}]', 2998, 'completed', '63', 'Pos', '2025-08-08 16:22:18', '2025-08-08 16:22:18', NULL),
(51, '1754652393460', 'HASAN', '6281159234', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754652358037\"}]', 3996, 'completed', '63', 'Pos', '2025-08-08 16:56:33', '2025-08-08 16:56:33', NULL),
(52, '1754652463827', 'SHREKAR', '9963060055', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754652417397\"}]', 1596, 'completed', '63', 'Pos', '2025-08-08 16:57:43', '2025-08-08 16:57:43', NULL),
(53, '1754652783279', 'MAYERA', '9811266592', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754652486117\"}]', 2998, 'completed', '63', 'Pos', '2025-08-08 17:03:03', '2025-08-08 17:03:03', NULL),
(54, '1754658225048', 'VAMSI', '9494470499', '[{\"productId\":4,\"name\":\"All 5 Rooms\",\"price\":\"1185.61\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754658191866\"}]', 5596, 'completed', '63', 'Pos', '2025-08-08 18:33:45', '2025-08-08 18:33:45', NULL),
(55, '1754658479759', 'MAYERA', '9811266592', '[{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754658446682\"}]', 798, 'completed', '63', 'Pos', '2025-08-08 18:37:59', '2025-08-08 18:37:59', NULL),
(56, '1754658531323', 'SRISHTI', '9860611821', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754658488634\"}]', 4497, 'completed', '63', 'Pos', '2025-08-08 18:38:51', '2025-08-08 18:38:51', NULL),
(57, '1754658551858', 'SRISHTI', '9860611821', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754658538770\"}]', 2997, 'completed', '63', 'Pos', '2025-08-08 18:39:11', '2025-08-08 18:39:11', NULL),
(58, '1754658590440', 'NEHA', '9494030502', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":6,\"type\":\"product\",\"id\":\"1754658562194\"}]', 5994, 'completed', '63', 'Pos', '2025-08-08 18:39:50', '2025-08-08 18:39:50', NULL),
(59, '1754662366447', 'VAMSI', '9494470499', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754662340006\"}]', 4497, 'completed', '63', 'Pos', '2025-08-08 19:42:46', '2025-08-08 19:42:46', NULL),
(60, '1754662415431', 'BIDITH', '9849333303', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754662391133\"}]', 2998, 'completed', '63', 'Pos', '2025-08-08 19:43:35', '2025-08-08 19:43:35', NULL),
(61, '1754666774526', 'PHANI', '9170313114', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754666752169\"}]', 798, 'completed', '63', 'Pos', '2025-08-08 20:56:14', '2025-08-08 20:56:14', NULL),
(62, '1754666809731', 'SURAJ KUMAR', '8790775984', '[{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754666786241\"}]', 1596, 'completed', '63', 'Pos', '2025-08-08 20:56:49', '2025-08-08 20:56:49', NULL),
(63, '1754666857856', 'REEM', '9090091709', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754666826665\"}]', 2998, 'completed', '63', 'Pos', '2025-08-08 20:57:38', '2025-08-08 20:57:38', NULL),
(64, '1754666942501', 'SRIYAN', '9866590342', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754666870385\"}]', 999, 'completed', '63', 'Pos', '2025-08-08 20:59:02', '2025-08-08 20:59:02', NULL),
(65, '1754729205760', 'SIRISHA', '9494833003', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754729180737\"}]', 1998, 'completed', '63', 'Pos', '2025-08-09 14:16:45', '2025-08-09 14:16:45', NULL),
(66, '1754729265927', 'GANESH', '9440197009', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754729220049\"}]', 1998, 'completed', '63', 'Pos', '2025-08-09 14:17:45', '2025-08-09 14:17:45', NULL),
(67, '1754729411828', 'BHARATH', '6281906474', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729351690\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729353434\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729383722\"}]', 1197, 'completed', '63', 'Pos', '2025-08-09 14:20:11', '2025-08-09 14:20:11', NULL),
(68, '1754729455729', 'VIAN', '9030033468', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729421937\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729427330\"}]', 798, 'completed', '63', 'Pos', '2025-08-09 14:20:54', '2025-08-09 14:20:54', NULL),
(69, '1754729527061', 'VIAN', '9030033468', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729460089\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729470425\"}]', 798, 'completed', '63', 'Pos', '2025-08-09 14:22:06', '2025-08-09 14:22:06', NULL),
(70, '1754729744127', 'RUDHVIKA', '9949217607', '[{\"gameId\":8,\"name\":\"Any 3 Rooms\",\"price\":\"999.00\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754729719914\"}]', 1179, 'completed', '63', 'Pos', '2025-08-09 14:25:43', '2025-08-09 14:25:43', NULL),
(71, '1754729971781', 'ANURANJAN', '9985557470', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":6,\"type\":\"product\",\"id\":\"1754729869026\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":6,\"type\":\"product\",\"id\":\"1754729880482\"}]', 14989, 'completed', '63', 'Pos', '2025-08-09 14:29:31', '2025-08-09 14:29:31', NULL),
(72, '1754730018995', 'Y NIRVI', '9705755535', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754729980634\"}]', 1499, 'completed', '63', 'Pos', '2025-08-09 14:30:18', '2025-08-09 14:30:18', NULL),
(73, '1754730198581', 'NIKHILA', '9000129719', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754730138074\"},{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754730162514\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754730163602\"}]', 4794, 'completed', '63', 'Pos', '2025-08-09 14:33:17', '2025-08-09 14:33:17', NULL),
(74, '1754730236732', 'HARDHITA', '7989590059', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754730209834\"}]', 2998, 'completed', '63', 'Pos', '2025-08-09 14:33:55', '2025-08-09 14:33:55', NULL),
(75, '1754731003986', 'SIRISHA', '9494833003', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754730980571\"}]', 2998, 'completed', '63', 'Pos', '2025-08-09 14:46:43', '2025-08-09 14:46:43', NULL),
(76, '1754731035702', 'RASHMITHA', '8121581944', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754731013411\"}]', 1197, 'completed', '63', 'Pos', '2025-08-09 14:47:14', '2025-08-09 14:47:14', NULL),
(77, '1754731070902', 'ASHWINI', '8886400909', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754731047139\"}]', 2998, 'completed', '63', 'Pos', '2025-08-09 14:47:50', '2025-08-09 14:47:50', NULL),
(78, '1754731114954', 'APURVA', '8374931620', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754731082379\"}]', 2998, 'completed', '63', 'Pos', '2025-08-09 14:48:34', '2025-08-09 14:48:34', NULL),
(79, '1754733951615', 'YUVRAJ', '9643774242', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754733890373\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754733900285\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754733901621\"}]', 3591, 'completed', '63', 'Pos', '2025-08-09 15:35:50', '2025-08-09 15:35:50', NULL),
(80, '1754734187434', 'VINISHA', '7729948338', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":5,\"type\":\"game\",\"id\":\"1754733969381\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":5,\"type\":\"game\",\"id\":\"1754733971709\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":5,\"type\":\"game\",\"id\":\"1754733973437\"}]', 5985, 'completed', '63', 'Pos', '2025-08-09 15:39:46', '2025-08-09 15:39:46', NULL),
(81, '1754734232734', 'JYOTHIRMAI', '9052522861', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754734198181\"}]', 5996, 'completed', '63', 'Pos', '2025-08-09 15:40:31', '2025-08-09 15:40:31', NULL),
(82, '1754734267599', 'SREDHAR', '8805284765', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754734243765\"}]', 1998, 'completed', '63', 'Pos', '2025-08-09 15:41:06', '2025-08-09 15:41:06', NULL),
(83, '1754736223461', 'PRADNYA', '7993464733', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754736189920\"}]', 1499, 'completed', '63', 'Pos', '2025-08-09 16:13:42', '2025-08-09 16:13:42', NULL),
(84, '1754736256696', 'ARUNA', '9581138877', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754736236295\"}]', 2998, 'completed', '63', 'Pos', '2025-08-09 16:14:15', '2025-08-09 16:14:15', NULL),
(85, '1754815381445', 'IMTIYAZ', '9177835961', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754815332814\"}]', 1998, 'completed', '63', 'Pos', '2025-08-10 14:12:59', '2025-08-10 14:12:59', NULL),
(86, '1754815438779', 'HARSHITA', '7989590059', '[{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754815407734\"}]', 399, 'completed', '63', 'Pos', '2025-08-10 14:13:57', '2025-08-10 14:13:57', NULL),
(87, '1754815492596', 'NIKESH', '7569791707', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754815448494\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 14:14:50', '2025-08-10 14:14:50', NULL),
(88, '1754815542783', 'VEEKSHA', '8341611111', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754815508382\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 14:15:41', '2025-08-10 14:15:41', NULL),
(89, '1754815582031', 'SANJANA', '7207777116', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754815552174\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 14:16:20', '2025-08-10 14:16:20', NULL),
(90, '1754815652664', 'PRIYA', '9849668800', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754815593102\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 14:17:31', '2025-08-10 14:17:31', NULL),
(91, '1754815681565', 'SAI', '8688242413', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754815658070\"}]', 5996, 'completed', '63', 'Pos', '2025-08-10 14:17:59', '2025-08-10 14:17:59', NULL),
(92, '1754816152801', 'SARAT CHANDRA', '9493256265', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754816106743\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754816108135\"}]', 9992, 'completed', '63', 'Pos', '2025-08-10 14:25:51', '2025-08-10 14:25:51', NULL),
(93, '1754816187851', 'SAILAJA', '8008268883', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":5,\"type\":\"product\",\"id\":\"1754816162271\"}]', 7495, 'completed', '63', 'Pos', '2025-08-10 14:26:26', '2025-08-10 14:26:26', NULL),
(94, '1754816236867', 'RAJ KIRAN', '9963888661', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754816202671\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754816203551\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754816205447\"}]', 4788, 'completed', '63', 'Pos', '2025-08-10 14:27:15', '2025-08-10 14:27:15', NULL),
(95, '1754816299069', 'VINOD', '8978001654', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754816245743\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 14:28:17', '2025-08-10 14:28:17', NULL),
(96, '1754816325765', 'TASHVI', '6300243260', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754816306751\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 14:28:44', '2025-08-10 14:28:44', NULL),
(97, '1754816419171', 'SHREOSHI', '8639967608', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754816375607\"}]', 1197, 'completed', '63', 'Pos', '2025-08-10 14:30:17', '2025-08-10 14:30:17', NULL),
(98, '1754824394237', 'VAISHNAEI', '8074988847', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754824362270\"}]', 798, 'completed', '63', 'Pos', '2025-08-10 16:43:12', '2025-08-10 16:43:12', NULL),
(99, '1754824433015', 'FATIMA', '9970728142', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754824403526\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 16:43:51', '2025-08-10 16:43:51', NULL),
(100, '1754824585337', 'AMUIYA', '8411929233', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":12,\"type\":\"product\",\"id\":\"1754824462206\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":14,\"type\":\"product\",\"id\":\"1754824469638\"}]', 31975, 'completed', '63', 'Pos', '2025-08-10 16:46:23', '2025-08-10 16:46:23', NULL),
(101, '1754824610756', 'PAVANI', '9703963049', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754824591942\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 16:46:49', '2025-08-10 16:46:49', NULL),
(102, '1754824646594', 'JAGDISH', '9652662212', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754824618822\"}]', 3996, 'completed', '63', 'Pos', '2025-08-10 16:47:24', '2025-08-10 16:47:24', NULL),
(103, '1754824673188', 'MOBIN', '7702050426', '[{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754824655422\"}]', 798, 'completed', '63', 'Pos', '2025-08-10 16:47:51', '2025-08-10 16:47:51', NULL),
(104, '1754824753738', 'MUSAB', '8886364361', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":8,\"type\":\"game\",\"id\":\"1754824692158\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":7,\"type\":\"game\",\"id\":\"1754824701438\"}]', 5985, 'completed', '63', 'Pos', '2025-08-10 16:49:12', '2025-08-10 16:49:12', NULL),
(105, '1754824989790', 'PAVANI', '9703963049', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754824961022\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 16:53:08', '2025-08-10 16:53:08', NULL),
(106, '1754825015797', 'TUSHAR', '8850536438', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754824998038\"}]', 2997, 'completed', '63', 'Pos', '2025-08-10 16:53:34', '2025-08-10 16:53:34', NULL),
(107, '1754825047525', 'ARUNA', '8919781513', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754825023022\"}]', 5996, 'completed', '63', 'Pos', '2025-08-10 16:54:05', '2025-08-10 16:54:05', NULL),
(108, '1754825129975', 'JATIN', '9949993668', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754825102190\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754825103502\"},{\"gameId\":2,\"name\":\"CLIMB\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754825106158\"}]', 3591, 'completed', '63', 'Pos', '2025-08-10 16:55:28', '2025-08-10 16:55:28', NULL),
(109, '1754825162225', 'SATYA', '8885401111', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":6,\"type\":\"product\",\"id\":\"1754825142094\"}]', 5994, 'completed', '63', 'Pos', '2025-08-10 16:56:00', '2025-08-10 16:56:00', NULL),
(110, '1754830038492', 'SHRUTI', '9640362222', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754830013043\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754830016595\"}]', 2498, 'completed', '63', 'Pos', '2025-08-10 18:17:16', '2025-08-10 18:17:16', NULL),
(111, '1754830086128', 'AMRUTHA', '9502366643', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754830047322\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754830049962\"}]', 4996, 'completed', '63', 'Pos', '2025-08-10 18:18:04', '2025-08-10 18:18:04', NULL),
(112, '1754830117807', 'PRANEETH', '9676890791', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754830093714\"}]', 3996, 'completed', '63', 'Pos', '2025-08-10 18:18:36', '2025-08-10 18:18:36', NULL),
(113, '1754830161845', 'GRINISHA', '7799005858', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754830134954\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 18:19:20', '2025-08-10 18:19:20', NULL),
(114, '1754831563232', 'SWETHA', '9394504026', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":12,\"type\":\"product\",\"id\":\"1754831517108\"},{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754831524324\"}]', 19987, 'completed', '63', 'Pos', '2025-08-10 18:42:41', '2025-08-10 18:42:41', NULL),
(115, '1754831605050', 'SRIYA', '9573565598', '[{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":5,\"type\":\"game\",\"id\":\"1754831575084\"}]', 1995, 'completed', '63', 'Pos', '2025-08-10 18:43:23', '2025-08-10 18:43:23', NULL),
(116, '1754831731201', 'PANKAJ', '9916707555', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":8,\"type\":\"product\",\"id\":\"1754831614228\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754831704208\"}]', 8391, 'completed', '63', 'Pos', '2025-08-10 18:45:29', '2025-08-10 18:45:29', NULL),
(117, '1754831803318', 'RIYANSHIKA', '8019474247', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754831774116\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 18:46:41', '2025-08-10 18:46:41', NULL),
(118, '1754831829018', 'KARTHIK', '9581022244', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754831810644\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 18:47:07', '2025-08-10 18:47:07', NULL),
(119, '1754831864217', 'TAMAI', '8978909639', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754831834884\"}]', 1998, 'completed', '63', 'Pos', '2025-08-10 18:47:42', '2025-08-10 18:47:42', NULL),
(120, '1754831923418', 'KALA', '9960827383', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831879916\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831882100\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831888940\"}]', 4788, 'completed', '63', 'Pos', '2025-08-10 18:48:41', '2025-08-10 18:48:41', NULL),
(121, '1754832012483', 'ALEKHIA', '8886189691', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831973276\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831979004\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831983540\"},{\"gameId\":2,\"name\":\"CLIMB\",\"price\":\"338.14\",\"quantity\":4,\"type\":\"game\",\"id\":\"1754831985372\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754831991172\"}]', 7182, 'completed', '63', 'Pos', '2025-08-10 18:50:10', '2025-08-10 18:50:10', NULL),
(122, '1754832038384', 'KISHOR', '7569495251', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1754832017644\"}]', 3996, 'completed', '63', 'Pos', '2025-08-10 18:50:36', '2025-08-10 18:50:36', NULL),
(123, '1754832083021', 'SURESH', '8050512594', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832059092\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832061228\"}]', 2394, 'completed', '63', 'Pos', '2025-08-10 18:51:21', '2025-08-10 18:51:21', NULL),
(124, '1754832309153', 'PRIYANKA', '9177977821', '[{\"gameId\":7,\"name\":\"All 5 Rooms\",\"price\":\"1399.00\",\"quantity\":15,\"type\":\"game\",\"id\":\"1754832240724\"},{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754832278996\"}]', 25161, 'completed', '63', 'Pos', '2025-08-10 18:55:07', '2025-08-10 18:55:07', NULL),
(125, '1754832359969', 'VARSHA', '9959372699', '[{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832316100\"},{\"gameId\":2,\"name\":\"CLIMB\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832320660\"},{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832335468\"}]', 3591, 'completed', '63', 'Pos', '2025-08-10 18:55:58', '2025-08-10 18:55:58', NULL),
(126, '1754832486221', 'ANUSHA', '7702023457', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":18,\"type\":\"product\",\"id\":\"1754832415092\"},{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754832458668\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754832460060\"}]', 28580, 'completed', '63', 'Pos', '2025-08-10 18:58:04', '2025-08-10 18:58:04', NULL),
(127, '1754832597088', 'BHARATH', '9603575757', '[{\"productId\":4,\"name\":\"All 5 Rooms\",\"price\":\"1185.61\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754832566668\"}]', 2798, 'completed', '63', 'Pos', '2025-08-10 18:59:55', '2025-08-10 18:59:55', NULL),
(128, '1754832634989', 'NIMISH', '8790435624', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754832603572\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 19:00:33', '2025-08-10 19:00:33', NULL),
(129, '1754832668858', 'TEJASWI', '9642000558', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":7,\"type\":\"product\",\"id\":\"1754832643021\"}]', 6993, 'completed', '63', 'Pos', '2025-08-10 19:01:07', '2025-08-10 19:01:07', NULL),
(130, '1754832708789', 'SUDHEER', '8897253558', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832681053\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832682829\"}]', 2394, 'completed', '63', 'Pos', '2025-08-10 19:01:47', '2025-08-10 19:01:47', NULL),
(131, '1754832761540', 'PRABHA', '8074967768', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":5,\"type\":\"product\",\"id\":\"1754832721541\"}]', 7495, 'completed', '63', 'Pos', '2025-08-10 19:02:39', '2025-08-10 19:02:39', NULL),
(132, '1754832791890', 'SRIMAN', '9849902727', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":6,\"type\":\"game\",\"id\":\"1754832769205\"}]', 2394, 'completed', '63', 'Pos', '2025-08-10 19:03:10', '2025-08-10 19:03:10', NULL),
(133, '1754832823213', 'BINDI', '9381266332', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":5,\"type\":\"product\",\"id\":\"1754832800293\"}]', 7495, 'completed', '63', 'Pos', '2025-08-10 19:03:41', '2025-08-10 19:03:41', NULL),
(134, '1754832855255', 'KARTIK', '7904530064', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832832573\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832835789\"}]', 2394, 'completed', '63', 'Pos', '2025-08-10 19:04:13', '2025-08-10 19:04:13', NULL),
(135, '1754832881990', 'SMRITH', '9550373954', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754832862717\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 19:04:40', '2025-08-10 19:04:40', NULL),
(136, '1754832918224', 'VARSHITHA', '8328489544', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754832891549\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 19:05:16', '2025-08-10 19:05:16', NULL),
(137, '1754832984557', 'SAHASRA', '9849000563', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832930765\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832932381\"},{\"gameId\":5,\"name\":\"Maze\",\"price\":\"338.14\",\"quantity\":3,\"type\":\"game\",\"id\":\"1754832937077\"}]', 3591, 'completed', '63', 'Pos', '2025-08-10 19:06:22', '2025-08-10 19:06:22', NULL),
(138, '1754833015056', 'RIYA', '9849471429', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754832991005\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 19:06:53', '2025-08-10 19:06:53', NULL),
(139, '1754833044941', 'SRIYANSHI', '9182780938', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754833022101\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 19:07:23', '2025-08-10 19:07:23', NULL),
(140, '1754833072391', 'ARIYAN', '8985915322', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754833052149\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 19:07:50', '2025-08-10 19:07:50', NULL),
(141, '1754833419524', 'MAYANK', '9246881181', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":6,\"type\":\"product\",\"id\":\"1754833386541\"}]', 8995, 'completed', '63', 'Pos', '2025-08-10 19:13:37', '2025-08-10 19:13:37', NULL),
(142, '1754833445954', 'PRATHEEK', '9949354944', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754833426221\"}]', 999, 'completed', '63', 'Pos', '2025-08-10 19:14:04', '2025-08-10 19:14:04', NULL),
(143, '1754833472327', 'AJAY', '9849659592', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754833453645\"}]', 798, 'completed', '63', 'Pos', '2025-08-10 19:14:30', '2025-08-10 19:14:30', NULL),
(144, '1754833501477', 'MANVITA', '9440486938', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":1,\"type\":\"product\",\"id\":\"1754833482957\"}]', 1499, 'completed', '63', 'Pos', '2025-08-10 19:14:59', '2025-08-10 19:14:59', NULL),
(145, '1754833531182', 'NAVADEEP', '6305318535', '[{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1754833510349\"}]', 798, 'completed', '63', 'Pos', '2025-08-10 19:15:29', '2025-08-10 19:15:29', NULL),
(146, '1754833560310', 'GOUTHAMI', '7093517364', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754833538237\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 19:15:58', '2025-08-10 19:15:58', NULL),
(147, '1754833586710', 'I VARNIKA', '9032945555', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1754833567357\"}]', 399, 'completed', '63', 'Pos', '2025-08-10 19:16:24', '2025-08-10 19:16:24', NULL),
(148, '1754833634998', 'SWATHI', '9246151351', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754833594701\"}]', 2998, 'completed', '63', 'Pos', '2025-08-10 19:17:13', '2025-08-10 19:17:13', NULL),
(149, '1754833661461', 'PAYAL', '9556995905', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1754833641829\"}]', 1998, 'completed', '63', 'Pos', '2025-08-10 19:17:39', '2025-08-10 19:17:39', NULL),
(150, '1754833684611', 'SHIVA', '9000001929', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":3,\"type\":\"product\",\"id\":\"1754833668285\"}]', 4497, 'completed', '63', 'Pos', '2025-08-10 19:18:02', '2025-08-10 19:18:02', NULL),
(151, '1755090163068', 'ANKIT', '7620131025', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1755090135445\"}]', 1998, 'completed', '63', 'Pos', '2025-08-13 18:32:42', '2025-08-13 18:32:42', NULL),
(152, '1755090420589', 'RAMIYA', '9515768210', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":4,\"type\":\"product\",\"id\":\"1755090167453\"}]', 3996, 'completed', '63', 'Pos', '2025-08-13 18:37:00', '2025-08-13 18:37:00', NULL),
(153, '1755090447390', 'MEGHNA', '7702504704', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":2,\"type\":\"product\",\"id\":\"1755090427444\"}]', 2998, 'completed', '63', 'Pos', '2025-08-13 18:37:26', '2025-08-13 18:37:26', NULL),
(154, '1755090475772', 'MOHON SANTOSH', '9550123971', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":2,\"type\":\"product\",\"id\":\"1755090454060\"}]', 1998, 'completed', '63', 'Pos', '2025-08-13 18:37:55', '2025-08-13 18:37:55', NULL),
(155, '1755090502469', 'NAVADEEP', '6305318535', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1755090484845\"}]', 399, 'completed', '63', 'Pos', '2025-08-13 18:38:22', '2025-08-13 18:38:22', NULL),
(156, '1755090516293', 'NAVADEEP', '6305318535', '[{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1755090509268\"}]', 399, 'completed', '63', 'Pos', '2025-08-13 18:38:35', '2025-08-13 18:38:35', NULL),
(157, '1755090541055', 'NAVADEEP', '6305318535', '[{\"gameId\":3,\"name\":\"ARENA\",\"price\":\"338.14\",\"quantity\":2,\"type\":\"game\",\"id\":\"1755090533988\"}]', 798, 'completed', '63', 'Pos', '2025-08-13 18:39:00', '2025-08-13 18:39:00', NULL),
(158, '1755090567703', 'RABHYA', '9000169113', '[{\"productId\":5,\"name\":\"Any 3 Rooms\",\"price\":\"846.62\",\"quantity\":3,\"type\":\"product\",\"id\":\"1755090547596\"}]', 2997, 'completed', '63', 'Pos', '2025-08-13 18:39:27', '2025-08-13 18:39:27', NULL),
(159, '1755092563027', 'KIARA', '6309291050', '[{\"productId\":9,\"name\":\"Neon Splatter Zone\",\"price\":\"1270.42\",\"quantity\":4,\"type\":\"product\",\"id\":\"1755092473972\"},{\"gameId\":8,\"name\":\"Any 3 Rooms\",\"price\":\"999.00\",\"quantity\":3,\"type\":\"game\",\"id\":\"1755092485508\"},{\"gameId\":6,\"name\":\"Mega Grid\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1755092499116\"},{\"gameId\":4,\"name\":\"Push\",\"price\":\"338.14\",\"quantity\":1,\"type\":\"game\",\"id\":\"1755092505180\"}]', 10331, 'completed', '63', 'Pos', '2025-08-13 19:12:42', '2025-08-13 19:12:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` date NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_proof` tinyint(1) NOT NULL,
  `payment_file` text DEFAULT NULL,
  `amount` float(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `updated_by` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `project_id`, `payment_date`, `payment_mode`, `payment_proof`, `payment_file`, `amount`, `created_at`, `updated_at`, `updated_by`) VALUES
(27, 46, '2025-06-29', 'Bank Transfer', 1, 'payments/zpxLlZB8Ey0ODzNIrbJqkPx1J6UqOTbr08N08xu8.pdf', 2000.00, '2025-06-29 22:49:28', '2025-06-29 22:49:28', 59);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `branch_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`branch_ids`)),
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand_id`, `category_id`, `branch_ids`, `stock`, `price`, `offer_price`, `final_price`, `discount_percent`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Mango', 5, 6, '[\"4\"]', 122, 123.00, 11.00, 11.00, 91.06, 'products/5oTeaKuDF0Ed2nefuxdiK9t4hihtEgmHrY7vLdFD.jpg', '2025-08-28 11:29:43', '2025-08-30 15:20:11'),
(4, 'Banan', 4, 7, '[\"4\"]', 20, 50.00, NULL, 50.00, 0.00, 'products/SvQnoJkufVwZ6l9uQ0DYi0UsGMZ2TYkgVK7upjHI.jpg', '2025-08-30 15:05:44', '2025-08-30 15:19:55'),
(5, 'Apple', 4, 7, '[\"4\"]', 50, 300.00, NULL, 300.00, 0.00, 'products/b4AQup2YpaBBce9o9WTEC69hZufToxN1gU7EHJK4.jpg', '2025-08-30 15:21:45', '2025-08-30 15:21:45');

-- --------------------------------------------------------

--
-- Table structure for table `producttypecategories`
--

CREATE TABLE `producttypecategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `producttypes_id` bigint(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `saas_id` varchar(200) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producttypecategories`
--

INSERT INTO `producttypecategories` (`id`, `producttypes_id`, `name`, `saas_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 1, 'Plat', 'Sample123', 'active', '2025-05-17 16:23:57', NULL, NULL),
(4, 1, 'Full', 'Sample123', 'active', '2025-05-17 16:23:57', NULL, NULL),
(5, 2, 'grams', 'Sample123', 'active', '2025-05-17 16:24:24', NULL, NULL),
(6, 2, 'kgs', 'Sample123', 'active', '2025-05-17 16:24:24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `producttypes`
--

CREATE TABLE `producttypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(200) NOT NULL,
  `saas_id` varchar(200) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producttypes`
--

INSERT INTO `producttypes` (`id`, `Name`, `saas_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Food', 'Sample123', 'active', '2025-05-17 16:23:01', NULL, NULL),
(2, 'Vegetable\r\n', 'Sample123', 'active', '2025-05-17 16:23:14', NULL, NULL),
(3, 'Meat', 'Sample123', 'active', '2025-05-17 16:23:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customerId` bigint(20) UNSIGNED NOT NULL,
  `projectTitle` varchar(255) NOT NULL,
  `services` text NOT NULL,
  `totalPrice` decimal(10,2) NOT NULL,
  `orderSource` varchar(200) NOT NULL,
  `salesAgent` text NOT NULL,
  `domainName` text NOT NULL,
  `domainOwnership` varchar(200) NOT NULL,
  `hostingType` varchar(200) NOT NULL,
  `hasLogo` enum('Yes','No') NOT NULL,
  `logoType` varchar(200) DEFAULT NULL,
  `logoCost` decimal(10,2) DEFAULT NULL,
  `contactDetails` text NOT NULL,
  `deadline` datetime NOT NULL,
  `assignedTo` text NOT NULL,
  `attachments` text NOT NULL,
  `notes` text NOT NULL,
  `advancePaid` decimal(10,2) DEFAULT NULL,
  `balanceRemaining` decimal(10,2) DEFAULT NULL,
  `paymentMode` text DEFAULT NULL,
  `paymentScreenshot` text DEFAULT NULL,
  `saas_id` varchar(200) NOT NULL,
  `currentStage` varchar(200) DEFAULT 'domain',
  `domain` enum('Pending','Booked') NOT NULL DEFAULT 'Pending',
  `hosting` enum('Pending','Assigned') NOT NULL DEFAULT 'Pending',
  `design` enum('Not Started','In Progress','Client Changes','Done') NOT NULL DEFAULT 'Not Started',
  `madeLive` enum('No','Yes') NOT NULL DEFAULT 'No',
  `balanceAsked` enum('No','Yes') DEFAULT 'No',
  `progress` int(10) NOT NULL DEFAULT 10,
  `overAllProgress` int(10) NOT NULL DEFAULT 92,
  `status` varchar(255) DEFAULT 'In Progress',
  `doc_type` varchar(255) DEFAULT NULL,
  `doc_status` varchar(255) DEFAULT NULL,
  `sent_on` date DEFAULT NULL,
  `received_on` date DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `doc_notes` text DEFAULT NULL,
  `hasGST` tinyint(1) NOT NULL DEFAULT 0,
  `Price` float(10,2) NOT NULL DEFAULT 0.00,
  `gstPercent` float(10,2) DEFAULT 0.00,
  `gstNumber` text DEFAULT NULL,
  `gstAmount` float(10,2) DEFAULT NULL,
  `grandTotal` float(10,2) DEFAULT NULL,
  `invoiceStatus` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `customerId`, `projectTitle`, `services`, `totalPrice`, `orderSource`, `salesAgent`, `domainName`, `domainOwnership`, `hostingType`, `hasLogo`, `logoType`, `logoCost`, `contactDetails`, `deadline`, `assignedTo`, `attachments`, `notes`, `advancePaid`, `balanceRemaining`, `paymentMode`, `paymentScreenshot`, `saas_id`, `currentStage`, `domain`, `hosting`, `design`, `madeLive`, `balanceAsked`, `progress`, `overAllProgress`, `status`, `doc_type`, `doc_status`, `sent_on`, `received_on`, `file_name`, `file_size`, `doc_notes`, `hasGST`, `Price`, `gstPercent`, `gstNumber`, `gstAmount`, `grandTotal`, `invoiceStatus`, `created_at`, `updated_at`, `deleted_at`) VALUES
(46, 22, 'Sample', '\"[\\\"Website Design\\\",\\\"SEO\\\",\\\"E-commerce\\\",\\\"Branding\\\"]\"', 74750.00, 'Referral', 'Manish', 'sdsad', 'client', 'client', 'Yes', 'free', NULL, '9440161007', '2025-06-15 00:00:00', '\"[\\\"Manish\\\"]\"', '\"[]\"', 'dfsdfd', NULL, 67750.00, NULL, '[]', 'admin', 'domain', 'Pending', 'Pending', 'Not Started', 'No', 'No', 10, 92, 'In Progress', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 65000.00, 15.00, NULL, 9750.00, 74750.00, 1, '2025-06-29 18:31:04', '2025-06-29 22:49:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_documents`
--

CREATE TABLE `project_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `doc_type` varchar(50) NOT NULL COMMENT 'e.g. engagementForm, acceptanceForm',
  `doc_name` varchar(255) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `sent_on` date NOT NULL,
  `received_on` date DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_documents`
--

INSERT INTO `project_documents` (`id`, `project_id`, `doc_type`, `doc_name`, `status`, `sent_on`, `received_on`, `file_name`, `file_size`, `notes`, `created_at`, `updated_at`) VALUES
(8, 23, 'Engagement Form', 'Engagement Form With Signature', 'sent', '2025-06-10', NULL, '/storage/documents/1749474722_MenteeWaiser.pdf', '432988', NULL, '2025-06-09 13:12:02', '2025-06-10 06:18:50'),
(9, 23, 'Engagement Form', 'Engagement Form With Signature', 'sent', '2025-06-09', NULL, '/storage/documents/1749476201_Merchant Copy V2 Rewards Marketplace API (1) (4) (1).pdf', '638293', NULL, '2025-06-09 13:36:41', '2025-06-10 06:18:55'),
(10, 23, 'Engagement Form', 'Engagement Form With Changes', 'sent', '2025-06-10', NULL, '/storage/documents/1749476233_ESG Repoter.pdf', '427065', NULL, '2025-06-09 13:37:13', '2025-06-09 14:04:44'),
(11, 23, 'Acceptance Form', 'Acceptance Form With Signature', 'sent', '2025-06-11', NULL, '/storage/documents/1749477828__Appointment letter.docx (4).pdf', '396022', NULL, '2025-06-09 14:03:48', '2025-06-09 14:03:48'),
(13, 23, 'Engagement Form', 'Engagement Form With Signature', 'sent', '2025-06-20', NULL, '/storage/documents/1749536296_Event & Ticket Purchase Design Requirements.pdf', '441352', NULL, '2025-06-10 06:18:17', '2025-06-10 06:18:17'),
(14, 23, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-10', NULL, '/storage/documents/1749544663_MenteeWaiser (1).pdf', '432988', NULL, '2025-06-10 08:37:43', '2025-06-10 08:37:43'),
(15, 23, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-10', NULL, '/storage/documents/1749544691_MenteeWaiser (1).pdf', '432988', NULL, '2025-06-10 08:38:11', '2025-06-10 08:38:11'),
(16, 23, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-10', NULL, '/storage/documents/1749544738_MenteeWaiser (1).pdf', '432988', NULL, '2025-06-10 08:38:58', '2025-06-10 08:38:58'),
(35, 28, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-18', NULL, '/storage/documents/1750230425_Tax Calculation System Overview.pdf', '280330', NULL, '2025-06-18 07:07:05', '2025-06-18 07:07:05'),
(37, 28, 'Acceptance Form', 'Acceptance Form With Changes', 'sent', '2025-06-18', NULL, '/storage/documents/1750230449_CA Accounting Software - System Flow Document.pdf', '583389', NULL, '2025-06-18 07:07:29', '2025-06-18 07:07:29'),
(38, 28, 'Acceptance Form', 'Acceptance Form With Changes', 'sent', '2025-06-18', NULL, '/storage/documents/1750230526_CA Accounting Software - System Flow Document.pdf', '583389', NULL, '2025-06-18 07:08:46', '2025-06-18 07:08:46'),
(40, 28, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-18', NULL, '/storage/documents/1750231253_CA Accounting Software - Dev Notes (1).pdf', '460565', NULL, '2025-06-18 07:20:53', '2025-06-18 07:20:53'),
(41, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231584_Project Proposal Pharmacy Management  Ordering Platform.pdf', '573265', NULL, '2025-06-18 07:26:24', '2025-06-18 07:26:24'),
(42, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231618_CA Accounting Software - Dev Notes.pdf', '460565', NULL, '2025-06-18 07:26:58', '2025-06-18 07:26:58'),
(43, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231643_MOM With NAMS (1).pdf', '438820', NULL, '2025-06-18 07:27:23', '2025-06-18 07:27:23'),
(44, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231704_Tax Calculation System Overview.pdf', '280330', NULL, '2025-06-18 07:28:24', '2025-06-18 07:28:24'),
(45, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231747_MOM With NAMS - 12-06-2025.pdf', '630477', NULL, '2025-06-18 07:29:07', '2025-06-18 07:29:07'),
(46, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231766_MOM With NAMS - 12-06-2025.pdf', '630477', NULL, '2025-06-18 07:29:26', '2025-06-18 07:29:26'),
(47, 28, 'General Documents', 'General Documents', 'sent', '2025-06-18', NULL, '/storage/documents/1750231869_CA Accounting Software - System Flow Document (1).pdf', '583389', NULL, '2025-06-18 07:31:09', '2025-06-18 07:31:09'),
(48, 30, 'Engagement Form', 'Engagement Form For Signature', 'sent', '2025-06-19', NULL, '/storage/documents/1750330965_1749477828__Appointment letter.docx (4).pdf', '396022', NULL, '2025-06-19 11:02:45', '2025-06-19 11:02:45'),
(49, 30, 'Acceptance Form', 'Acceptance Form With Signature', 'sent', '2025-06-20', NULL, '/storage/documents/1750417855_suggested changes (1).pdf', '108898', NULL, '2025-06-20 11:10:55', '2025-06-20 11:10:55'),
(50, 30, 'General Documents', 'General Documents', 'sent', '2025-06-20', NULL, '/storage/documents/1750417909_suggested changes (1).pdf', '108898', NULL, '2025-06-20 11:11:49', '2025-06-20 11:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `offer_price`, `final_price`, `discount_percent`, `duration`, `created_at`, `updated_at`) VALUES
(12, 'Head & Neck & Back shoulder', 'Eliminate the tension', 1499.00, NULL, 1499.00, 0.00, '30', '2025-09-23 15:47:47', '2025-09-23 15:47:47'),
(13, 'Head & Neck & Back shoulder', 'Eliminate the tension', 2499.00, NULL, 2499.00, 0.00, '60', '2025-09-23 15:53:40', '2025-09-23 15:53:40'),
(14, 'Foot Reflexology', 'Relaxing', 1499.00, NULL, 1499.00, 0.00, '30', '2025-09-23 15:54:35', '2025-09-23 15:54:35'),
(15, 'Foot Reflexology', 'Relaxing', 2499.00, NULL, 2499.00, 0.00, '60', '2025-09-23 15:55:04', '2025-09-23 15:55:04'),
(16, 'Replensing sugar scrub', 'Replensing sugar scrub', 1499.00, NULL, 1499.00, 0.00, '30', '2025-09-23 15:56:16', '2025-09-23 15:56:16'),
(17, 'Replensing sugar scrub', 'Replensing sugar scrub', 2499.00, NULL, 2499.00, 0.00, '60', '2025-09-23 15:56:26', '2025-09-23 15:56:26'),
(18, 'Repairing jojoba scrub', 'Repairing jojoba scrub', 1499.00, NULL, 1499.00, 0.00, '30', '2025-09-23 15:59:21', '2025-09-23 15:59:21'),
(19, 'Repairing jojoba scrub', 'Repairing jojoba scrub', 60.00, NULL, 60.00, 0.00, '1799', '2025-09-23 15:59:37', '2025-09-23 15:59:37'),
(20, 'Coffee bean scrub', 'Coffee bean scrub', 1499.00, NULL, 1499.00, 0.00, '30', '2025-09-23 15:59:59', '2025-09-23 15:59:59'),
(21, 'Coffee bean scrub', 'Coffee bean scrub', 1799.00, NULL, 1799.00, 0.00, '60', '2025-09-23 16:00:30', '2025-09-23 16:00:30'),
(22, 'Traditional Thai Massage', 'Traditional Thai Massage', 2499.00, NULL, 2499.00, 0.00, '60', '2025-09-23 16:01:08', '2025-09-23 16:01:08'),
(23, 'Traditional Thai Massage', 'Traditional Thai Massage', 3499.00, NULL, 3499.00, 0.00, '90', '2025-09-23 16:03:09', '2025-09-23 16:03:09'),
(24, 'Traditional Thai Massage', 'Traditional Thai Massage', 4499.00, NULL, 4499.00, 0.00, '120', '2025-09-23 16:04:46', '2025-09-23 16:04:46'),
(25, 'ODY Signature Delight', 'ODY Signature Delight', 3499.00, NULL, 3499.00, 0.00, '60', '2025-09-23 16:06:12', '2025-09-23 16:06:12'),
(26, 'ODY Signature Delight', 'ODY Signature Delight', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 14:50:38', '2025-09-24 14:50:38'),
(27, 'ODY Signature Delight', 'ODY Signature Delight', 6499.00, 6499.00, 6499.00, 0.00, '120', '2025-09-24 14:50:57', '2025-09-24 14:50:57'),
(28, 'Aroma Therapy Massage', 'Aroma Therapy Massage', 2699.00, 2699.00, 2699.00, 0.00, '60', '2025-09-24 14:51:50', '2025-09-24 14:51:50'),
(29, 'Aroma Therapy Massage', 'Aroma Therapy Massage', 3699.00, 3699.00, 3699.00, 0.00, '90', '2025-09-24 14:52:09', '2025-09-24 14:52:09'),
(30, 'Aroma Therapy Massage', 'Aroma Therapy Massage', 4699.00, 4699.00, 4699.00, 0.00, '120', '2025-09-24 14:52:30', '2025-09-24 14:52:30'),
(31, 'Swedish Massage', 'Swedish Massage', 2699.00, 2699.00, 2699.00, 0.00, '60', '2025-09-24 14:53:03', '2025-09-24 14:53:03'),
(32, 'Swedish Massage', 'Swedish Massage', 3699.00, 3699.00, 3699.00, 0.00, '90', '2025-09-24 18:10:17', '2025-09-24 18:10:17'),
(33, 'Swedish Massage', 'Swedish Massage', 4699.00, 4699.00, 4699.00, 0.00, '120', '2025-09-24 18:10:45', '2025-09-24 18:10:45'),
(34, 'Vitalizing Balinese Massage', 'Vitalizing Balinese Massage', 2699.00, 2699.00, 2699.00, 0.00, '60', '2025-09-24 18:12:00', '2025-09-24 18:12:00'),
(35, 'Vitalizing Balinese Massage', 'Vitalizing Balinese Massage', 3699.00, 3699.00, 3699.00, 0.00, '90', '2025-09-24 18:12:22', '2025-09-24 18:12:22'),
(36, 'Vitalizing Balinese Massage', 'Vitalizing Balinese Massage', 4699.00, 4699.00, 4699.00, 0.00, '120', '2025-09-24 18:13:10', '2025-09-24 18:13:10'),
(37, 'Vitalizing Pain relief Massage', 'Vitalizing Pain relief Massage', 2999.00, 2999.00, 2999.00, 0.00, '60', '2025-09-24 18:13:53', '2025-09-24 18:13:53'),
(38, 'Vitalizing Pain relief Massage', 'Vitalizing Pain relief Massage', 3999.00, 3999.00, 3999.00, 0.00, '90', '2025-09-24 18:14:21', '2025-09-24 18:14:21'),
(39, 'Vitalizing Pain relief Massage', 'Vitalizing Pain relief Massage', 4999.00, 4999.00, 4999.00, 0.00, '120', '2025-09-24 18:14:54', '2025-09-24 18:14:54'),
(40, 'Deep Tissue Massage', 'Deep Tissue Massage', 3499.00, 3499.00, 3499.00, 0.00, '60', '2025-09-24 18:15:37', '2025-09-24 18:15:37'),
(41, 'Deep Tissue Massage', 'Deep Tissue Massage', 4499.00, 4499.00, 4499.00, 0.00, '120', '2025-09-24 18:15:57', '2025-09-24 18:15:57'),
(42, 'Deep Tissue Massage', 'Deep Tissue Massage', 5499.00, 5499.00, 5499.00, 0.00, '120', '2025-09-24 18:16:21', '2025-09-24 18:16:21'),
(43, 'Shea Butter Massage', 'Shea Butter Massage', 3499.00, 3499.00, 3499.00, 0.00, '60', '2025-09-24 18:17:10', '2025-09-24 18:17:10'),
(44, 'Shea Butter Massage', 'Shea Butter Massage', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 18:17:34', '2025-09-24 18:17:34'),
(45, 'Shea Butter Massage', 'Shea Butter Massage', 5499.00, 5499.00, 5499.00, 0.00, '120', '2025-09-24 18:18:05', '2025-09-24 18:18:05'),
(46, 'Hydrating wrap', 'Hydrating wrap', 1799.00, 1799.00, 1799.00, 0.00, '30', '2025-09-24 18:18:52', '2025-09-24 18:18:52'),
(47, 'Hydrating wrap', 'Hydrating wrap', 2599.00, 2599.00, 2599.00, 0.00, '60', '2025-09-24 18:19:19', '2025-09-24 18:19:19'),
(48, 'Smoothing Detan wrap', 'Smoothing Detan wrap', 1499.00, 1499.00, 1499.00, 0.00, '30', '2025-09-24 18:20:07', '2025-09-24 18:20:07'),
(49, 'Smoothing Detan wrap', 'Smoothing Detan wrap', 2499.00, 2499.00, 2499.00, 0.00, '60', '2025-09-24 18:20:39', '2025-09-24 18:20:39'),
(50, 'Natural Fruit wrap', 'Natural Fruit wrap', 1499.00, 1499.00, 1499.00, 0.00, '30', '2025-09-24 18:21:11', '2025-09-24 18:21:11'),
(51, 'Natural Fruit wrap', 'Natural Fruit wrap', 2499.00, 2499.00, 2499.00, 0.00, '60', '2025-09-24 18:21:35', '2025-09-24 18:21:35'),
(52, 'White & Bright facial', 'White & Bright facial', 2999.00, 2999.00, 2999.00, 0.00, '60', '2025-09-24 18:22:23', '2025-09-24 18:22:23'),
(53, 'Anti Aging facial', 'Anti Aging facial', 2999.00, 2999.00, 2999.00, 0.00, '60', '2025-09-24 18:23:07', '2025-09-24 18:23:07'),
(54, 'Deep cleaning facial', 'Deep cleaning facial', 2499.00, 2499.00, 2499.00, 0.00, '45', '2025-09-24 18:23:31', '2025-09-24 18:23:31'),
(55, 'Chocolate massage', 'Chocolate massage', 3499.00, 3499.00, 3499.00, 0.00, '60', '2025-09-24 18:30:37', '2025-09-24 18:30:37'),
(56, 'Chocolate massage', 'Chocolate massage', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 18:32:19', '2025-09-24 18:32:19'),
(57, 'Chocolate massage', 'Chocolate massage', 5499.00, 5499.00, 5499.00, 0.00, '120', '2025-09-24 18:32:46', '2025-09-24 18:32:46'),
(58, 'Melting candle therapy', 'Melting candle therapy', 3499.00, 3499.00, 3499.00, 0.00, '60', '2025-09-24 18:35:30', '2025-09-24 18:35:30'),
(59, 'Melting candle therapy', 'Melting candle therapy', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 18:35:47', '2025-09-24 18:35:47'),
(60, 'Melting candle therapy', 'Melting candle therapy', 5499.00, 5499.00, 5499.00, 0.00, '120', '2025-09-24 18:36:11', '2025-09-24 18:36:11'),
(61, 'spearmint oil therapy', 'spearmint oil therapy', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 18:41:49', '2025-09-24 18:41:49'),
(62, 'spearmint oil therapy', 'spearmint oil therapy', 4499.00, 4499.00, 4499.00, 0.00, '90', '2025-09-24 18:42:23', '2025-09-24 18:42:23'),
(63, 'spearmint oil therapy', 'spearmint oil therapy', 5499.00, 5499.00, 5499.00, 0.00, '120', '2025-09-24 18:42:43', '2025-09-24 18:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL,
  `type` varchar(200) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0 COMMENT '0 means inactive; 1 means active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, '2 Step Verification', 1, '2025-04-26 04:27:22', NULL),
(2, 'Msg91', 1, '2025-04-26 07:32:04', NULL),
(3, 'Rozarpay', 1, '2025-04-26 09:06:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` bigint(20) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `refresh_token` varchar(200) DEFAULT NULL,
  `web_fcm_token` varchar(255) DEFAULT NULL,
  `device_fcm_token` varchar(255) DEFAULT NULL,
  `department` enum('SalesTeam','Customer','UI/UX','Wordpress','DigitalMarketing','FrontEnd','BackEnd','AppDevelopment','Cloud','Sales','HrAdmin','HrAccounts','Management') NOT NULL,
  `employeeId` varchar(255) DEFAULT NULL,
  `role` enum('admin','pos','manager','therapist') DEFAULT NULL,
  `documents` varchar(255) DEFAULT NULL,
  `joiningDate` datetime DEFAULT NULL,
  `shiftStart` time DEFAULT NULL,
  `shiftEnd` time DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `status` enum('Active','Resigned','On Leave') NOT NULL DEFAULT 'Active',
  `profile_pic` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `postalcode` int(15) DEFAULT NULL,
  `saas_id` varchar(200) DEFAULT 'admin',
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `email_otp` int(10) DEFAULT NULL,
  `expired_time` datetime DEFAULT NULL,
  `deleted_at` int(10) NOT NULL DEFAULT 0 COMMENT '0 means not deleted,1 means deleted\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contact`, `email_verified_at`, `password`, `remember_token`, `refresh_token`, `web_fcm_token`, `device_fcm_token`, `department`, `employeeId`, `role`, `documents`, `joiningDate`, `shiftStart`, `shiftEnd`, `notes`, `gender`, `status`, `profile_pic`, `state`, `city`, `country`, `postalcode`, `saas_id`, `branch_id`, `email_otp`, `expired_time`, `deleted_at`, `created_at`, `updated_at`) VALUES
(59, 'admin', 'admin@pos.com', 9440161007, NULL, '$2y$10$EuCgG/FHlhfCAzz14GLfgeTNqOX4wPoKd/q6DBMKr0tJ00Ti3bguG', NULL, 'b59bac6fc2b5c787bea2b6dfc2f149a98fa388d0aec63ba593f2384e567a1303', NULL, 'dfgkdfgjl', 'Management', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 0, NULL, NULL, 0, NULL, '2025-10-14 12:47:49'),
(92, 'Kiran', 'odyspa2025@gmail.com', 8919289295, NULL, '$2y$10$8aQoYM4ot5iCzfUDgy7H/.F6DlXurOnKXDrv/mYjAOINwkCPg85r2', NULL, 'cc168e6a55dc743381204d1df1640958debb83910b01bf8b8e627223dcf37718', NULL, NULL, 'SalesTeam', NULL, 'manager', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 14, NULL, NULL, 0, '2025-09-22 11:44:52', '2025-09-29 07:28:40'),
(93, 'Ramesh', 'odyspakokapet@gmail.com', 9515696776, NULL, '$2y$10$D0VT9tXai5B1rZNgMWhwye1CR6C/2idLNtCocGIUvUm0Cf8p7V1Kq', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'manager', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-24 14:38:53', '2025-09-24 14:40:03'),
(94, 'Gita', 'gita@gmail.com', 9515696776, NULL, '$2y$10$.9ktbIIo7b734VOuQUOmB.0ijjkNE4NNby9J3dSHDIY0K7704M5/u', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:14:20', '2025-09-26 18:14:20'),
(95, 'Glory', 'glory@gmail.com', 9515696776, NULL, '$2y$10$N3WORMNDdDkC8lom1d9sz.HEGwWdknUtQ28ScxYC0txPj1bfRsnq2', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:15:13', '2025-09-26 18:15:13'),
(96, 'Eliana', 'Eliana@gmail.com', 9515696776, NULL, '$2y$10$s2a17RKEfcgs6zqyZr7QsuA8axHzQ0I2DQzS0AU.Xqn1hVZlhasbC', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:15:57', '2025-09-26 18:15:57'),
(97, 'Mouni', 'mouni@gmail.com', 9515696776, NULL, '$2y$10$T6hiIpFCt4I0GBXlQmL7GOZXRRd62lRbEbw0iLDzUYm6V2CtZXIpa', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:16:33', '2025-09-26 18:16:33'),
(98, 'Nidhi', 'Nidhi@gmail.com', 9515696776, NULL, '$2y$10$eu.NnhnSZNwIyFzmSNSITua3m9HlHVMftngDum1Iir0Uqm6Y9DmmS', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:17:08', '2025-09-26 18:17:08'),
(99, 'sana', 'sana@gmail.com', 9515696776, NULL, '$2y$10$Ek/1KFClXcNCsjcDISB0BOGy8l3sbK1ciL4/4m3xkzDQH.FPm04Iy', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:17:41', '2025-09-26 18:17:41'),
(100, 'Ranjana', 'Ranjana@gmail.com', 9515696776, NULL, '$2y$10$ZCSr7AW4.FeNHVG.Xlov5.crl2ydobJPc/USk9By6ZOtIuGOoS5Z6', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-09-26 18:31:34', '2025-09-26 18:31:34'),
(101, 'Naina', 'Naina@gmail.com', 9515696776, NULL, '$2y$10$Qphba78HbMaopHUhVW1S1ecY6/RlZQXwnZszRcQ976WE2qZjNVP3q', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-26 18:33:01', '2025-09-26 18:33:01'),
(102, 'Rosy', 'Rosy@gmail.com', 9515696776, NULL, '$2y$10$csc3HqwKP.U/4E6zk1C7buA24s2ZiOqelncWME3vjldV58XtS6SLC', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-26 18:33:26', '2025-09-26 18:33:26'),
(103, 'Mercy', 'Mercy@gmail.com', 9515696776, NULL, '$2y$10$dsUmnF8iy4DfsiUOnvSml.Ri4ydW0XSbzlnoS8mrhLllWLRCJyKQ.', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-26 18:34:00', '2025-09-26 18:34:00'),
(104, 'Riya', 'Riya@gmail.com', 9515696776, NULL, '$2y$10$qF.OqhIO7APec.AkDgqTUOksPaB4zCvkvW./1mTnZNQbZvv6ta0ii', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-26 18:34:25', '2025-09-26 18:34:25'),
(105, 'Sruthi', 'Sruthi@gmail.com', 9515696776, NULL, '$2y$10$z1cSGAF9bFYtzfu51FyLA.SHwcGFUAhT5msu4p.TuJnnaXtBYlKGS', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-09-26 18:34:47', '2025-09-26 18:34:47'),
(106, 'aa', 'aa@gmail.com', 1234567890, NULL, '$2y$10$C7542yZroeatMBwg1hqMV.WwkhWuCXnkQgUc6rhoejGOG9cKMmQ7.', NULL, '44c04a4b2f5e74aa0573bdf7e7e917b59004eb97ea9b27cfc66b7dd513890666', NULL, NULL, 'SalesTeam', NULL, 'manager', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-09-29 07:30:39', '2025-10-17 12:25:44'),
(107, 'sdsd', 'aaaaa@gmail.com', 9988776655, NULL, '$2y$10$HxojycH1uwNONZtgP990v.NHd3tVbakdpOU1yxbWkprQNwXwVegV.', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 16, NULL, NULL, 0, '2025-10-14 05:43:30', '2025-10-14 05:43:30'),
(108, 'Rani', 'rani@gmail.com', 9966554433, NULL, '$2y$10$K16.W7ppeXHztILw/p/vg.Vq5XkxbXJLEomZVVC7M8mScddFNYJ5a', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-10-14 05:51:54', '2025-10-14 05:51:54'),
(109, 'cddss', 'eee@gmail.com', 1234567890, NULL, '$2y$10$JKGJCPIBrUKGU0oyhfpDrepWyICWSRov8lcPP0ugwPLsUZkmlJsG2', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'manager', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-10-14 06:17:59', '2025-10-14 06:17:59'),
(110, 'kalyani', 'kalyani@gmail.com', 9988776656, NULL, '$2y$10$sB1zWQFx8RkwDUZZIcT6xufQ9O7ZkAHQs4GgW.EXTo6j2JNdhOgVC', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-10-14 08:59:51', '2025-10-14 08:59:51'),
(111, 'ihfdjkbk', 'nfkndfn@gmail.com', 9876543211, NULL, '$2y$10$namKHd4MDAj2SNQl/0jF7u0SBUkXAaoONoFxEUr32x/joaZdUaNfG', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'pos', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-10-14 09:40:40', '2025-10-14 11:05:46'),
(112, 'bfbhfsb', 'bjhfbhvv@gmail.com', 1237894561, NULL, '$2y$10$ZO35zPKtdkWu0PyrYb73s.4fsbp4GbDyW71Rot3VTo59TFER022t.', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'pos', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 19, NULL, NULL, 0, '2025-10-14 09:47:16', '2025-10-14 11:06:31'),
(113, 'sdsad', 'dssds@gmail.com', 10099887766, NULL, '$2y$10$Ai0tXQtArb7i9UxKKe8Ho.nkex.aNso7aOQQYRnArcjOeBLE0Bc2i', NULL, NULL, NULL, NULL, 'SalesTeam', NULL, 'therapist', NULL, NULL, NULL, NULL, NULL, NULL, 'Active', NULL, NULL, NULL, NULL, NULL, 'admin', 17, NULL, NULL, 0, '2025-10-14 11:06:46', '2025-10-14 11:06:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calenders`
--
ALTER TABLE `calenders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_ibfk_1` (`customer_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membershipspurchase`
--
ALTER TABLE `membershipspurchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `msg91s`
--
ALTER TABLE `msg91s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producttypecategories`
--
ALTER TABLE `producttypecategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producttypes_id` (`producttypes_id`);

--
-- Indexes for table `producttypes`
--
ALTER TABLE `producttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_documents`
--
ALTER TABLE `project_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_project_id` (`project_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `calenders`
--
ALTER TABLE `calenders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `combos`
--
ALTER TABLE `combos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `membershipspurchase`
--
ALTER TABLE `membershipspurchase`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `msg91s`
--
ALTER TABLE `msg91s`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `producttypecategories`
--
ALTER TABLE `producttypecategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `producttypes`
--
ALTER TABLE `producttypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `project_documents`
--
ALTER TABLE `project_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producttypecategories`
--
ALTER TABLE `producttypecategories`
  ADD CONSTRAINT `producttypecategories_ibfk_1` FOREIGN KEY (`producttypes_id`) REFERENCES `producttypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
