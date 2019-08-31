/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : hebeikeji

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-05-24 21:19:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dean
-- ----------------------------
DROP TABLE IF EXISTS `dean`;
CREATE TABLE `dean` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `mobilephone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dean
-- ----------------------------

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `usci` varchar(255) DEFAULT NULL,
  `faren_name` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization
-- ----------------------------

-- ----------------------------
-- Table structure for platform_info
-- ----------------------------
DROP TABLE IF EXISTS `platform_info`;
CREATE TABLE `platform_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Puserid` int(11) DEFAULT NULL,
  `Pdeanid` int(11) DEFAULT NULL,
  `Porganizationid` int(11) DEFAULT NULL,
  `Pgrade` int(11) DEFAULT NULL,
  `Pdistrict` varchar(255) DEFAULT NULL,
  `Pform` int(11) DEFAULT NULL,
  `Punite` int(11) DEFAULT NULL,
  `Pjjjgj` int(11) DEFAULT NULL,
  `Pindustry` varchar(255) DEFAULT NULL,
  `Psubject` varchar(255) DEFAULT NULL,
  `Pgjdw` varchar(255) DEFAULT NULL,
  `Pwebsite` varchar(255) DEFAULT NULL,
  `Pweburl` varchar(255) DEFAULT NULL,
  `Paddress` varchar(255) DEFAULT NULL,
  `Ppostcode` varchar(255) DEFAULT NULL,
  `Pstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of platform_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `platform_name` varchar(255) DEFAULT NULL,
  `platform_no` varchar(255) DEFAULT NULL,
  `approval_date` datetime DEFAULT NULL,
  `approval_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '', ' ', '2019-05-24 16:40:33', ' ', 'admin', ' ');
