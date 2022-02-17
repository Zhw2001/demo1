/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-02-17 18:44:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role` (
  `UR_role_id` bigint(20) NOT NULL,
  `UR_uid` bigint(20) NOT NULL,
  `user_cid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UR_role_id`,`UR_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES ('1', '1', 'E_XX110110s,GD_XX127130,CD_XX127030,C_XX110100');
INSERT INTO `admin_user_role` VALUES ('2', '11', null);
INSERT INTO `admin_user_role` VALUES ('4', '1', 'E_XX110110s,GD_XX127130,CD_XX127030');
INSERT INTO `admin_user_role` VALUES ('4', '2', 'C_XX110100');
INSERT INTO `admin_user_role` VALUES ('4', '3', 'C_XX110100');
INSERT INTO `admin_user_role` VALUES ('2', '1', 'C_XX110100');
