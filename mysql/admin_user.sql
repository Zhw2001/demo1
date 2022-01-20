/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-20 14:46:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `uid` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'uid',
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
  `admin_role_ids` longtext COLLATE utf8_unicode_ci COMMENT '后台用户角色id列表',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_timestamp` bigint(50) DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('10HWBcXmDnz', '/default/img/avatar.png', 'admin', 'admin', '51095f5de38e250ecaa8706ddf6cbfe6793ca3c1e254d96e8eaa8290fec4ba0ce58c73ecb3bcdd2c', null, null, null, null, '1', null, '100000', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_user` VALUES ('6a314519', null, '1112', null, '1111111', '12', '12', null, null, '1', null, null, '2022-01-19 16:01:22', '20220119160122');
INSERT INTO `admin_user` VALUES ('7878df5c', null, '11110', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:02:04', '20220119160204');
INSERT INTO `admin_user` VALUES ('84cee5ee', null, '1117', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:01:54', '20220119160154');
INSERT INTO `admin_user` VALUES ('996149c6', null, '1116', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:01:52', '20220119160152');
INSERT INTO `admin_user` VALUES ('9bf9fe3b', null, '1119', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:02:01', '20220119160201');
INSERT INTO `admin_user` VALUES ('b1ab1c30', null, '1115', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:01:49', '20220119160149');
INSERT INTO `admin_user` VALUES ('d4569380', null, '1114', null, '1111111', '12', '12', null, null, '0', null, null, '2022-01-19 16:01:31', '20220119160131');
INSERT INTO `admin_user` VALUES ('eb9a362f', null, '1113', null, '1111111', '12', '12', null, null, '0', null, null, '2022-01-19 16:01:27', '20220119160127');
INSERT INTO `admin_user` VALUES ('ff5bdb6c', null, '1118', null, '1111111', '111', '111', null, null, '0', null, null, '2022-01-19 16:01:57', '20220119160157');
INSERT INTO `admin_user` VALUES ('GdqxOSGlx', '/default/img/avatar.png', 'testuser', 'test', 'a4cf5bc91236bb98316ba49c4aeaf848d3b590a0a2be1734cdfaa6818f3158aef9c4761cec99922e', '13569875641', '1@1.com', null, null, '1', null, null, '2022-01-18 14:49:40', '1642488580');
