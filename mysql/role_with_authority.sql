/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-25 17:45:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `role_with_authority`
-- ----------------------------
DROP TABLE IF EXISTS `role_with_authority`;
CREATE TABLE `role_with_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_role_id` bigint(20) DEFAULT NULL,
  `admin_authority_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_with_authority
-- ----------------------------
INSERT INTO `role_with_authority` VALUES ('1', '1000000', '1');
INSERT INTO `role_with_authority` VALUES ('2', '1000000', '2');
INSERT INTO `role_with_authority` VALUES ('3', '1000000', '3');
INSERT INTO `role_with_authority` VALUES ('4', '1000000', '4');
INSERT INTO `role_with_authority` VALUES ('5', '1000000', '5');
INSERT INTO `role_with_authority` VALUES ('6', '1000001', '5');
INSERT INTO `role_with_authority` VALUES ('7', '1000001', '1');
