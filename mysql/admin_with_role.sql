/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-25 17:45:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_with_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_with_role`;
CREATE TABLE `admin_with_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_role_id` bigint(20) DEFAULT NULL,
  `admin_uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_with_role
-- ----------------------------
INSERT INTO `admin_with_role` VALUES ('1', '1000000', '1');
INSERT INTO `admin_with_role` VALUES ('2', '1000001', '11');
