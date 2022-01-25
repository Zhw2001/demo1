/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-25 17:44:52
*/

SET FOREIGN_KEY_CHECKS=0;

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
