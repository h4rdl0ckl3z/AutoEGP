/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 101106 (10.11.6-MariaDB-0+deb12u1)
 Source Host           : localhost:3306
 Source Schema         : egp

 Target Server Type    : MySQL
 Target Server Version : 101106 (10.11.6-MariaDB-0+deb12u1)
 File Encoding         : 65001

 Date: 13/08/2024 21:02:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) NOT NULL,
  `epak` varchar(255) NOT NULL,
  `ecity` varchar(255) NOT NULL,
  `numid` varchar(255) NOT NULL,
  `eaddress` text DEFAULT NULL,
  `etel` varchar(255) DEFAULT NULL,
  `efax` varchar(255) DEFAULT NULL,
  `eweb` text DEFAULT NULL,
  `eemail` varchar(255) DEFAULT NULL,
  `emap` text DEFAULT NULL,
  `emassage` text DEFAULT NULL,
  `ecal` text DEFAULT NULL,
  `eper` text DEFAULT NULL,
  `esta` int(11) DEFAULT NULL,
  `exp` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for egps
-- ----------------------------
DROP TABLE IF EXISTS `egps`;
CREATE TABLE `egps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numID` int(11) DEFAULT NULL,
  `title` mediumtext DEFAULT NULL,
  `link` mediumtext DEFAULT NULL,
  `pubDate` date DEFAULT NULL,
  `pubt` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `link` (`link`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;
