-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.16 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_cctms
CREATE DATABASE IF NOT EXISTS `db_cctms` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_cctms`;

-- Dumping structure for table db_cctms.tbl_attempt
CREATE TABLE IF NOT EXISTS `tbl_attempt` (
  `trans_id` varchar(50) DEFAULT NULL,
  `attempt_ip` varchar(50) DEFAULT NULL,
  `attempt_details` varchar(100) DEFAULT NULL,
  `attempt_date` date DEFAULT NULL,
  `attempt_datetime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_attempt: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_audit_trail
CREATE TABLE IF NOT EXISTS `tbl_audit_trail` (
  `trans_id` varchar(50) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `audit_trail_from` longtext,
  `audit_trail_to` longtext,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_audit_trail: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_cms_menu
CREATE TABLE IF NOT EXISTS `tbl_cms_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `page_url` varchar(200) DEFAULT NULL,
  `menu_level` tinyint(3) unsigned DEFAULT NULL,
  `sort_order` tinyint(3) unsigned DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT '',
  `is_public` varchar(1) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `system_module` tinyint(3) unsigned DEFAULT NULL,
  `last_user` varchar(30) DEFAULT NULL,
  `last_date` varchar(30) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_cms_menu: ~11 rows (approximately)
INSERT INTO `tbl_cms_menu` (`menu_id`, `parent_id`, `menu_name`, `page_url`, `menu_level`, `sort_order`, `menu_icon`, `is_public`, `is_active`, `system_module`, `last_user`, `last_date`, `module`) VALUES
	(1, 0, 'Administration', '', 1, 99, '', 'N', 'Y', 1, 'System Administrator', '8/25/2015 11:42:14 PM', 'SENIOR CITIZEN'),
	(2, 1, 'User Account', '~/Secured/SystemAdministration/UserEntry.aspx', 2, 1, '', 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(3, 1, 'User Role', '~/Secured/SystemAdministration/UserRole.aspx', 2, 2, '', 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(4, 1, 'User Permission', '~/Secured/SystemAdministration/UserPermission.aspx', 2, 3, '', 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(5, 1, 'Role Permission', '~/Secured/SystemAdministration/RolePermission.aspx', 2, 4, '', 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(6, 1, 'CMS', '~/Secured/SystemAdministration/cmsMenu.aspx', 2, 5, '', 'N', 'Y', 1, 'AUTO', '4/17/2014 10:29:54 AM', NULL),
	(57, 0, 'UserAdmin', '', 1, 10, '', 'N', 'Y', 1, 'System Administrator', '10/21/2025 1:50:53 PM', 'SENIOR CITIZEN'),
	(58, 57, 'User Entry', '~/Secured/UserAdmin/adminUserEntry.aspx', 2, 1, '', 'N', 'Y', 1, 'System Administrator', '10/21/2025 1:51:34 PM', NULL),
	(59, 57, 'User Permission', '~/Secured/UserAdmin/adminUserPermission.aspx', 2, 2, '', 'N', 'Y', 1, 'System Administrator', '10/21/2025 1:52:05 PM', NULL),
	(60, 0, 'DashBoard', '~/Secured/DashBoard.aspx', 1, 0, '', 'N', 'Y', 1, 'System Administrator', '10/21/2025 3:06:07 PM', 'SENIOR CITIZEN'),
	(61, 0, 'Trainings', '', 1, 1, '', 'N', 'Y', 1, 'scadmin', '2/5/2026 1:52:23 PM', 'SENIOR CITIZEN'),
	(63, 61, 'List', '~/Secured/TrainingManagement/Trainings.aspx', 2, 1, '', 'N', 'Y', NULL, 'scadmin', '2/5/2026 1:51:17 PM', NULL),
	(64, 61, 'Report', '~/Secured/TrainingManagement/TrainingReport.aspx', 2, 2, '', 'N', 'Y', NULL, 'scadmin', '2/5/2026 1:51:40 PM', NULL);

-- Dumping structure for table db_cctms.tbl_comments
CREATE TABLE IF NOT EXISTS `tbl_comments` (
  `trans_id` varchar(50) NOT NULL,
  `comment_name` varchar(100) DEFAULT NULL,
  `comment_contactno` varchar(50) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `reply` varchar(2000) DEFAULT NULL,
  `reply_count` int(11) DEFAULT '0',
  `comment_ip` varchar(50) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  `comment_datetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_comments: ~1 rows (approximately)
INSERT INTO `tbl_comments` (`trans_id`, `comment_name`, `comment_contactno`, `comment`, `reply`, `reply_count`, `comment_ip`, `comment_date`, `comment_datetime`) VALUES
	('120320251109195CA0631666F6498D8CB697D82', 'ZCZXCZX', '09758202587', 'zxczxczxczxczxc', '\r\nrewrewtrretertetr <12/3/2025 9:11:53 AM><System Administrator>', 1, '192.168.88.208', '2025-12-03', '2025-12-03 09:11:19 AM');

-- Dumping structure for table db_cctms.tbl_consent
CREATE TABLE IF NOT EXISTS `tbl_consent` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_code` varchar(50) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `date_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trans_id`),
  KEY `reference_code` (`reference_code`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table db_cctms.tbl_consent: ~27 rows (approximately)
INSERT INTO `tbl_consent` (`trans_id`, `reference_code`, `ip_address`, `date_time`) VALUES
	(1, '', '::1', '2025-10-21 11:22:29'),
	(2, '', '::1', '2025-10-21 15:35:08'),
	(3, '', '::1', '2025-10-21 16:35:14'),
	(4, '', '::1', '2025-10-22 14:07:11'),
	(5, '', '::1', '2025-10-23 13:38:58'),
	(6, '', '::1', '2025-10-23 13:48:18'),
	(7, '', '::1', '2025-10-23 14:19:08'),
	(8, '', '::1', '2025-10-23 14:22:49'),
	(9, '', '::1', '2025-10-23 14:26:09'),
	(10, '', '::1', '2025-10-23 14:27:46'),
	(11, '', '::1', '2025-10-23 14:32:03'),
	(12, '', '::1', '2025-10-23 14:51:46'),
	(13, '', '::1', '2025-10-23 14:56:52'),
	(14, '', '::1', '2025-10-23 15:01:21'),
	(15, 'ABDFD392B1', '::1', '2025-10-24 13:28:01'),
	(16, 'FE840076D4', '::1', '2025-10-24 13:30:56'),
	(17, '27B7E043BF', '::1', '2025-10-24 13:31:45'),
	(18, '', '192.168.88.208', '2025-10-24 13:46:23'),
	(19, '', '192.168.88.208', '2025-12-03 08:29:05'),
	(20, '5AF7C7D13C', '192.168.88.208', '2025-12-03 08:30:51'),
	(21, '', '192.168.88.208', '2025-12-03 08:40:08'),
	(22, '', '192.168.88.208', '2025-12-03 08:48:22'),
	(23, '', '::1', '2025-12-03 08:56:55'),
	(24, '', '192.168.88.208', '2025-12-03 09:03:35'),
	(25, '', '::1', '2026-01-19 10:36:53'),
	(26, '', '::1', '2026-01-19 10:41:16'),
	(27, '', '::1', '2026-01-19 11:40:25');

-- Dumping structure for table db_cctms.tbl_login_log
CREATE TABLE IF NOT EXISTS `tbl_login_log` (
  `trans_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  `login_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_login_log: ~28 rows (approximately)
INSERT INTO `tbl_login_log` (`trans_id`, `user_id`, `login_ip`, `login_datetime`, `login_status`) VALUES
	('011920260502522692B49C96DB4D2FAD225BB68', 'scadmi', '::1', '2026-01-19 14:05:52', 'FAIL'),
	('0119202636032227F9E4BFBA29434F9AEB6E597', 'admin', '::1', '2026-01-19 15:36:22', 'FAIL'),
	('011920263810451F60DF22449D433B93B80768B', 'admin', '::1', '2026-01-19 10:38:45', 'FAIL'),
	('01192026381048FC7FF787F1EF4749A9B4C0798', 'admin', '::1', '2026-01-19 10:38:48', 'FAIL'),
	('011920263810524475128BBB5049B39840FF11D', 'admin', '::1', '2026-01-19 10:38:52', 'FAIL'),
	('011920263810573CF4C90730A949258547F8B7D', 'admin', '::1', '2026-01-19 10:38:57', 'FAIL'),
	('020520260304426726CB8C5C874C04BE5398FED', 'dodong', '::1', '2026-02-05 16:03:42', 'FAIL'),
	('02052026050449788AC44EFAB642C188264FB0C', 'dodong', '::1', '2026-02-05 16:05:49', 'FAIL'),
	('0205202605045037591C4B6B02477DABF6DD594', 'dodong', '::1', '2026-02-05 16:05:50', 'FAIL'),
	('020520261004213EBA9C55811E43FBA18B74212', 'dodong', '::1', '2026-02-05 16:10:21', 'FAIL'),
	('02052026110421B0A77025701F4630B6AC1C204', 'dodong', '::1', '2026-02-05 16:11:21', 'FAIL'),
	('020520262901222D46B0933FA54CB3ADA0D35CD', 'scadmin', '::1', '2026-02-05 13:29:22', 'FAIL'),
	('02052026290128999EC6D855A740919209D0B37', 'admin', '::1', '2026-02-05 13:29:28', 'FAIL'),
	('02052026290131E2AE219D69CA4F39A3F19DCE6', 'admin', '::1', '2026-02-05 13:29:31', 'FAIL'),
	('020520263001094D79F59BA32F4BD19BE96A9CD', 'scadmin', '::1', '2026-02-05 13:30:09', 'FAIL'),
	('020520263101375C2F614656F74892B35350DBD', 'scadmin', '::1', '2026-02-05 13:31:37', 'FAIL'),
	('0205202632012384C2F70C651C4FEFA409ECF25', 'scadmin', '::1', '2026-02-05 13:32:23', 'FAIL'),
	('02052026320154A08FC15D9191404E8F792A554', 'scadmin', '::1', '2026-02-05 13:32:54', 'FAIL'),
	('0205202633015369447D4A2FBB4196947118E4F', 'scadmin', '::1', '2026-02-05 13:33:53', 'FAIL'),
	('02052026340133080B0B4A31C54D3AB640AC99C', 'scadmin', '::1', '2026-02-05 13:34:33', 'FAIL'),
	('0205202646031776262626FF1547E6B24144245', 'scadmin', '::1', '2026-02-05 15:46:17', 'FAIL'),
	('020520264603178BD350A5914546EBB93499C58', 'scadmin', '::1', '2026-02-05 15:46:17', 'FAIL'),
	('06132023310900815CBE6CEC954A0591221F542', 'asdsad', '::1', '2023-06-13 09:31:00', 'FAIL'),
	('0619202317041889D4D8AD88734361A8CD1FCA2', 'admin', '::1', '2023-06-19 16:17:18', 'FAIL'),
	('06222023220857D0F243F76F03480898E3C9355', 'admin', '::1', '2023-06-22 08:22:57', 'FAIL'),
	('06222023230802FABF040DAD574401BF9D65B81', 'admin', '::1', '2023-06-22 08:23:02', 'FAIL'),
	('06222023230808339BDED2F3E04D18ACA0ECA78', 'admin', '::1', '2023-06-22 08:23:08', 'FAIL'),
	('06222023360839770C13801396453F9B07E2AF8', 'admin', '::1', '2023-06-22 08:36:39', 'FAIL'),
	('102120252211126BC0938CBA9045FABC7F66177', 'admin', '::1', '2025-10-21 23:22:12', 'FAIL'),
	('102120252602021B51BA90C6E64289BF535B006', 'admin', '::1', '2025-10-21 14:26:02', 'FAIL'),
	('1021202532110188DD6A3027D940BBA5FBB9E5C', 'admin', '::1', '2025-10-21 11:32:01', 'FAIL'),
	('1021202544043552D62326B2B24505ABF8DD2CF', 'admin', '::1', '2025-10-21 16:44:35', 'FAIL'),
	('1021202549110620342A82F75F419581275D3C8', 'admin', '::1', '2025-10-21 11:49:06', 'FAIL'),
	('1021202557103804E909901A5B4FE7B1A774338', 'admin', '::1', '2025-10-21 10:57:38', 'FAIL'),
	('102220250802338B9435F27A2A4BE48C10C85B9', 'admin', '::1', '2025-10-22 14:08:33', 'FAIL'),
	('10232025210100D5B171AB2F4049A4A7C59CF2D', 'admin', '::1', '2025-10-23 13:21:00', 'FAIL'),
	('1023202540011485A941C8D189413C89236BF89', 'admin', '::1', '2025-10-23 13:40:14', 'FAIL'),
	('10242025220127A36D803ED8644999AE9537252', 'admin', '::1', '2025-10-24 13:22:27', 'FAIL'),
	('10242025270108A2BEA0F0E40F4D1DAC688D6A8', 'admin', '::1', '2025-10-24 13:27:08', 'FAIL'),
	('111120250310414501951CFDD1455EBE3BA2D1F', 'admin', '::1', '2025-11-11 10:03:41', 'FAIL'),
	('11112025031044933844B3436042B3BE725E9FE', 'admin', '::1', '2025-11-11 10:03:44', 'FAIL'),
	('111120250310472EEB22C2E8964C9F92F58BACD', 'admin', '::1', '2025-11-11 10:03:47', 'FAIL'),
	('120320250609089B0743EFCE4944D199289BEC2', 'admin', '192.168.88.208', '2025-12-03 09:06:08', 'FAIL'),
	('1203202525080798536D31A5DD4A85A568F2251', 'admin', '192.168.88.202', '2025-12-03 08:25:07', 'FAIL');

-- Dumping structure for table db_cctms.tbl_notify_sms
CREATE TABLE IF NOT EXISTS `tbl_notify_sms` (
  `cel_numbers` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_notify_sms: ~1 rows (approximately)
INSERT INTO `tbl_notify_sms` (`cel_numbers`) VALUES
	('09359828145,09069044808,09261277653,09453669413');

-- Dumping structure for table db_cctms.tbl_ref_city_province
CREATE TABLE IF NOT EXISTS `tbl_ref_city_province` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_city_province: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_civil_status
CREATE TABLE IF NOT EXISTS `tbl_ref_civil_status` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_civil_status: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_educ_attainment
CREATE TABLE IF NOT EXISTS `tbl_ref_educ_attainment` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_educ_attainment: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_gender
CREATE TABLE IF NOT EXISTS `tbl_ref_gender` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_gender: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_learning_mode
CREATE TABLE IF NOT EXISTS `tbl_ref_learning_mode` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_learning_mode: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_learning_tracks
CREATE TABLE IF NOT EXISTS `tbl_ref_learning_tracks` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_learning_tracks: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_preferred_schedule
CREATE TABLE IF NOT EXISTS `tbl_ref_preferred_schedule` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_preferred_schedule: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_program_sources
CREATE TABLE IF NOT EXISTS `tbl_ref_program_sources` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_program_sources: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_ref_training_speakers
CREATE TABLE IF NOT EXISTS `tbl_ref_training_speakers` (
  `trans_id` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `speaker_name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `speaker_designation` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_ref_training_speakers: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_registration_comments
CREATE TABLE IF NOT EXISTS `tbl_registration_comments` (
  `trans_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `senior_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `reg_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remarks` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `last_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_cctms.tbl_registration_comments: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_registration_details
CREATE TABLE IF NOT EXISTS `tbl_registration_details` (
  `trans_id` varchar(50) NOT NULL,
  `senior_id` varchar(50) DEFAULT NULL,
  `reg_status` varchar(50) DEFAULT NULL,
  `remarks` longtext,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `senior_id` (`senior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_registration_details: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_system_default
CREATE TABLE IF NOT EXISTS `tbl_system_default` (
  `default_desc` varchar(50) DEFAULT NULL,
  `default_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_system_default: ~4 rows (approximately)
INSERT INTO `tbl_system_default` (`default_desc`, `default_value`) VALUES
	('default password', 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a'),
	('notify_sms', 'Y'),
	('consent_desc', '&nbsp;I, hereby explicitly and unambiguously consent to the collection, use and transfer, in electronic or other form, of my personal data for the purpose of processing my Senior Citizen ID Application.'),
	('dpn', '<p><strong>BACKGROUND</strong></p>\r\n<p>The Republic Act No. 10173 also known as the Data Privacy Act of 2012 which requires the government and the private sector to follow and comply to fulfill their objective to protect personal data in information and communications systems.</p>\r\n<p>With this, it ensures that entities of the City Government of Cagayan de Oro to implement measures and procedures that guarantee the safety and security of personal data under their control or custody and thereby upholding an individual&rsquo;s data privacy rights; this also applies the principles of Transparency, Legitimate Purpose, and Proportionality in processing of the personal data submitted and stored in the information and communication system.</p>\r\n<p>This Manual serves as a guide or handbook for ensuring the compliance and the City Government with the Data Privacy Act and its Implementing Rules and Regulations (IRR). This also encapsulates the privacy and data protection protocols that is being observed and is being carried out within this entity for specific circumstances (e.g., from collection to destruction), directed toward the fulfillment and realization of the rights of data subjects.</p>\r\n<p><strong>INTRODUCTION</strong></p>\r\n<p>We, the City Government of Cagayan de Oro respects and values your data privacy rights. It is our duty to give you assurance and confidence to notify you on the submitted with data most specifically your given personal information on how it is being collected, processed, and kept. This is also to inform you on your rights in accordance of the laws and regulations stated and specified in the Republic Act No. 10173 which is also known as the &ldquo;Data Privacy Act of 2012 (DPA)&rdquo;.</p>\r\n<p><strong>DEFINITION OF TERMS</strong></p>\r\n<ul>\r\n<li><u>Data Privacy Act</u> &ndash; refers to the Republic Act No. 10173 or the Data Privacy Act of 2012 and its implementing rules and regulations (insert url:</li>\r\n</ul>\r\n<p><u><a href="https://www.privacy.gov.ph/implementing-rules-regulations-data-privacy-act-2012/">https://www.privacy.gov.ph/implementing-rules-regulations-data-privacy-act-2012/</a></u>).</p>\r\n<ul>\r\n<li><u>Processing</u> &ndash; refers to any operation or set of operations performed upon personal data including, but not limited to, the collection, recording, organization, storage, updating or modification, retrieval, consultation, use, consolidation, blocking, erasure or destruction of data. Processing may be performed through automated means, or manual processing, if the personal data are contained or are intended to be contained in a filing system;</li>\r\n<li><u>Personal data</u> &ndash; collectively refers to personal information, sensitive personal information, and privileged information;</li>\r\n<li><u>Personal Information</u> &ndash; refers to any information, whether recorded in a material form or not, from which the identity of an individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put together with other information would directly and certainly identify an individual;</li>\r\n<li><u>Sensitive Personal Information</u> &ndash; refers to personal data:\r\n<ul>\r\n<li>About an individual&rsquo;s race, ethnic origin, marital status, age, color, and religious, philosophical or political affiliations;</li>\r\n<li>About an individual&rsquo;s health, education, genetic or sexual life of a person, or to any proceeding for any offense committed or alleged to have been committed by such individual, the disposal of such proceedings, or the sentence of any court in such proceedings;</li>\r\n</ul>\r\n</li>\r\n<li><u>Privileged information</u> &ndash; refers to any and all forms of personal data, which, under the Rules of Court and other pertinent laws constitute privileged communication;</li>\r\n<li><u>Data Subject / Clients</u> &ndash; refers to an individual whose personal, sensitive personal, or privileged information is processed; who gives consent to the processors to process the stated data; [<em>Include specific Data Subjects depending on the IS</em>]</li>\r\n<li><u>Information System </u>&ndash; an application or an online application that tools the automation process of personal data with the assigned processor; contains the data privacy consent of the client for the Senior Citizen Online ID Application;</li>\r\n<li><u>Processing office </u>&ndash; OSCA-CSWD given the authority to process the personal, sensitive personal, or privileged information;</li>\r\n<li><u>Processor </u>&ndash; Staff, personnel, processing office, City Government of Cagayan de Oro employee or individual who processes the personal data using the information system with utmost confidentiality, integrity and authenticity;</li>\r\n<li><u>National Privacy Commission (NPC)</u> &ndash; refers as the forefront of not only implementing but complying with the Data Privacy Act of 2012;</li>\r\n<li><u>Data Protection Officer </u>&ndash; Any natural or juridical person or other body involved in the processing of personal data or otherwise be accountable for ensuring compliance with applicable laws and regulations for the protection of data privacy and security.</li>\r\n<li><u>Third Party Sharing and Processing</u> &ndash; Information as well as Personal information of the Data Subjects is being shared and processed outside the entity, subject to cross-border arrangement and cooperation.</li>\r\n<li><u>Data Sharing Agreement</u> &ndash; Needed when third party sharing and processing of data is being made for the relevant process or use of the data of the data subjects.</li>\r\n</ul>\r\n<p><strong>SCOPE AND LIMITATIONS</strong></p>\r\n<p>All personnel of the City Government of Cagayan de Oro especially the office processing the data, regardless of the type of employment or contractual arrangement, must comply with the terms set out in this Data Privacy Manual. This Data Privacy Manual is publicly posted for the information and transparency of the data being processed through the information systems with the data processors identified in the next section of this manual.</p>\r\n<p>[<em>Can also include here the purpose of the IS on highlighting the scope of the data being processed within the IS</em>]</p>\r\n<p><strong>PROCESSING OF PERSONAL DATA: WHAT WE PROCESS, HOW WE PROCESS, WHO WILL PROCESS, WHY WE PROCESS</strong></p>\r\n<ol>\r\n<li><u>Collection (What Information Do We Collect)</u>:</li>\r\n</ol>\r\n<p>The processing office with the processor collects the information required in the <strong>Senior Citizen Online ID Application System</strong>. The information provided and submitted by the clients, including their [<em>full name, address, email address, contact number, birthday and other personal data</em> <em>together with their attached documents and the kind of request or process selected</em>]. The information system stores the personal data in the database system assigned for this information system respectively and is being protected through the security protocol set out by the server where the database system is located to give assurance that the data will be protected and secured.</p>\r\n<ol>\r\n<li><u>Use (How We Process Your Information)</u>:</li>\r\n</ol>\r\n<p>Personal data collected shall be used accordingly base on the data subject&rsquo;s request as well as for the processing office and the City Government records which is as follows:</p>\r\n<ol>\r\n<li>Data Subject&rsquo; request:\r\n<ol>\r\n<li>Processing for the service availed</li>\r\n<li>Third Party Processing [<em>if there&rsquo;s any</em>]</li>\r\n</ol>\r\n</li>\r\n<li>Profiling: [<em>fill in</em>]</li>\r\n<li>Research: [<em>fill in</em>]</li>\r\n<li>Others: [<em>fill in</em>]</li>\r\n</ol>\r\n<ol>\r\n<li><u>Storage, Retention and Destruction</u></li>\r\n</ol>\r\n<p>The processor as well as the information system will ensure that personal data under its custody are protected against any other unlawful processing (misused, modified, interfered, lost or disclosed to unauthorized processors without the Data Sharing Agreement).</p>\r\n<p>The implementation and the management of the information system shall have security practices and processes such as but not limited to the following:</p>\r\n<ul>\r\n<li>Document storage security policies;</li>\r\n<li>Security measures to control access to our systems and premises;</li>\r\n<li>Limitations on access to personal data;</li>\r\n<li>Strict selection of third-party data processors and partners; and</li>\r\n<li>Electronic security systems, such as firewalls, data encryption and transmission of data through a secured file transfer protocol.</li>\r\n</ul>\r\n<p>The personal data shall be kept and maintained up to a certain period or as long as necessary for the purpose for which they were collected or as required by laws and regulations.</p>\r\n<p>[<em>Add retention period here.]</em></p>\r\n<ol>\r\n<li><u>Access</u></li>\r\n</ol>\r\n<p>Due to the sensitive and confidential nature of the personal data under the custody of the City Government, only the client/data subject and the authorized processor shall be allowed to access such personal data, for any purpose, except for those contrary to law, public policy, public order or morals. The authorized processor of this information system are as follows:</p>\r\n<ol>\r\n<li>Processing office: Process your request [<em>please edit if necessary</em>]</li>\r\n<li>City Management Information System Office: ICT system in-charge for the City Government. Data accessibility of this office is only limited to the structure of the database for the development purposes only. This shared accessibility is being protected by a data sharing agreement between the processing office and the developer-CMISO.</li>\r\n<li>Third Party Offices: [<em>if there&rsquo;s any, please enumerate</em>]</li>\r\n</ol>\r\n<ol>\r\n<li><u>Disclosure and Sharing</u></li>\r\n</ol>\r\n<p>All processors shall maintain the confidentiality and secrecy of all personal data that come to their knowledge and possession, even after resignation, termination of contract, or other contractual relations. Personal data under the custody of the City Government shall be disclosed only pursuant to a lawful purpose, and to authorized recipients of such data.</p>\r\n<p><strong>SECURITY MEASURED: HOW WE PROTECT YOUR DATA</strong></p>\r\n<p>The Data Privacy of the City Government is being managed by the registered Data Protection Officer, Atty. Reymond Q. Villablanca (currently the Asst. City Legal Officer). The Data Protection Officer who is being assisted by the Compliance Officer for Privacy of each City Government Offices/Department, shall oversee the compliance of the organization with the DPA, its IRR, and other related policies, including the conduct of a Privacy Impact Assessment, implementation of security measures, security incident and data breach protocol, and the inquiry and complaints procedure. All employees will be asked to sign a Non-Disclosure Agreement. All employees with access to personal data shall operate and hold personal data under strict confidentiality if the same is not intended for public disclosure.</p>\r\n<p>Personal data in the custody of the organization may be in digital/electronic format and paper-based/physical format. All personal data being processed by the organization shall be stored in a data room, where paper-based documents are kept in locked filing cabinets while the digital/electronic files are stored in secured server managed by the [<em>who manages the server of this IS</em>]. And only the authorized personnel have the access of the server with the level of access permission.</p>\r\n<p><strong>BREACH AND SECURITY INCIDENTS: RISK INVOLVE IN PROCESSING</strong></p>\r\n<p>The [<em>server manager/CMISO</em>] shall always maintain a backup file for all personal data under its custody. In the event of a security incident or data breach, it shall always compare the backup with the affected file to determine the presence of any inconsistencies or alterations resulting from the incident or breach.</p>\r\n<p>In case of breach incident, the [<em>server manager/CMISO</em>] will report to the Data Protection Officer together with the responsible Compliance Officer for Privacy of the certain City Government Office for the notification protocol. The [<em>server manager/CMISO</em>] detailed documentation of the incident or breach encountered as will be forwarded to the management and to the NPC depending on the City Government DPO&rsquo;s advise.</p>\r\n<p><strong>HOW MAY CONTACT US FOR INQUIRIES AND COMPLAINTS</strong></p>\r\n<p><strong>You as our Data Subjects have the following rights (RIGHTS OF DATA SUBJECTS):</strong></p>\r\n<p>Personal information will be made available to the clients and authorized processors anytime in case there are requests for correction, modification or deletion. It is the right of the individual owning the personal data to inquire or obtain a copy of the personal information provided to us.</p>\r\n<ol>\r\n<li>The right to be informed, thus this Data Privacy Manual on how your personal information collected be processed through this Information System.</li>\r\n<li>The right to access, thus you have the access of your personal details and account.</li>\r\n<li>The right to object, thus you can the right not to submit the data so as not the data to be processed.</li>\r\n<li><em>The right to erasure or blocking. [if there&rsquo;s a privilege for client to wipe out his/her data]</em></li>\r\n<li>The right to damages, thus you can request for assessment of your data that might be mishandled to our Data Privacy Officer.</li>\r\n<li>The right to file a complaint, thus you can file a complaint to our Data Privacy Officer to any misused, maliciously disclosed, or improperly disposition of your data.</li>\r\n<li>The right to rectify, thus you have the right to correct your submitted through [<em>the system or through the data information processor</em>].</li>\r\n</ol>\r\n<p>For further inquiries or complaints, you may report or coordinate with our City Government&rsquo;s Data Privacy Officer:</p>\r\n<p><strong>Atty. Reymond Q. Villablanca</strong></p>\r\n<p>Asst. City Legal Officer</p>\r\n<p>City Legal Office</p>\r\n<p>Ground Floor, Executive Building, City Hall, Cagayan de Oro City</p>\r\n<p>Email: dpo.cdo@gmail.com</p>\r\n<p>Contact Number: (088) 857-2260 / +63-960-902-1208</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><strong>EFFECTIVITY OF THIS DATA PRIVACY MANUAL:</strong></p>\r\n<p>The provisions of this Manual are effective this June day of 29, 2021, until revoked or amended by this entity, the City Government of Cagayan de Oro.</p>\r\n<p>DPM Version 1.0 as of June 29, 2021</p>');

-- Dumping structure for table db_cctms.tbl_training
CREATE TABLE IF NOT EXISTS `tbl_training` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `training_date` date DEFAULT NULL,
  `training_time` time DEFAULT NULL,
  `training_title` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `training_desc` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `training_slots` int(11) DEFAULT '0',
  `other_details` longtext CHARACTER SET latin1 COLLATE latin1_general_ci,
  `attendance` int(11) DEFAULT '0',
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_training: ~1 rows (approximately)
INSERT INTO `tbl_training` (`trans_id`, `training_date`, `training_time`, `training_title`, `training_desc`, `training_slots`, `other_details`, `attendance`, `is_active`, `create_user`, `create_date`) VALUES
	('0205202652034383463E6FBAA24D258095A17F6', '2026-02-16', '00:00:00', 'SAMPLE TITLE', 'SAMPLE DESCRIPTION', 14, 'other details\nsample links and others', 0, 'Y', 'scadmin', '2026-02-05 15:52:00');

-- Dumping structure for table db_cctms.tbl_training_applicants
CREATE TABLE IF NOT EXISTS `tbl_training_applicants` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `lname` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `fname` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `mname` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `ename` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `civil_status` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `contact_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email_add` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `home_addr` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `city_province` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `profession` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `educ_attain` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `workplace` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `prc_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pref_learn_tracks` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pref_learn_tracks_others` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pref_learn_mode` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `pref_sched` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `topic_interest` varchar(500) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `program_discovered` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `prc_expiration` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `user_name` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `password` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_training_applicants: ~1 rows (approximately)
INSERT INTO `tbl_training_applicants` (`trans_id`, `lname`, `fname`, `mname`, `ename`, `gender`, `civil_status`, `contact_no`, `email_add`, `home_addr`, `city_province`, `profession`, `educ_attain`, `workplace`, `position`, `prc_no`, `pref_learn_tracks`, `pref_learn_tracks_others`, `pref_learn_mode`, `pref_sched`, `topic_interest`, `program_discovered`, `prc_expiration`, `registration_date`, `user_name`, `password`, `is_active`, `create_user`, `create_date`) VALUES
	('02052026401102998E9C469EEF40299B1032C92', 'LNAME SHS', 'FNAME SJAD', 'MNAME SD', 'Jr.', 'Male', 'Married', '09355465456', 'noel.sierra.moreno@gmail.com', 'HOME ADDRESS', 'ILIGAN CITY', 'profession occupation', 'MASTER\'S DEGREE', 'WORKPLACE AFFILIATION', 'POSITION JOB TITLE ADASD', 'prc license Number', 'DIGITAL TRANSFORMATION', '', 'HYBRID', 'WEEKENDS', 'specific topic interest assshsd', 'specific topic interest assshsd', '2027-01-01', '2026-02-05 11:40:00', 'dodong', 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a', 'Y', NULL, '2026-02-05 11:40:00');

-- Dumping structure for table db_cctms.tbl_training_applications
CREATE TABLE IF NOT EXISTS `tbl_training_applications` (
  `trans_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `training_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `applicant_id` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `application_status` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `application_remarks` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `application_datetime` datetime DEFAULT NULL,
  `validation_datetime` datetime DEFAULT NULL,
  `is_active` varchar(1) COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `last_user` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `last_date` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `training_id` (`training_id`,`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_training_applications: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_training_attendance
CREATE TABLE IF NOT EXISTS `tbl_training_attendance` (
  `trans_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attendee_no` int(11) DEFAULT '0',
  `training_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `applicant_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_present` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_active` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `training_id` (`training_id`,`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_training_attendance: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_training_speakers
CREATE TABLE IF NOT EXISTS `tbl_training_speakers` (
  `trans_id` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `training_id` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `training_speaker` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `is_active` varchar(1) COLLATE latin1_general_ci DEFAULT 'Y',
  `create_user` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `create_date` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `training_id` (`training_id`,`training_speaker`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- Dumping data for table db_cctms.tbl_training_speakers: ~0 rows (approximately)

-- Dumping structure for table db_cctms.tbl_user_access_permission
CREATE TABLE IF NOT EXISTS `tbl_user_access_permission` (
  `user_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `page_url` varchar(200) DEFAULT NULL,
  `can_access` char(1) NOT NULL,
  `can_create` char(1) NOT NULL,
  `can_update` char(1) NOT NULL,
  `can_delete` char(1) NOT NULL,
  `can_report` char(1) NOT NULL,
  `can_export` char(1) NOT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5515 DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_user_access_permission: ~214 rows (approximately)
INSERT INTO `tbl_user_access_permission` (`user_permission_id`, `user_role_id`, `user_id`, `menu_id`, `page_url`, `can_access`, `can_create`, `can_update`, `can_delete`, `can_report`, `can_export`, `last_user`, `last_date`) VALUES
	(497, '4', '', 1, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(498, '4', '', 2, 'UserEntry.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(499, '4', '', 3, 'UserRole.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(500, '4', '', 4, 'UserPermission.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(501, '4', '', 5, 'RolePermission.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(502, '4', '', 6, 'cmsMenu.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(503, '4', '', 35, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '6/24/2014 2:18:01 PM'),
	(857, '7', '00370', 7, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(858, '7', '00370', 8, 'PDSList.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(859, '7', '00370', 25, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(860, '7', '00370', 26, 'EmploymentDetailsEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(861, '7', '00370', 9, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(862, '7', '00370', 10, 'ProvinceEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(863, '7', '00370', 11, 'MunicipalityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(864, '7', '00370', 12, 'BarangayEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(865, '7', '00370', 13, 'SchoolEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(866, '7', '00370', 14, 'SkillEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(867, '7', '00370', 15, 'CourseEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(868, '7', '00370', 16, 'EligibilityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(869, '7', '00370', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(870, '7', '00370', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(871, '7', '00370', 32, 'PositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(872, '7', '00370', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(873, '7', '00370', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(874, '7', '00370', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(875, '7', '00370', 17, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(876, '7', '00370', 18, 'rptAOBirthdayCelebrants.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(877, '7', '00370', 20, 'rptAOEmployeeListingAge.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(878, '7', '00370', 21, 'rptAOEmployeeListingGender.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(879, '7', '00370', 22, 'rptAOEmployeeListTraining.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(880, '7', '00370', 23, 'rptAOEmployeeSkillsInventory.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(881, '7', '00370', 24, 'rptAOOfficeEmployeeList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(882, '7', '00370', 27, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(883, '7', '00370', 28, 'EarnLeaves.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(884, '7', '00370', 29, 'EmployeeLeaveLedger.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(885, '7', '00370', 36, 'LeaveApplicationManagement.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:18 PM'),
	(886, '7', '00370', 37, 'ApproveLeaveApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(887, '7', '00370', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(888, '7', '00370', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(889, '7', '00370', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(890, '7', '00370', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(891, '7', '00370', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(892, '7', '00370', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(893, '7', '00370', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(894, '7', '00370', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '1/29/2015 1:27:19 PM'),
	(1361, '0', '02072015150805D11DE3459F9740E6B9C3', 7, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1362, '0', '02072015150805D11DE3459F9740E6B9C3', 8, 'PDSList.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1363, '0', '02072015150805D11DE3459F9740E6B9C3', 25, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1364, '0', '02072015150805D11DE3459F9740E6B9C3', 40, 'OfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1365, '0', '02072015150805D11DE3459F9740E6B9C3', 45, 'NonOfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1366, '0', '02072015150805D11DE3459F9740E6B9C3', 26, 'OfficeNonPlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1367, '0', '02072015150805D11DE3459F9740E6B9C3', 9, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1368, '0', '02072015150805D11DE3459F9740E6B9C3', 10, 'ProvinceEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1369, '0', '02072015150805D11DE3459F9740E6B9C3', 11, 'MunicipalityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1370, '0', '02072015150805D11DE3459F9740E6B9C3', 12, 'BarangayEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1371, '0', '02072015150805D11DE3459F9740E6B9C3', 13, 'SchoolEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1372, '0', '02072015150805D11DE3459F9740E6B9C3', 14, 'SkillEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1373, '0', '02072015150805D11DE3459F9740E6B9C3', 15, 'CourseEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1374, '0', '02072015150805D11DE3459F9740E6B9C3', 16, 'EligibilityEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1375, '0', '02072015150805D11DE3459F9740E6B9C3', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1376, '0', '02072015150805D11DE3459F9740E6B9C3', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1377, '0', '02072015150805D11DE3459F9740E6B9C3', 32, 'OfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1378, '0', '02072015150805D11DE3459F9740E6B9C3', 46, 'SectionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1379, '0', '02072015150805D11DE3459F9740E6B9C3', 41, 'OfficeNonPlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1380, '0', '02072015150805D11DE3459F9740E6B9C3', 44, 'NonOfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1381, '0', '02072015150805D11DE3459F9740E6B9C3', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1382, '0', '02072015150805D11DE3459F9740E6B9C3', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1383, '0', '02072015150805D11DE3459F9740E6B9C3', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1384, '0', '02072015150805D11DE3459F9740E6B9C3', 42, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1385, '0', '02072015150805D11DE3459F9740E6B9C3', 43, 'PersonnelScheduleEntryAdd.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1386, '0', '02072015150805D11DE3459F9740E6B9C3', 17, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1387, '0', '02072015150805D11DE3459F9740E6B9C3', 18, 'rptAOBirthdayCelebrants.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1388, '0', '02072015150805D11DE3459F9740E6B9C3', 20, 'rptAOEmployeeListingAge.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1389, '0', '02072015150805D11DE3459F9740E6B9C3', 21, 'rptAOEmployeeListingGender.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1390, '0', '02072015150805D11DE3459F9740E6B9C3', 22, 'rptAOEmployeeListTraining.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1391, '0', '02072015150805D11DE3459F9740E6B9C3', 23, 'rptAOEmployeeSkillsInventory.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1392, '0', '02072015150805D11DE3459F9740E6B9C3', 24, 'rptAOOfficeEmployeeList.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1393, '0', '02072015150805D11DE3459F9740E6B9C3', 27, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1394, '0', '02072015150805D11DE3459F9740E6B9C3', 28, 'EarnLeaves.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1395, '0', '02072015150805D11DE3459F9740E6B9C3', 29, 'EmployeeLeaveLedger.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1396, '0', '02072015150805D11DE3459F9740E6B9C3', 36, 'LeaveApplicationManagement.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1397, '0', '02072015150805D11DE3459F9740E6B9C3', 37, 'ApproveLeaveApplication.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1398, '0', '02072015150805D11DE3459F9740E6B9C3', 1, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1399, '0', '02072015150805D11DE3459F9740E6B9C3', 2, 'UserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1400, '0', '02072015150805D11DE3459F9740E6B9C3', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1401, '0', '02072015150805D11DE3459F9740E6B9C3', 4, 'UserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1402, '0', '02072015150805D11DE3459F9740E6B9C3', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1403, '0', '02072015150805D11DE3459F9740E6B9C3', 6, 'cmsMenu.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1404, '0', '02072015150805D11DE3459F9740E6B9C3', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1405, '0', '02072015150805D11DE3459F9740E6B9C3', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1406, '0', '02072015150805D11DE3459F9740E6B9C3', 47, 'EmployeeUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/8/2015 10:08:48 PM'),
	(1407, '0', '02072015331152ECF111F4CD03403EB6F7', 25, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1408, '0', '02072015331152ECF111F4CD03403EB6F7', 40, 'OfficePlantillaED.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1409, '0', '02072015331152ECF111F4CD03403EB6F7', 45, 'NonOfficePlantillaED.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1410, '0', '02072015331152ECF111F4CD03403EB6F7', 26, 'OfficeNonPlantillaED.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1411, '0', '02072015331152ECF111F4CD03403EB6F7', 30, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1412, '0', '02072015331152ECF111F4CD03403EB6F7', 31, 'DivisionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1413, '0', '02072015331152ECF111F4CD03403EB6F7', 32, 'OfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1414, '0', '02072015331152ECF111F4CD03403EB6F7', 46, 'SectionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1415, '0', '02072015331152ECF111F4CD03403EB6F7', 41, 'OfficeNonPlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1416, '0', '02072015331152ECF111F4CD03403EB6F7', 44, 'NonOfficePlantillaPositionEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1417, '0', '02072015331152ECF111F4CD03403EB6F7', 33, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1418, '0', '02072015331152ECF111F4CD03403EB6F7', 34, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1419, '0', '02072015331152ECF111F4CD03403EB6F7', 35, 'rptDivisionPersonnel.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1420, '0', '02072015331152ECF111F4CD03403EB6F7', 42, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(1421, '0', '02072015331152ECF111F4CD03403EB6F7', 43, 'PersonnelScheduleEntryAdd.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '2/9/2015 8:48:55 PM'),
	(3572, '0', '04092015351013406688026FD84887B6A4', 65, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3573, '0', '04092015351013406688026FD84887B6A4', 66, 'ApplyAppendLogTime.aspx', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3574, '0', '04092015351013406688026FD84887B6A4', 77, 'AttendanceEmployeeNoLog.aspx', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3575, '0', '04092015351013406688026FD84887B6A4', 61, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3576, '0', '04092015351013406688026FD84887B6A4', 62, 'BioOnlineLogTimeDownload.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3577, '0', '04092015351013406688026FD84887B6A4', 63, 'BiometricEmployeeDTRPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3578, '0', '04092015351013406688026FD84887B6A4', 64, 'ProcessTimeLogsIndividual.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3579, '0', '04092015351013406688026FD84887B6A4', 84, 'ProcessTimeLogsAll.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3580, '0', '04092015351013406688026FD84887B6A4', 78, 'ViewBiometricRawTimeLogs.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3581, '0', '04092015351013406688026FD84887B6A4', 67, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3582, '0', '04092015351013406688026FD84887B6A4', 68, 'EmployeeInformation.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3583, '0', '04092015351013406688026FD84887B6A4', 71, 'BiometricEmployeeShiftSchedule.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3584, '0', '04092015351013406688026FD84887B6A4', 70, 'BiometricScheduleEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3585, '0', '04092015351013406688026FD84887B6A4', 69, 'HolidayEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3586, '0', '04092015351013406688026FD84887B6A4', 79, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3587, '0', '04092015351013406688026FD84887B6A4', 80, 'PositionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3588, '0', '04092015351013406688026FD84887B6A4', 81, 'DivisionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3589, '0', '04092015351013406688026FD84887B6A4', 38, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3590, '0', '04092015351013406688026FD84887B6A4', 39, 'EmployeeUserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3591, '0', '04092015351013406688026FD84887B6A4', 47, 'EmployeeUserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3592, '0', '04092015351013406688026FD84887B6A4', 82, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3593, '0', '04092015351013406688026FD84887B6A4', 83, 'rptBiometricDailyTimeLogPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '5/5/2015 1:49:09 PM'),
	(3638, '0', '040920153510058B0D09A2F7164379A4B8', 65, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3639, '0', '040920153510058B0D09A2F7164379A4B8', 66, 'ApplyAppendLogTime.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3640, '0', '040920153510058B0D09A2F7164379A4B8', 77, 'AttendanceEmployeeNoLog.aspx', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3641, '0', '040920153510058B0D09A2F7164379A4B8', 61, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3642, '0', '040920153510058B0D09A2F7164379A4B8', 62, 'BioOnlineLogTimeDownload.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3643, '0', '040920153510058B0D09A2F7164379A4B8', 63, 'BiometricEmployeeDTRPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3644, '0', '040920153510058B0D09A2F7164379A4B8', 64, 'ProcessTimeLogsIndividual.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3645, '0', '040920153510058B0D09A2F7164379A4B8', 84, 'ProcessTimeLogsAll.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3646, '0', '040920153510058B0D09A2F7164379A4B8', 78, 'ViewBiometricRawTimeLogs.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3647, '0', '040920153510058B0D09A2F7164379A4B8', 67, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3648, '0', '040920153510058B0D09A2F7164379A4B8', 68, 'EmployeeInformation.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3649, '0', '040920153510058B0D09A2F7164379A4B8', 71, 'BiometricEmployeeShiftSchedule.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3650, '0', '040920153510058B0D09A2F7164379A4B8', 70, 'BiometricScheduleEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3651, '0', '040920153510058B0D09A2F7164379A4B8', 69, 'HolidayEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3652, '0', '040920153510058B0D09A2F7164379A4B8', 79, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3653, '0', '040920153510058B0D09A2F7164379A4B8', 80, 'PositionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3654, '0', '040920153510058B0D09A2F7164379A4B8', 81, 'DivisionEntry.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3655, '0', '040920153510058B0D09A2F7164379A4B8', 82, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3656, '0', '040920153510058B0D09A2F7164379A4B8', 83, 'rptBiometricDailyTimeLogPrinting.aspx', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3657, '0', '040920153510058B0D09A2F7164379A4B8', 38, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3658, '0', '040920153510058B0D09A2F7164379A4B8', 39, 'EmployeeUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(3659, '0', '040920153510058B0D09A2F7164379A4B8', 47, 'EmployeeUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'RAY ANTHONY   VIRTUDAZO', '5/16/2015 10:41:01 AM'),
	(5373, '4', '1111', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:29 PM'),
	(5374, '4', '1111', 22, 'ValidateRegistration.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:29 PM'),
	(5375, '4', '1111', 23, 'PendingRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:29 PM'),
	(5376, '4', '1111', 41, 'TagRegistration.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5377, '4', '1111', 42, 'RegistrationStatus.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5378, '4', '1111', 43, 'RegistrationComments.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5379, '4', '1111', 44, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5380, '4', '1111', 45, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5381, '4', '1111', 46, 'refLivingA.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5382, '4', '1111', 47, 'refSkills.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5383, '4', '1111', 48, 'refCommunity.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5384, '4', '1111', 49, 'refLivingB.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5385, '4', '1111', 50, 'refSourceIncome.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5386, '4', '1111', 51, 'refAssetA.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5387, '4', '1111', 52, 'refAssetB.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5388, '4', '1111', 53, 'refPNC.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5389, '4', '1111', 54, 'refHealth.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5390, '4', '1111', 55, 'refSocial.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5391, '4', '1111', 56, 'refDifficulty.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5392, '4', '1111', 57, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5393, '4', '1111', 58, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:30 PM'),
	(5394, '4', '1111', 59, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 2:45:31 PM'),
	(5395, '1', 'admin', 60, 'DashBoard.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5396, '1', 'admin', 21, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5397, '1', 'admin', 22, 'ValidateRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5398, '1', 'admin', 23, 'PendingRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5399, '1', 'admin', 41, 'TagRegistration.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5400, '1', 'admin', 42, 'RegistrationStatus.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5401, '1', 'admin', 43, 'RegistrationComments.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5402, '1', 'admin', 44, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5403, '1', 'admin', 45, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5404, '1', 'admin', 46, 'refLivingA.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5405, '1', 'admin', 47, 'refSkills.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5406, '1', 'admin', 48, 'refCommunity.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5407, '1', 'admin', 49, 'refLivingB.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5408, '1', 'admin', 50, 'refSourceIncome.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5409, '1', 'admin', 51, 'refAssetA.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5410, '1', 'admin', 52, 'refAssetB.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5411, '1', 'admin', 53, 'refPNC.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:17 PM'),
	(5412, '1', 'admin', 54, 'refHealth.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5413, '1', 'admin', 55, 'refSocial.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5414, '1', 'admin', 56, 'refDifficulty.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5415, '1', 'admin', 57, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5416, '1', 'admin', 58, 'adminUserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5417, '1', 'admin', 59, 'adminUserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5418, '1', 'admin', 1, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5419, '1', 'admin', 2, 'UserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5420, '1', 'admin', 3, 'UserRole.aspx', 'N', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5421, '1', 'admin', 4, 'UserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5422, '1', 'admin', 5, 'RolePermission.aspx', 'N', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5423, '1', 'admin', 6, 'cmsMenu.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'System Administrator', '10/21/2025 3:06:18 PM'),
	(5502, '4', 'scadmin', 60, 'DashBoard.aspx', 'Y', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5503, '4', 'scadmin', 61, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5504, '4', 'scadmin', 63, 'Trainings.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5505, '4', 'scadmin', 64, 'TrainingReport.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5506, '4', 'scadmin', 57, '&nbsp;', 'N', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5507, '4', 'scadmin', 58, 'adminUserEntry.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:38 PM'),
	(5508, '4', 'scadmin', 59, 'adminUserPermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5509, '4', 'scadmin', 1, '&nbsp;', 'Y', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5510, '4', 'scadmin', 2, 'UserEntry.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5511, '4', 'scadmin', 3, 'UserRole.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5512, '4', 'scadmin', 4, 'UserPermission.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5513, '4', 'scadmin', 5, 'RolePermission.aspx', 'N', 'N', 'N', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM'),
	(5514, '4', 'scadmin', 6, 'cmsMenu.aspx', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'scadmin', '2/5/2026 1:52:39 PM');

-- Dumping structure for table db_cctms.tbl_user_info
CREATE TABLE IF NOT EXISTS `tbl_user_info` (
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_role_id` int(11) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  `is_active` char(1) DEFAULT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_user_info: ~4 rows (approximately)
INSERT INTO `tbl_user_info` (`user_id`, `user_name`, `user_role_id`, `user_password`, `is_active`, `last_user`, `last_date`) VALUES
	('scadmin', 'scadmin', 4, 'Vw6ttcqROO4c4edd6202aaf1420f', 'Y', '', '9/10/2015 2:37:16 PM'),
	('pong', 'Pong', 4, 'ScERpQRcQP0480d834b6493e4b9a', 'Y', '', '10/25/2016 1:40:01 PM'),
	('admin', 'System Administrator', 1, 'XwvrVjGvGjKEkJRDXBxuyg=baf4ecee3192340c2', 'Y', 'INITIALIZED', '4/17/2014 10:29:54 AM'),
	('1111', 'Sample User', 4, 'tl9UUtoyQm2uzSorsCfAEg=e0ea150034825421a', 'Y', 'System Administrator', '10/21/2025 2:27:32 PM');

-- Dumping structure for table db_cctms.tbl_user_role
CREATE TABLE IF NOT EXISTS `tbl_user_role` (
  `user_role_id` int(11) NOT NULL,
  `user_role_name` varchar(50) DEFAULT NULL,
  `user_role_description` varchar(200) DEFAULT NULL,
  `is_active` char(1) NOT NULL,
  `last_user` varchar(50) DEFAULT NULL,
  `last_date` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_user_role: ~2 rows (approximately)
INSERT INTO `tbl_user_role` (`user_role_id`, `user_role_name`, `user_role_description`, `is_active`, `last_user`, `last_date`) VALUES
	(1, 'Administrator', 'System Administrator', 'Y', 'INITIALIZED', '4/17/2014 10:29:54 AM'),
	(4, 'User', '', 'Y', 'System Administrator', '6/24/2014 2:11:33 PM');

-- Dumping structure for table db_cctms.tbl_visitor
CREATE TABLE IF NOT EXISTS `tbl_visitor` (
  `trans_id` varchar(50) NOT NULL,
  `visitor_ip` varchar(50) DEFAULT NULL,
  `visitor_date` date DEFAULT NULL,
  `visitor_datetime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `visitor_date` (`visitor_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table db_cctms.tbl_visitor: ~43 rows (approximately)
INSERT INTO `tbl_visitor` (`trans_id`, `visitor_ip`, `visitor_date`, `visitor_datetime`) VALUES
	('01192026050235D8C0E1CDBCCE4AFB96B626D58', '::1', '2026-01-19', '1/19/2026 2:05:35 PM'),
	('0119202607020867D69819012D425DB9778A5F1', '::1', '2026-01-19', '1/19/2026 2:07:08 PM'),
	('011920261401236D2CE34BDFC64EE2A3812FC3F', '::1', '2026-01-19', '1/19/2026 1:14:23 PM'),
	('0119202633011730514F68B5E74A80BACC04BFC', '::1', '2026-01-19', '1/19/2026 1:33:17 PM'),
	('01192026350106C7CA3A5D7A5B4BA9B56638D96', '::1', '2026-01-19', '1/19/2026 1:35:06 PM'),
	('01192026351022E6AA4B8B47974685A2D9D616B', '::1', '2026-01-19', '1/19/2026 10:35:22 AM'),
	('0119202639115045DDD4C235D648EE9E375421E', '::1', '2026-01-19', '1/19/2026 11:39:50 AM'),
	('0119202640101676084034ED5148A48D9C05E59', '::1', '2026-01-19', '1/19/2026 10:40:16 AM'),
	('01192026461004D71815233F17478DA3B3FDF78', '::1', '2026-01-19', '1/19/2026 10:46:04 AM'),
	('012020263109536B9354B0279C472E9C65CB988', '::1', '2026-01-20', '1/20/2026 9:31:53 AM'),
	('102120251511156500B18BE16C4DD989A22AB03', '::1', '2025-10-21', '10/21/2025 11:15:15 AM'),
	('10212025181147104D6D67879D4C37B616326C9', '::1', '2025-10-21', '10/21/2025 11:18:47 AM'),
	('1021202534030549E4BECFD1394089A837FE13E', '::1', '2025-10-21', '10/21/2025 3:34:05 PM'),
	('10212025340444026B0A06E14F410AAF4348075', '::1', '2025-10-21', '10/21/2025 4:34:44 PM'),
	('10212025471156A0F0043185FC4263BF8624A6C', '::1', '2025-10-21', '10/21/2025 11:47:56 AM'),
	('102120254811592118875A7D1B47BF8B35DC1E5', '::1', '2025-10-21', '10/21/2025 11:48:59 AM'),
	('10212025591133308FF316561C48CCA8FDE69A2', '::1', '2025-10-21', '10/21/2025 11:59:33 AM'),
	('10222025140229336386968464458AAEE626D8D', '::1', '2025-10-22', '10/22/2025 2:14:29 PM'),
	('10222025270103B38D41D20516468E901A318E7', '::1', '2025-10-22', '10/22/2025 1:27:03 PM'),
	('102220255001130905F6660B9341CA85CBB174E', '::1', '2025-10-22', '10/22/2025 1:50:13 PM'),
	('10222025510107F44BBC29BC8847F3AEF31D3D6', '::1', '2025-10-22', '10/22/2025 1:51:07 PM'),
	('102320251702161653C5922CCE4BBCB54B6AA3D', '::1', '2025-10-23', '10/23/2025 2:17:16 PM'),
	('10232025300255C77A5ADEFB8F4E09A64DA3A48', '::1', '2025-10-23', '10/23/2025 2:30:55 PM'),
	('10232025380111909D2CDE19FC4834BC03D40F0', '::1', '2025-10-23', '10/23/2025 1:38:11 PM'),
	('10232025460124A32B62A56EC44858BD93300B6', '::1', '2025-10-23', '10/23/2025 1:46:24 PM'),
	('102320255102154959607B59374DF49A22C76D0', '::1', '2025-10-23', '10/23/2025 2:51:15 PM'),
	('1024202521010861C91D3ADBF64FD1AAE8CB0A6', '::1', '2025-10-24', '10/24/2025 1:21:08 PM'),
	('102420252201025C433256F6094B78A62A47A3C', '::1', '2025-10-24', '10/24/2025 1:22:02 PM'),
	('10242025270143C4B744AC687E406A8B4AC406F', '::1', '2025-10-24', '10/24/2025 1:27:43 PM'),
	('10242025300139293C93429C6F49CCBB4E9C24B', '::1', '2025-10-24', '10/24/2025 1:30:39 PM'),
	('102420254501219576EDD97ADC45D08178574BA', '192.168.88.208', '2025-10-24', '10/24/2025 1:45:21 PM'),
	('1111202503101639D12E1A072C4C76B2F36A69B', '::1', '2025-11-11', '11/11/2025 10:03:16 AM'),
	('112020251111212A3A92F0B2CE42609A9E418FC', '::1', '2025-11-20', '11/20/2025 11:11:21 AM'),
	('1127202558012293A2DECCDF9447D88DE87C4DF', '::1', '2025-11-27', '11/27/2025 1:58:22 PM'),
	('12032025020908CAD40C1444B94075BAAF658B7', '192.168.88.208', '2025-12-03', '12/3/2025 9:02:08 AM'),
	('12032025081038813D4C50B37641DF822079E44', '::1', '2025-12-03', '12/3/2025 10:08:38 AM'),
	('12032025171027F1F0104173944DC4BB7CA50BB', '192.168.88.208', '2025-12-03', '12/3/2025 10:17:27 AM'),
	('12032025190845F89C095A11D54214910AB2937', '::1', '2025-12-03', '12/3/2025 8:19:45 AM'),
	('1203202520081396D5C1090F65433C9F691473C', '192.168.88.202', '2025-12-03', '12/3/2025 8:20:13 AM'),
	('12032025240834A48BE2393ECE4F62BA20ED32E', '192.168.88.202', '2025-12-03', '12/3/2025 8:24:34 AM'),
	('12032025270811E33735835EFE44AEA9D5A3768', '192.168.88.208', '2025-12-03', '12/3/2025 8:27:11 AM'),
	('120320253608159B035313812C410AB511EAB12', '192.168.88.208', '2025-12-03', '12/3/2025 8:36:15 AM'),
	('120320255408302CF2231E943C46B784284F5C1', '::1', '2025-12-03', '12/3/2025 8:54:30 AM');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
