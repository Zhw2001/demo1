/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-25 17:44:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `avatar` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `account` char(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户',
  `nickname` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `phone` bigint(28) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `last_sign_time` bigint(50) DEFAULT NULL COMMENT '最后登录时间',
  `reg_ip` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册IP',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否可以登录',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', '/default/img/avatar.png', 'admin', 'admin', '123456', null, null, null, null, '1', null, '2022-01-10 15:09:48');
INSERT INTO `admin_user` VALUES ('2', null, '1112', null, '1111111', '12', '12', null, null, '1', null, '2022-01-19 16:01:22');
INSERT INTO `admin_user` VALUES ('3', null, '11110', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:02:04');
INSERT INTO `admin_user` VALUES ('4', null, '1117', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:01:54');
INSERT INTO `admin_user` VALUES ('5', null, '1116', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:01:52');
INSERT INTO `admin_user` VALUES ('6', null, '1119', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:02:01');
INSERT INTO `admin_user` VALUES ('7', null, '1115', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:01:49');
INSERT INTO `admin_user` VALUES ('8', null, '1114', null, '1111111', '12', '12', null, null, '0', null, '2022-01-19 16:01:31');
INSERT INTO `admin_user` VALUES ('9', null, '1113', null, '1111111', '12', '12', null, null, '0', null, '2022-01-19 16:01:27');
INSERT INTO `admin_user` VALUES ('10', null, '1118', null, '1111111', '111', '111', null, null, '0', null, '2022-01-19 16:01:57');
INSERT INTO `admin_user` VALUES ('11', '/default/img/avatar.png', 'testuser', 'test', '123456', '13569875641', '1@1.com', null, null, '1', null, '2022-01-18 14:49:40');
