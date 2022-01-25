/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-25 17:44:44
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
INSERT INTO `admin_authority` VALUES ('5', '课程数据', '1', '1', '数据查看', '', '11', '课程数据', '1', '2022-01-24 13:59:36');
