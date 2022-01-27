/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-27 18:13:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_authority`
-- ----------------------------
DROP TABLE IF EXISTS `admin_authority`;
CREATE TABLE `admin_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `authority_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名字',
  `authority_type` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限类型',
  `authority_parent_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限父ID',
  `authority_parent_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父权限名字',
  `authority_url` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限树的连接路径',
  `authority_sort` int(20) DEFAULT '-1' COMMENT '权限树的排序',
  `authority_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限描述',
  `enable` tinyint(1) DEFAULT '0' COMMENT '是否可以显示',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_authority
-- ----------------------------
INSERT INTO `admin_authority` VALUES ('1', '查看数据', '1', '', '', '', '1', '查看数据', '1', '2022-01-06 15:09:48');
INSERT INTO `admin_authority` VALUES ('2', '生成表格', '1', null, '', '', '2', '填写&生成', '1', '2022-01-24 14:01:27');
INSERT INTO `admin_authority` VALUES ('3', '用户管理', '1', null, '', '', '3', '用户管理', '1', '2022-01-24 14:03:37');
INSERT INTO `admin_authority` VALUES ('4', '系统管理', '1', '', '管理员管理', '', '4', '管理员管理', '1', '2022-01-24 14:04:45');
INSERT INTO `admin_authority` VALUES ('5', '课程数据', '1', '1', '数据查看', '', '1', '课程数据', '1', '2022-01-24 13:59:36');

-- ----------------------------
-- Table structure for `admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id 主键，自增',
  `role_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户',
  `role_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1000000', 'super admin', 'super admin', '2022-01-10 15:09:48');
INSERT INTO `admin_role` VALUES ('1000001', '测试', '测试', '2022-01-18 14:50:05');

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

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `avatar` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `account` char(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户',
  `nickname` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `phone` bigint(28) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否可以登录',
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户描述',
  `user_role_ids` bigint(20) DEFAULT NULL COMMENT '后台用户角色id列表',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '/default/img/avatar.png', 'testuser1', 'test1', '51095f5de38e250ecaa8706ddf6cbfe6793ca3c1e254d96e8eaa8290fec4ba0ce58c73ecb3bcdd2c', null, null, '1', null, '10000', '2022-01-10 15:09:48');
INSERT INTO `user` VALUES ('2', '/default/img/avatar.png', 'testuser2', 'test2', 'a4cf5bc91236bb98316ba49c4aeaf848d3b590a0a2be1734cdfaa6818f3158aef9c4761cec99922e', '13569875641', '1@1.com', '1', null, '100000', '2022-01-18 14:49:40');

-- ----------------------------
-- Table structure for `user_authority`
-- ----------------------------
DROP TABLE IF EXISTS `user_authority`;
CREATE TABLE `user_authority` (
  `authority_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `authority_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名字',
  `authority_type` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限类型',
  `authority_parent_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限父ID',
  `authority_parent_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父权限名字',
  `authority_url` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限树的连接路径',
  `authority_sort` int(20) DEFAULT NULL COMMENT '权限树的排序',
  `authority_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限描述',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否可以显示',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_authority
-- ----------------------------
INSERT INTO `user_authority` VALUES ('1', '查看数据', '1', '', '', '', '1', '查看数据', '1', '2022-01-06 15:09:48');
INSERT INTO `user_authority` VALUES ('2', '生成表格', '1', '', '', '', '2', '填写&生成', '1', '2022-01-24 14:01:27');
INSERT INTO `user_authority` VALUES ('3', '用户管理', '1', '', '', '', '3', '用户管理', '1', '2022-01-24 14:03:37');
INSERT INTO `user_authority` VALUES ('4', '系统管理', '1', '', '', '', '4', '管理员管理', '1', '2022-01-24 14:04:45');
INSERT INTO `user_authority` VALUES ('5', '课程数据', '1', '1', '查看数据', '', '1', '课程数据', '1', '2022-01-24 13:59:36');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `user_role_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户角色名字',
  `user_role_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户角色描述',
  `user_authority_id` bigint(20) DEFAULT NULL COMMENT '角色权限id列表',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否有效',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('10000', '默认用户', '默认用户，拥有默认用户的权限', '1', '1', '2022-01-10 15:09:48');
INSERT INTO `user_role` VALUES ('100000', '认证作者', '认证作者发布文章时，默认对所有人可见', '2', '1', '2022-01-10 15:09:48');
