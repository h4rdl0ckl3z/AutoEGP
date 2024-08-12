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

 Date: 12/08/2024 23:24:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for egp
-- ----------------------------
DROP TABLE IF EXISTS `egp`;
CREATE TABLE `egp` (
  `EGPID` int(11) NOT NULL AUTO_INCREMENT,
  `numID` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `pubDate` varchar(255) DEFAULT NULL,
  `pubt` varchar(255) DEFAULT NULL,
  `pubd` varchar(255) DEFAULT NULL,
  `pubm` varchar(255) DEFAULT NULL,
  `puby` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EGPID`,`link`) USING BTREE,
  UNIQUE KEY `link` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for egp_id
-- ----------------------------
DROP TABLE IF EXISTS `egp_id`;
CREATE TABLE `egp_id` (
  `EGPID` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) DEFAULT NULL,
  `numID` varchar(255) DEFAULT NULL,
  `eaddress` varchar(255) DEFAULT NULL,
  `etel` varchar(255) DEFAULT NULL,
  `efax` varchar(255) DEFAULT NULL,
  `eweb` varchar(255) DEFAULT NULL,
  `eEmail` varchar(255) DEFAULT NULL,
  `eMap` varchar(255) DEFAULT NULL,
  `eMassage` varchar(255) DEFAULT NULL,
  `ecal` varchar(255) DEFAULT NULL,
  `eper` varchar(255) DEFAULT NULL,
  `esta` varchar(255) DEFAULT NULL,
  `epak` varchar(255) DEFAULT NULL,
  `ecity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EGPID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
