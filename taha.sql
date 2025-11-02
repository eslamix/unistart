-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2025 at 09:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taha`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_admin`
--

CREATE TABLE `oc_t_admin` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT 0,
  `s_moderator_access` varchar(1000) DEFAULT NULL,
  `i_login_fails` int(3) DEFAULT 0,
  `dt_login_fail_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`, `s_moderator_access`, `i_login_fails`, `dt_login_fail_date`) VALUES
(1, 'Administrator', 'admin', '$2y$15$3MRK6DnuNMxRiU0p6YCivegQgA6ytFX06aWPeNXyqUyoAYyDAtzEe', 'eslamweso123@gmail.com', 'EdmFhi2t', 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts`
--

CREATE TABLE `oc_t_alerts` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) DEFAULT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `s_search` text DEFAULT NULL,
  `s_param` varchar(1000) DEFAULT NULL,
  `s_sql` varchar(1000) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `i_num_trigger` int(10) DEFAULT 0,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_alerts_sent`
--

CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_ban_rule`
--

CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(1000) NOT NULL DEFAULT '',
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT '',
  `i_hit` int(10) DEFAULT 1,
  `dt_date` datetime DEFAULT current_timestamp(),
  `dt_expire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category`
--

CREATE TABLE `oc_t_category` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `i_expiration_days` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `i_position` int(2) UNSIGNED NOT NULL DEFAULT 0,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `s_icon` varchar(250) DEFAULT NULL,
  `s_color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_category`
--

INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`, `s_color`) VALUES
(96, NULL, 0, 1, 1, 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWBOtJCKtKB7Ado1XrPiJ3bBV9kcNSFBEZgA&amp;s', ''),
(97, NULL, 0, 2, 1, 1, 'https://www.wzzaif.com/wp-content/uploads/2024/02/20240225_122628_0000-1.jpg', ''),
(98, NULL, 0, 3, 1, 1, 'https://upload.wikimedia.org/wikipedia/ar/archive/5/5e/20231126101510%21%D8%B4%D8%B9%D8%A7%D8%B1_%D8%AC%D8%A7%D9%85%D8%B9%D8%A9_%D8%A7%D9%84%D9%85%D9%86%D8%B5%D9%88%D8%B1%D8%A9.png', ''),
(99, NULL, 0, 0, 1, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPexnp__kxYwObIwrPlJUGiJ9BTq5l316E5A&amp;s', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_description`
--

CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text DEFAULT NULL,
  `s_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_category_description`
--

INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
(96, 'ar_SY', 'جامعة القاهرة', '', '%d8%ac%d8%a7%d9%85%d8%b9%d8%a9-%d8%a7%d9%84%d9%82%d8%a7%d9%87%d8%b1%d8%a9'),
(97, 'ar_SY', 'جامعة الإسكندرية', '', '%d8%ac%d8%a7%d9%85%d8%b9%d8%a9-%d8%a7%d9%84%d8%a5%d8%b3%d9%83%d9%86%d8%af%d8%b1%d9%8a%d8%a9'),
(98, 'ar_SY', 'جامعة المنصورة', '', '%d8%ac%d8%a7%d9%85%d8%b9%d8%a9-%d8%a7%d9%84%d9%85%d9%86%d8%b5%d9%88%d8%b1%d8%a9'),
(99, 'ar_SY', 'حامعة عين شمس', '', '%d8%ad%d8%a7%d9%85%d8%b9%d8%a9-%d8%b9%d9%8a%d9%86-%d8%b4%d9%85%d8%b3');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_category_stats`
--

CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(96, 6),
(97, 2),
(98, 1),
(99, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city`
--

CREATE TABLE `oc_t_city` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_name_native` varchar(60) DEFAULT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT 1,
  `d_coord_lat` decimal(20,10) DEFAULT NULL,
  `d_coord_long` decimal(20,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_area`
--

CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_name_native` varchar(60) DEFAULT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT 1,
  `d_coord_lat` decimal(20,10) DEFAULT NULL,
  `d_coord_long` decimal(20,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_city_stats`
--

CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country`
--

CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_name_native` varchar(80) DEFAULT NULL,
  `s_phone_code` varchar(900) DEFAULT NULL,
  `s_currency` varchar(10) DEFAULT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_name_native`, `s_phone_code`, `s_currency`, `s_slug`) VALUES
('EN', 'هندسي', NULL, 'https://cdn-icons-png.flaticon.com/512/6511/6511590.png', '', '%d9%87%d9%86%d8%af%d8%b3%d9%8a'),
('MD', 'طبي', NULL, 'https://cdn-icons-png.flaticon.com/512/4434/4434478.png', '', '%d8%b7%d8%a8%d9%8a'),
('TC', 'تكنولوجي', NULL, 'https://marketplace.canva.com/Uvzlk/MAGyUpUvzlk/1/tl/canva-computer-chip%2C-ai-software-technology-icon-MAGyUpUvzlk.png', '', '%d8%aa%d9%83%d9%86%d9%88%d9%84%d9%88%d8%ac%d9%8a'),
('TG', 'تجاري', NULL, 'https://cdn-icons-png.flaticon.com/512/9503/9503519.png', '', 'd8aad8acd8a7d8b1d98a'),
('ZR', 'زراعي', NULL, 'https://cdn-icons-png.flaticon.com/512/6007/6007937.png', '', '%d8%b2%d8%b1%d8%a7%d8%b9%d9%8a');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_country_stats`
--

CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('EN', 1),
('MD', 1),
('ZR', 1),
('TC', 2),
('TG', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_cron`
--

CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','MINUTELY','HOURLY','DAILY','WEEKLY','MONTHLY','YEARLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('MINUTELY', '2025-10-30 13:38:43', '2025-10-30 13:43:00'),
('HOURLY', '2025-10-30 13:10:55', '2025-10-30 14:10:00'),
('DAILY', '2025-10-29 21:56:43', '2025-10-30 21:56:00'),
('WEEKLY', '2025-10-28 19:23:11', '2025-11-04 19:23:00'),
('MONTHLY', '2025-10-28 19:23:11', '2025-11-28 19:23:00'),
('YEARLY', '2025-10-28 19:23:11', '2026-10-28 19:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_currency`
--

CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('EUR', 'European Union Euro', '€', 1),
('GBP', 'United Kingdom Pound', '£', 1),
('USD', 'United States Dollar', '$', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item`
--

CREATE TABLE `oc_t_item` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_contact_phone` varchar(100) DEFAULT NULL,
  `s_contact_other` varchar(100) DEFAULT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT 0,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `b_spam` tinyint(1) NOT NULL DEFAULT 0,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `b_show_phone` tinyint(1) DEFAULT 1,
  `i_renewed` int(3) DEFAULT 0,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item`
--

INSERT INTO `oc_t_item` (`pk_i_id`, `fk_i_user_id`, `fk_i_category_id`, `dt_pub_date`, `dt_mod_date`, `f_price`, `i_price`, `fk_c_currency_code`, `s_contact_name`, `s_contact_email`, `s_contact_phone`, `s_contact_other`, `s_ip`, `b_premium`, `b_enabled`, `b_active`, `b_spam`, `s_secret`, `b_show_email`, `b_show_phone`, `i_renewed`, `dt_expiration`) VALUES
(3, 1, 96, '2025-10-28 22:22:53', '2025-10-29 17:27:03', NULL, NULL, NULL, 'eslam', 'eslamweso123@gmail.com', '', '', '::1', 0, 1, 1, 0, 'VdOZ2mpG', 0, 0, 0, '9999-12-31 23:59:59'),
(4, 2, 96, '2025-10-29 12:28:10', '2025-10-29 17:27:15', NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'G3QkFygT', 0, 0, 0, '9999-12-31 23:59:59'),
(5, 2, 96, '2025-10-29 12:30:05', '2025-10-29 17:27:26', NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, '0o8x9C3F', 0, 0, 0, '9999-12-31 23:59:59'),
(6, 2, 96, '2025-10-29 13:01:13', '2025-10-29 17:27:35', NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'o4t1adCN', 0, 0, 0, '9999-12-31 23:59:59'),
(7, 2, 96, '2025-10-29 16:15:06', '2025-10-29 17:27:45', NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, '5mV57QFx', 0, 0, 0, '9999-12-31 23:59:59'),
(8, 2, 98, '2025-10-29 17:15:28', '2025-10-29 17:27:56', NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'qMk9LOlx', 0, 0, 0, '9999-12-31 23:59:59'),
(9, 2, 96, '2025-10-29 17:52:18', NULL, NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'hU8U7Miv', 0, 0, 0, '9999-12-31 23:59:59'),
(10, 2, 97, '2025-10-30 13:25:55', NULL, NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'F1wdD5Cd', 0, 0, 0, '9999-12-31 23:59:59'),
(11, 2, 97, '2025-10-30 13:32:25', NULL, NULL, NULL, NULL, 'admin', 'eslamweso123@icloud.com', '', '', '::1', 0, 1, 1, 0, 'NlaXFoPn', 0, 0, 0, '9999-12-31 23:59:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_comment`
--

CREATE TABLE `oc_t_item_comment` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `i_rating` int(3) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `b_spam` tinyint(1) NOT NULL DEFAULT 0,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_reply_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_comment`
--

INSERT INTO `oc_t_item_comment` (`pk_i_id`, `fk_i_item_id`, `dt_pub_date`, `s_title`, `s_author_name`, `s_author_email`, `s_body`, `i_rating`, `b_enabled`, `b_active`, `b_spam`, `fk_i_user_id`, `fk_i_reply_id`) VALUES
(1, 3, '2025-10-29 18:29:57', 'vvvvvvvvvvvvv', 'admin', 'eslamweso123@icloud.com', 'vvvvvvvvvvvvvvvvvvvvvvvv', NULL, 1, 1, 0, 2, NULL),
(2, 3, '2025-10-29 18:31:57', 'ffffffffffff', 'admin', 'eslamweso123@icloud.com', 'fffffffffffffff', NULL, 1, 1, 0, 2, NULL),
(3, 3, '2025-10-29 18:32:05', 'dddddddddddddddd', 'admin', 'eslamweso123@icloud.com', 'ddddddddddddddddd', NULL, 1, 1, 0, 2, NULL),
(4, 6, '2025-10-29 18:36:16', 'ddd', 'admin', 'eslamweso123@icloud.com', 'ddd', NULL, 1, 1, 0, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_description`
--

CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_description`
--

INSERT INTO `oc_t_item_description` (`fk_i_item_id`, `fk_c_locale_code`, `s_title`, `s_description`) VALUES
(3, 'ar_SY', 'ببببببببببببب', 'ببببببببببببببببببببب'),
(4, 'ar_SY', 'fffffffff', 'fffffffffff'),
(5, 'ar_SY', 'dsf fds svdf sf', 'dfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddddfsdfsf ddddddd ddddddddddddd dddddddddd'),
(6, 'ar_SY', 'ييييييي', 'يييييييييييييي'),
(5, 'ar_EG', '', ''),
(5, 'en_US', '', ''),
(7, 'ar_SY', 'يييييييييييي', 'kdddddddkjfg dg fg fd gfd g fdgfdg\r\n dfgfdg\r\n dfgfdgdg\r\n dfgdfgfdgdfgdg'),
(8, 'ar_SY', 'JJJJ', 'KKKK'),
(3, 'ar_EG', '', ''),
(3, 'en_US', '', ''),
(4, 'ar_EG', '', ''),
(4, 'en_US', '', ''),
(6, 'ar_EG', '', ''),
(6, 'en_US', '', ''),
(7, 'ar_EG', '', ''),
(7, 'en_US', '', ''),
(8, 'ar_EG', '', ''),
(8, 'en_US', '', ''),
(9, 'ar_SY', 'ييييييييييييييييييييييي', 'ييييييييييييييييييييييييييييييييييييي'),
(10, 'ar_SY', 'ببببببببببسسي', 'موبمسمبنم'),
(11, 'ar_SY', 'ييييييييييييييييييييييييي', 'سسسسسسسسسسسسسسسسسسسسسسسس');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_location`
--

CREATE TABLE `oc_t_item_location` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_country_native` varchar(80) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `s_region_native` varchar(60) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `s_city_native` varchar(60) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(20,10) DEFAULT NULL,
  `d_coord_long` decimal(20,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_location`
--

INSERT INTO `oc_t_item_location` (`fk_i_item_id`, `fk_c_country_code`, `s_country`, `s_country_native`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `s_region_native`, `fk_i_city_id`, `s_city`, `s_city_native`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`) VALUES
(3, 'TG', 'تجاري', NULL, '454545454', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '5454545', 25.7177100000, 32.6539300000),
(4, 'ZR', 'زراعي', NULL, '45454454545', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 30.7906300000, 29.4941500000),
(5, 'TC', 'تكنولوجي', NULL, '64544545', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 25.2189000000, 30.5628800000),
(6, 'MD', 'طبي', NULL, '54545454', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 31.1166700000, 31.2500000000),
(7, 'EN', 'هندسي', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 30.0626300000, 31.2496700000),
(8, 'TC', 'تكنولوجي', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', 30.0626300000, 31.2496700000),
(9, 'TG', 'تجاري', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL),
(10, NULL, '', '', '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL),
(11, NULL, '', '', '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_meta`
--

CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL,
  `s_value` text DEFAULT NULL,
  `s_multi` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_meta`
--

INSERT INTO `oc_t_item_meta` (`fk_i_item_id`, `fk_i_field_id`, `s_value`, `s_multi`) VALUES
(3, 1, '', ''),
(4, 1, '', ''),
(5, 1, '', ''),
(6, 1, 'https://www.youtube.com/watch?v=G54ksbIjMq8', ''),
(7, 1, 'https://www.youtube.com/watch?v=V-BaGCWiz4c', ''),
(9, 1, '', ''),
(10, 1, 'https://www.youtube.com/watch?v=w4sDOlX2kqM&amp;t=1s&amp;ab_channel=AlexChacon', ''),
(11, 1, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_resource`
--

CREATE TABLE `oc_t_item_resource` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_resource`
--

INSERT INTO `oc_t_item_resource` (`pk_i_id`, `fk_i_item_id`, `s_name`, `s_extension`, `s_content_type`, `s_path`, `i_order`) VALUES
(1, 3, 'DCxgMSBg', 'png', 'image/png', 'oc-content/uploads/0/', 1),
(2, 4, 't26dEQMl', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(3, 4, 'J6feQPSB', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 2),
(6, 5, '7qappsLv', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(7, 6, 'xvhlsu6X', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(8, 6, 'q5qCBgBO', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 2),
(9, 6, '6awpEXiR', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 3),
(10, 7, 'GaSAnjWd', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(11, 8, 's2xi2qC3', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(12, 9, '5217kuLt', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(13, 10, 'V9uOyAMD', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1),
(14, 10, 'NyzONTGf', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 2),
(15, 11, 'JwYt1Ffg', 'jpg', 'image/jpeg', 'oc-content/uploads/0/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_item_stats`
--

CREATE TABLE `oc_t_item_stats` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `i_num_views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_spam` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_repeated` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_bad_classified` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_offensive` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_expired` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `i_num_premium_views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `dt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_item_stats`
--

INSERT INTO `oc_t_item_stats` (`fk_i_item_id`, `i_num_views`, `i_num_spam`, `i_num_repeated`, `i_num_bad_classified`, `i_num_offensive`, `i_num_expired`, `i_num_premium_views`, `dt_date`) VALUES
(3, 0, 0, 0, 0, 0, 0, 0, '2025-10-28'),
(4, 0, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(4, 1, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(5, 1, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(6, 0, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(6, 1, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(7, 0, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(7, 1, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(8, 0, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(8, 1, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(9, 0, 0, 0, 0, 0, 0, 0, '2025-10-29'),
(9, 1, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(10, 0, 0, 0, 0, 0, 0, 0, '2025-10-30'),
(11, 1, 0, 0, 0, 0, 0, 0, '2025-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_keywords`
--

CREATE TABLE `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_latest_searches`
--

CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locale`
--

CREATE TABLE `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT 2,
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT 1,
  `b_locations_native` tinyint(1) DEFAULT 0,
  `b_rtl` tinyint(1) DEFAULT 0,
  `fk_c_currency_code` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`, `b_locations_native`, `b_rtl`, `fk_c_currency_code`) VALUES
('ar_EG', 'عربي', 'Ar', 'الترجمة العربية', '8.2.1', 'OsclassPoint', 'https://osclass-classifieds.com/', '{NUMBER} {CURRENCY}', '.', '', 2, 'd/m/Y', '', 1, 1, 1, 1, NULL),
('ar_SY', 'Arabic', 'Arabic', 'Arabic translation', '8.3.0', 'Osclass', 'salymyaw@gmail.com', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', '', 1, 1, 0, 0, NULL),
('en_US', 'English (US)', 'English', 'American english translation', '8.3.0', 'OsclassPoint', 'https://osclass-classifieds.com/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 1, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_locations_tmp`
--

CREATE TABLE `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_locations_tmp`
--

INSERT INTO `oc_t_locations_tmp` (`id_location`, `e_type`) VALUES
('EN', 'COUNTRY'),
('MD', 'COUNTRY'),
('TC', 'COUNTRY'),
('TG', 'COUNTRY'),
('ZR', 'COUNTRY');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_log`
--

CREATE TABLE `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) UNSIGNED NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_detail` text DEFAULT NULL,
  `s_comment` varchar(512) DEFAULT NULL,
  `s_ip` varchar(64) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_detail`, `s_comment`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2025-10-28 19:22:10', 'item', 'add', 1, 'Example Ad', NULL, NULL, '::1', 'admin', 0),
('2025-10-28 21:55:53', 'itemActions', 'deleteResourcesFromHD', 1, '1', NULL, NULL, '::1', 'admin', 1),
('2025-10-28 21:55:53', 'itemActions', 'deleteResourcesFromHD', 1, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-28 22:16:00', 'item', 'add', 2, 'اااااااةو ةننن ل', NULL, NULL, '::1', 'user', 0),
('2025-10-28 22:22:05', 'item', 'delete', 2, 'اااااااةو ةننن ل', NULL, NULL, '::1', 'admin', 1),
('2025-10-28 22:22:05', 'itemActions', 'deleteResourcesFromHD', 2, '2', NULL, NULL, '::1', 'admin', 1),
('2025-10-28 22:22:05', 'itemActions', 'deleteResourcesFromHD', 2, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-28 22:22:53', 'item', 'add', 3, 'ببببببببببببب', NULL, NULL, '::1', 'user', 0),
('2025-10-29 12:25:09', 'user', 'register', 1, 'eslamweso123@gmail.com', NULL, NULL, '::1', 'user', 1),
('2025-10-29 12:27:09', 'user', 'register', 2, 'eslamweso123@icloud.com', NULL, NULL, '::1', 'user', 2),
('2025-10-29 12:28:10', 'item', 'add', 4, 'fffffffff', NULL, NULL, '::1', 'user', 2),
('2025-10-29 12:30:05', 'item', 'add', 5, 'dsf fds svdf sf', NULL, NULL, '::1', 'user', 2),
('2025-10-29 13:01:13', 'item', 'add', 6, 'ييييييي', NULL, NULL, '::1', 'user', 2),
('2025-10-29 13:37:36', 'item', 'edit', 5, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 16:15:06', 'item', 'add', 7, 'يييييييييييي', NULL, NULL, '::1', 'user', 2),
('2025-10-29 17:15:28', 'item', 'add', 8, 'JJJJ', NULL, NULL, '::1', 'user', 2),
('2025-10-29 17:27:03', 'item', 'edit', 3, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:27:15', 'item', 'edit', 4, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:27:26', 'item', 'edit', 5, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:27:35', 'item', 'edit', 6, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:27:45', 'item', 'edit', 7, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:27:56', 'item', 'edit', 8, '', NULL, NULL, '::1', 'admin', 1),
('2025-10-29 17:52:18', 'item', 'add', 9, 'ييييييييييييييييييييييي', NULL, NULL, '::1', 'user', 2),
('2025-10-30 13:25:55', 'item', 'add', 10, 'ببببببببببسسي', NULL, NULL, '::1', 'user', 2),
('2025-10-30 13:32:25', 'item', 'add', 11, 'ييييييييييييييييييييييييي', NULL, NULL, '::1', 'user', 2),
('2025-10-30 13:38:26', 'item', 'delete resource', 4, '4', NULL, NULL, '::1', 'admin', 1),
('2025-10-30 13:38:26', 'item', 'delete resource backtrace', 4, '#0 osc_deleteResource called@ [C:\\xampp\\htdocs\\asas\\oc-admin\\media.php:45] / #1 doModel called@ [C:\\xampp\\htdocs\\asas\\oc-admin\\index.php:122] / ', NULL, NULL, '::1', 'admin', 1),
('2025-10-30 13:38:26', 'media', 'delete bulk', 4, '4', NULL, NULL, '::1', 'admin', 1),
('2025-10-30 13:40:21', 'item', 'delete resource', 5, '5', NULL, NULL, '::1', 'admin', 1),
('2025-10-30 13:40:21', 'item', 'delete resource backtrace', 5, '#0 osc_deleteResource called@ [C:\\xampp\\htdocs\\asas\\oc-admin\\media.php:45] / #1 doModel called@ [C:\\xampp\\htdocs\\asas\\oc-admin\\index.php:122] / ', NULL, NULL, '::1', 'admin', 1),
('2025-10-30 13:40:21', 'media', 'delete bulk', 5, '5', NULL, NULL, '::1', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_meta_categories`
--

INSERT INTO `oc_t_meta_categories` (`fk_i_category_id`, `fk_i_field_id`) VALUES
(96, 1),
(97, 1),
(98, 1),
(99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_meta_fields`
--

CREATE TABLE `oc_t_meta_fields` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','NUMBER','TEL','EMAIL','COLOR','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT 0,
  `b_searchable` tinyint(1) NOT NULL DEFAULT 0,
  `i_order` int(3) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_meta_fields`
--

INSERT INTO `oc_t_meta_fields` (`pk_i_id`, `s_name`, `s_slug`, `e_type`, `s_options`, `b_required`, `b_searchable`, `i_order`) VALUES
(1, 'فيديو', 'new-custom-field', 'URL', '', 0, 0, 999);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages`
--

CREATE TABLE `oc_t_pages` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT 0,
  `b_link` tinyint(1) NOT NULL DEFAULT 1,
  `b_index` tinyint(1) NOT NULL DEFAULT 1,
  `i_visibility` tinyint(1) DEFAULT 0,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT 0,
  `s_meta` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `b_index`, `i_visibility`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, 1, 0, '2025-10-28 21:22:09', NULL, 0, NULL),
(23, 'example_page', 0, 0, 1, 0, '2025-10-28 19:22:10', '2025-10-28 19:22:10', 1, '\"\"');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_pages_description`
--

CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'ar_EG', '{WEB_TITLE} - شخصا ما لديه سؤال عن اعلانك', '<p>مرحبا{CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE})ترك لك رسالة خاصة بأعلانك <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(1, 'ar_SY', '{WEB_TITLE} - شخصا ما لديه سؤال عن اعلانك', '<p>مرحبا{CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE})ترك لك رسالة خاصة بأعلانك <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'ar_EG', 'من فضلك اكد {WEB_TITLE} حسابك', '<p>مرحبا{USER_NAME},</p><p>برحاء تحقيق صحة تسجليك من خلال الضغط على الرابط التالى: {VALIDATION_LINK}</p><p>مع الشكر!</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(2, 'ar_SY', 'من فضلك اكد {WEB_TITLE} حسابك', '<p>مرحبا{USER_NAME},</p><p>برحاء تحقيق صحة تسجليك من خلال الضغط على الرابط التالى: {VALIDATION_LINK}</p><p>مع الشكر!</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(2, 'en_US', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'ar_EG', '{WEB_TITLE} - تسجيل ناجح!', '<p>مرحبا {USER_NAME},</p><p>لقد سجلت بنجاح في {WEB_LINK}.</p><p>شكرا لك!</p><p>مع تحياتي,</p><p>{WEB_LINK}</p>'),
(3, 'ar_SY', '{WEB_TITLE} - تسجيل ناجح!', '<p>مرحبا {USER_NAME},</p><p>لقد سجلت بنجاح في {WEB_LINK}.</p><p>شكرا لك!</p><p>مع تحياتي,</p><p>{WEB_LINK}</p>'),
(3, 'en_US', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(4, 'ar_EG', 'أنظر ماذا أكتشفت فى {WEB_TITLE}', '<p>مرحبا {FRIEND_NAME},</p><p>صديقك {USER_NAME} يريد مشاركتك هذا الاعلان <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>الرساله:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_TITLE}</p>'),
(4, 'ar_SY', 'أنظر ماذا أكتشفت فى {WEB_TITLE}', '<p>مرحبا {FRIEND_NAME},</p><p>صديقك {USER_NAME} يريد مشاركتك هذا الاعلان <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>الرساله:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_TITLE}</p>'),
(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(5, 'ar_EG', '{WEB_TITLE} - اعلانات جديدة في الساعة الماضية', '<p>مرحبا{USER_NAME},</p><p>إعلان جديد تم نشره فى أخر ساعة. القي نظره عليه:</p><p>{ADS}</p><p>-------------</p><p>لإلغاء الاشتراك فى هذه التنبيهات مستقبلا برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(5, 'ar_SY', '{WEB_TITLE} - اعلانات جديدة في الساعة الماضية', '<p>مرحبا{USER_NAME},</p><p>إعلان جديد تم نشره فى أخر ساعة. القي نظره عليه:</p><p>{ADS}</p><p>-------------</p><p>لإلغاء الاشتراك فى هذه التنبيهات مستقبلا برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p><hr/></p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'ar_EG', '{WEB_TITLE} - اعلانات جديدة في اليوم الاخير', '<p>مرحبا {USER_NAME},</p><p>أعلان جديد تم نشره فى اخر يوم. القي نظرة عليه:</p><p>{ADS}</p><p>-------------</p><p>لإلغاء الاشتراك فى هذه التنبيهات مستقبلا برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'ar_SY', '{WEB_TITLE} - اعلانات جديدة في اليوم الاخير', '<p>مرحبا {USER_NAME},</p><p>أعلان جديد تم نشره فى اخر يوم. القي نظرة عليه:</p><p>{ADS}</p><p>-------------</p><p>لإلغاء الاشتراك فى هذه التنبيهات مستقبلا برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p><hr/></p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'ar_EG', '{WEB_TITLE} - اعلانات جديدة في الأسبوع الماضي', '<p>مرحبا{USER_NAME},</p><p>العديد من الاعلانات تم نشرها خلال لاسبوع الماضى. لمشاهدتهم:</p><p>{ADS}</p><p>-------------</p><p>لإيقاف الاشتراك فى تنبيهات مماثلة ، برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'ar_SY', '{WEB_TITLE} - اعلانات جديدة في الأسبوع الماضي', '<p>مرحبا{USER_NAME},</p><p>العديد من الاعلانات تم نشرها خلال لاسبوع الماضى. لمشاهدتهم:</p><p>{ADS}</p><p>-------------</p><p>لإيقاف الاشتراك فى تنبيهات مماثلة ، برجاء الضغط على: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p><hr/></p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'ar_EG', '{WEB_TITLE} - اعلانات جديدة', '<p>مرحبا {USER_NAME},</p><p>اعلان جديد تم نشره, تفحصه!</p><p>{ADS}</p><p>-------------</p><p>لالغاء الاشتراك, انقر علي: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'ar_SY', '{WEB_TITLE} - اعلانات جديدة', '<p>مرحبا {USER_NAME},</p><p>اعلان جديد تم نشره, تفحصه!</p><p>{ADS}</p><p>-------------</p><p>لالغاء الاشتراك, انقر علي: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p><hr/></p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(9, 'ar_EG', '{WEB_TITLE} - تعليق جديد', '<p>علق شخص ما على الأعلان <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>المعلق: {COMMENT_AUTHOR}<br />البريد الإلكتروني للمعلق: {COMMENT_EMAIL}<br />عنوان: {COMMENT_TITLE}<br />تعليق: {COMMENT_TEXT}</p>'),
(9, 'ar_SY', '{WEB_TITLE} - تعليق جديد', '<p>علق شخص ما على الأعلان <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>المعلق: {COMMENT_AUTHOR}<br />البريد الإلكتروني للمعلق: {COMMENT_EMAIL}<br />عنوان: {COMMENT_TITLE}<br />تعليق: {COMMENT_TEXT}</p>'),
(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(10, 'ar_EG', '{WEB_TITLE} - تغيير اعدادات الاعلان {ITEM_TITLE}', '<p>مرحبا {USER_NAME},</p><p>أنت غير مسجل في {WEB_LINK}, ولكن لا يزال بإمكانك تحرير الأعلان أو حذفها <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> لفترة قصيرة من الزمن.</p><p>يمكنك تحرير قائمتك باتباع هذا الرابط: {EDIT_LINK}</p><p>يمكنك حذف قائمتك باتباع هذا الرابط: {DELETE_LINK}</p><p>إذا قمت بالتسجيل كمستخدم ، فسيكون لديك حق الوصول الكامل إلى خيارات التحرير.</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(10, 'ar_SY', '{WEB_TITLE} - تغيير اعدادات الاعلان {ITEM_TITLE}', '<p>مرحبا {USER_NAME},</p><p>أنت غير مسجل في {WEB_LINK}, ولكن لا يزال بإمكانك تحرير الأعلان أو حذفها <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> لفترة قصيرة من الزمن.</p><p>يمكنك تحرير قائمتك باتباع هذا الرابط: {EDIT_LINK}</p><p>يمكنك حذف قائمتك باتباع هذا الرابط: {DELETE_LINK}</p><p>إذا قمت بالتسجيل كمستخدم ، فسيكون لديك حق الوصول الكامل إلى خيارات التحرير.</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'ar_EG', '{WEB_TITLE} - اكد اعلانك', '<p>مرحبا {USER_NAME},</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم نشر أعلان في {WEB_LINK}. يرجى التحقق من صحة هذه الأعلان من خلال النقر على الرابط التالي: {VALIDATION_LINK}. إذا لم تنشر هذه الأعلان ، فيرجى تجاهل هذا البريد الإلكتروني.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال: {USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(11, 'ar_SY', '{WEB_TITLE} - اكد اعلانك', '<p>مرحبا {USER_NAME},</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم نشر أعلان في {WEB_LINK}. يرجى التحقق من صحة هذه الأعلان من خلال النقر على الرابط التالي: {VALIDATION_LINK}. إذا لم تنشر هذه الأعلان ، فيرجى تجاهل هذا البريد الإلكتروني.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال: {USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'ar_EG', '{WEB_TITLE} - اعلان جديد تم نشره', '<p>العزيز {WEB_TITLE} admin,</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم نشر أعلان في {WEB_LINK}.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال: {USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>يمكنك تحرير هذه الأعلان بالضغط على الرابط التالي: {EDIT_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(12, 'ar_SY', '{WEB_TITLE} - اعلان جديد تم نشره', '<p>العزيز {WEB_TITLE} admin,</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم نشر أعلان في {WEB_LINK}.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال: {USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>يمكنك تحرير هذه الأعلان بالضغط على الرابط التالي: {EDIT_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'ar_EG', '{WEB_TITLE} - استرجع كلمة مرورك', '<p>مرحبا {USER_NAME},</p><p>لقد أرسلنا إليك هذا البريد الإلكتروني لأنك طلبت تذكيرًا بكلمة المرور. اتبع هذا الرابط لاستعادته: {PASSWORD_LINK}</p><p>سيتم إلغاء تنشيط الرابط خلال 24 ساعة.</p><p>إذا لم تطلب تذكيرًا بكلمة المرور ، فيرجى تجاهل هذه الرسالة. تم تقديم هذا الطلب من IP {IP_ADDRESS} في {DATE_TIME}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(13, 'ar_SY', '{WEB_TITLE} - استرجع كلمة مرورك', '<p>مرحبا {USER_NAME},</p><p>لقد أرسلنا إليك هذا البريد الإلكتروني لأنك طلبت تذكيرًا بكلمة المرور. اتبع هذا الرابط لاستعادته: {PASSWORD_LINK}</p><p>سيتم إلغاء تنشيط الرابط خلال 24 ساعة.</p><p>إذا لم تطلب تذكيرًا بكلمة المرور ، فيرجى تجاهل هذه الرسالة. تم تقديم هذا الطلب من IP {IP_ADDRESS} في {DATE_TIME}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'ar_EG', '{WEB_TITLE} - انت طلبت تغيير البريد الالكترونى', '<p>مرحبا {USER_NAME}</p><p>أنت تتلقى هذا البريد الإلكتروني لأنك طلبت تغيير البريد الإلكتروني. يرجى تأكيد عنوان البريد الإلكتروني الجديد هذا عن طريق النقر فوق ارتباط التحقق التالي: {VALIDATION_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(14, 'ar_SY', '{WEB_TITLE} - انت طلبت تغيير البريد الالكترونى', '<p>مرحبا {USER_NAME}</p><p>أنت تتلقى هذا البريد الإلكتروني لأنك طلبت تغيير البريد الإلكتروني. يرجى تأكيد عنوان البريد الإلكتروني الجديد هذا عن طريق النقر فوق ارتباط التحقق التالي: {VALIDATION_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'ar_EG', '{WEB_TITLE} - من فضلك اكد تنبيهك', 'برجاء التحقق من صحة تسجيل التنبيه الخاص بكم عن طريق الضغط على الرابط التالى'),
(15, 'ar_SY', '{WEB_TITLE} - من فضلك اكد تنبيهك', 'برجاء التحقق من صحة تسجيل التنبيه الخاص بكم عن طريق الضغط على الرابط التالى'),
(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'ar_EG', '{WEB_TITLE} - تعليقك تم قبوله', '<p>مرحبا {COMMENT_AUTHOR},</p><p>تعليقك علي <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> تم قبوله.</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(16, 'ar_SY', '{WEB_TITLE} - تعليقك تم قبوله', '<p>مرحبا {COMMENT_AUTHOR},</p><p>تعليقك علي <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> تم قبوله.</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'ar_EG', '{WEB_TITLE} - اكد اعلانك', '<p>مرحبا {USER_NAME},</p><p>أنت تتلقى هذا البريد الإلكتروني لأنك نشرت أعلان على {WEB_LINK}. يرجى التحقق من صحة هذه الأعلان من خلال النقر على الرابط التالي: {VALIDATION_LINK}. إذا لم تنشر هذه الأعلان ، فيرجى تجاهل هذا البريد الإلكتروني.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال:{USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>حتى لو لم تكن مسجلاً في {WEB_LINK}, لا يزال بإمكانك تعديل أو حذف قائمتك:</p><p>يمكنك تحرير قائمتك باتباع هذا الرابط: {EDIT_LINK}</p><p>يمكنك حذف قائمتك باتباع هذا الرابط: {DELETE_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(17, 'ar_SY', '{WEB_TITLE} - اكد اعلانك', '<p>مرحبا {USER_NAME},</p><p>أنت تتلقى هذا البريد الإلكتروني لأنك نشرت أعلان على {WEB_LINK}. يرجى التحقق من صحة هذه الأعلان من خلال النقر على الرابط التالي: {VALIDATION_LINK}. إذا لم تنشر هذه الأعلان ، فيرجى تجاهل هذا البريد الإلكتروني.</p><p>تفاصيل أعلان:</p><p>اسم جهة الاتصال:{USER_NAME}<br />تواصل بالبريد الاكتروني: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>عنوان Url: {ITEM_URL}</p><p>حتى لو لم تكن مسجلاً في {WEB_LINK}, لا يزال بإمكانك تعديل أو حذف قائمتك:</p><p>يمكنك تحرير قائمتك باتباع هذا الرابط: {EDIT_LINK}</p><p>يمكنك حذف قائمتك باتباع هذا الرابط: {DELETE_LINK}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'ar_EG', '{WEB_TITLE} - مستخدم جديد قام بالتسجيل', '<p>العزيز {WEB_TITLE} admin,</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم إنشاء مستخدم جديد في {WEB_LINK}.</p><p>بيانات المستخدم:</p><p>الأسم: {USER_NAME}<br />البريد الإلكتروني: {USER_EMAIL}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(18, 'ar_SY', '{WEB_TITLE} - مستخدم جديد قام بالتسجيل', '<p>العزيز {WEB_TITLE} admin,</p><p>أنت تتلقى هذا البريد الإلكتروني لأنه تم إنشاء مستخدم جديد في {WEB_LINK}.</p><p>بيانات المستخدم:</p><p>الأسم: {USER_NAME}<br />البريد الإلكتروني: {USER_EMAIL}</p><p>مع تحياتي،</p><p>{WEB_LINK}</p>'),
(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'ar_EG', '{WEB_TITLE} - شخصا ما لديه سؤال لك', '<p>مرحبا {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) ترك لك رسالة:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(19, 'ar_SY', '{WEB_TITLE} - شخصا ما لديه سؤال لك', '<p>مرحبا {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) ترك لك رسالة:</p><p>{COMMENT}</p><p>تحياتنا,</p><p>{WEB_LINK}</p>'),
(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(20, 'ar_EG', '{WEB_TITLE} - شخصا ما علق علي اعلانك', '<p>يوجد تعليق جديد على الأعلان: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>مؤلف: {COMMENT_AUTHOR}<br />البريد الإلكتروني للمؤلف: {COMMENT_EMAIL}<br />عنوان: {COMMENT_TITLE}<br />تعليق: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(20, 'ar_SY', '{WEB_TITLE} - شخصا ما علق علي اعلانك', '<p>يوجد تعليق جديد على الأعلان: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>مؤلف: {COMMENT_AUTHOR}<br />البريد الإلكتروني للمؤلف: {COMMENT_EMAIL}<br />عنوان: {COMMENT_TITLE}<br />تعليق: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(21, 'ar_EG', '{WEB_TITLE} - تم انشاء حساب مدير بنجاح!', '<p>مرحبا {ADMIN_NAME},</p><p>مدير  {WEB_LINK} انشأ حساب لك,</p><ul><li>اسم المرور: {USERNAME}</li><li>كلمة المرور: {PASSWORD}</li></ul><p>يمكنك الوصول للوحة الادارة من هنا {WEB_ADMIN_LINK}.</p><p>شكرا لك!</p><p>مع التحية,</p>'),
(21, 'ar_SY', '{WEB_TITLE} - تم انشاء حساب مدير بنجاح!', '<p>مرحبا {ADMIN_NAME},</p><p>مدير  {WEB_LINK} انشأ حساب لك,</p><ul><li>اسم المرور: {USERNAME}</li><li>كلمة المرور: {PASSWORD}</li></ul><p>يمكنك الوصول للوحة الادارة من هنا {WEB_ADMIN_LINK}.</p><p>شكرا لك!</p><p>مع التحية,</p>'),
(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
(22, 'ar_EG', '{WEB_TITLE} - اعلانك علي وشك الانتهاء', '<p>مرحبا {USER_NAME},</p><p>اعلانك <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> علي وشك الانتهاء في  {WEB_LINK}.'),
(22, 'ar_SY', '{WEB_TITLE} - اعلانك علي وشك الانتهاء', '<p>مرحبا {USER_NAME},</p><p>اعلانك <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> علي وشك الانتهاء في  {WEB_LINK}.'),
(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Hi {USER_NAME},</p><p>Your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),
(23, 'en_US', 'Example page title', 'This is an example page description. This is a good place to put your Terms of Service or any other help information.');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_plugin_category`
--

CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_preference`
--

CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_preference`
--

INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('dreamfree', 'catsmall', '0', 'STRING'),
('dreamfree', 'coode_adsense', '', 'STRING'),
('dreamfree', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('dreamfree', 'defaultShowAs@all', 'gallery', 'STRING'),
('dreamfree', 'donation', '0', 'STRING'),
('dreamfree', 'facebook', '', 'STRING'),
('dreamfree', 'footer_link', '0', 'STRING'),
('dreamfree', 'header-728x90', '', 'STRING'),
('dreamfree', 'homepage-728x90', '', 'STRING'),
('dreamfree', 'keyword_placeholder', '', 'STRING'),
('dreamfree', 'link-site', '', 'STRING'),
('dreamfree', 'linkedin', '', 'STRING'),
('dreamfree', 'name-site', 'Unistart', 'STRING'),
('dreamfree', 'pinterest', '', 'STRING'),
('dreamfree', 'rtl', '0', 'STRING'),
('dreamfree', 'search-results-middle-728x90', '', 'STRING'),
('dreamfree', 'search-results-top-728x90', '', 'STRING'),
('dreamfree', 'sidebar-300x250', '', 'STRING'),
('dreamfree', 'sidebara-300x250', '', 'STRING'),
('dreamfree', 'statsmain', '1', 'STRING'),
('dreamfree', 'twitter', '', 'STRING'),
('dreamfree', 'version', '320', 'STRING'),
('omega_admin_theme', 'compact_mode', '0', 'STRING'),
('osclass', 'active_plugins', 'a:0:{}', 'STRING'),
('osclass', 'admin_color_scheme', 'modern', 'STRING'),
('osclass', 'admin_language', 'en_US', 'STRING'),
('osclass', 'admin_theme', 'omega', 'STRING'),
('osclass', 'admin_toolbar_front', '0', 'STRING'),
('osclass', 'admindash_columns_hidden', '', 'STRING'),
('osclass', 'admindash_widgets_collapsed', '', 'STRING'),
('osclass', 'admindash_widgets_hidden', '', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allow_report_osclass', '1', 'BOOLEAN'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'always_gen_canonical', '1', 'STRING'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'best_fit_image', '1', 'BOOLEAN'),
('osclass', 'breadcrumbs_hide', '', 'STRING'),
('osclass', 'breadcrumbs_hide_custom', '', 'STRING'),
('osclass', 'breadcrumbs_item_category', '1', 'BOOLEAN'),
('osclass', 'breadcrumbs_item_city', '0', 'BOOLEAN'),
('osclass', 'breadcrumbs_item_country', '0', 'BOOLEAN'),
('osclass', 'breadcrumbs_item_page_title', '1', 'BOOLEAN'),
('osclass', 'breadcrumbs_item_parent_categories', '0', 'BOOLEAN'),
('osclass', 'breadcrumbs_item_region', '0', 'BOOLEAN'),
('osclass', 'can_deactivate_items', '0', 'STRING'),
('osclass', 'canvas_background', 'white', 'STRING'),
('osclass', 'comment_rating_limit', '1', 'STRING'),
('osclass', 'comment_reply_user_type', '', 'STRING'),
('osclass', 'comments_per_page', '10', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'contactEmail', 'eslamweso123@gmail.com', 'STRING'),
('osclass', 'csrf_name', 'CSRF177149677', 'STRING'),
('osclass', 'css_banned_pages', 'item-item_add,item-item_edit', 'STRING'),
('osclass', 'css_banned_words', 'font,awesome,tiny,fineuploader', 'STRING'),
('osclass', 'css_merge', '0', 'BOOLEAN'),
('osclass', 'css_minify', '0', 'BOOLEAN'),
('osclass', 'currency', 'USD', 'STRING'),
('osclass', 'custom_css', '', 'STRING'),
('osclass', 'custom_css_hook', '', 'STRING'),
('osclass', 'custom_html', '', 'STRING'),
('osclass', 'custom_html_hook', '', 'STRING'),
('osclass', 'custom_js', '', 'STRING'),
('osclass', 'custom_js_hook', '', 'STRING'),
('osclass', 'dateFormat', 'Y/m/d', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '12', 'STRING'),
('osclass', 'defaultShowAs@search', 'gallery', 'STRING'),
('osclass', 'description_character_length', '5000', 'STRING'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimProfileImg', '180x180', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enable_comment_rating', '1', 'STRING'),
('osclass', 'enable_comment_reply', '1', 'STRING'),
('osclass', 'enable_comment_reply_rating', '1', 'STRING'),
('osclass', 'enable_profile_img', '1', 'STRING'),
('osclass', 'enable_rss', '1', 'STRING'),
('osclass', 'enabled_comments', '1', 'STRING'),
('osclass', 'enabled_recaptcha_items', '0', 'STRING'),
('osclass', 'enabled_renewal_items', '0', 'STRING'),
('osclass', 'enabled_tinymce_items', '0', 'STRING'),
('osclass', 'enabled_tinymce_users', '0', 'STRING'),
('osclass', 'enabled_user_registration', '1', 'STRING'),
('osclass', 'enabled_user_validation', '0', 'STRING'),
('osclass', 'enabled_users', '1', 'STRING'),
('osclass', 'enableField#f_price@items', '0', 'STRING'),
('osclass', 'enableField#images@items', '1', 'STRING'),
('osclass', 'enhance_canonical_url_enabled', '1', 'STRING'),
('osclass', 'force_aspect_image', '0', 'BOOLEAN'),
('osclass', 'gen_hreflang_tags', '0', 'STRING'),
('osclass', 'hide_generator', '0', 'STRING'),
('osclass', 'image_upload_lib_force_replace', '1', 'BOOLEAN'),
('osclass', 'image_upload_library', 'UPPY', 'STRING'),
('osclass', 'image_upload_reorder', '1', 'BOOLEAN'),
('osclass', 'installed_plugins', 'a:0:{}', 'STRING'),
('osclass', 'item_attachment', '0', 'STRING'),
('osclass', 'item_contact_form_disabled', '0', 'STRING'),
('osclass', 'item_mark_disable', '1', 'STRING'),
('osclass', 'item_post_redirect', '', 'STRING'),
('osclass', 'item_send_friend_form_disabled', '0', 'STRING'),
('osclass', 'item_stats_method', 'SESSION', 'STRING'),
('osclass', 'items_wait_time', '0', 'STRING'),
('osclass', 'jquery_version', '3', 'STRING'),
('osclass', 'js_banned_pages', 'item-item_add,item-item_edit', 'STRING'),
('osclass', 'js_banned_words', 'tiny,fineuploader', 'STRING'),
('osclass', 'js_merge', '0', 'BOOLEAN'),
('osclass', 'js_minify', '0', 'BOOLEAN'),
('osclass', 'keep_original_image', '1', 'BOOLEAN'),
('osclass', 'language', 'ar_SY', 'STRING'),
('osclass', 'languages_downloaded', '[\"ar_SY\",\"en_US\",\"ar_EG\"]', 'STRING'),
('osclass', 'languages_last_version_check', '1761819118', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1761764203', 'STRING'),
('osclass', 'latest_searches_restriction', '0', 'INTEGER'),
('osclass', 'latest_searches_words', '', 'STRING'),
('osclass', 'locale_to_base_url_enabled', '0', 'STRING'),
('osclass', 'locale_to_base_url_type', '', 'STRING'),
('osclass', 'location_todo', '5', 'STRING'),
('osclass', 'logged_user_item_validation', '1', 'STRING'),
('osclass', 'logging_auto_cleanup', '0', 'STRING'),
('osclass', 'logging_enabled', '1', 'STRING'),
('osclass', 'logging_months', '24', 'STRING'),
('osclass', 'mailserver_auth', '', 'BOOLEAN'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', '', 'STRING'),
('osclass', 'mailserver_name_from', '', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '', 'BOOLEAN'),
('osclass', 'mailserver_port', '', 'INTEGER'),
('osclass', 'mailserver_ssl', '', 'STRING'),
('osclass', 'mailserver_type', 'custom', 'STRING'),
('osclass', 'mailserver_username', '', 'STRING');
INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('osclass', 'market_products_version', '{\"date\":\"2025-10-30 13:11:57\",\"data\":{\"last_update\":\"2025-10-30 01:00:00\",\"0yNxpeRQtrJ1P40QfCn1\":{\"s_product_key\":\"0yNxpeRQtrJ1P40QfCn1\",\"s_version\":\"4.2.4\",\"fk_i_item_id\":\"46\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-06 16:34:08\",\"s_comment\":\"CSS issues fixed.\"},\"MTZ9Tv7cVAPLzMfIOupg\":{\"s_product_key\":\"MTZ9Tv7cVAPLzMfIOupg\",\"s_version\":\"3.4.0\",\"fk_i_item_id\":\"47\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-11 22:10:29\",\"s_comment\":\"Fixed possible issue with memory overflow when getting sample location.\\nMinor improvements.\"},\"KHrh5ixSocGe8COBeMc7\":{\"s_product_key\":\"KHrh5ixSocGe8COBeMc7\",\"s_version\":\"1.3.1\",\"fk_i_item_id\":\"48\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-08-15 14:47:36\",\"s_comment\":\"Improvements to identify uploaded image.\"},\"LacliCEGw3BAf1JlcNdU\":{\"s_product_key\":\"LacliCEGw3BAf1JlcNdU\",\"s_version\":\"1.6.1\",\"fk_i_item_id\":\"49\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-15 14:44:27\",\"s_comment\":\"Fixed minor php issues.\"},\"CNMxiwkWshE8H3F1JyMo\":{\"s_product_key\":\"CNMxiwkWshE8H3F1JyMo\",\"s_version\":\"2.5.1\",\"fk_i_item_id\":\"50\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-08-25 13:44:42\",\"s_comment\":\"User avatar is now visible in send message form.\\nIt is now possible to enable avatar generation based on user initials\\/name, so each user has different avatar (until name is different).\"},\"ac52YupMpzkKcAtcCy8m\":{\"s_product_key\":\"ac52YupMpzkKcAtcCy8m\",\"s_version\":\"3.4.1\",\"fk_i_item_id\":\"51\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-11 11:50:50\",\"s_comment\":\"Minor improvements especially in backoffice.\"},\"2mdX3OOMOsFdKnYHx4Cp\":{\"s_product_key\":\"2mdX3OOMOsFdKnYHx4Cp\",\"s_version\":\"1.1.1\",\"fk_i_item_id\":\"52\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 13:39:55\",\"s_comment\":\"Notices fixes\"},\"9xHou3b3OQ1IG3EZ1BmA\":{\"s_product_key\":\"9xHou3b3OQ1IG3EZ1BmA\",\"s_version\":\"2.7.6\",\"fk_i_item_id\":\"53\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-05 15:37:49\",\"s_comment\":\"Fixed error notices on publish map.\"},\"C7IDtk5QVGn39wsnSOE2\":{\"s_product_key\":\"C7IDtk5QVGn39wsnSOE2\",\"s_version\":\"2.3.7\",\"fk_i_item_id\":\"54\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-14 14:39:53\",\"s_comment\":\"Fixed bug in case notifications were enabled but instant messenger plugin was not installed.\"},\"SdWSefTyq9twKToM6qPk\":{\"s_product_key\":\"SdWSefTyq9twKToM6qPk\",\"s_version\":\"1.1.3\",\"fk_i_item_id\":\"55\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-07-20 09:01:09\",\"s_comment\":\"Fixed bug when mobile phone was not picked properly on newer themes and newer Osclass versions.\"},\"PQCkHq7JVdhTpFxeeR3l\":{\"s_product_key\":\"PQCkHq7JVdhTpFxeeR3l\",\"s_version\":\"2.1.2\",\"fk_i_item_id\":\"56\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-07 09:55:35\",\"s_comment\":\"Fixed problem when category specific advert was shown in search page (no category selected\\/all categories).\"},\"KlqIQ1ClzI4eQTlNJ7xc\":{\"s_product_key\":\"KlqIQ1ClzI4eQTlNJ7xc\",\"s_version\":\"2.2.0\",\"fk_i_item_id\":\"57\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-01 16:21:52\",\"s_comment\":\"Major update: many enhancements and fixes.\\nUsers can now edit their ratings - when they click to leave a rating and rating already exists, user got option to modify it\'s existing rating.\"},\"GlNHp4EtSnbdG9CAQ2z6\":{\"s_product_key\":\"GlNHp4EtSnbdG9CAQ2z6\",\"s_version\":\"2.3.4\",\"fk_i_item_id\":\"58\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-03-06 12:11:18\",\"s_comment\":\"Fixed multiple design bugs and issues.\\nAdded separate message for \\\"remove all users block\\\".\"},\"Ulkh6xNkOv2YT7POQfmO\":{\"s_product_key\":\"Ulkh6xNkOv2YT7POQfmO\",\"s_version\":\"1.2.2\",\"fk_i_item_id\":\"59\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:34:51\",\"s_comment\":\"Updates in license and terms of usage.\"},\"0QDgBnwfOyvG8sUOCizo\":{\"s_product_key\":\"0QDgBnwfOyvG8sUOCizo\",\"s_version\":\"1.5.3\",\"fk_i_item_id\":\"60\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-04-24 14:35:06\",\"s_comment\":\"Fixed bug with incorrect function in model.\"},\"MaN1xZ5SKBJqWjZgD2bm\":{\"s_product_key\":\"MaN1xZ5SKBJqWjZgD2bm\",\"s_version\":\"1.3.3\",\"fk_i_item_id\":\"61\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-02 13:32:57\",\"s_comment\":\"Fixed plugin error.\"},\"4qqdPpskk98qyFNElHYE\":{\"s_product_key\":\"4qqdPpskk98qyFNElHYE\",\"s_version\":\"2.6.0\",\"fk_i_item_id\":\"62\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-27 09:33:52\",\"s_comment\":\"Major update: Way how logged and unlogged lists, their transition and management has been redesigned.\\nPlugin now keeps it\'s own fi user id in cookies &amp; session even after user logged in.\\nAs a benefit, it\'s possible to check anytime for lists linked to non-logged ID and transition these lists to logged ID.\\nWhen logged user did not have any lists before, existing list is transitioned to logged ID.\\nWhen logged user had one or more lists before, non-logged list is removed and it\'s items are transitioned to logged user current list, so no new lists are created at all.\\nPlugin now require PHP 7.0 or higher.\"},\"mqiokDukjuGMkrZ1taSX\":{\"s_product_key\":\"mqiokDukjuGMkrZ1taSX\",\"s_version\":\"1.7.1\",\"fk_i_item_id\":\"63\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-06-17 08:53:20\",\"s_comment\":\"Fixed XSS vulnerability on search page.\"},\"8BBAzI3IDIcFYqA1alzu\":{\"s_product_key\":\"8BBAzI3IDIcFYqA1alzu\",\"s_version\":\"1.8.0\",\"fk_i_item_id\":\"64\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-04 21:35:45\",\"s_comment\":\"Zara theme is now FREE.\\nChanges in license and usage terms.\"},\"8vXVx9jI59dxNSgj38xK\":{\"s_product_key\":\"8vXVx9jI59dxNSgj38xK\",\"s_version\":\"1.8.0\",\"fk_i_item_id\":\"65\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-04 21:46:05\",\"s_comment\":\"Updates in license and terms of usage.\"},\"j3CBbxWhQpEVBK7pouT8\":{\"s_product_key\":\"j3CBbxWhQpEVBK7pouT8\",\"s_version\":\"3.7.0\",\"fk_i_item_id\":\"66\",\"s_osc_version_from\":\"4.4\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-04-22 10:38:38\",\"s_comment\":\"Major update, javascript libraries update, preparation for jQuery 3.6 and Osclass 4.4\"},\"ynMUuxp3sXYa0tMj0dQn\":{\"s_product_key\":\"ynMUuxp3sXYa0tMj0dQn\",\"s_version\":\"3.6.0\",\"fk_i_item_id\":\"67\",\"s_osc_version_from\":\"4.4\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-04-22 10:39:09\",\"s_comment\":\"Major update, javascript libraries update, preparation for jQuery 3.6 and Osclass 4.4\"},\"4bx3pxmTuz0TAszEpoQ9\":{\"s_product_key\":\"4bx3pxmTuz0TAszEpoQ9\",\"s_version\":\"3.3.0\",\"fk_i_item_id\":\"68\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-04-22 10:38:11\",\"s_comment\":\"Major update, javascript libraries update, preparation for jQuery 3.6 and Osclass 4.4\"},\"LeLqCpPszqj7ijcEUJFJ\":{\"s_product_key\":\"LeLqCpPszqj7ijcEUJFJ\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"69\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2019-03-20 14:44:09\",\"s_comment\":\"Added partial support for oc-admin themes\"},\"ag7c6i6dvi5XuOf2GTcb\":{\"s_product_key\":\"ag7c6i6dvi5XuOf2GTcb\",\"s_version\":\"1.0.4\",\"fk_i_item_id\":\"70\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2018-03-17 09:15:13\",\"s_comment\":\"Fixed issue with non-showing flash messages\"},\"2tnYRompS1tuV2SqZ6qy\":{\"s_product_key\":\"2tnYRompS1tuV2SqZ6qy\",\"s_version\":\"1.6.4\",\"fk_i_item_id\":\"72\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-19 10:07:43\",\"s_comment\":\"Fixed minor issue in functions.\"},\"4EdXqRi5wzbIYKjXPhQ1\":{\"s_product_key\":\"4EdXqRi5wzbIYKjXPhQ1\",\"s_version\":\"1.1.5\",\"fk_i_item_id\":\"73\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-03-27 11:07:50\",\"s_comment\":\"Fixed errors in backoffice and notice in frontoffice.\"},\"ccxff0jHMYEh2ikbyswa\":{\"s_product_key\":\"ccxff0jHMYEh2ikbyswa\",\"s_version\":\"1.2.8\",\"fk_i_item_id\":\"74\",\"s_osc_version_from\":\"3.0.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-22 15:20:49\",\"s_comment\":\"Fixed php notices on newer versions (8.2, 8.3).\"},\"RhTE7SKNogtq8bNVvIcJ\":{\"s_product_key\":\"RhTE7SKNogtq8bNVvIcJ\",\"s_version\":\"1.2.1\",\"fk_i_item_id\":\"75\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-10-10 21:53:33\",\"s_comment\":\"Moved box trigger to footer (hook, from header) to avoid design glitch at load.\"},\"9BgL1gFtkfYIx0KVQJ58\":{\"s_product_key\":\"9BgL1gFtkfYIx0KVQJ58\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"76\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-04-24 10:52:28\",\"s_comment\":\"Major update: Design improvements and fixes.\"},\"tJvtsgwVfHh2iNVrUKZm\":{\"s_product_key\":\"tJvtsgwVfHh2iNVrUKZm\",\"s_version\":\"2.8.3\",\"fk_i_item_id\":\"77\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-23 21:02:27\",\"s_comment\":\"Fixed bug with incorrect variable used.\"},\"FCovG0JwLwogaSRGLSAW\":{\"s_product_key\":\"FCovG0JwLwogaSRGLSAW\",\"s_version\":\"1.2.2\",\"fk_i_item_id\":\"78\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-11-20 13:34:58\",\"s_comment\":\"Error notices fixed.\"},\"xQGEDiExjTR5UwJUmbRx\":{\"s_product_key\":\"xQGEDiExjTR5UwJUmbRx\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"79\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-03-02 12:44:34\",\"s_comment\":\"Minifier will not try to minify external CSS\\/JS files\"},\"aP0ReAUMbQqpEZUi6H1R\":{\"s_product_key\":\"aP0ReAUMbQqpEZUi6H1R\",\"s_version\":\"1.2.2\",\"fk_i_item_id\":\"80\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-18 12:36:00\",\"s_comment\":\"Disabled and hidden recaptcha for backoffice login.\"},\"UkjJPIxfbNfYCxuTfm2N\":{\"s_product_key\":\"UkjJPIxfbNfYCxuTfm2N\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"82\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2022-06-14 10:29:35\",\"s_comment\":\"Major update: remove old styles and fonts.\\nUpdated default content of email templates.\\nFixed several design bugs.\"},\"FU7UTpHmDThsRKWwXwZO\":{\"s_product_key\":\"FU7UTpHmDThsRKWwXwZO\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"83\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-03-15 10:25:04\",\"s_comment\":\"Major release:\\n- UI of plugin has been completely redeveloped providing better user experience\\n- new download button design\\n- new configuration options like hooks management, plugin preferred color, enable downloads to logged-in users, enable file versioning\\n- new section \\\"uploads\\\" where customers can manage all their uploaded files\\n- new uploads form design\\n- better features and support from backoffice\\n- admin can now remove file from backoffice\\n- customers can now remove uploaded files\\n- uploaded files are now stored in oc-content\\/uploads\\/virtual folder instead of using plugin folder (for easier maintenance).\\n- redesigned files history section\"},\"kK7dgkItDQ66WZX76BzB\":{\"s_product_key\":\"kK7dgkItDQ66WZX76BzB\",\"s_version\":\"1.7.5\",\"fk_i_item_id\":\"84\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-17 19:27:27\",\"s_comment\":\"Fixed minor issues and bugs.\"},\"3aVxfB6ACekqc6ZUDbVw\":{\"s_product_key\":\"3aVxfB6ACekqc6ZUDbVw\",\"s_version\":\"1.3.4\",\"fk_i_item_id\":\"85\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-04 17:20:06\",\"s_comment\":\"Added info message to backoffice in case GDPR plugin is installed.\"},\"VVUOjIZMpRwBjbbT8Ue4\":{\"s_product_key\":\"VVUOjIZMpRwBjbbT8Ue4\",\"s_version\":\"1.5.0\",\"fk_i_item_id\":\"86\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-04 21:55:51\",\"s_comment\":\"Updates in usage terms.\"},\"v8vsj78TTuvBTfS8lLVs\":{\"s_product_key\":\"v8vsj78TTuvBTfS8lLVs\",\"s_version\":\"1.4.4\",\"fk_i_item_id\":\"87\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-29 07:44:38\",\"s_comment\":\"Fixed icon on Font Awesome 5 themes.\"},\"J9wVtDVg2WDgm3cS6fXi\":{\"s_product_key\":\"J9wVtDVg2WDgm3cS6fXi\",\"s_version\":\"1.1.1\",\"fk_i_item_id\":\"88\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:44:25\",\"s_comment\":\"Updates in license and terms of use.\"},\"VnwC5tcwCuXffWIOZiEZ\":{\"s_product_key\":\"VnwC5tcwCuXffWIOZiEZ\",\"s_version\":\"1.8.8\",\"fk_i_item_id\":\"89\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-22 15:20:18\",\"s_comment\":\"Fixed php issues in backoffice.\"},\"Vknlbnj86NQq95u9ebph\":{\"s_product_key\":\"Vknlbnj86NQq95u9ebph\",\"s_version\":\"1.1.2\",\"fk_i_item_id\":\"90\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:52:37\",\"s_comment\":\"Updates in license and terms of use.\"},\"7k3yIRZf7pqdTfkqbCct\":{\"s_product_key\":\"7k3yIRZf7pqdTfkqbCct\",\"s_version\":\"1.4.6\",\"fk_i_item_id\":\"91\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-06-17 08:51:29\",\"s_comment\":\"Fixed XSS vulnerability on search page.\"},\"Z0hyzNqGCzOmCfC4NGVn\":{\"s_product_key\":\"Z0hyzNqGCzOmCfC4NGVn\",\"s_version\":\"1.3.1\",\"fk_i_item_id\":\"92\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-05-13 15:37:00\",\"s_comment\":\"Fixed minor issues those caused bugs in other plugins.\"},\"vOUF3cgopU8qyNMewkQS\":{\"s_product_key\":\"vOUF3cgopU8qyNMewkQS\",\"s_version\":\"1.7.9\",\"fk_i_item_id\":\"93\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-21 19:01:40\",\"s_comment\":\"Plugin now supports custom invoice logo that can be uploaded to plugin folder \\/img with name logo.png or logo.jpg.\"},\"gcNH3W3tlQR3ckJ7XSCq\":{\"s_product_key\":\"gcNH3W3tlQR3ckJ7XSCq\",\"s_version\":\"1.6.2\",\"fk_i_item_id\":\"94\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-22 15:20:01\",\"s_comment\":\"Fixed php warnings.\"},\"CW4YOjMfMXI6zvpw75r1\":{\"s_product_key\":\"CW4YOjMfMXI6zvpw75r1\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"95\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-11 09:00:51\",\"s_comment\":\"Many improvements and updates.\\nCode optimization.\\nAdded set of filters for easier manipulation from other plugins or themes.\\nUnified checks when cache cannot be generated (social login).\\nAdded support for dark mode in theme (generate separate file).\\nAdded support for RTL languages (generate separate file).\"},\"EuIidjPacShPoibBFu6m\":{\"s_product_key\":\"EuIidjPacShPoibBFu6m\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"96\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 09:13:45\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"FJGisjE1yqVWa3KVoCzY\":{\"s_product_key\":\"FJGisjE1yqVWa3KVoCzY\",\"s_version\":\"1.1.9\",\"fk_i_item_id\":\"97\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-28 09:44:24\",\"s_comment\":\"Minor updates and improvements.\\nAdded phone validation &amp; check on item publish and edit pages, both in front &amp; back office. If phone number that exists on non-related user profile, error is shown.\"},\"pBrd68M4b5SiexjdJ5yK\":{\"s_product_key\":\"pBrd68M4b5SiexjdJ5yK\",\"s_version\":\"1.8.1\",\"fk_i_item_id\":\"98\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-14 13:44:08\",\"s_comment\":\"Minor design fix.\"},\"mNqtMxg1zBJRwIDKdLuM\":{\"s_product_key\":\"mNqtMxg1zBJRwIDKdLuM\",\"s_version\":\"1.7.8\",\"fk_i_item_id\":\"99\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-07 10:23:15\",\"s_comment\":\"Now supports showing map on business profile plugin - seller\'s page.\"},\"oxs1OgtBR7lqBtNk9x0j\":{\"s_product_key\":\"oxs1OgtBR7lqBtNk9x0j\",\"s_version\":\"1.3.6\",\"fk_i_item_id\":\"100\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-08-04 21:28:24\",\"s_comment\":\"Updated installation &amp; setup instructions.\"},\"n2eVCPcgB74fheHF8WMq\":{\"s_product_key\":\"n2eVCPcgB74fheHF8WMq\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"101\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 09:05:25\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"kbUtlUi37pjcT4Do0OI1\":{\"s_product_key\":\"kbUtlUi37pjcT4Do0OI1\",\"s_version\":\"3.1.3\",\"fk_i_item_id\":\"102\",\"s_osc_version_from\":\"4.4.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-04-27 08:32:47\",\"s_comment\":\"Functionality update for Osclass 4.4, many bugs fixed, new sections added, admin color scheme added.\"},\"zQeGvWyO3U0y57KR7CvP\":{\"s_product_key\":\"zQeGvWyO3U0y57KR7CvP\",\"s_version\":\"1.2.8\",\"fk_i_item_id\":\"103\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-23 11:34:54\",\"s_comment\":\"Fixed severalPHP issues and bugs.\"},\"5GbeI4IbxU5ZLeSXlS5F\":{\"s_product_key\":\"5GbeI4IbxU5ZLeSXlS5F\",\"s_version\":\"1.9.6\",\"fk_i_item_id\":\"104\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-27 21:54:39\",\"s_comment\":\"When user change phone number during listing verification, this (new) number is updated on item, so verified phone number is same as listing phone number.\"},\"BlUmJrTdUAaDqQ8UXHb4\":{\"s_product_key\":\"BlUmJrTdUAaDqQ8UXHb4\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"105\",\"s_osc_version_from\":\"\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2019-06-18 07:47:21\",\"s_comment\":\"Blank file\"},\"MmCdRh47DK88qrFD6L1w\":{\"s_product_key\":\"MmCdRh47DK88qrFD6L1w\",\"s_version\":\"1.7.5\",\"fk_i_item_id\":\"106\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-08-25 08:41:49\",\"s_comment\":\"Fixed problem with footer pages showing in footer even it was unset in backoffice setting.\"},\"zyrLNTohHi1nykfew2hM\":{\"s_product_key\":\"zyrLNTohHi1nykfew2hM\",\"s_version\":\"1.1.3\",\"fk_i_item_id\":\"107\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-03-28 13:28:36\",\"s_comment\":\"Added new option to restrict video box (and video itself) to be shown just in selected categories.\"},\"Q3JkTD1eH1LjQKE07IVz\":{\"s_product_key\":\"Q3JkTD1eH1LjQKE07IVz\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"108\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-05-02 08:49:51\",\"s_comment\":\"Major update: Backoffice styles and javascript refined and updated.\\nNumerous enhancements mainly in backoffice.\\nChanges related to default data of newly created voucher.\"},\"7wMRIzqJbL8LIILv56Fu\":{\"s_product_key\":\"7wMRIzqJbL8LIILv56Fu\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"109\",\"s_osc_version_from\":\"\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 10:15:05\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"GFE1crrhnvi0AtRiagJp\":{\"s_product_key\":\"GFE1crrhnvi0AtRiagJp\",\"s_version\":\"1.8.3\",\"fk_i_item_id\":\"110\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-21 09:34:03\",\"s_comment\":\"Updated doctype at start of html document.\\nRefactored user items url, now supports \\\"sItemType\\\" parameter natively and works much better with Osclass 8.3+\"},\"58jeUWqcBCc9AyKktvph\":{\"s_product_key\":\"58jeUWqcBCc9AyKktvph\",\"s_version\":\"1.2.1\",\"fk_i_item_id\":\"111\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-18 12:14:55\",\"s_comment\":\"Bug fix.\"},\"GwoMe84Z9fBVqGU7JgPQ\":{\"s_product_key\":\"GwoMe84Z9fBVqGU7JgPQ\",\"s_version\":\"1.6.3\",\"fk_i_item_id\":\"112\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-06 10:30:41\",\"s_comment\":\"New advanced logging features has been added into plugin.\\nDebug mode can be now enabled from plugin configuration page directly.\\nLogs are stored in separate file: oc-content\\/importer.debug.log.\\nFixed minor issues, improved function that get price from imported file and set \\\"NULL\\\" or string values to \\\"Check with seller\\\".\"},\"P2xUxTzHUv8LMkGB14BV\":{\"s_product_key\":\"P2xUxTzHUv8LMkGB14BV\",\"s_version\":\"1.3.1\",\"fk_i_item_id\":\"113\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-02-23 21:32:27\",\"s_comment\":\"Major update: Several improvements and updates.\\nUpdated configuration page with latest details.\"},\"tmTcQIQhyfwrseFGqLIr\":{\"s_product_key\":\"tmTcQIQhyfwrseFGqLIr\",\"s_version\":\"1.4.2\",\"fk_i_item_id\":\"114\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-25 10:12:52\",\"s_comment\":\"Added new api support to upload user profile picture (or update user profile picture name).\"},\"LNlXIJmlaVMAICJ7o728\":{\"s_product_key\":\"LNlXIJmlaVMAICJ7o728\",\"s_version\":\"1.6.0\",\"fk_i_item_id\":\"115\",\"s_osc_version_from\":\"8.2.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-11-10 09:31:37\",\"s_comment\":\"New theme version for Osclass 8.2.0\"},\"aKHCKmKJSHIGDr9W1Gno\":{\"s_product_key\":\"aKHCKmKJSHIGDr9W1Gno\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"116\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 09:17:17\",\"s_comment\":\"Initial community release\"},\"EW7CF1Ut1VyDy7OHSzOz\":{\"s_product_key\":\"EW7CF1Ut1VyDy7OHSzOz\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"117\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:15:40\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"DUBVnkh9jwqW17nf6NGj\":{\"s_product_key\":\"DUBVnkh9jwqW17nf6NGj\",\"s_version\":\"1.2.1\",\"fk_i_item_id\":\"118\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2022-07-20 12:59:28\",\"s_comment\":\"Minor updates and changes in code\"},\"XvsQRHMyP1UK43q6Yd0J\":{\"s_product_key\":\"XvsQRHMyP1UK43q6Yd0J\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"119\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:18:24\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"4JVeSCym2yP23fgntw0Z\":{\"s_product_key\":\"4JVeSCym2yP23fgntw0Z\",\"s_version\":\"1.2.1\",\"fk_i_item_id\":\"120\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-10-03 13:13:25\",\"s_comment\":\"Fixed different issues (missing images, incorrect image used, ...)\"},\"Lif3TMohLnh8Q04F8Hwz\":{\"s_product_key\":\"Lif3TMohLnh8Q04F8Hwz\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"121\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:20:04\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"2NXsQmUKHos7jalBrqXz\":{\"s_product_key\":\"2NXsQmUKHos7jalBrqXz\",\"s_version\":\"1.7.0\",\"fk_i_item_id\":\"122\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 09:33:39\",\"s_comment\":\"Initial community release\"},\"KIRI6jiKUZIAvPQvBPA3\":{\"s_product_key\":\"KIRI6jiKUZIAvPQvBPA3\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"123\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 09:37:58\",\"s_comment\":\"Initial community release\"},\"2W7JWqCbxXdMfrrPLWxv\":{\"s_product_key\":\"2W7JWqCbxXdMfrrPLWxv\",\"s_version\":\"3.3.2\",\"fk_i_item_id\":\"124\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-26 16:35:34\",\"s_comment\":\"Improvements related to tables and models, so it\'s easier to install &amp; reinstall plugin.\"},\"djkx5sFdRsg4RyNolJyb\":{\"s_product_key\":\"djkx5sFdRsg4RyNolJyb\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"125\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 10:11:40\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"eT3rb042WfSXRc19otYi\":{\"s_product_key\":\"eT3rb042WfSXRc19otYi\",\"s_version\":\"3.2.2\",\"fk_i_item_id\":\"126\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-15 14:49:57\",\"s_comment\":\"Fixed minor php issue.\"},\"HBVzMk1O9AachzWTfstj\":{\"s_product_key\":\"HBVzMk1O9AachzWTfstj\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"127\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:22:41\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"MjqkDNW8spqvllOvtMSH\":{\"s_product_key\":\"MjqkDNW8spqvllOvtMSH\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"128\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 09:53:36\",\"s_comment\":\"Initial community release\"},\"XX4ccIt1Cj2SZQstJGWm\":{\"s_product_key\":\"XX4ccIt1Cj2SZQstJGWm\",\"s_version\":\"2.2.0\",\"fk_i_item_id\":\"129\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:00:46\",\"s_comment\":\"Initial community release\"},\"U9eN1qT3RP7LxCAq1zRS\":{\"s_product_key\":\"U9eN1qT3RP7LxCAq1zRS\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"130\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:23:44\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"CQxEKg0gHAuWK543zXZR\":{\"s_product_key\":\"CQxEKg0gHAuWK543zXZR\",\"s_version\":\"3.0.0\",\"fk_i_item_id\":\"131\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:13:09\",\"s_comment\":\"Initial community release\"},\"NS4N953XMUYGVlbHXtod\":{\"s_product_key\":\"NS4N953XMUYGVlbHXtod\",\"s_version\":\"3.2.2\",\"fk_i_item_id\":\"132\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-05-28 07:46:15\",\"s_comment\":\"Fixed error notices thrown in map, improved several functions\"},\"xJTuuOyytVDITjNjMlSC\":{\"s_product_key\":\"xJTuuOyytVDITjNjMlSC\",\"s_version\":\"3.4.3\",\"fk_i_item_id\":\"133\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-26 16:35:51\",\"s_comment\":\"Improvements related to tables and models, so it\'s easier to install &amp; reinstall plugin.\"},\"YpmgxnUy99FVT4GREHgu\":{\"s_product_key\":\"YpmgxnUy99FVT4GREHgu\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"134\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:20:50\",\"s_comment\":\"Initial community release\"},\"6dpbDvcouLjIwupfoDvk\":{\"s_product_key\":\"6dpbDvcouLjIwupfoDvk\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"135\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:24:58\",\"s_comment\":\"Initial community release\"},\"KPmC9399OcTmjOMQYjGp\":{\"s_product_key\":\"KPmC9399OcTmjOMQYjGp\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"136\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:26:54\",\"s_comment\":\"Initial community release\"},\"X2JXV9xLTaCvC2Og5CUm\":{\"s_product_key\":\"X2JXV9xLTaCvC2Og5CUm\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"137\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:28:39\",\"s_comment\":\"Initial community release\"},\"B9f8pUVcBeCRWuv3ia19\":{\"s_product_key\":\"B9f8pUVcBeCRWuv3ia19\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"138\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:31:31\",\"s_comment\":\"Initial community release\"},\"300pFzxrhPxGRYxZaHax\":{\"s_product_key\":\"300pFzxrhPxGRYxZaHax\",\"s_version\":\"1.4.1\",\"fk_i_item_id\":\"139\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 13:37:25\",\"s_comment\":\"Notices fixes\"},\"gKtMIByCxLvGXOytRysh\":{\"s_product_key\":\"gKtMIByCxLvGXOytRysh\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"140\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:39:37\",\"s_comment\":\"Initial community release\"},\"HLJg40f8FB4mgEsioqcY\":{\"s_product_key\":\"HLJg40f8FB4mgEsioqcY\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"141\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:25:46\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"FPTeGnz8PxBhqC86O2a8\":{\"s_product_key\":\"FPTeGnz8PxBhqC86O2a8\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"142\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:46:28\",\"s_comment\":\"Initial community release\"},\"LaMjjPzvEjGgHgpLVi6z\":{\"s_product_key\":\"LaMjjPzvEjGgHgpLVi6z\",\"s_version\":\"1.5.0\",\"fk_i_item_id\":\"143\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 10:50:11\",\"s_comment\":\"Initial community release\"},\"CQMi0syigvUJXxnpoVrW\":{\"s_product_key\":\"CQMi0syigvUJXxnpoVrW\",\"s_version\":\"3.4.1\",\"fk_i_item_id\":\"144\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-26 16:36:46\",\"s_comment\":\"Improvements related to tables and models, so it\'s easier to install &amp; reinstall plugin.\"},\"RvR9IqCQA0IVv57n7PFx\":{\"s_product_key\":\"RvR9IqCQA0IVv57n7PFx\",\"s_version\":\"2.0.1\",\"fk_i_item_id\":\"145\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-05-10 14:06:36\",\"s_comment\":\"Fixed bug after installation when plugin was not creating own folder in Osclass uploads folder.\"},\"TyVlD2EuU0zqZ6pKXSC9\":{\"s_product_key\":\"TyVlD2EuU0zqZ6pKXSC9\",\"s_version\":\"3.4.2\",\"fk_i_item_id\":\"146\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-26 16:36:54\",\"s_comment\":\"Improvements related to tables and models, so it\'s easier to install &amp; reinstall plugin.\"},\"9xLZ82VNsdC2cPp14iZh\":{\"s_product_key\":\"9xLZ82VNsdC2cPp14iZh\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"147\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:00:49\",\"s_comment\":\"Initial community release\"},\"MC7C2ERpzFNp4rfv0RJd\":{\"s_product_key\":\"MC7C2ERpzFNp4rfv0RJd\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"148\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:02:31\",\"s_comment\":\"Initial community release\"},\"pcMdYfykmrM4pJJeSOiP\":{\"s_product_key\":\"pcMdYfykmrM4pJJeSOiP\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"149\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:04:13\",\"s_comment\":\"Initial community release\"},\"bmCSP5oQ3V8ku20vmOyI\":{\"s_product_key\":\"bmCSP5oQ3V8ku20vmOyI\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"150\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:05:56\",\"s_comment\":\"Initial community release\"},\"vaqhSSRVtwzmb9BN8qxU\":{\"s_product_key\":\"vaqhSSRVtwzmb9BN8qxU\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"151\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:07:23\",\"s_comment\":\"Initial community release\"},\"AmqMvlVTHcXZrgiKnpIy\":{\"s_product_key\":\"AmqMvlVTHcXZrgiKnpIy\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"152\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:10:45\",\"s_comment\":\"Initial community release\"},\"DS9mru7ri7zFBwdxxzQW\":{\"s_product_key\":\"DS9mru7ri7zFBwdxxzQW\",\"s_version\":\"1.1.1\",\"fk_i_item_id\":\"153\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-16 10:08:30\",\"s_comment\":\"Improvements and fixes.\"},\"jqgduyDOa2J0kzgo2ffP\":{\"s_product_key\":\"jqgduyDOa2J0kzgo2ffP\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"154\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:28:56\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"T2gBQVBvOci6YdA0nNeR\":{\"s_product_key\":\"T2gBQVBvOci6YdA0nNeR\",\"s_version\":\"1.3.0\",\"fk_i_item_id\":\"155\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:37:16\",\"s_comment\":\"Initial community release\"},\"6E9ulx5fwCskM8GIcSMI\":{\"s_product_key\":\"6E9ulx5fwCskM8GIcSMI\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"156\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:39:21\",\"s_comment\":\"Initial community release\"},\"bgX4ETvrv6sIfluntcwz\":{\"s_product_key\":\"bgX4ETvrv6sIfluntcwz\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"157\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:41:06\",\"s_comment\":\"Initial community release\"},\"bct0VBUQPl1Po88uVapn\":{\"s_product_key\":\"bct0VBUQPl1Po88uVapn\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"158\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-19 14:29:47\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"MBIDRCC1jT1QPPJgZArG\":{\"s_product_key\":\"MBIDRCC1jT1QPPJgZArG\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"159\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2020-11-18 11:44:15\",\"s_comment\":\"Initial community release\"},\"RINzxtWvLYhfYdW82FDH\":{\"s_product_key\":\"RINzxtWvLYhfYdW82FDH\",\"s_version\":\"3.4.0\",\"fk_i_item_id\":\"160\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 13:52:15\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"Y4hZSdyb3dNx8T2K0gvx\":{\"s_product_key\":\"Y4hZSdyb3dNx8T2K0gvx\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"161\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:05:32\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"qgTeAeNLqsFydH18uuCD\":{\"s_product_key\":\"qgTeAeNLqsFydH18uuCD\",\"s_version\":\"3.2.0\",\"fk_i_item_id\":\"162\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:07:26\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"FjEXeR0nxc8SN0nbZEcQ\":{\"s_product_key\":\"FjEXeR0nxc8SN0nbZEcQ\",\"s_version\":\"2.6.0\",\"fk_i_item_id\":\"163\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:08:53\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"ClGjGODvxFtx58pACZew\":{\"s_product_key\":\"ClGjGODvxFtx58pACZew\",\"s_version\":\"2.3.0\",\"fk_i_item_id\":\"164\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:10:35\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"3jyU3nm1Rtj54fdGQ5h9\":{\"s_product_key\":\"3jyU3nm1Rtj54fdGQ5h9\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"165\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:12:32\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"5EU0g0p9MPYAWAiFDXRa\":{\"s_product_key\":\"5EU0g0p9MPYAWAiFDXRa\",\"s_version\":\"1.4.0\",\"fk_i_item_id\":\"166\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:15:31\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"BV5DvGrgtOg2GsfBdFak\":{\"s_product_key\":\"BV5DvGrgtOg2GsfBdFak\",\"s_version\":\"1.5.0\",\"fk_i_item_id\":\"167\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-01-18 14:25:25\",\"s_comment\":\"PHP 8.0 compatibility update, additional minor fixes\"},\"oPs2Gjn9C8GS86JspY2R\":{\"s_product_key\":\"oPs2Gjn9C8GS86JspY2R\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"168\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-05-30 08:49:42\",\"s_comment\":\"Major update: User counts revalidated.\\nAdmin can now select what kind of listings are counted to user listing count (active\\/enabled\\/spam\\/expired).\"},\"EIvSTp3NyIdV6Dto1Qhx\":{\"s_product_key\":\"EIvSTp3NyIdV6Dto1Qhx\",\"s_version\":\"1.0.8\",\"fk_i_item_id\":\"169\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-02-06 13:41:07\",\"s_comment\":\"It is now possible to hook \\\"FAQ\\\" button\\/link to header from backoffice, using Osclass hooks 8.2\"},\"L3IN81p4BJP0UU4pc0Xk\":{\"s_product_key\":\"L3IN81p4BJP0UU4pc0Xk\",\"s_version\":\"1.6.3\",\"fk_i_item_id\":\"170\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-21 09:34:22\",\"s_comment\":\"Updated doctype at start of html document.\\nRefactored user items url, now supports \\\"sItemType\\\" parameter natively and works much better with Osclass 8.3+\"},\"qcj6opM6HtKfMtlsbAdv\":{\"s_product_key\":\"qcj6opM6HtKfMtlsbAdv\",\"s_version\":\"1.1.5\",\"fk_i_item_id\":\"171\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-03-03 10:45:29\",\"s_comment\":\"New messages when follow\\/unfollow button is hit and subscribe option enabled (when new alert is created with follow and alert is deactivated with unfollow).\\nUser is now aware that alert has been created and where to manage it.\"},\"KFHwr9v7MXDv8z7Gaxqf\":{\"s_product_key\":\"KFHwr9v7MXDv8z7Gaxqf\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"173\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:06:31\",\"s_comment\":\"Changes in license and terms of use.\"},\"5sGWW11Q4k2ZPOiLKmbH\":{\"s_product_key\":\"5sGWW11Q4k2ZPOiLKmbH\",\"s_version\":\"1.0.7\",\"fk_i_item_id\":\"174\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-09 21:33:04\",\"s_comment\":\"Fixed bug with price formatting.\"},\"4Ru93z0aGeUifioD2FZF\":{\"s_product_key\":\"4Ru93z0aGeUifioD2FZF\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"175\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2021-10-25 08:04:52\",\"s_comment\":\"Initial Plugin Release\"},\"aCwcTb5tF8XHaOLMIrjB\":{\"s_product_key\":\"aCwcTb5tF8XHaOLMIrjB\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"176\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-27 22:12:09\",\"s_comment\":\"Updated instructions\"},\"nqygcFAScb360OQIyr5L\":{\"s_product_key\":\"nqygcFAScb360OQIyr5L\",\"s_version\":\"1.1.3\",\"fk_i_item_id\":\"177\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-02 14:29:20\",\"s_comment\":\"Plugin now support option to remove original (jpg\\/png\\/gif) image once webp image has been generated.\\nUse with care, test well before using in production! \\nThis setting has no impact on existing images.\"},\"FxBSA3UNkXmCsJ5Rk5h2\":{\"s_product_key\":\"FxBSA3UNkXmCsJ5Rk5h2\",\"s_version\":\"1.0.6\",\"fk_i_item_id\":\"178\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-07-26 08:52:59\",\"s_comment\":\"Fixed few small bugs.\"},\"vliNRyxVet2OKwvL6b9L\":{\"s_product_key\":\"vliNRyxVet2OKwvL6b9L\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"179\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-02-24 21:11:43\",\"s_comment\":\"Fixed bug that caused to show views counter on other than item pages.\"},\"DxMMDzXC3d39tvALXnGE\":{\"s_product_key\":\"DxMMDzXC3d39tvALXnGE\",\"s_version\":\"1.0.6\",\"fk_i_item_id\":\"180\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-10-28 09:29:22\",\"s_comment\":\"PHP notices bug fix.\"},\"dI2zdwnHWj1TnMldUVji\":{\"s_product_key\":\"dI2zdwnHWj1TnMldUVji\",\"s_version\":\"1.0.4\",\"fk_i_item_id\":\"181\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2022-05-03 10:36:24\",\"s_comment\":\"Improved coordination with Anti-Spam plugin.\"},\"bieyVwillf6RUKpr4hav\":{\"s_product_key\":\"bieyVwillf6RUKpr4hav\",\"s_version\":\"1.1.2\",\"fk_i_item_id\":\"182\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:21:11\",\"s_comment\":\"Updates in license and terms of use.\"},\"xQFfpbyJt23FfLDCWz92\":{\"s_product_key\":\"xQFfpbyJt23FfLDCWz92\",\"s_version\":\"1.0.1\",\"fk_i_item_id\":\"183\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-03-02 13:15:03\",\"s_comment\":\"Important: Native RTL support added directly to plugin (will not be part of themes anymore).\\nTo identify RTL text direction, plugin detects if \\\"dir\\\" attribute on \\\"html\\\" tag is set to \\\"rtl\\\" (html[dir=\\\"rtl\\\"]).\"},\"viI5pwIYUEk2IpfpZc40\":{\"s_product_key\":\"viI5pwIYUEk2IpfpZc40\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"184\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-11-25 12:12:26\",\"s_comment\":\"Added demo mode configuration parameter (instead of setting it via constant).\"},\"8SJ2E17vwNNdd27OqJOC\":{\"s_product_key\":\"8SJ2E17vwNNdd27OqJOC\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"185\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-12-20 08:49:54\",\"s_comment\":\"Many improvements and fixes, especially with listings in search page.\"},\"IM1Ebj5mSpL1XNFeY7ua\":{\"s_product_key\":\"IM1Ebj5mSpL1XNFeY7ua\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"186\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-13 22:38:20\",\"s_comment\":\"Minor enhancements.\"},\"IDzeo3EbACMp7NXeb0DA\":{\"s_product_key\":\"IDzeo3EbACMp7NXeb0DA\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"187\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2022-01-20 12:13:55\",\"s_comment\":\"Initial plugin release\"},\"QWwL6TbKi4DGf2FyZwtl\":{\"s_product_key\":\"QWwL6TbKi4DGf2FyZwtl\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"188\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-09-27 13:58:36\",\"s_comment\":\"Fixed bug when whatsapp button was visible without user consent (if consent required).\"},\"6uQYzb4Kp3cXe89y2ibc\":{\"s_product_key\":\"6uQYzb4Kp3cXe89y2ibc\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"189\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-04-17 14:43:09\",\"s_comment\":\"Fixed error in backoffice when no permissions selected.\"},\"MMkXbbeY5D6uh3q48CZC\":{\"s_product_key\":\"MMkXbbeY5D6uh3q48CZC\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"190\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-10-04 15:34:19\",\"s_comment\":\"Fixed notification about future expiration.\"},\"HE1EllKqHtiACmhK5Idt\":{\"s_product_key\":\"HE1EllKqHtiACmhK5Idt\",\"s_version\":\"1.1.3\",\"fk_i_item_id\":\"191\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-08-22 09:50:09\",\"s_comment\":\"Updated steps required to correct CSS on Zeta theme.\"},\"CUZuRRxIiooPd46TbQFo\":{\"s_product_key\":\"CUZuRRxIiooPd46TbQFo\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"192\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-02 18:55:26\",\"s_comment\":\"Correction of display property in backoffice into \\\"minimal-ui\\\".\"},\"n821LlcdX8vUdHSGTD3o\":{\"s_product_key\":\"n821LlcdX8vUdHSGTD3o\",\"s_version\":\"1.2.0\",\"fk_i_item_id\":\"193\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-01-30 13:24:31\",\"s_comment\":\"Fixed PHP 8.0 and PHP 8.1 error notices.\"},\"hX0HiVY277mEhGiFJcr1\":{\"s_product_key\":\"hX0HiVY277mEhGiFJcr1\",\"s_version\":\"1.6.8\",\"fk_i_item_id\":\"194\",\"s_osc_version_from\":\"8.0.1\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-21 09:34:11\",\"s_comment\":\"Updated doctype at start of html document.\\nRefactored user items url, now supports \\\"sItemType\\\" parameter natively and works much better with Osclass 8.3+\"},\"3xmnFPXCUQlVFXlvIWHl\":{\"s_product_key\":\"3xmnFPXCUQlVFXlvIWHl\",\"s_version\":\"1.1.4\",\"fk_i_item_id\":\"195\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-19 14:47:48\",\"s_comment\":\"Fix possible misconfiguration when generating items sitemap and splitting these.\"},\"NHXRYmx3R3XbvXyOAZsB\":{\"s_product_key\":\"NHXRYmx3R3XbvXyOAZsB\",\"s_version\":\"1.0.6\",\"fk_i_item_id\":\"196\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-10-03 14:42:23\",\"s_comment\":\"Added new feature to cleanup old item versions and moderations records after XY months by cron.\"},\"2moprwc8UrGgUcSiWF2z\":{\"s_product_key\":\"2moprwc8UrGgUcSiWF2z\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"197\",\"s_osc_version_from\":\"4.1.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-01-25 15:23:01\",\"s_comment\":\"Initial plugin release\"},\"pTVnP2nGEyjqdFb2gbkg\":{\"s_product_key\":\"pTVnP2nGEyjqdFb2gbkg\",\"s_version\":\"1.1.2\",\"fk_i_item_id\":\"198\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-09-28 21:40:57\",\"s_comment\":\"Fixed bug when protection html was printed to title\\/desc on item publish page.\"},\"5q2aJafwuq05tRrsu8Yr\":{\"s_product_key\":\"5q2aJafwuq05tRrsu8Yr\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"199\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-02-09 13:52:45\",\"s_comment\":\"Initial plugin release\"},\"c7cq9Kdxlfn8tHIGjKvN\":{\"s_product_key\":\"c7cq9Kdxlfn8tHIGjKvN\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"200\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-05-22 09:50:44\",\"s_comment\":\"Added explicit library for PHP 8.0 to have more compatibility with other plugins using guzzle reference.\"},\"csFubIxcfbZTXbuw18p9\":{\"s_product_key\":\"csFubIxcfbZTXbuw18p9\",\"s_version\":\"1.0.5\",\"fk_i_item_id\":\"201\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-03-13 08:42:51\",\"s_comment\":\"Added FJL_DEBUG constant in index.php that can be set to true to enable much detailed debugging and logging options.\"},\"pCzOOuWBXQFWGNRI7Kne\":{\"s_product_key\":\"pCzOOuWBXQFWGNRI7Kne\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"202\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-29 11:13:56\",\"s_comment\":\"Updates in license and terms of use.\"},\"VG11Nrw5X3jZPyoxppql\":{\"s_product_key\":\"VG11Nrw5X3jZPyoxppql\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"203\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-23 12:23:29\",\"s_comment\":\"All SKD updated to latest versions.\\nNow supporting PHP 8.1 - 8.4 as well.\"},\"NUlRMO8bvmXqIKfArmNK\":{\"s_product_key\":\"NUlRMO8bvmXqIKfArmNK\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"204\",\"s_osc_version_from\":\"8.0.1\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-07-26 08:48:42\",\"s_comment\":\"Corrected small error notices in plugin.\"},\"5vkOOrMEUgMI7oIXC7Rx\":{\"s_product_key\":\"5vkOOrMEUgMI7oIXC7Rx\",\"s_version\":\"1.0.1\",\"fk_i_item_id\":\"205\",\"s_osc_version_from\":\"8.1.2\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2023-05-24 11:33:50\",\"s_comment\":\"Initial plugin release\"},\"qXKlQjNcExf2gFAg0mQp\":{\"s_product_key\":\"qXKlQjNcExf2gFAg0mQp\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"206\",\"s_osc_version_from\":\"4.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-10 22:37:50\",\"s_comment\":\"Important fix to avoid duplicated white spaces in meta tags.\"},\"d6eKxZFWoEKilojuNNfS\":{\"s_product_key\":\"d6eKxZFWoEKilojuNNfS\",\"s_version\":\"1.2.9\",\"fk_i_item_id\":\"207\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-03-27 13:59:22\",\"s_comment\":\"Plugin renamed to Ultimate attributes.\"},\"XxvQaXGvjyFkWgO20zYA\":{\"s_product_key\":\"XxvQaXGvjyFkWgO20zYA\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"208\",\"s_osc_version_from\":\"8.2.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-02-12 14:41:03\",\"s_comment\":\"Major update - Huge amount of improvements and fixes.\\nUpdate in terms of usage.\"},\"7AYUry3o2myRpzbzeo4H\":{\"s_product_key\":\"7AYUry3o2myRpzbzeo4H\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"209\",\"s_osc_version_from\":\"8.2.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-01-28 13:33:39\",\"s_comment\":\"Initial plugin release\"},\"fJlBLMtaMjxWU3deX9gN\":{\"s_product_key\":\"fJlBLMtaMjxWU3deX9gN\",\"s_version\":\"1.1.7\",\"fk_i_item_id\":\"210\",\"s_osc_version_from\":\"8.2.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-30 10:11:03\",\"s_comment\":\"Improvements in backoffice.\\nAdded links to manage &amp; show auctions into widget.\\nAdded link to show auction in front into widget (external link icon).\\nUpdated plugin menu and showing links to edit item, show item, edit seller, show seller profile instead of plugin name.\\nAdded link to show front auction into right top menu.\"},\"vA8QTMICDMSgq4OR3c1Z\":{\"s_product_key\":\"vA8QTMICDMSgq4OR3c1Z\",\"s_version\":\"1.0.9\",\"fk_i_item_id\":\"211\",\"s_osc_version_from\":\"8.2\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-04-28 09:36:37\",\"s_comment\":\"Fixed limits on functions in admin dashboard.\"},\"JQzkzI6cvv8BRv3fNE1k\":{\"s_product_key\":\"JQzkzI6cvv8BRv3fNE1k\",\"s_version\":\"1.4.1\",\"fk_i_item_id\":\"212\",\"s_osc_version_from\":\"8.1\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-21 09:33:53\",\"s_comment\":\"Updated doctype at start of html document.\\nRefactored user items url, now supports \\\"sItemType\\\" parameter natively and works much better with Osclass 8.3+\"},\"bygWRReSzszRw1MX9b3J\":{\"s_product_key\":\"bygWRReSzszRw1MX9b3J\",\"s_version\":\"1.0.1\",\"fk_i_item_id\":\"213\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-25 13:22:44\",\"s_comment\":\"Minor changes\"},\"fm7qkCSM0ZNTJB1DsuOA\":{\"s_product_key\":\"fm7qkCSM0ZNTJB1DsuOA\",\"s_version\":\"1.1.1\",\"fk_i_item_id\":\"214\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-06-21 11:36:57\",\"s_comment\":\"Fixed new user creation on v2.1 of SMF (Simple Machines Forum)\"},\"YDIMuRU6f47bV39zEzsx\":{\"s_product_key\":\"YDIMuRU6f47bV39zEzsx\",\"s_version\":\"1.0.4\",\"fk_i_item_id\":\"215\",\"s_osc_version_from\":\"8.2\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-02 13:15:14\",\"s_comment\":\"Fixed user type restriction of custom fields.\"},\"lFOkY3pVwZuaFQUXH2Pc\":{\"s_product_key\":\"lFOkY3pVwZuaFQUXH2Pc\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"216\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-30 11:48:05\",\"s_comment\":\"Plugin now works correctly with 0 decimals as well.\"},\"grmbLnFUovIqBySnTmzI\":{\"s_product_key\":\"grmbLnFUovIqBySnTmzI\",\"s_version\":\"1.0.8\",\"fk_i_item_id\":\"217\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-10-09 10:07:15\",\"s_comment\":\"Fixed bug with incorrect key definitions for cache.\"},\"OVXl4Ul8RNMY3o1nbBvR\":{\"s_product_key\":\"OVXl4Ul8RNMY3o1nbBvR\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"218\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2024-12-21 19:25:32\",\"s_comment\":\"Initial plugin release\"},\"Vc9ueVtA4wD3G3cLFRaE\":{\"s_product_key\":\"Vc9ueVtA4wD3G3cLFRaE\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"219\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-28 14:52:01\",\"s_comment\":\"License udpates.\"},\"4fKv9Gps3l3HFfepHTFr\":{\"s_product_key\":\"4fKv9Gps3l3HFfepHTFr\",\"s_version\":\"1.1.0\",\"fk_i_item_id\":\"220\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-28 14:19:40\",\"s_comment\":\"Fix\"},\"9i4r3utkTxqgkFjyUrVL\":{\"s_product_key\":\"9i4r3utkTxqgkFjyUrVL\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"221\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-01-28 14:15:16\",\"s_comment\":\"Initial release\"},\"TGhEtXq4LFDbr7TfyJGz\":{\"s_product_key\":\"TGhEtXq4LFDbr7TfyJGz\",\"s_version\":\"1.0.1\",\"fk_i_item_id\":\"222\",\"s_osc_version_from\":\"8.2\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-03-05 14:14:00\",\"s_comment\":\"Fixed minor layout and positioning issues on several themes.\"},\"gqjqO0dlv2JlVhFVd1e3\":{\"s_product_key\":\"gqjqO0dlv2JlVhFVd1e3\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"223\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:41:20\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"c8pKvQcW9wpegg47SUnG\":{\"s_product_key\":\"c8pKvQcW9wpegg47SUnG\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"224\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:41:34\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"pwTg9aniaKKHL8BBwlpD\":{\"s_product_key\":\"pwTg9aniaKKHL8BBwlpD\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"225\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:41:48\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"ebh7GbQLUrWK6jowXcbR\":{\"s_product_key\":\"ebh7GbQLUrWK6jowXcbR\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"226\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:42:05\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"uW7myjwgDqWrXMthFvoF\":{\"s_product_key\":\"uW7myjwgDqWrXMthFvoF\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"227\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:42:16\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"bSnhtOLzfE8DH3fg03Ml\":{\"s_product_key\":\"bSnhtOLzfE8DH3fg03Ml\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"228\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:42:25\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"QyCFpFsNwblwEk8s1fJy\":{\"s_product_key\":\"QyCFpFsNwblwEk8s1fJy\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"229\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:42:50\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"QKPw2NXNMRe4XyILfqAm\":{\"s_product_key\":\"QKPw2NXNMRe4XyILfqAm\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"230\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:42:57\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"w63aCCTbefvykRHGvLGo\":{\"s_product_key\":\"w63aCCTbefvykRHGvLGo\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"231\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:11\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"4CSomfZiB5YL0EgCKTmD\":{\"s_product_key\":\"4CSomfZiB5YL0EgCKTmD\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"232\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:23\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"sAt67MeHJTtLE9Jfyofl\":{\"s_product_key\":\"sAt67MeHJTtLE9Jfyofl\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"233\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:31\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"mhZTTw35Uv5rtfWahmMN\":{\"s_product_key\":\"mhZTTw35Uv5rtfWahmMN\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"234\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:40\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"t9J3ADPY8av37my220IQ\":{\"s_product_key\":\"t9J3ADPY8av37my220IQ\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"235\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:51\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"9tw7EX1IPzasvVy4UhrB\":{\"s_product_key\":\"9tw7EX1IPzasvVy4UhrB\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"236\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:43:59\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"0OH1czFP7j1hLYgi3bLg\":{\"s_product_key\":\"0OH1czFP7j1hLYgi3bLg\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"237\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:07\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"lefNCKQT6H0TyZPGB2JI\":{\"s_product_key\":\"lefNCKQT6H0TyZPGB2JI\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"238\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:22\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"OZyWSrarEKapufbGG0aW\":{\"s_product_key\":\"OZyWSrarEKapufbGG0aW\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"239\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:29\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"69VI9VXU7oh3fSK8kOKb\":{\"s_product_key\":\"69VI9VXU7oh3fSK8kOKb\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"240\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:37\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"g8RPOAInlYEcmTSD55Jp\":{\"s_product_key\":\"g8RPOAInlYEcmTSD55Jp\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"241\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:47\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"R4Ll5e3C71XN4jH8hXzO\":{\"s_product_key\":\"R4Ll5e3C71XN4jH8hXzO\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"242\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:44:56\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"fDzvdzyqzPdZF8vwo8gg\":{\"s_product_key\":\"fDzvdzyqzPdZF8vwo8gg\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"243\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:03\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"98X982v5ziD9labhRxWs\":{\"s_product_key\":\"98X982v5ziD9labhRxWs\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"244\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:10\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"Ighbnp9VXxCvRlmoxoyt\":{\"s_product_key\":\"Ighbnp9VXxCvRlmoxoyt\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"245\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:17\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"OQQN43YxEqrZUGvOIZEC\":{\"s_product_key\":\"OQQN43YxEqrZUGvOIZEC\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"246\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:27\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"AwOb8GNM887W0kPzQaYX\":{\"s_product_key\":\"AwOb8GNM887W0kPzQaYX\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"247\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:35\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"y50T0ANfmv1SmnEgnw1M\":{\"s_product_key\":\"y50T0ANfmv1SmnEgnw1M\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"248\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:43\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"PDyUttmQsIdSnOAuFVsh\":{\"s_product_key\":\"PDyUttmQsIdSnOAuFVsh\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"249\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:52\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"47y8bIFPOGVmx2zdImQY\":{\"s_product_key\":\"47y8bIFPOGVmx2zdImQY\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"250\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:45:59\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"WbO64j8oq9nTJ4Febadn\":{\"s_product_key\":\"WbO64j8oq9nTJ4Febadn\",\"s_version\":\"1.0.4\",\"fk_i_item_id\":\"251\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:46:05\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"RA3JXlR86kKsjnzIVIRd\":{\"s_product_key\":\"RA3JXlR86kKsjnzIVIRd\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"252\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:46:17\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"9EHPnVbyThKIlv18qQJv\":{\"s_product_key\":\"9EHPnVbyThKIlv18qQJv\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"253\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:46:32\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"OhJOUeLybS7sxhztXyrU\":{\"s_product_key\":\"OhJOUeLybS7sxhztXyrU\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"254\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:46:40\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"wxwfotsAGbzdwztYLXBQ\":{\"s_product_key\":\"wxwfotsAGbzdwztYLXBQ\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"255\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:46:51\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"5mz7cmOdGlYyi1hF7F3x\":{\"s_product_key\":\"5mz7cmOdGlYyi1hF7F3x\",\"s_version\":\"1.0.6\",\"fk_i_item_id\":\"256\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-16 12:18:42\",\"s_comment\":\"Fixed issue with ambiguity in using transaction id.\"},\"Mb3ldqDDOSG7hodDWXfJ\":{\"s_product_key\":\"Mb3ldqDDOSG7hodDWXfJ\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"257\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:07\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"l5DYZVAudpvt4LzZ4oC5\":{\"s_product_key\":\"l5DYZVAudpvt4LzZ4oC5\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"258\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:17\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"a6TCzOUPAJyr8IyGjYKE\":{\"s_product_key\":\"a6TCzOUPAJyr8IyGjYKE\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"259\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:27\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"rRsFHMvAtVLLw72twujV\":{\"s_product_key\":\"rRsFHMvAtVLLw72twujV\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"260\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:33\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"fPrtEdWPmuY92KCdwFRL\":{\"s_product_key\":\"fPrtEdWPmuY92KCdwFRL\",\"s_version\":\"1.0.3\",\"fk_i_item_id\":\"261\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:43\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"wxIeq0Ht3ymM803jo8vM\":{\"s_product_key\":\"wxIeq0Ht3ymM803jo8vM\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"262\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:47:58\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"wM3pPUU6c30ZpBy7wgS1\":{\"s_product_key\":\"wM3pPUU6c30ZpBy7wgS1\",\"s_version\":\"1.0.2\",\"fk_i_item_id\":\"263\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-10 12:48:07\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"WsKMLaZ92xXmGE7s7KiY\":{\"s_product_key\":\"WsKMLaZ92xXmGE7s7KiY\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"264\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-02 09:14:56\",\"s_comment\":\"Initial service release\"},\"VByiBU5qmrIG8dsOkrA9\":{\"s_product_key\":\"VByiBU5qmrIG8dsOkrA9\",\"s_version\":\"1.0.1\",\"fk_i_item_id\":\"265\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"-\",\"last_update_date\":\"2025-06-10 12:48:16\",\"s_comment\":\"Improved amount retrieval on payment confirmation.\"},\"bVxqTR9d4Ew13OSpK6dC\":{\"s_product_key\":\"bVxqTR9d4Ew13OSpK6dC\",\"s_version\":\"1.1.3\",\"fk_i_item_id\":\"266\",\"s_osc_version_from\":\"8.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-09-30 11:21:19\",\"s_comment\":\"Minor improvements\"},\"aEQ2vc8J9PwQgBy8WfXO\":{\"s_product_key\":\"aEQ2vc8J9PwQgBy8WfXO\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"267\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-25 09:27:39\",\"s_comment\":\"Initial release\"},\"9Rm9q5m3yNxIcj9HFeQ4\":{\"s_product_key\":\"9Rm9q5m3yNxIcj9HFeQ4\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"268\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-06-25 09:38:11\",\"s_comment\":\"Initial release\"},\"UFy5ZRFeVIrvxoIAA9XX\":{\"s_product_key\":\"UFy5ZRFeVIrvxoIAA9XX\",\"s_version\":\"1.0.0\",\"fk_i_item_id\":\"269\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"last_update_date\":\"2025-07-01 13:04:40\",\"s_comment\":\"Initial plugin release\"}}}', 'STRING');
INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('osclass', 'maxLatestItems@home', '12', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '4096', 'INTEGER'),
('osclass', 'mod_rewrite_loaded', '0', 'BOOLEAN'),
('osclass', 'moderate_comments', '-1', 'STRING'),
('osclass', 'moderate_items', '-1', 'STRING'),
('osclass', 'notify_contact_friends', '1', 'STRING'),
('osclass', 'notify_contact_item', '1', 'STRING'),
('osclass', 'notify_new_comment', '1', 'STRING'),
('osclass', 'notify_new_comment_reply', '0', 'STRING'),
('osclass', 'notify_new_comment_reply_user', '0', 'STRING'),
('osclass', 'notify_new_comment_user', '0', 'STRING'),
('osclass', 'notify_new_item', '1', 'STRING'),
('osclass', 'notify_new_user', '1', 'STRING'),
('osclass', 'num_category_levels', '4', 'STRING'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'numImages@items', '30', 'STRING'),
('osclass', 'optimize_uploaded_images', '1', 'BOOLEAN'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'osclasspoint_api_key', '', 'STRING'),
('osclass', 'pageDesc', '', 'STRING'),
('osclass', 'pageTitle', 'Unistart', 'STRING'),
('osclass', 'ping_search_engines', '0', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '[]', 'STRING'),
('osclass', 'plugins_last_version_check', '1761819117', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'profile_picture_library', 'UPPY', 'STRING'),
('osclass', 'purge_latest_searches', '1000', 'STRING'),
('osclass', 'recaptcha_version', '2', 'STRING'),
('osclass', 'recaptchaEnabled', '0', 'BOOLEAN'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'STRING'),
('osclass', 'reg_user_can_see_phone', '0', 'STRING'),
('osclass', 'reg_user_post', '1', 'STRING'),
('osclass', 'reg_user_post_comments', '1', 'STRING'),
('osclass', 'regenerate_image_data', '', 'STRING'),
('osclass', 'renewal_limit', '0', 'STRING'),
('osclass', 'renewal_update_pub_date', '0', 'STRING'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_deactivate', 'item/deactivate', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_renew', 'item/renew', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}-i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', '', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_custom_rules_enabled', '0', 'BOOLEAN'),
('osclass', 'rewrite_search_custom_rules_strict', '1', 'BOOLEAN'),
('osclass', 'rewrite_search_order', 'order', 'STRING'),
('osclass', 'rewrite_search_order_by_expiration', 'expiration', 'STRING'),
('osclass', 'rewrite_search_order_by_price', 'price', 'STRING'),
('osclass', 'rewrite_search_order_by_pub_date', 'pub-date', 'STRING'),
('osclass', 'rewrite_search_order_by_rating', 'rating', 'STRING'),
('osclass', 'rewrite_search_order_by_relevance', 'relevance', 'STRING'),
('osclass', 'rewrite_search_order_type', 'sort', 'STRING'),
('osclass', 'rewrite_search_page_number', 'pn', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_premium_only', 'premium-only', 'STRING'),
('osclass', 'rewrite_search_price_max', 'price-max', 'STRING'),
('osclass', 'rewrite_search_price_min', 'price-min', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_show_as', 'view', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_search_with_phone', 'with-phone', 'STRING'),
('osclass', 'rewrite_search_with_picture', 'with-picture', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'rewriteEnabled', '0', 'BOOLEAN'),
('osclass', 'save_latest_searches', '0', 'BOOLEAN'),
('osclass', 'search_pattern_locale', '0', 'STRING'),
('osclass', 'search_pattern_method', '', 'STRING'),
('osclass', 'selectable_parent_categories', '1', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'structured_data', '0', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_landing', '0', 'BOOLEAN'),
('osclass', 'subdomain_language_slug_type', '', 'STRING'),
('osclass', 'subdomain_redirect', '0', 'BOOLEAN'),
('osclass', 'subdomain_restricted_ids', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'dreamfree', 'STRING'),
('osclass', 'themes_downloaded', '{\"1\":\"LNlXIJmlaVMAICJ7o728\"}', 'STRING'),
('osclass', 'themes_last_version_check', '1761819117', 'STRING'),
('osclass', 'themes_to_update', '[]', 'STRING'),
('osclass', 'themes_update_count', '0', 'STRING'),
('osclass', 'timeFormat', 'H:i', 'STRING'),
('osclass', 'timezone', 'Africa/Cairo', 'STRING'),
('osclass', 'title_character_length', '100', 'STRING'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'update_include_occontent', '0', 'STRING'),
('osclass', 'use_imagick', '0', 'BOOLEAN'),
('osclass', 'user_public_profile_enabled', 'ALL', 'STRING'),
('osclass', 'user_public_profile_min_items', '0', 'STRING'),
('osclass', 'username_blacklist', 'admin,user', 'STRING'),
('osclass', 'username_generator', 'ID', 'STRING'),
('osclass', 'version', '830', 'INTEGER'),
('osclass', 'warn_expiration', '0', 'STRING'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'web_contact_form_disabled', '0', 'STRING'),
('osclass', 'weekStart', '0', 'STRING'),
('osclass', 'widget_data_api', '', 'STRING'),
('osclass', 'widget_data_blog', '{\"date\":\"2025-10-28 19:25:55\",\"data\":[{\"id\":\"45\",\"slug\":\"osclass-83-released-full-php-84-support-major-performance-upgrades--advanced-search-features\",\"image\":\"https:\\/\\/osclasspoint.com\\/oc-content\\/plugins\\/blog\\/img\\/blog\\/45.jpg\",\"category_id\":\"1\",\"views\":\"3234\",\"pub_date\":\"2025-06-04 00:00:00\",\"title\":\"Osclass 8.3 Released: Full PHP 8.4 Support, Major Performance Upgrades &amp; Advanced Search Features\",\"subtitle\":\"Osclass 8.3 is the most advanced release yet, delivering full PHP 8.3 and 8.4 compatibility, major speed improvements, and cleaner, SEO-friendly search URLs. With smarter caching, user listing filters, action logging, and full emoji support, this update makes managing and scaling your classifieds site faster and easier than ever.\",\"description\":\"Osclass 8.3 Released: Full PHP 8.4 Support, Major Performance Upgrades &amp; Advanced Search Features Osclass 8.3 is a landmark release that delivers powerful enhancements for both performance and customization. It introduces full compatibility with PHP 8.3 and 8.4, redesigned search URL logic, deep database optimizations, user filtering options, and extensive backend improvements. Whether you run a small classifieds site or a large directory, this update offers increased speed, flexibility, and...\",\"short_description\":\"Osclass 8.3 is the most advanced release yet, delivering full PHP 8.3 and 8.4 compatibility, major speed improvements, and cleaner, SEO-friendly search URLs. With smarter caching, user listing filters, action logging, and full emoji support, this update makes managing and scaling your classifieds site faster and easier than ever.\",\"link\":\"https:\\/\\/osclasspoint.com\\/blog\\/osclass-83-released-full-php-84-support-major-performance-upgrades-advanced-search-features-b45\"},{\"id\":\"44\",\"slug\":\"osclass-pay-plugin-major-changes\",\"image\":\"https:\\/\\/osclasspoint.com\\/oc-content\\/plugins\\/blog\\/img\\/blog\\/44.png\",\"category_id\":\"3\",\"views\":\"4765\",\"pub_date\":\"2025-05-28 00:00:00\",\"title\":\"Osclass Pay Plugin - Gateways separation\",\"subtitle\":\"Plugin will be redesigned, gateways will now be delivered as separate plugins\",\"description\":\"Dear community! Let me share news regarding Osclass Pay Plugin and upcoming changes. Osclass Pay is most comlplex plugin created for Osclass, that brings a lot of various features how to monetize your website. Besides that, in order to be able to manage and accept payments, it also implement payment gateway interface - communication layer between plugin and payment gateway like Paypal, Stripe, Authorize.net etc. In next update v4.1, plugin will no more implement payment gateway interfaces with e...\",\"short_description\":\"Plugin will be redesigned, gateways will now be delivered as separate plugins\",\"link\":\"https:\\/\\/osclasspoint.com\\/blog\\/osclass-pay-plugin-major-changes-b44\"},{\"id\":\"43\",\"slug\":\"seo-classifieds-marketplace-plugin-pro\",\"image\":\"https:\\/\\/osclasspoint.com\\/oc-content\\/plugins\\/blog\\/img\\/blog\\/43.png\",\"category_id\":\"3\",\"views\":\"12768\",\"pub_date\":\"2023-07-18 00:00:00\",\"title\":\"Seo PRO Classifieds Plugin\",\"subtitle\":\"Professional solution to fine-tune meta tags on Osclass classifieds website\",\"description\":\"Seo PRO Plugin helps to manage meta title, description and \\\"Seo text\\\" on your website with ease, create unique tags those attract customers and customize tags for specific combination of parameters (ie. one city on search). This article is focused to explain how to work with plugin and understand it\'s features. It will be updated based on questions from customers. \\u00a0 Search page tags - what they means and how they works There are many tabs on Search page those specify current location of user. Pl...\",\"short_description\":\"Professional solution to fine-tune meta tags on Osclass classifieds website\",\"link\":\"https:\\/\\/osclasspoint.com\\/blog\\/seo-classifieds-marketplace-plugin-pro-b43\"},{\"id\":\"42\",\"slug\":\"osclass-810-major-release-2023\",\"image\":\"https:\\/\\/osclasspoint.com\\/oc-content\\/plugins\\/blog\\/img\\/blog\\/42.jpg\",\"category_id\":\"1\",\"views\":\"33275\",\"pub_date\":\"2023-01-13 00:00:00\",\"title\":\"Osclass 8.1.0 Major Release - 2023 Classifieds Update\",\"subtitle\":\"We\'ve been hardly working almost year to bring Osclass into next level. Listened community, read forums, checked emails and always there was great idea, implemented this into Osclass. Our goal was to make Osclass classifieds script easier to use, easier to configure, turn partial solution into full-scope enterprise features.\",\"description\":\"Next level classifieds software Last year was extremely hard, as there has been a lot going on in the world, extreme price rising, problems to find developers, war, ... Even it was complicated, our team is bringing you super huge update that not only fix minor issues, but integrates most wanted features ever requested by community, improvements in cache, documentation updates, removal of useless features and more and more and more... We will only review most important features, full list is in c...\",\"short_description\":\"We\'ve been hardly working almost year to bring Osclass into next level. Listened community, read forums, checked emails and always there was great idea, implemented this into Osclass. Our goal was to make Osclass classifieds script easier to use, easier to configure, turn partial solution into full-scope enterprise features.\",\"link\":\"https:\\/\\/osclasspoint.com\\/blog\\/osclass-810-major-release-2023-b42\"},{\"id\":\"41\",\"slug\":\"osclass-802-update\",\"image\":\"https:\\/\\/osclasspoint.com\\/oc-content\\/plugins\\/blog\\/img\\/blog\\/41.jpg\",\"category_id\":\"1\",\"views\":\"31372\",\"pub_date\":\"2022-05-05 00:00:00\",\"title\":\"Osclass 8.0.2 major release\",\"subtitle\":\"Latest update brings speed enhancements, security updates as well as new features. \",\"description\":\"Osclass 8.0.2 review May osclass update comes after several months of work and follow continuous improvements from 8.0.1. Today we will do just quick summary to avoid long stories :-) Download Osclass 8.0.2 Upsert function support New function has been added into core that greatly helps developers to update or insert data into database without need to explicitly check if record already exists in table Image canvas background It is possible now to change canvas background for media and can be swi...\",\"short_description\":\"Latest update brings speed enhancements, security updates as well as new features. \",\"link\":\"https:\\/\\/osclasspoint.com\\/blog\\/osclass-802-update-b41\"}]}', 'STRING'),
('osclass', 'widget_data_product', '{\"date\":\"2025-10-28 19:25:56\",\"data\":{\"UFy5ZRFeVIrvxoIAA9XX\":{\"pk_i_id\":\"269\",\"s_title\":\"Paypal Advanced Checkout - Payment Gateway Integration Plugin\",\"s_contact_name\":\"MB Themes\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/osclass-plugins\\/payments-and-shopping\\/paypal-advanced-checkout-payment-gateway-integration-plugin-i269\",\"s_thumbnail_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1229_thumbnail.jpg\",\"s_preview_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1229_preview.jpg\",\"s_large_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1229.jpg\",\"s_description\":\"PayPal Advanced Checkout is a powerful and modern payment gateway solution built on PayPal&rsquo;s latest REST API, designed to provide a seamless, secure, and customizable checkout experience. It allows buyers to complete one-time payments...\",\"dt_pub_date\":\"2025-07-01 13:04:37\",\"i_category_id\":\"98\",\"s_category_name\":\"Payments and Shopping\",\"i_price\":\"19.99\",\"i_price_extend\":\"7.00\",\"d_extend_percent\":\"0.35\",\"b_purchased\":0,\"b_expired\":0,\"s_purchase_url\":\"https:\\/\\/osclasspoint.com\\/osclasspay\\/updatecart\\/1101x1x269x19.99\",\"s_download_url\":\"https:\\/\\/osclasspoint.com\\/download\\/269\",\"i_download\":\"2\",\"i_order\":\"1\",\"i_rating\":\"0.0\",\"i_rating_count\":\"0\",\"i_version\":\"1.0.0\",\"i_osc_version_from\":\"3.0\",\"i_osc_version_to\":\"\",\"dt_update_date\":\"2025-07-01 13:04:40\",\"s_product_key\":\"UFy5ZRFeVIrvxoIAA9XX\",\"s_update_comment\":\"Initial plugin release\",\"theme_type\":\"\",\"type\":\"plugin\"},\"bVxqTR9d4Ew13OSpK6dC\":{\"pk_i_id\":\"266\",\"s_title\":\"Wall Chat & Microfeed Plugin\",\"s_contact_name\":\"MB Themes\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/osclass-plugins\\/messaging-and-communication\\/wall-chat-microfeed-plugin-i266\",\"s_thumbnail_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1216_thumbnail.jpg\",\"s_preview_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1216_preview.jpg\",\"s_large_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1216.jpg\",\"s_description\":\"The Wall Chat &amp; Microfeed Plugin enables you to add a real-time, AJAX-powered public communication system to your Osclass website. This plugin is ideal for sites that need a fast and lightweight way to share brief updates, quick message...\",\"dt_pub_date\":\"2025-06-20 11:15:49\",\"i_category_id\":\"100\",\"s_category_name\":\"Messaging and Communication\",\"i_price\":\"19.99\",\"i_price_extend\":\"7.00\",\"d_extend_percent\":\"0.35\",\"b_purchased\":0,\"b_expired\":0,\"s_purchase_url\":\"https:\\/\\/osclasspoint.com\\/osclasspay\\/updatecart\\/1101x1x266x19.99\",\"s_download_url\":\"https:\\/\\/osclasspoint.com\\/download\\/266\",\"i_download\":\"27\",\"i_order\":\"7\",\"i_rating\":\"0.0\",\"i_rating_count\":\"0\",\"i_version\":\"1.1.3\",\"i_osc_version_from\":\"8.0\",\"i_osc_version_to\":\"\",\"dt_update_date\":\"2025-09-30 11:21:19\",\"s_product_key\":\"bVxqTR9d4Ew13OSpK6dC\",\"s_update_comment\":\"Minor improvements\",\"theme_type\":\"\",\"type\":\"plugin\"},\"VByiBU5qmrIG8dsOkrA9\":{\"pk_i_id\":\"265\",\"s_title\":\"FedaPay - Payment Gateway Integration Plugin\",\"s_contact_name\":\"MB Themes\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/osclass-plugins\\/payments-and-shopping\\/fedapay-payment-gateway-integration-plugin-i265\",\"s_thumbnail_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1215_thumbnail.jpg\",\"s_preview_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1215_preview.jpg\",\"s_large_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1215.jpg\",\"s_description\":\"FedaPay is a digital payment gateway designed to simplify online transactions across West Africa. It enables businesses, NGOs, and freelancers to accept secure one-time payments through various methods, including bank cards and mobile money...\",\"dt_pub_date\":\"2025-06-09 22:15:34\",\"i_category_id\":\"98\",\"s_category_name\":\"Payments and Shopping\",\"i_price\":\"19.99\",\"i_price_extend\":\"7.00\",\"d_extend_percent\":\"0.35\",\"b_purchased\":0,\"b_expired\":0,\"s_purchase_url\":\"https:\\/\\/osclasspoint.com\\/osclasspay\\/updatecart\\/1101x1x265x19.99\",\"s_download_url\":\"https:\\/\\/osclasspoint.com\\/download\\/265\",\"i_download\":\"3\",\"i_order\":\"1\",\"i_rating\":\"0.0\",\"i_rating_count\":\"0\",\"i_version\":\"1.0.1\",\"i_osc_version_from\":\"3.0\",\"i_osc_version_to\":\"-\",\"dt_update_date\":\"2025-06-10 12:48:16\",\"s_product_key\":\"VByiBU5qmrIG8dsOkrA9\",\"s_update_comment\":\"Improved amount retrieval on payment confirmation.\",\"theme_type\":\"\",\"type\":\"plugin\"},\"wM3pPUU6c30ZpBy7wgS1\":{\"pk_i_id\":\"263\",\"s_title\":\"Mercado Pago - Payment Gateway Integration Plugin\",\"s_contact_name\":\"MB Themes\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/osclass-plugins\\/payments-and-shopping\\/mercado-pago-payment-gateway-integration-plugin-i263\",\"s_thumbnail_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1213_thumbnail.jpg\",\"s_preview_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1213_preview.jpg\",\"s_large_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1213.jpg\",\"s_description\":\"Mercado Pago is a widely used digital payment gateway in Latin America, offering a secure and flexible solution for online and offline transactions. It supports a variety of local payment methods, including cards, bank transfers, and cash-b...\",\"dt_pub_date\":\"2025-05-31 22:11:48\",\"i_category_id\":\"98\",\"s_category_name\":\"Payments and Shopping\",\"i_price\":\"19.99\",\"i_price_extend\":\"7.00\",\"d_extend_percent\":\"0.35\",\"b_purchased\":0,\"b_expired\":0,\"s_purchase_url\":\"https:\\/\\/osclasspoint.com\\/osclasspay\\/updatecart\\/1101x1x263x19.99\",\"s_download_url\":\"https:\\/\\/osclasspoint.com\\/download\\/263\",\"i_download\":\"21\",\"i_order\":\"7\",\"i_rating\":\"0.0\",\"i_rating_count\":\"0\",\"i_version\":\"1.0.2\",\"i_osc_version_from\":\"3.0\",\"i_osc_version_to\":\"\",\"dt_update_date\":\"2025-06-10 12:48:07\",\"s_product_key\":\"wM3pPUU6c30ZpBy7wgS1\",\"s_update_comment\":\"Improved amount retrieval on payment confirmation.\",\"theme_type\":\"\",\"type\":\"plugin\"},\"wxIeq0Ht3ymM803jo8vM\":{\"pk_i_id\":\"262\",\"s_title\":\"YooKassa (YooMoney) - Payment Gateway Integration Plugin\",\"s_contact_name\":\"MB Themes\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/osclass-plugins\\/payments-and-shopping\\/yookassa-yoomoney-payment-gateway-integration-plugin-i262\",\"s_thumbnail_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1212_thumbnail.jpg\",\"s_preview_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1212_preview.jpg\",\"s_large_url\":\"https:\\/\\/static-d761.kxcdn.com\\/oc-content\\/uploads\\/2\\/1212.jpg\",\"s_description\":\"YooKassa is a versatile and secure payment gateway designed to simplify online transactions, especially for businesses operating in Russia and neighboring countries. It supports a wide range of local and international payment methods, offer...\",\"dt_pub_date\":\"2025-05-30 16:04:25\",\"i_category_id\":\"98\",\"s_category_name\":\"Payments and Shopping\",\"i_price\":\"19.99\",\"i_price_extend\":\"7.00\",\"d_extend_percent\":\"0.35\",\"b_purchased\":0,\"b_expired\":0,\"s_purchase_url\":\"https:\\/\\/osclasspoint.com\\/osclasspay\\/updatecart\\/1101x1x262x19.99\",\"s_download_url\":\"https:\\/\\/osclasspoint.com\\/download\\/262\",\"i_download\":\"6\",\"i_order\":\"2\",\"i_rating\":\"0.0\",\"i_rating_count\":\"0\",\"i_version\":\"1.0.2\",\"i_osc_version_from\":\"3.0\",\"i_osc_version_to\":\"\",\"dt_update_date\":\"2025-06-10 12:47:58\",\"s_product_key\":\"wxIeq0Ht3ymM803jo8vM\",\"s_update_comment\":\"Improved amount retrieval on payment confirmation.\",\"theme_type\":\"\",\"type\":\"plugin\"}}}', 'STRING'),
('osclass', 'widget_data_product_updates', '{\"date\":\"2025-10-28 19:25:55\",\"data\":{\"last_update\":\"2025-10-28 01:00:00\",\"link_all\":\"https:\\/\\/osclasspoint.com\\/product-updates\",\"updates\":[{\"fk_i_item_id\":\"203\",\"i_version\":\"1.1.0\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"s_comment\":\"All SKD updated to latest versions.\\nNow supporting PHP 8.1 - 8.4 as well.\",\"s_title\":\"S3 Cloud Image Storage Plugin\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/index.php?page=item&id=203\",\"dt_date\":\"2025-10-23 12:23:29\"},{\"fk_i_item_id\":\"74\",\"i_version\":\"1.2.8\",\"s_osc_version_from\":\"3.0.0\",\"s_osc_version_to\":\"\",\"s_comment\":\"Fixed php notices on newer versions (8.2, 8.3).\",\"s_title\":\"Facebook Login Osclass Plugin\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/index.php?page=item&id=74\",\"dt_date\":\"2025-10-22 15:20:49\"},{\"fk_i_item_id\":\"89\",\"i_version\":\"1.8.8\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"s_comment\":\"Fixed php issues in backoffice.\",\"s_title\":\"Business Profile Osclass Plugin\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/index.php?page=item&id=89\",\"dt_date\":\"2025-10-22 15:20:18\"},{\"fk_i_item_id\":\"94\",\"i_version\":\"1.6.2\",\"s_osc_version_from\":\"3.0\",\"s_osc_version_to\":\"\",\"s_comment\":\"Fixed php warnings.\",\"s_title\":\"Forums Osclass Plugin\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/index.php?page=item&id=94\",\"dt_date\":\"2025-10-22 15:20:01\"},{\"fk_i_item_id\":\"170\",\"i_version\":\"1.6.3\",\"s_osc_version_from\":\"3.3\",\"s_osc_version_to\":\"\",\"s_comment\":\"Updated doctype at start of html document.\\nRefactored user items url, now supports \\\"sItemType\\\" parameter natively and works much better with Osclass 8.3+\",\"s_title\":\"Delta Osclass Theme\",\"s_url\":\"https:\\/\\/osclasspoint.com\\/index.php?page=item&id=170\",\"dt_date\":\"2025-10-21 09:34:22\"}]}}', 'STRING'),
('osclass', 'widget_data_update', '{\"date\":\"2025-10-28 19:25:55\",\"data\":{\"version\":830,\"version_string\":\"8.3.0\",\"url\":\"https:\\/\\/osclass-classifieds.com\\/file\\/osclass-v8.3.0.zip\",\"s_name\":\"v8.3.0\"}}', 'STRING'),
('sigma', 'defaultLocationShowAs', 'dropdown', 'STRING'),
('sigma', 'defaultShowAs@all', 'list', 'STRING'),
('sigma', 'donation', '0', 'STRING'),
('sigma', 'footer_link', '1', 'STRING'),
('sigma', 'keyword_placeholder', 'ie. PHP Programmer', 'STRING'),
('sigma', 'logo', 'sigma_logo.png', 'STRING'),
('sigma', 'rtl', '0', 'STRING'),
('sigma', 'version', '150', 'STRING');

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region`
--

CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_name_native` varchar(60) DEFAULT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_region_stats`
--

CREATE TABLE `oc_t_region_stats` (
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_site`
--

CREATE TABLE `oc_t_site` (
  `s_site` varchar(255) NOT NULL,
  `s_site_mapping` varchar(255) DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `s_db_name` varchar(64) DEFAULT NULL,
  `s_db_host` varchar(255) DEFAULT NULL,
  `s_db_user` varchar(64) DEFAULT NULL,
  `s_db_password` varchar(255) DEFAULT NULL,
  `s_upload_path` varchar(255) DEFAULT NULL,
  `dt_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user`
--

CREATE TABLE `oc_t_user` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `b_active` tinyint(1) NOT NULL DEFAULT 0,
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(64) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_country_native` varchar(80) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `s_region_native` varchar(60) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `s_city_native` varchar(60) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(20,10) DEFAULT NULL,
  `d_coord_long` decimal(20,10) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT 0,
  `i_items` int(10) UNSIGNED DEFAULT 0,
  `i_comments` int(10) UNSIGNED DEFAULT 0,
  `dt_access_date` datetime DEFAULT NULL,
  `s_access_ip` varchar(64) NOT NULL DEFAULT '',
  `i_login_fails` int(3) DEFAULT 0,
  `dt_login_fail_date` datetime DEFAULT NULL,
  `s_profile_img` varchar(100) DEFAULT NULL,
  `fk_c_locale_code` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_user`
--

INSERT INTO `oc_t_user` (`pk_i_id`, `dt_reg_date`, `dt_mod_date`, `s_name`, `s_username`, `s_password`, `s_secret`, `s_email`, `s_website`, `s_phone_land`, `s_phone_mobile`, `b_enabled`, `b_active`, `s_pass_code`, `s_pass_date`, `s_pass_ip`, `fk_c_country_code`, `s_country`, `s_country_native`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `s_region_native`, `fk_i_city_id`, `s_city`, `s_city_native`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`, `b_company`, `i_items`, `i_comments`, `dt_access_date`, `s_access_ip`, `i_login_fails`, `dt_login_fail_date`, `s_profile_img`, `fk_c_locale_code`) VALUES
(1, '2025-10-29 12:25:06', '2025-10-29 12:25:06', 'eslam', '1', '$2y$15$hPh6WF4jDohxMpwvB6nMDOP65VPa1rubCWyOdNk.NX20dBV4QluOq', 'lCB7wCp7', 'eslamweso123@gmail.com', '', '', '', 1, 0, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, 0, 1, 0, '2025-10-29 12:25:06', '::1', 0, NULL, NULL, NULL),
(2, '2025-10-29 12:27:06', '2025-10-29 12:27:06', 'admin', '2', '$2y$15$khyzTlStMBBGy6LXa9rNeOd2Q5HoTaOyGdFIuKXEKlYurOq9sNhAW', 'cGjRl4XB', 'eslamweso123@icloud.com', '', '', '', 1, 1, NULL, NULL, NULL, NULL, '', NULL, '', '', NULL, '', NULL, NULL, '', NULL, NULL, '', NULL, NULL, 0, 8, 4, '2025-10-30 13:32:02', '::1', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_description`
--

CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_user_email_tmp`
--

CREATE TABLE `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_t_widget`
--

CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oc_t_widget`
--

INSERT INTO `oc_t_widget` (`pk_i_id`, `s_description`, `s_location`, `e_kind`, `s_content`) VALUES
(3, 'home', 'header', 'HTML', '<p> </p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"http://localhost/asas/oc-content/themes/dreamfree/images/homewidget.png\" alt=\"\" width=\"1088\" height=\"319\" /></p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_username` (`s_username`),
  ADD UNIQUE KEY `s_email` (`s_email`);

--
-- Indexes for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_alerts_sent`
--
ALTER TABLE `oc_t_alerts_sent`
  ADD PRIMARY KEY (`d_date`);

--
-- Indexes for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_parent_id` (`fk_i_parent_id`),
  ADD KEY `i_position` (`i_position`);

--
-- Indexes for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD PRIMARY KEY (`fk_i_category_id`);

--
-- Indexes for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_name_native` (`s_name_native`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Indexes for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_name_native` (`s_name_native`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Indexes for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD PRIMARY KEY (`fk_i_city_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_country`
--
ALTER TABLE `oc_t_country`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Indexes for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD PRIMARY KEY (`fk_c_country_code`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_currency`
--
ALTER TABLE `oc_t_currency`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Indexes for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`),
  ADD KEY `idx_b_premium` (`b_premium`),
  ADD KEY `idx_s_contact_email` (`s_contact_email`(10)),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_c_currency_code` (`fk_c_currency_code`),
  ADD KEY `idx_pub_date` (`dt_pub_date`),
  ADD KEY `idx_price` (`i_price`);

--
-- Indexes for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`);

--
-- Indexes for table `oc_t_item_description`
--
ALTER TABLE `oc_t_item_description`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`);
ALTER TABLE `oc_t_item_description` ADD FULLTEXT KEY `s_description` (`s_description`,`s_title`);

--
-- Indexes for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  ADD KEY `s_value` (`s_value`(255)),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10));

--
-- Indexes for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`);

--
-- Indexes for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_locale`
--
ALTER TABLE `oc_t_locale`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_short_name` (`s_short_name`);

--
-- Indexes for table `oc_t_locations_tmp`
--
ALTER TABLE `oc_t_locations_tmp`
  ADD PRIMARY KEY (`id_location`,`e_type`);

--
-- Indexes for table `oc_t_log`
--
ALTER TABLE `oc_t_log`
  ADD KEY `idx_s_section` (`s_section`),
  ADD KEY `idx_s_action` (`s_action`);

--
-- Indexes for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Indexes for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Indexes for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Indexes for table `oc_t_preference`
--
ALTER TABLE `oc_t_preference`
  ADD UNIQUE KEY `s_section` (`s_section`,`s_name`);

--
-- Indexes for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_name_native` (`s_name_native`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Indexes for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD PRIMARY KEY (`fk_i_region_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Indexes for table `oc_t_site`
--
ALTER TABLE `oc_t_site`
  ADD PRIMARY KEY (`s_site`);

--
-- Indexes for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_email` (`s_email`),
  ADD KEY `idx_s_name` (`s_name`(6)),
  ADD KEY `idx_s_username` (`s_username`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Indexes for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Indexes for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD PRIMARY KEY (`fk_i_user_id`);

--
-- Indexes for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15202277;

--
-- AUTO_INCREMENT for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10603260;

--
-- AUTO_INCREMENT for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_area_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_area_ibfk_3` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Constraints for table `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`);

--
-- Constraints for table `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Constraints for table `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Constraints for table `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Constraints for table `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Constraints for table `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`);

--
-- Constraints for table `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Constraints for table `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Constraints for table `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
