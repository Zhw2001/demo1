/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : graduationdb

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 27/02/2022 21:27:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_authority
-- ----------------------------
DROP TABLE IF EXISTS `admin_authority`;
CREATE TABLE `admin_authority`  (
  `authority_name` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名字',
  `authority_type` int(20) DEFAULT NULL COMMENT '权限类型',
  `authority_parent_id` bigint(20) DEFAULT NULL COMMENT '权限父ID',
  `authority_parent_name` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父权限名字',
  `authority_url` char(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限树的连接路径',
  `authority_sort` int(11) DEFAULT -1 COMMENT '权限树的排序',
  `authority_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限描述',
  `auth_enable` int(1) DEFAULT 0 COMMENT '是否可以显示',
  `auth_create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `authority_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`authority_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_authority
-- ----------------------------
INSERT INTO `admin_authority` VALUES ('内容合理性审核', 1, NULL, '', 'EA', 1, '', 1, '2022-01-06 15:09:48', 1);
INSERT INTO `admin_authority` VALUES ('考核信息填写', 1, 1, '内容合理性审核', 'EA_Input', 1, '填写内容合理性审核所需信息', 1, '2022-01-24 14:03:37', 2);
INSERT INTO `admin_authority` VALUES ('课程目标成绩明细', 1, NULL, '', 'CGD', 2, '', 1, '2022-01-24 13:59:36', 3);
INSERT INTO `admin_authority` VALUES ('课程成绩录入', 1, 3, '课程目标成绩明细', 'CGD_Input', 1, '录入课程成绩数据', 1, '2022-02-13 16:21:56', 4);
INSERT INTO `admin_authority` VALUES ('课程目标达成度评价', 1, NULL, '', 'ADE', 3, '', 1, '2022-02-13 16:21:59', 5);
INSERT INTO `admin_authority` VALUES ('目标信息填写', 1, 5, '课程目标达成度评价', 'ADE_Input', 1, '目标达成度评价所需信息填写', 1, '2022-02-13 16:24:11', 6);
INSERT INTO `admin_authority` VALUES ('我的历史课程信息', 1, NULL, '', 'MyCourse', 4, '', 1, '2022-02-13 16:24:49', 7);
INSERT INTO `admin_authority` VALUES ('课程列表', 1, 7, '我的历史课程信息', 'Latest_C_Info', 1, '所负责课程信息的展示', 1, '2022-02-17 22:15:12', 8);
INSERT INTO `admin_authority` VALUES ('课程目标明细', 1, 7, '我的历史课程信息', 'Latest_A_Detail', 2, '历史生成的课程目标明细下载', 1, '2022-02-17 22:15:16', 9);
INSERT INTO `admin_authority` VALUES ('用户管理', 1, NULL, NULL, 'User', 5, NULL, 1, '2022-02-17 22:15:18', 10);
INSERT INTO `admin_authority` VALUES ('用户信息', 1, 10, '用户管理', 'UserInfo', 1, '读取和写入用户信息', 1, '2022-02-17 22:15:20', 11);
INSERT INTO `admin_authority` VALUES ('用户角色', 1, 10, '用户管理', 'UserRole', 2, '设置用户角色', 1, '2022-02-17 22:15:23', 12);
INSERT INTO `admin_authority` VALUES ('用户权限', 1, 10, '用户管理', 'UserAuth', 3, '查看用户权限', 1, '2022-02-17 22:15:25', 13);
INSERT INTO `admin_authority` VALUES ('分配课程', 1, 10, '用户管理', 'UserCC', 4, '为用户分配教授的课程', 1, '2022-02-26 14:39:34', 14);

-- ----------------------------
-- Table structure for admin_course_class
-- ----------------------------
DROP TABLE IF EXISTS `admin_course_class`;
CREATE TABLE `admin_course_class`  (
  `cc_account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cc_role_id` bigint(20) NOT NULL,
  `user_cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`cc_account`, `cc_role_id`, `user_cid`, `course_class`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_course_class
-- ----------------------------
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110110', '操作系统', '计算机193');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110110s', '操作系统实验', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 2, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 2, 'XX127030', '操作系统课程设计', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 4, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin01', 1, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin01', 4, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin02', 4, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin10', 2, 'XX110110', '操作系统', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'JY391001', '国际航运概论', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'JY391001', '国际航运概论', '计算机193');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'WL320020', '物理实验', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'WL320020', '物理实验', '计算机193');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110210', '计算机网络', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110210', '计算机网络', '计算机193');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110240', '计算机原理与汇编', '计算机191');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110240', '计算机原理与汇编', '计算机192');
INSERT INTO `admin_course_class` VALUES ('admin', 1, 'XX110240', '计算机原理与汇编', '计算机181');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id 主键，自增',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户',
  `role_description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色描述',
  `role_create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES (1, 'super admin', 'super admin', '2022-01-10 15:09:48');
INSERT INTO `admin_role` VALUES (2, '测试', '测试', '2022-01-18 14:50:05');
INSERT INTO `admin_role` VALUES (3, '课程组长', '查看课程详细数据', '2022-01-30 14:53:46');
INSERT INTO `admin_role` VALUES (4, '任课老师', '读写负责课程数据', '2022-01-30 14:54:13');

-- ----------------------------
-- Table structure for admin_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_auth`;
CREATE TABLE `admin_role_auth`  (
  `RA_role_id` bigint(20) NOT NULL,
  `RA_authority_id` bigint(20) NOT NULL,
  PRIMARY KEY (`RA_role_id`, `RA_authority_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_role_auth
-- ----------------------------
INSERT INTO `admin_role_auth` VALUES (1, 1);
INSERT INTO `admin_role_auth` VALUES (1, 2);
INSERT INTO `admin_role_auth` VALUES (1, 3);
INSERT INTO `admin_role_auth` VALUES (1, 4);
INSERT INTO `admin_role_auth` VALUES (1, 5);
INSERT INTO `admin_role_auth` VALUES (1, 6);
INSERT INTO `admin_role_auth` VALUES (1, 7);
INSERT INTO `admin_role_auth` VALUES (1, 8);
INSERT INTO `admin_role_auth` VALUES (1, 9);
INSERT INTO `admin_role_auth` VALUES (1, 10);
INSERT INTO `admin_role_auth` VALUES (1, 11);
INSERT INTO `admin_role_auth` VALUES (1, 12);
INSERT INTO `admin_role_auth` VALUES (1, 13);
INSERT INTO `admin_role_auth` VALUES (1, 14);
INSERT INTO `admin_role_auth` VALUES (2, 1);
INSERT INTO `admin_role_auth` VALUES (2, 2);
INSERT INTO `admin_role_auth` VALUES (2, 3);
INSERT INTO `admin_role_auth` VALUES (2, 4);
INSERT INTO `admin_role_auth` VALUES (2, 5);
INSERT INTO `admin_role_auth` VALUES (2, 7);
INSERT INTO `admin_role_auth` VALUES (2, 10);
INSERT INTO `admin_role_auth` VALUES (2, 12);
INSERT INTO `admin_role_auth` VALUES (3, 1);
INSERT INTO `admin_role_auth` VALUES (3, 2);
INSERT INTO `admin_role_auth` VALUES (3, 3);
INSERT INTO `admin_role_auth` VALUES (3, 4);
INSERT INTO `admin_role_auth` VALUES (3, 5);
INSERT INTO `admin_role_auth` VALUES (3, 6);
INSERT INTO `admin_role_auth` VALUES (3, 7);
INSERT INTO `admin_role_auth` VALUES (3, 10);
INSERT INTO `admin_role_auth` VALUES (3, 14);
INSERT INTO `admin_role_auth` VALUES (4, 1);
INSERT INTO `admin_role_auth` VALUES (4, 2);
INSERT INTO `admin_role_auth` VALUES (4, 3);
INSERT INTO `admin_role_auth` VALUES (4, 4);
INSERT INTO `admin_role_auth` VALUES (4, 5);
INSERT INTO `admin_role_auth` VALUES (4, 6);
INSERT INTO `admin_role_auth` VALUES (4, 7);
INSERT INTO `admin_role_auth` VALUES (4, 8);
INSERT INTO `admin_role_auth` VALUES (4, 9);
INSERT INTO `admin_role_auth` VALUES (4, 10);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'uid',
  `account` char(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户',
  `nickname` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `phone` bigint(20) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(36) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账户描述',
  `create_date` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES (1, 'admin', 'zzz', '123456', 15821713348, 'admin@my.com', NULL, '2022-01-30 14:46:42');
INSERT INTO `admin_user` VALUES (2, 'admin01', 'ZhangXf', '123456', 15821713344, 'xiaoxiaohong@163.com', NULL, '2022-01-19 16:01:22');
INSERT INTO `admin_user` VALUES (3, 'admin02', 'BiK', '123456', 17326543984, 'bluelan@126.com', NULL, '2022-01-19 16:02:04');
INSERT INTO `admin_user` VALUES (4, 'admin03', 'ZhangL', '123456', 18921234465, 'white@163.com', NULL, '2022-01-19 16:01:54');
INSERT INTO `admin_user` VALUES (5, 'admin04', 'ChenL', '123456', 13811723654, 'square@163.com', NULL, '2022-01-19 16:01:52');
INSERT INTO `admin_user` VALUES (6, 'admin05', 'SunW', '123456', 16217484542, 'chensir@126.com', NULL, '2022-01-19 16:02:01');
INSERT INTO `admin_user` VALUES (7, 'admin06', 'XuM', '123456', 17022800114, 'joker@gmail.com', NULL, '2022-01-19 16:01:49');
INSERT INTO `admin_user` VALUES (8, 'admin07', 'LiuYx', '123456', 17024972739, 'doggoy@163.com', NULL, '2022-01-19 16:01:31');
INSERT INTO `admin_user` VALUES (9, 'admin08', 'HuangXx', '123456', 16761011175, 'catty@163.com', NULL, '2022-01-19 16:01:27');
INSERT INTO `admin_user` VALUES (10, 'admin09', 'ZhuCh', '123456', 17024913295, 'squirral@126.com', NULL, '2022-01-19 16:01:57');
INSERT INTO `admin_user` VALUES (11, 'admin10', 'JiaoJj', '123456', 17017219915, '1@1.com', NULL, '2022-01-18 14:49:40');
INSERT INTO `admin_user` VALUES (12, 'admin11', 'YangZy', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (13, 'admin12', 'YuN', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (14, 'admin13', 'HanYj', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (15, 'admin14', 'LuanCj', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (16, 'admin15', 'ShiYh', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (17, 'admin16', 'WuH', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (18, 'admin17', 'JinSs', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (19, 'admin18', 'XuQ', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (20, 'admin19', 'SongM', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (21, 'user01', 'LiuJ', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (22, 'user02', 'ZhuCm', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (23, 'user03', 'LiQm', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (24, 'user04', 'LiuGz', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (25, 'user05', 'JiangSm', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (26, 'user06', 'YaoM', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (27, 'user07', 'LiuTy', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (28, 'user08', 'BaiZj', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (29, 'user09', 'GeY', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (30, 'user10', 'ZhouRg', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (31, 'user11', 'WangWh', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (32, 'user12', 'WangXf', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (33, 'user13', 'GaoMt', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (34, 'user14', 'ZhangYf', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (35, 'user15', 'WeiL', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (36, 'user16', 'LiuYh', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (37, 'user17', 'LiuJing', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (38, 'user18', 'SongAj', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (39, 'user19', 'LiMj', '123456', NULL, '', '', '2022-02-07 19:47:19');
INSERT INTO `admin_user` VALUES (40, 'user20', 'TanFx', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (41, 'user21', 'ShiXh', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (42, 'user22', 'HuXc', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (43, 'user23', 'ZengWm', '123456', NULL, NULL, NULL, NULL);
INSERT INTO `admin_user` VALUES (44, 'user24', 'ZhouF', '123456', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_role`;
CREATE TABLE `admin_user_role`  (
  `UR_uid` bigint(20) NOT NULL,
  `UR_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`UR_uid`, `UR_role_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of admin_user_role
-- ----------------------------
INSERT INTO `admin_user_role` VALUES (1, 1);
INSERT INTO `admin_user_role` VALUES (1, 2);
INSERT INTO `admin_user_role` VALUES (1, 4);
INSERT INTO `admin_user_role` VALUES (2, 1);
INSERT INTO `admin_user_role` VALUES (2, 4);
INSERT INTO `admin_user_role` VALUES (3, 4);
INSERT INTO `admin_user_role` VALUES (11, 2);

-- ----------------------------
-- Table structure for cdesign
-- ----------------------------
DROP TABLE IF EXISTS `cdesign`;
CREATE TABLE `cdesign`  (
  `sTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cNum` int(11) DEFAULT NULL,
  `sId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `select` double(20, 2) DEFAULT NULL,
  `begin` double(20, 2) DEFAULT NULL,
  `medium` double(20, 2) DEFAULT NULL,
  `program` double(20, 2) DEFAULT NULL,
  `answer` double(20, 2) DEFAULT NULL,
  `report` double(20, 2) DEFAULT NULL,
  `overall` double(20, 2) DEFAULT NULL,
  `cdesign_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cdesign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cdesign
-- ----------------------------
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311020', '徐竞杰', '计算机151', '正常', 13.00, 7.00, 13.00, 17.00, 16.00, 14.00, 80.00, 2);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311026', '陈兴宇', '计算机151', '正常', 13.00, 8.00, 12.00, 16.00, 16.00, 15.00, 80.00, 3);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311029', '尹涛迪', '计算机151', '正常', 14.00, 9.00, 14.00, 18.00, 17.00, 16.00, 88.00, 4);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311037', '蒋昊', '计算机151', '正常', 12.00, 7.00, 11.00, 14.00, 14.00, 13.00, 71.00, 5);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311038', '陈家斌', '计算机151', '正常', 14.00, 7.00, 13.00, 19.00, 18.00, 14.00, 85.00, 6);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311047', '徐品真', '计算机151', '正常', 14.00, 9.00, 13.00, 20.00, 19.00, 18.00, 93.00, 7);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311050', '张一乾', '计算机151', '正常', 15.00, 9.00, 14.00, 20.00, 19.00, 18.00, 95.00, 8);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311056', '程思聪', '计算机151', '正常', 15.00, 10.00, 14.00, 20.00, 19.00, 18.00, 96.00, 9);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311066', '王佳怡', '计算机151', '正常', 13.00, 8.00, 12.00, 18.00, 17.00, 16.00, 84.00, 10);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311070', '余东海', '计算机151', '正常', 14.00, 9.00, 14.00, 18.00, 18.00, 17.00, 90.00, 11);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311083', '姚浩天', '计算机151', '正常', 14.00, 9.00, 13.00, 19.00, 18.00, 17.00, 90.00, 12);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311084', '韩蕊', '计算机151', '正常', 14.00, 9.00, 13.00, 17.00, 17.00, 16.00, 86.00, 13);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311095', '曾红', '计算机151', '正常', 14.00, 9.00, 13.00, 19.00, 18.00, 17.00, 90.00, 14);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311107', '冯士伟', '计算机151', '正常', 15.00, 8.00, 14.00, 20.00, 19.00, 16.00, 92.00, 15);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311109', '詹豪', '计算机151', '正常', 13.00, 7.00, 12.00, 18.00, 17.00, 14.00, 81.00, 16);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311116', '张超', '计算机151', '正常', 15.00, 10.00, 14.00, 19.00, 19.00, 18.00, 95.00, 17);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311117', '李新元', '计算机151', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 14.00, 78.00, 18);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311126', '周燕丽', '计算机151', '正常', 12.00, 7.00, 12.00, 17.00, 17.00, 13.00, 78.00, 19);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311135', '谢骏', '计算机151', '正常', 15.00, 9.00, 14.00, 20.00, 19.00, 17.00, 94.00, 20);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311149', '涂渊辉', '计算机151', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 17.00, 93.00, 21);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311156', '黄景', '计算机151', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 22);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311164', '王栋', '计算机151', '正常', 15.00, 9.00, 14.00, 19.00, 18.00, 17.00, 92.00, 23);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311168', '章家瑞', '计算机151', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 18.00, 94.00, 24);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311174', '张睿楠', '计算机151', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 16.00, 84.00, 25);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311193', '李筹凯', '计算机151', '正常', 13.00, 9.00, 12.00, 16.00, 16.00, 16.00, 82.00, 26);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311194', '朱泽浩', '计算机151', '正常', 15.00, 10.00, 15.00, 20.00, 20.00, 18.00, 98.00, 27);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311195', '王润豪', '计算机151', '正常', 15.00, 10.00, 15.00, 20.00, 20.00, 18.00, 98.00, 28);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311196', '沈博文', '计算机151', '正常', 14.00, 9.00, 14.00, 18.00, 18.00, 17.00, 90.00, 29);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311203', '张奕岑', '计算机151', '正常', 15.00, 9.00, 15.00, 20.00, 19.00, 17.00, 95.00, 30);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201410311013', '朱颉 再修', '计算机152', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 31);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201410311020', '曹阳再修旷考', '计算机162', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510210143', '陈暄', '计算机152', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 33);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311001', '王天赐', '计算机152', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 34);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311008', '何玉梅', '计算机152', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 35);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311010', '张雪', '计算机152', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 36);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311013', '姚心怡', '计算机153', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 37);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311014', '宋澍宾', '计算机152', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 38);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311015', '张亦然', '计算机153', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 39);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311022', '申楠', '计算机153', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 40);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311033', '沈洋', '计算机152', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 41);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311041', '周杨', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 42);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311042', '李书丽', '计算机153', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 43);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311044', '侯隽雨', '计算机153', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 44);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311046', '郭舒雨', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 45);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311049', '牟思远', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 46);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311054', '陈勇刚', '计算机153', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 47);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311055', '岳闻', '计算机152', '正常', 14.00, 9.00, 14.00, 19.00, 18.00, 19.00, 93.00, 48);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311057', '李泽萱', '计算机152', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 49);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311058', '李家欣', '计算机153', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 50);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311065', '段一鸣', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 51);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311067', '马鹏飞', '计算机152', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 52);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311068', '张昕雷', '计算机153', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 53);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311073', '陈家敬', '计算机152', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 54);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311076', '王鹏', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 55);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311077', '王智诚', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 56);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311087', '陈帆', '计算机153', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 57);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311088', '谢月波', '计算机152', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 58);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311092', '桑献成', '计算机153', '正常', 15.00, 10.00, 15.00, 20.00, 19.00, 19.00, 98.00, 59);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311094', '唐嘉文', '计算机153', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 60);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311097', '潘登', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 61);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311100', '陈雯', '计算机153', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 62);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311101', '段书锋', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 63);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311102', '刘渊明', '计算机153', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 64);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311104', '陈怡琪', '计算机152', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 65);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311105', '于洋', '计算机152', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 66);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311106', '陈颖杰', '计算机153', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 67);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311108', '周思宇', '计算机152', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 68);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311113', '卢骥轩', '计算机152', '正常', 14.00, 9.00, 14.00, 19.00, 18.00, 19.00, 93.00, 69);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311114', '薄涛', '计算机152', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 70);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311115', '倪天佳', '计算机153', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 71);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311119', '钮佩芸', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 72);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311123', '陈建卿', '计算机152', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 73);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311124', '刘笑', '计算机153', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 74);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311130', '朱伟锋', '计算机153', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 75);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311131', '夏淼菲', '计算机153', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 76);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311132', '冯赫鑫', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 77);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311136', '施旭', '计算机152', '正常', 15.00, 10.00, 15.00, 20.00, 19.00, 19.00, 98.00, 78);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311137', '杨陈', '计算机153', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 79);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311148', '孙哲', '计算机153', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 80);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311152', '梅思寒', '计算机152', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 81);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311159', '陆懿晟', '计算机153', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 82);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311169', '刘炫淇', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 83);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311172', '孔天浩', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 84);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311176', '钱艳婷', '计算机152', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 85);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311177', '任静', '计算机152', '正常', 14.00, 9.00, 14.00, 19.00, 18.00, 19.00, 93.00, 86);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311178', '刘子晨', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 87);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311188', '裘荻', '计算机153', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 88);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311191', '郑海湘', '计算机153', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 89);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311197', '项思怡', '计算机153', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 90);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311198', '蔡耀骏', '计算机153', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 91);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311204', '赵亦凡', '计算机152', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 92);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510311206', 'CYRIL APUSIYINE', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 93);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510314011', '史佳眉', '计算机153', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 94);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510314013', '李梦怡', '计算机153', '正常', 15.00, 10.00, 15.00, 20.00, 19.00, 19.00, 98.00, 95);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510320148', '赵林堃', '计算机153', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 96);
INSERT INTO `cdesign` VALUES ('2017-2018-2', 'XX127030', 1, '201510320161', '包昊冉', '计算机152', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 97);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201510311017', '付嘉懿', '计算机161', '正常', 15.00, 8.00, 14.00, 19.00, 19.00, 15.00, 90.00, 98);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311011', '杨昕皓', '计算机161', '正常', 15.00, 6.00, 15.00, 15.00, 15.00, 12.00, 78.00, 99);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311017', '陈龙', '计算机161', '正常', 14.00, 8.00, 14.00, 19.00, 19.00, 16.00, 90.00, 100);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311043', '洪嘉晖', '计算机161', '正常', 13.00, 7.00, 13.00, 15.00, 15.00, 13.00, 76.00, 101);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311045', '范晓苇', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 19.00, 17.00, 95.00, 102);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311047', '冯一丁', '计算机161', '正常', 15.00, 8.00, 15.00, 20.00, 19.00, 14.00, 91.00, 103);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311049', '虞昌远', '计算机161', '正常', 15.00, 7.00, 14.00, 15.00, 15.00, 14.00, 80.00, 104);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311068', '施程博', '计算机161', '正常', 15.00, 8.00, 14.00, 18.00, 18.00, 17.00, 90.00, 105);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311076', '樊陈', '计算机161', '正常', 14.00, 7.00, 14.00, 17.00, 17.00, 13.00, 82.00, 106);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311079', '钱品馨', '计算机161', '正常', 10.00, 6.00, 11.00, 14.00, 14.00, 12.00, 67.00, 107);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311085', '李钦源', '计算机161', '正常', 15.00, 7.00, 15.00, 15.00, 15.00, 14.00, 81.00, 108);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311105', '王晓晨', '计算机161', '正常', 14.00, 8.00, 14.00, 18.00, 18.00, 18.00, 90.00, 109);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311111', '井卓', '计算机161', '正常', 15.00, 7.00, 15.00, 19.00, 19.00, 15.00, 90.00, 110);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311112', '郁旭晖', '计算机161', '正常', 15.00, 8.00, 14.00, 18.00, 18.00, 17.00, 90.00, 111);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311113', '蔡颖锋', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 20.00, 19.00, 98.00, 112);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311114', '叶玉萍', '计算机161', '正常', 15.00, 9.00, 14.00, 20.00, 20.00, 18.00, 96.00, 113);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311116', '李铠桐', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 20.00, 19.00, 98.00, 114);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311133', '查自强', '计算机161', '正常', 15.00, 7.00, 15.00, 19.00, 19.00, 15.00, 90.00, 115);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311155', '王兆瑞', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 20.00, 19.00, 98.00, 116);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311163', '左雪婷', '计算机161', '正常', 12.00, 7.00, 12.00, 15.00, 15.00, 14.00, 75.00, 117);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311166', '储锐', '计算机161', '正常', 13.00, 7.00, 13.00, 16.00, 16.00, 15.00, 80.00, 118);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311167', '胡静雨', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 19.00, 18.00, 96.00, 119);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311189', '李闯', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 20.00, 17.00, 96.00, 120);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311195', '赵超', '计算机161', '正常', 13.00, 7.00, 13.00, 12.00, 12.00, 13.00, 70.00, 121);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311196', '张子君', '计算机161', '正常', 14.00, 7.00, 14.00, 18.00, 18.00, 14.00, 85.00, 122);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311198', '刘志丹', '计算机161', '正常', 15.00, 9.00, 15.00, 20.00, 20.00, 19.00, 98.00, 123);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311222', '黄李阳', '计算机161', '正常', 14.00, 7.00, 14.00, 18.00, 18.00, 14.00, 85.00, 124);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311224', '焦淑娜', '计算机161', '正常', 12.00, 6.00, 12.00, 11.00, 12.00, 12.00, 65.00, 125);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311228', '董文一', '计算机161', '正常', 14.00, 8.00, 14.00, 15.00, 15.00, 14.00, 80.00, 126);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311234', '孙嘉珩', '计算机161', '正常', 15.00, 8.00, 15.00, 18.00, 18.00, 14.00, 88.00, 127);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311241', '金恺文（旷考）', '计算机161', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 128);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311250', '王珊珊', '计算机161', '正常', 11.00, 6.00, 10.00, 13.00, 13.00, 12.00, 65.00, 129);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311256', '叶逸铭', '计算机161', '正常', 13.00, 7.00, 12.00, 18.00, 17.00, 15.00, 82.00, 130);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410111355', '刘平东', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 131);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410121050', '魏江燔', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 132);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410311027', '王林辉', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 133);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410311044', '王彦楠', '计算机162', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 134);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410311062', '朱子豪', '计算机163', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 135);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410311083', '王耀宗', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 136);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201410314058', '李静', '网络162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 137);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201510311024', '谭振东', '计算机151卓', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 138);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610121041', '胡涛', '计算机163', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 139);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610121045', '赵波', '计算机163', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 140);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610125010', '周徐榕', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 141);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610223126', '盛文静', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 142);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311006', '何晓阳', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 143);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311007', '郎思雯', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 144);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311008', '吴佳晖', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 145);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311009', '吴奥然', '计算机162', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 146);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311012', '李天辰', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 147);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311013', '吴子非', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 148);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311028', '占国志', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 149);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311030', '张健', '计算机162', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 150);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311032', '陈永聪', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 151);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311055', '刘小敏', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 152);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311057', '王盛楠', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 153);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311061', '冯灿', '计算机162', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 154);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311066', '李昂', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 155);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311069', '何宗正', '计算机161卓', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 156);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311070', '戴奕超', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 157);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311072', '周雨岚', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 158);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311074', '张静怡', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 159);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311078', '屠林猛', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 160);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311082', '赵理想', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 161);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311084', '胡翔坤', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 162);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311088', '卓彦志', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 163);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311091', '邹晨露', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 164);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311094', '洪珊娜', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 165);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311096', '邓思庆', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 166);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311100', '来正强', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 167);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311101', '龚逸文', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 168);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311103', '潘徐杰', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 169);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311104', '张俊帆', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 170);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311106', '缪奕晟', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 171);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311108', '杨墨政', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 172);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311109', '阮如刚', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 173);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311121', '尹俊杰', '计算机162', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 174);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311125', '林佳琰', '计算机162', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 175);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311129', '徐刚', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 176);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311130', '申博文', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 177);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311143', '郑安贤', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 178);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311144', '袁雪芹', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 179);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311147', '尹含磊', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 180);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311148', '马杰', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 181);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311153', '陈露健', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 182);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311156', '黄恩浩', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 183);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311157', '刘杰寅', '计算机163', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 184);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311165', '李源', '计算机163', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 185);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311183', '王建鑫', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 186);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311186', '杨笑成', '计算机163', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 187);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311187', '唐煜', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 188);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311188', '秦振霄', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 189);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311190', '陆锦晖', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 190);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311201', '施天琦', '计算机163', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 191);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311214', '周安顺', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 192);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311216', '徐欣依', '计算机163', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 193);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311218', '张伊凡', '计算机163', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 194);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311219', '冯源', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 195);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311225', '凡涛', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 196);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311226', '王博元', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 197);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311227', '郑翀', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 198);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311231', '周兴', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 199);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311232', '占锦明', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 200);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311235', '杨景优', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 201);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311239', '王薪程', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 202);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311246', '贺雪', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 203);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311249', '王彦淇', '计算机163', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 204);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311251', '徐凌霄', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 205);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311253', '奚好晨', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 206);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311254', '王怡清', '计算机163', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 207);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610311265', '陈波', '计算机163', '正常', 13.00, 8.00, 13.00, 17.00, 17.00, 17.00, 85.00, 208);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610320028', '唐文千', '计算机162', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 209);
INSERT INTO `cdesign` VALUES ('2018-2019-2', 'XX127030', 1, '201610733071', '刘娅', '计算机162', '正常', 15.00, 9.00, 14.00, 19.00, 19.00, 19.00, 95.00, 210);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201510311045', '俞子俊', '计算机171', '正常', 15.00, 10.00, 15.00, 19.00, 19.00, 18.00, 96.00, 211);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311011', '刘云丽', '计算机171', '正常', 15.00, 9.00, 14.00, 19.00, 18.00, 18.00, 93.00, 212);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311012', '寇嘉颖', '计算机171', '正常', 15.00, 10.00, 14.00, 18.00, 18.00, 18.00, 93.00, 213);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311015', '陈颖', '计算机171', '正常', 14.00, 8.00, 12.00, 17.00, 17.00, 17.00, 85.00, 214);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311025', '徐逸凡', '计算机171', '正常', 15.00, 10.00, 15.00, 20.00, 20.00, 19.00, 99.00, 215);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311077', '管俊洋', '计算机171', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 216);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311085', '庞张灯', '计算机171', '正常', 14.00, 8.00, 13.00, 18.00, 17.00, 17.00, 87.00, 217);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311093', '忻伟琦', '计算机171', '正常', 14.00, 9.00, 14.00, 17.00, 17.00, 17.00, 88.00, 218);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311100', '高铤', '计算机171', '正常', 14.00, 9.00, 14.00, 18.00, 18.00, 17.00, 90.00, 219);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311118', '冯雪玲', '计算机171', '正常', 10.00, 9.00, 14.00, 18.00, 17.00, 17.00, 85.00, 220);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311140', '于霖', '计算机171', '正常', 15.00, 9.00, 14.00, 18.00, 18.00, 18.00, 92.00, 221);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311150', '钮莹莹', '计算机171', '正常', 12.00, 9.00, 12.00, 16.00, 15.00, 16.00, 80.00, 222);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311151', '吴亦飞', '计算机171', '正常', 15.00, 10.00, 15.00, 19.00, 19.00, 19.00, 97.00, 223);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311152', '陈忠青', '计算机171', '正常', 15.00, 9.00, 14.00, 18.00, 19.00, 18.00, 93.00, 224);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311155', '余荔恒', '计算机171', '正常', 12.00, 9.00, 13.00, 17.00, 18.00, 17.00, 86.00, 225);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311157', '高亚鹏', '计算机171', '正常', 15.00, 9.00, 15.00, 19.00, 18.00, 18.00, 94.00, 226);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311164', '周睛集', '计算机171', '正常', 13.00, 8.00, 12.00, 15.00, 16.00, 16.00, 80.00, 227);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311178', '金江林', '计算机171', '正常', 15.00, 10.00, 15.00, 18.00, 18.00, 19.00, 95.00, 228);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311181', '吴凡', '计算机171', '正常', 14.00, 9.00, 14.00, 17.00, 16.00, 17.00, 87.00, 229);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311190', '楼玲妃', '计算机171', '正常', 14.00, 8.00, 12.00, 16.00, 16.00, 16.00, 82.00, 230);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311194', '钟昱祺', '计算机171', '正常', 14.00, 9.00, 12.00, 16.00, 16.00, 17.00, 84.00, 231);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311210', '李钰林', '计算机171', '正常', 15.00, 9.00, 13.00, 18.00, 17.00, 18.00, 90.00, 232);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311222', '沈康文', '计算机171', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 18.00, 94.00, 233);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311235', '唐芮琪', '计算机171', '正常', 15.00, 9.00, 14.00, 18.00, 18.00, 17.00, 91.00, 234);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311242', '李兴业', '计算机171', '正常', 14.00, 9.00, 13.00, 17.00, 17.00, 17.00, 87.00, 235);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311243', '李颜言', '计算机171', '正常', 15.00, 10.00, 15.00, 19.00, 19.00, 19.00, 97.00, 236);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311256', '徐越', '计算机171', '正常', 15.00, 9.00, 14.00, 17.00, 17.00, 18.00, 90.00, 237);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311265', '何李杰', '计算机171', '正常', 15.00, 10.00, 14.00, 19.00, 19.00, 19.00, 96.00, 238);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201510121066', '冯盛', '计算机173', '正常', 9.00, 6.00, 9.00, 12.00, 12.00, 12.00, 60.00, 239);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201510121124', '杜中洲', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 240);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201510311165', '陈佳伟', '计算机173', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 241);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201510730056', '王伟', '计算机172', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 242);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710121222', '付家栋', '计算机173', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 243);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311001', '何弋帆', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 244);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311009', '朱心蕊', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 245);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311014', '张若男', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 246);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311017', '陈人丘', '计算机173', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 247);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311020', '宗赟', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 248);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311022', '陈川源', '计算机173', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 249);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311024', '钱思璇', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 250);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311026', '奚铮杰', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 251);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311027', '彭诚颢', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 252);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311028', '张栩', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 253);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311033', '黄美琳', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 254);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311037', '陈思哲', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 255);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311045', '施旸昱', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 256);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311052', '蔡硕', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 257);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311055', '李嘉祺', '计算机173', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 258);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311061', '修亚辉', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 259);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311063', '王鑫磊', '网络172', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 260);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311064', '高婧贤', '计算机171卓', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 261);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311070', '邱芷蕙', '计算机171卓', '正常', 13.00, 9.00, 13.00, 18.00, 18.00, 17.00, 88.00, 262);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311072', '周彦勇', '计算机173', '正常', 13.00, 9.00, 13.00, 18.00, 18.00, 17.00, 88.00, 263);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311075', '周翱天', '计算机173', '正常', 13.00, 9.00, 13.00, 18.00, 18.00, 17.00, 88.00, 264);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311083', '周明澍', '计算机172', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 265);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311088', '王峥', '计算机173', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 266);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311092', '谢甜', '计算机171卓', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 267);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311097', '盛昌', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 268);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311101', '江文全', '计算机173', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 269);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311106', '何玉娜', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 270);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311108', '严祥军', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 271);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311111', '毛竹', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 272);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311114', '赵继云', '计算机172', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 273);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311115', '冯佳琪', '计算机171卓', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 274);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311116', '王自阳', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 275);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311119', '陈冬珏', '计算机173', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 276);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311121', '尤闻涛', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 277);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311122', '张海婷', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 278);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311123', '顾佳琪', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 279);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311127', '华怡芃', '计算机172', '正常', 15.00, 10.00, 14.00, 20.00, 20.00, 19.00, 98.00, 280);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311128', '杨博文', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 281);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311130', '叶佳磊', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 282);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311143', '贾世正', '计算机173', '正常', 15.00, 10.00, 14.00, 20.00, 20.00, 19.00, 98.00, 283);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311148', '刘依依', '计算机171卓', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 284);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311159', '赵燕雯', '计算机172', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 285);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311174', '彭燕玲', '计算机172', '正常', 10.00, 7.00, 10.00, 13.00, 12.00, 13.00, 65.00, 286);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311176', '杨金坡', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 287);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311183', '贾岳欣', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 288);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311184', '陈奉天', '计算机173', '正常', 11.00, 7.00, 10.00, 14.00, 14.00, 14.00, 70.00, 289);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311185', '曲莫沙子', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 290);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311191', '黄超', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 291);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311193', '陈文岩', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 292);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311196', '钱多', '计算机173', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 293);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311197', '徐天赐', '计算机172', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 294);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311199', '张书楷', '计算机172', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 295);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311207', '王萱仪', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 296);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311211', '褚熠阳', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 297);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311215', '刘畅', '计算机172', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 298);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311223', '方真', '计算机173', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 299);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311226', '王梓同', '计算机172', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 300);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311227', '曹杰', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 301);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311229', '傅成', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 302);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311230', '顾卓成', '计算机173', '正常', 12.00, 8.00, 12.00, 16.00, 16.00, 16.00, 80.00, 303);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311231', '康宇佳', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 304);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311232', '罗鹏晖', '计算机173', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 305);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311233', '杨春泉', '计算机172', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 306);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311237', '龚一然', '计算机172', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 307);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311241', '李佳骏', '计算机173', '正常', 15.00, 10.00, 14.00, 20.00, 20.00, 19.00, 98.00, 308);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311245', '胡炳', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 309);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311249', '金怡', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 310);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311257', '汪宇', '计算机171卓', '正常', 15.00, 10.00, 14.00, 20.00, 20.00, 19.00, 98.00, 311);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311258', '李琦涛', '计算机173', '正常', 12.00, 8.00, 11.00, 15.00, 14.00, 15.00, 75.00, 312);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710311259', '庄一鸣', '计算机172', '正常', 13.00, 9.00, 13.00, 17.00, 16.00, 17.00, 85.00, 313);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710320023', '樊润泽', '计算机173', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 314);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710320168', '刘佳祺', '计算机172', '正常', 15.00, 10.00, 14.00, 20.00, 20.00, 19.00, 98.00, 315);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710413007', '戚华菁', '计算机172', '正常', 14.00, 9.00, 13.00, 18.00, 18.00, 18.00, 90.00, 316);
INSERT INTO `cdesign` VALUES ('2019-2020-2', 'XX127030', 1, '201710414002', '杨毅铭', '计算机172', '正常', 15.00, 10.00, 14.00, 19.00, 18.00, 19.00, 95.00, 317);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cNum` int(11) DEFAULT NULL,
  `sId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sClass` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `regular` double(20, 2) DEFAULT NULL COMMENT '平时成绩',
  `written` double(20, 2) DEFAULT NULL COMMENT '考试成绩',
  `overall` double(20, 2) DEFAULT NULL COMMENT '总成绩',
  `degree` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '总课程目标达成度',
  `s0` float DEFAULT NULL COMMENT '平时考核标准成绩1',
  `s1` float DEFAULT NULL COMMENT '平时考核标准成绩2',
  `s2` float DEFAULT NULL,
  `s3` float DEFAULT NULL,
  `s4` float DEFAULT NULL,
  `s5` float DEFAULT NULL,
  `s6` float DEFAULT NULL,
  `s7` float DEFAULT NULL,
  `s8` float DEFAULT NULL,
  `s9` float DEFAULT NULL,
  `s10` float DEFAULT NULL,
  `s11` float DEFAULT NULL,
  `s12` float DEFAULT NULL,
  `s13` float DEFAULT NULL,
  `s14` float DEFAULT NULL,
  `s15` float DEFAULT NULL,
  `q0` float DEFAULT NULL COMMENT '期末考试大题成绩1',
  `q1` float DEFAULT NULL COMMENT '期末考试大题成绩2',
  `q2` float DEFAULT NULL,
  `q3` float DEFAULT NULL,
  `q4` float DEFAULT NULL,
  `q5` float DEFAULT NULL,
  `q6` float DEFAULT NULL,
  `q7` float DEFAULT NULL,
  `q8` float DEFAULT NULL,
  `q9` float DEFAULT NULL,
  `q10` float DEFAULT NULL,
  `q11` float DEFAULT NULL,
  `q12` float DEFAULT NULL,
  `q13` float DEFAULT NULL,
  `q14` float DEFAULT NULL,
  `q15` float DEFAULT NULL,
  `g0` float DEFAULT NULL COMMENT '课程目标达成度1',
  `g1` float DEFAULT NULL COMMENT '课程目标达成度2',
  `g2` float DEFAULT NULL,
  `g3` float DEFAULT NULL,
  `g4` float DEFAULT NULL,
  `g5` float DEFAULT NULL,
  `g6` float DEFAULT NULL,
  `g7` float DEFAULT NULL,
  `g8` float DEFAULT NULL,
  `g9` float DEFAULT NULL,
  `g10` float DEFAULT NULL,
  `g11` float DEFAULT NULL,
  `g12` float DEFAULT NULL,
  `g13` float DEFAULT NULL,
  `g14` float DEFAULT NULL,
  `g15` float DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (5, '2017-2018-1', 'XX110100', 1, '201410314240', '王耀宗', '计算机162', '正常', 94.00, 61.50, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (10, '2017-2018-1', 'XX110100', 1, '201610313728', '吴奥然', '计算机162', '正常', 89.00, 79.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (11, '2017-2018-1', 'XX110100', 1, '201610313728', '李天辰', '计算机162', '正常', 94.00, 89.00, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (12, '2017-2018-1', 'XX110100', 1, '201610313728', '吴子非', '计算机162', '正常', 91.00, 89.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (13, '2017-2018-1', 'XX110100', 1, '201610313728', '占国志', '计算机162', '正常', 89.00, 84.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (14, '2017-2018-1', 'XX110100', 1, '201610313728', '张健', '计算机162', '正常', 81.00, 48.00, 58.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (15, '2017-2018-1', 'XX110100', 1, '201610313728', '陈永聪', '计算机162', '正常', 87.00, 75.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (16, '2017-2018-1', 'XX110100', 1, '201610313728', '黄雅雯', '计算机162', '正常', 89.00, 72.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (17, '2017-2018-1', 'XX110100', 1, '201610313728', '刘小敏', '计算机162', '正常', 90.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (18, '2017-2018-1', 'XX110100', 1, '201610313728', '王盛楠', '计算机162', '正常', 97.00, 91.50, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (19, '2017-2018-1', 'XX110100', 1, '201610313728', '冯灿', '计算机162', '正常', 89.00, 82.50, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (20, '2017-2018-1', 'XX110100', 1, '201610313728', '李昂', '计算机162', '正常', 88.00, 68.50, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (21, '2017-2018-1', 'XX110100', 1, '201610313728', '戴奕超', '计算机162', '正常', 89.00, 66.50, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (22, '2017-2018-1', 'XX110100', 1, '201610313728', '周雨岚', '计算机162', '正常', 92.00, 86.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (23, '2017-2018-1', 'XX110100', 1, '201610313728', '张静怡', '计算机162', '正常', 92.00, 63.50, 72.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (24, '2017-2018-1', 'XX110100', 1, '201610313728', '屠林猛', '计算机162', '正常', 92.00, 82.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (25, '2017-2018-1', 'XX110100', 1, '201610313728', '赵理想', '计算机162', '正常', 94.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (26, '2017-2018-1', 'XX110100', 1, '201610313728', '胡翔坤', '计算机162', '正常', 94.00, 92.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (27, '2017-2018-1', 'XX110100', 1, '201610313728', '卓彦志', '计算机162', '正常', 87.00, 31.50, 48.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (28, '2017-2018-1', 'XX110100', 1, '201610313728', '邹晨露', '计算机162', '正常', 95.00, 81.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (29, '2017-2018-1', 'XX110100', 1, '201610313728', '洪珊娜', '计算机162', '正常', 93.00, 74.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (30, '2017-2018-1', 'XX110100', 1, '201610313728', '邓思庆', '计算机162', '正常', 87.00, 42.00, 56.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (31, '2017-2018-1', 'XX110100', 1, '201610313728', '来正强*', '计算机162', '正常', 75.00, 35.50, 47.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (32, '2017-2018-1', 'XX110100', 1, '201610313728', '龚逸文', '计算机162', '正常', 88.00, 70.50, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (33, '2017-2018-1', 'XX110100', 1, '201610313728', '潘徐杰*', '计算机162', '正常', 83.00, 80.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (34, '2017-2018-1', 'XX110100', 1, '201610313728', '张俊帆', '计算机162', '正常', 93.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (35, '2017-2018-1', 'XX110100', 1, '201610313728', '缪奕晟', '计算机162', '正常', 85.00, 92.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (36, '2017-2018-1', 'XX110100', 1, '201610313728', '杨墨政', '计算机162', '正常', 91.00, 89.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (37, '2017-2018-1', 'XX110100', 1, '201610313728', '阮如刚', '计算机162', '正常', 88.00, 82.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (38, '2017-2018-1', 'XX110100', 1, '201610313728', '尹俊杰', '计算机162', '正常', 90.00, 40.50, 55.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (39, '2017-2018-1', 'XX110100', 1, '201610313728', '林佳琰', '计算机162', '正常', 88.00, 52.00, 63.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (40, '2017-2018-1', 'XX110100', 1, '201610313728', '刘杰寅', '计算机163', '正常', 91.00, 92.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (41, '2017-2018-1', 'XX110100', 1, '201610739712', '刘娅', '计算机162', '正常', 97.00, 91.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (42, '2017-2018-1', 'XX110100', 1, '201410314240', '苏鑫 再修', '计算机162', '正常', 90.00, 6.00, 31.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (43, '2017-2018-1', 'XX110100', 1, '201510305792', '陈淇文', '计算机162', '正常', 90.00, 16.00, 38.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (44, '2017-2018-1', 'XX110100', 1, '201510305792', 'CYRIL APUSIYINE', '计算机162', '正常', 18.00, 18.00, 18.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (45, '2017-2018-1', 'XX110100', 1, '201610117120', '周徐榕', '计算机162', '正常', 90.00, 69.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (46, '2017-2018-1', 'XX110100', 1, '201610215424', '盛文静', '计算机163', '正常', 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (47, '2017-2018-1', 'XX110100', 1, '201610313728', '李铮 再修', '网络161', '正常', 90.00, 30.00, 48.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (48, '2017-2018-1', 'XX110100', 1, '201610313728', '徐刚', '计算机163', '正常', 90.00, 75.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (49, '2017-2018-1', 'XX110100', 1, '201610313728', '申博文', '计算机163', '正常', 95.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (50, '2017-2018-1', 'XX110100', 1, '201610313728', '郑安贤', '计算机163', '正常', 95.00, 72.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (51, '2017-2018-1', 'XX110100', 1, '201610313728', '袁雪芹', '计算机163', '正常', 95.00, 53.50, 66.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (52, '2017-2018-1', 'XX110100', 1, '201610313728', '马杰', '计算机163', '正常', 95.00, 39.00, 56.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (53, '2017-2018-1', 'XX110100', 1, '201610313728', '陈露健', '计算机163', '正常', 95.00, 87.00, 89.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (54, '2017-2018-1', 'XX110100', 1, '201610313728', '黄恩浩', '计算机163', '正常', 90.00, 71.50, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (55, '2017-2018-1', 'XX110100', 1, '201610313728', '李源', '计算机163', '正常', 90.00, 72.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (56, '2017-2018-1', 'XX110100', 1, '201610313728', '唐煜', '计算机163', '正常', 95.00, 83.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (57, '2017-2018-1', 'XX110100', 1, '201610313728', '陆锦晖', '计算机163', '正常', 90.00, 57.50, 67.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (58, '2017-2018-1', 'XX110100', 1, '201610313728', '周安顺', '计算机163', '正常', 95.00, 40.00, 57.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (59, '2017-2018-1', 'XX110100', 1, '201610313728', '占锦明', '计算机163', '正常', 95.00, 70.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (60, '2017-2018-1', 'XX110100', 1, '201610313728', '杨景优', '计算机163', '正常', 95.00, 68.00, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (61, '2017-2018-1', 'XX110100', 1, '201610313728', '王薪程', '计算机163', '正常', 90.00, 61.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (62, '2017-2018-1', 'XX110100', 1, '201610313728', '贺雪', '计算机163', '正常', 95.00, 64.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (63, '2017-2018-1', 'XX110100', 1, '201610313728', '王彦淇', '计算机163', '正常', 95.00, 61.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (64, '2017-2018-1', 'XX110100', 1, '201610313728', '徐凌霄', '计算机163', '正常', 90.00, 47.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (65, '2017-2018-1', 'XX110100', 1, '201610313728', '奚好晨', '计算机163', '正常', 95.00, 65.00, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (66, '2017-2018-1', 'XX110100', 1, '201610313728', '王怡清', '计算机163', '正常', 95.00, 63.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (67, '2017-2018-1', 'XX110100', 1, '201610313728', '陈波', '计算机163', '正常', 95.00, 67.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (68, '2017-2018-1', 'XX110100', 1, '201610313728', '唐文千', '计算机162', '正常', 90.00, 87.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (69, '2018-2019-1', 'XX110100', 1, '201410314240', '苏鑫', '计算机162', '正常', 77.00, -1.00, -1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (70, '2018-2019-1', 'XX110100', 1, '201510125568', '冯盛', '计算机173', '正常', 90.00, 37.00, 53.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (71, '2018-2019-1', 'XX110100', 1, '201510125568', '杜中洲', '计算机172', '正常', 92.00, 81.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (72, '2018-2019-1', 'XX110100', 1, '201510305792', '付嘉懿', '计算机161卓', '正常', 90.00, 56.50, 67.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (73, '2018-2019-1', 'XX110100', 1, '201510305792', '陈佳伟', '计算机173', '正常', 90.00, 61.50, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (74, '2018-2019-1', 'XX110100', 1, '201510305792', '李晨光*', '信息162', '正常', 67.00, 37.50, 46.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (75, '2018-2019-1', 'XX110100', 1, '201510731776', '王伟', '计算机172', '正常', 90.00, 27.50, 46.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (76, '2018-2019-1', 'XX110100', 1, '201610313728', '张健', '计算机162', '正常', 56.50, 56.50, 57.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (77, '2018-2019-1', 'XX110100', 1, '201710125056', '付家栋', '计算机173', '正常', 91.00, 83.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (78, '2018-2019-1', 'XX110100', 1, '201710305280', '何弋帆', '计算机173', '正常', 90.00, 67.00, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (79, '2018-2019-1', 'XX110100', 1, '201710305280', '朱心蕊', '计算机172', '正常', 90.00, 79.50, 83.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (80, '2018-2019-1', 'XX110100', 1, '201710305280', '张若男', '计算机172', '正常', 91.00, 57.00, 67.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (81, '2018-2019-1', 'XX110100', 1, '201710305280', '陈人丘', '计算机173', '正常', 91.00, 67.50, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (82, '2018-2019-1', 'XX110100', 1, '201710305280', '宗赟', '计算机172', '正常', 92.00, 76.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (83, '2018-2019-1', 'XX110100', 1, '201710305280', '陈川源', '计算机173', '正常', 91.00, 67.00, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (84, '2018-2019-1', 'XX110100', 1, '201710305280', '钱思璇', '计算机173', '正常', 88.00, 87.50, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (85, '2018-2019-1', 'XX110100', 1, '201710305280', '奚铮杰', '计算机172', '正常', 92.00, 72.50, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (86, '2018-2019-1', 'XX110100', 1, '201710305280', '彭诚颢', '计算机173', '正常', 93.00, 86.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (87, '2018-2019-1', 'XX110100', 1, '201710305280', '张栩', '计算机173', '正常', 90.00, 38.00, 54.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (88, '2018-2019-1', 'XX110100', 1, '201710305280', '黄美琳', '计算机172', '正常', 92.00, 52.00, 64.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (89, '2018-2019-1', 'XX110100', 1, '201710305280', '陈思哲', '计算机172', '正常', 91.00, 54.00, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (90, '2018-2019-1', 'XX110100', 1, '201710305280', '施旸昱', '计算机173', '正常', 91.00, 59.50, 69.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (91, '2018-2019-1', 'XX110100', 1, '201710305280', '蔡硕', '计算机173', '正常', 90.00, 54.50, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (92, '2018-2019-1', 'XX110100', 1, '201710305280', '李嘉祺', '计算机173', '正常', 90.00, 41.00, 56.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (93, '2018-2019-1', 'XX110100', 1, '201710305280', '修亚辉', '计算机172', '正常', 94.00, 77.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (94, '2018-2019-1', 'XX110100', 1, '201710305280', '周彦勇', '计算机173', '正常', 91.00, 93.50, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (95, '2018-2019-1', 'XX110100', 1, '201710305280', '乔若晨', '计算机173', '正常', 91.00, 80.50, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (96, '2018-2019-1', 'XX110100', 1, '201710305280', '周翱天', '计算机173', '正常', 91.00, 67.50, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (97, '2018-2019-1', 'XX110100', 1, '201710305280', '周明澍', '计算机172', '正常', 93.00, 74.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (98, '2018-2019-1', 'XX110100', 1, '201710305280', '王峥', '计算机173', '正常', 90.00, 81.50, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (99, '2018-2019-1', 'XX110100', 1, '201710305280', '范茜琳', '计算机173', '正常', 75.00, 69.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (100, '2018-2019-1', 'XX110100', 1, '201710305280', '盛昌', '计算机172', '正常', 90.00, 50.00, 62.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (101, '2018-2019-1', 'XX110100', 1, '201710305280', '江文全', '计算机173', '正常', 94.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (102, '2018-2019-1', 'XX110100', 1, '201710305280', '何玉娜', '计算机172', '正常', 91.00, 85.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (103, '2018-2019-1', 'XX110100', 1, '201710305280', '严祥军', '计算机172', '正常', 91.00, 63.50, 72.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (104, '2018-2019-1', 'XX110100', 1, '201710305280', '毛竹', '计算机172', '正常', 93.00, 83.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (105, '2018-2019-1', 'XX110100', 1, '201710305280', '赵继云', '计算机172', '正常', 91.00, 58.00, 68.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (106, '2018-2019-1', 'XX110100', 1, '201710305280', '王自阳', '计算机172', '正常', 88.00, 60.50, 69.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (107, '2018-2019-1', 'XX110100', 1, '201710305280', '陈冬珏', '计算机173', '正常', 90.00, 78.50, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (108, '2018-2019-1', 'XX110100', 1, '201710305280', '尤闻涛', '计算机172', '正常', 94.00, 92.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (109, '2018-2019-1', 'XX110100', 1, '201710305280', '张海婷', '计算机172', '正常', 90.00, 71.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (110, '2018-2019-1', 'XX110100', 1, '201710305280', '顾佳琪', '计算机173', '正常', 90.00, 65.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (111, '2018-2019-1', 'XX110100', 1, '201710305280', '华怡芃', '计算机172', '正常', 90.00, 59.00, 68.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (112, '2018-2019-1', 'XX110100', 1, '201710305280', '杨博文', '计算机173', '正常', 92.00, 83.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (113, '2018-2019-1', 'XX110100', 1, '201710305280', '叶佳磊', '计算机172', '正常', 90.00, 72.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (114, '2018-2019-1', 'XX110100', 1, '201710305280', '朱佳威', '计算机172', '正常', 91.00, 87.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (115, '2018-2019-1', 'XX110100', 1, '201710305280', '贾世正', '计算机173', '正常', 90.00, 76.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (116, '2018-2019-1', 'XX110100', 1, '201710305280', '赵燕雯', '计算机172', '正常', 86.00, 59.50, 67.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (117, '2018-2019-1', 'XX110100', 1, '201710305280', '彭燕玲', '计算机172', '正常', 90.00, 76.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (118, '2018-2019-1', 'XX110100', 1, '201710305280', '杨金坡', '计算机173', '正常', 91.00, 47.50, 61.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (119, '2018-2019-1', 'XX110100', 1, '201710305280', '贾岳欣', '计算机173', '正常', 90.00, 74.50, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (120, '2018-2019-1', 'XX110100', 1, '201710305280', '陈奉天', '计算机173', '正常', 91.00, 78.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (121, '2018-2019-1', 'XX110100', 1, '201710305280', '曲莫沙子', '计算机172', '正常', 84.00, 62.50, 69.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (122, '2018-2019-1', 'XX110100', 1, '201710305280', '黄超', '计算机172', '正常', 92.00, 88.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (123, '2018-2019-1', 'XX110100', 1, '201710305280', '陈文岩', '计算机173', '正常', 90.00, 69.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (124, '2018-2019-1', 'XX110100', 1, '201710305280', '钱多', '计算机173', '正常', 91.00, 89.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (125, '2018-2019-1', 'XX110100', 1, '201710305280', '徐天赐', '计算机172', '正常', 90.00, 60.00, 69.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (126, '2018-2019-1', 'XX110100', 1, '201710305280', '张书楷', '计算机172', '正常', 91.00, 72.50, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (127, '2018-2019-1', 'XX110100', 1, '201710305280', '王萱仪', '计算机173', '正常', 90.00, 65.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (128, '2018-2019-1', 'XX110100', 1, '201710305280', '褚熠阳', '计算机173', '正常', 90.00, 67.50, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (129, '2018-2019-1', 'XX110100', 1, '201710305280', '刘畅', '计算机172', '正常', 91.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (130, '2018-2019-1', 'XX110100', 1, '201710305280', '方真', '计算机173', '正常', 91.00, 64.50, 72.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (131, '2018-2019-1', 'XX110100', 1, '201710305280', '王梓同', '计算机172', '正常', 97.00, 80.50, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (132, '2018-2019-1', 'XX110100', 1, '201710305280', '曹杰', '计算机173', '正常', 94.00, 77.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (133, '2018-2019-1', 'XX110100', 1, '201710305280', '傅成', '计算机172', '正常', 92.00, 76.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (134, '2018-2019-1', 'XX110100', 1, '201710305280', '顾卓成', '计算机173', '正常', 86.00, 65.50, 72.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (135, '2018-2019-1', 'XX110100', 1, '201710305280', '康宇佳', '计算机173', '正常', 89.00, 74.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (136, '2018-2019-1', 'XX110100', 1, '201710305280', '罗鹏晖', '计算机173', '正常', 90.00, 82.50, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (137, '2018-2019-1', 'XX110100', 1, '201710305280', '杨春泉', '计算机172', '正常', 90.00, 74.50, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (138, '2018-2019-1', 'XX110100', 1, '201710305280', '龚一然', '计算机172', '正常', 90.00, 71.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (139, '2018-2019-1', 'XX110100', 1, '201710305280', '李佳骏', '计算机173', '正常', 94.00, 82.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (140, '2018-2019-1', 'XX110100', 1, '201710305280', '胡炳', '计算机172', '正常', 93.00, 79.50, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (141, '2018-2019-1', 'XX110100', 1, '201710305280', '金怡', '计算机172', '正常', 91.00, 68.50, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (142, '2018-2019-1', 'XX110100', 1, '201710305280', '李琦涛', '计算机173', '正常', 87.00, 59.50, 68.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (143, '2018-2019-1', 'XX110100', 1, '201710305280', '庄一鸣*', '计算机172', '正常', 92.00, 61.50, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (144, '2018-2019-1', 'XX110100', 1, '201710321664', '樊润泽', '计算机173', '正常', 99.00, 97.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (145, '2018-2019-1', 'XX110100', 1, '201710321664', '刘佳祺', '计算机172', '正常', 91.00, 94.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (146, '2018-2019-1', 'XX110100', 1, '201710419968', '戚华菁', '计算机172', '正常', 95.00, 77.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (147, '2018-2019-1', 'XX110100', 1, '201710419968', '黄漪钦', '船舶171卓', '正常', 95.00, 77.50, 83.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (148, '2018-2019-1', 'XX110100', 1, '201710419968', '杨毅铭*', '计算机172', '正常', 90.00, 89.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (149, '2018-2019-1', 'XX110100', 1, '201410314240', '曹阳 免考勤', '计算机162', '正常', 0.00, -1.00, -1.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (150, '2018-2019-1', 'XX110100', 1, '201410314240', '杨沛喆 免考勤', '计算机162', '正常', 20.00, 20.00, 20.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (151, '2018-2019-1', 'XX110100', 1, '201510305792', '俞子俊', '计算机171卓', '正常', 90.00, 81.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (152, '2018-2019-1', 'XX110100', 1, '201510305792', 'CYRIL APUSIYINE', '计算机162', '正常', 41.00, 41.00, 41.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (153, '2018-2019-1', 'XX110100', 1, '201710305280', '刘云丽', '计算机171卓', '正常', 90.00, 49.00, 61.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (154, '2018-2019-1', 'XX110100', 1, '201710305280', '寇嘉颖', '计算机171卓', '正常', 90.00, 73.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (155, '2018-2019-1', 'XX110100', 1, '201710305280', '陈颖', '计算机171卓', '正常', 90.00, 82.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (156, '2018-2019-1', 'XX110100', 1, '201710305280', '徐逸凡', '计算机171卓', '正常', 90.00, 94.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (157, '2018-2019-1', 'XX110100', 1, '201710305280', '高婧贤', '计算机171卓', '正常', 90.00, 73.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (158, '2018-2019-1', 'XX110100', 1, '201710305280', '邱芷蕙', '计算机171卓', '正常', 90.00, 85.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (159, '2018-2019-1', 'XX110100', 1, '201710305280', '管俊洋', '计算机171卓', '正常', 90.00, 71.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (160, '2018-2019-1', 'XX110100', 1, '201710305280', '庞张灯', '计算机171卓', '正常', 90.00, 63.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (161, '2018-2019-1', 'XX110100', 1, '201710305280', '谢甜', '计算机171卓', '正常', 90.00, 73.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (162, '2018-2019-1', 'XX110100', 1, '201710305280', '忻伟琦', '计算机171卓', '正常', 90.00, 77.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (163, '2018-2019-1', 'XX110100', 1, '201710305280', '高铤', '计算机171卓', '正常', 90.00, 61.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (164, '2018-2019-1', 'XX110100', 1, '201710305280', '冯佳琪', '计算机171卓', '正常', 95.00, 78.00, 83.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (165, '2018-2019-1', 'XX110100', 1, '201710305280', '冯雪玲', '计算机171卓', '正常', 90.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (166, '2018-2019-1', 'XX110100', 1, '201710305280', '于霖', '计算机171卓', '正常', 90.00, 78.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (167, '2018-2019-1', 'XX110100', 1, '201710305280', '刘依依', '计算机171卓', '正常', 90.00, 70.00, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (168, '2018-2019-1', 'XX110100', 1, '201710305280', '钮莹莹', '计算机171卓', '正常', 90.00, 88.00, 89.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (169, '2018-2019-1', 'XX110100', 1, '201710305280', '吴亦飞', '计算机171卓', '正常', 90.00, 88.00, 89.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (170, '2018-2019-1', 'XX110100', 1, '201710305280', '陈忠青', '计算机171卓', '正常', 90.00, 50.00, 62.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (171, '2018-2019-1', 'XX110100', 1, '201710305280', '余荔恒', '计算机171卓', '正常', 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (172, '2018-2019-1', 'XX110100', 1, '201710305280', '高亚鹏', '计算机171卓', '正常', 90.00, 56.00, 66.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (173, '2018-2019-1', 'XX110100', 1, '201710305280', '周睛集', '计算机171卓', '正常', 90.00, 56.00, 66.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (174, '2018-2019-1', 'XX110100', 1, '201710305280', '金江林', '计算机171卓', '正常', 90.00, 80.00, 83.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (175, '2018-2019-1', 'XX110100', 1, '201710305280', '吴凡', '计算机171卓', '正常', 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (176, '2018-2019-1', 'XX110100', 1, '201710305280', '楼玲妃', '计算机171卓', '正常', 90.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (177, '2018-2019-1', 'XX110100', 1, '201710305280', '钟昱祺', '计算机171卓', '正常', 90.00, 73.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (178, '2018-2019-1', 'XX110100', 1, '201710305280', '李钰林', '计算机171卓', '正常', 90.00, 66.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (179, '2018-2019-1', 'XX110100', 1, '201710305280', '沈康文', '计算机171卓', '正常', 90.00, 65.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (180, '2018-2019-1', 'XX110100', 1, '201710305280', '唐芮琪', '计算机171卓', '正常', 90.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (181, '2018-2019-1', 'XX110100', 1, '201710305280', '李兴业', '计算机171卓', '正常', 90.00, 82.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (182, '2018-2019-1', 'XX110100', 1, '201710305280', '李颜言', '计算机171卓', '正常', 95.00, 72.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (183, '2018-2019-1', 'XX110100', 1, '201710305280', '徐越', '计算机171卓', '正常', 90.00, 75.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (184, '2018-2019-1', 'XX110100', 1, '201710305280', '汪宇', '计算机171卓', '正常', 95.00, 63.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (185, '2018-2019-1', 'XX110100', 1, '201710305280', '何李杰', '计算机171卓', '正常', 90.00, 76.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (186, '2019-2020-1', 'XX110100', 1, '201810313216', '李骑廷', '计算机181卓', '正常', 88.00, 80.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (187, '2019-2020-1', 'XX110100', 1, '201810313216', '马雍博', '计算机181卓', '正常', 89.00, 90.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (188, '2019-2020-1', 'XX110100', 1, '201810313216', '肖显扬', '计算机181卓', '正常', 90.00, 82.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (189, '2019-2020-1', 'XX110100', 1, '201810313216', '张奕庆', '计算机181卓', '正常', 91.00, 77.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (190, '2019-2020-1', 'XX110100', 1, '201810313216', '瞿茹芸', '计算机181卓', '正常', 94.00, 83.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (191, '2019-2020-1', 'XX110100', 1, '201810313216', '郭晓民', '计算机181卓', '正常', 92.00, 83.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (192, '2019-2020-1', 'XX110100', 1, '201810313216', '杨洪', '计算机181卓', '正常', 91.00, 86.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (193, '2019-2020-1', 'XX110100', 1, '201810313216', '陶哲', '计算机181卓', '正常', 93.00, 81.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (194, '2019-2020-1', 'XX110100', 1, '201810313216', '史周胤', '计算机181卓', '正常', 91.00, 80.50, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (195, '2019-2020-1', 'XX110100', 1, '201810313216', '王虹岚', '计算机181卓', '正常', 91.00, 93.50, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (196, '2019-2020-1', 'XX110100', 1, '201810313216', '陈洁翔', '计算机181卓', '正常', 98.00, 88.50, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (197, '2019-2020-1', 'XX110100', 1, '201810313216', '余凌霄', '计算机181卓', '正常', 91.00, 87.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (198, '2019-2020-1', 'XX110100', 1, '201810313216', '黎逸瀛', '计算机181卓', '正常', 89.00, 72.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (199, '2019-2020-1', 'XX110100', 1, '201810313216', '徐子荣', '计算机181卓', '正常', 90.00, 91.00, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (200, '2019-2020-1', 'XX110100', 1, '201810313216', '张冯晨安', '计算机181卓', '正常', 90.00, 90.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (201, '2019-2020-1', 'XX110100', 1, '201810313216', '冯亦凡', '计算机181卓', '正常', 92.00, 95.50, 94.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (202, '2019-2020-1', 'XX110100', 1, '201810313216', '徐仕豪', '计算机181卓', '正常', 92.00, 82.50, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (203, '2019-2020-1', 'XX110100', 1, '201810313216', '胡娅欣', '计算机181卓', '正常', 92.00, 97.50, 96.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (204, '2019-2020-1', 'XX110100', 1, '201810313216', '卢宇星', '计算机181卓', '正常', 92.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (205, '2019-2020-1', 'XX110100', 1, '201810313216', '肖玮琦', '计算机181卓', '正常', 96.00, 76.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (206, '2019-2020-1', 'XX110100', 1, '201810313216', '吴天昊', '计算机181卓', '正常', 90.00, 79.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (207, '2019-2020-1', 'XX110100', 1, '201810313216', '黄辰恺', '计算机181卓', '正常', 91.00, 70.00, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (208, '2019-2020-1', 'XX110100', 1, '201810313216', '夏天', '计算机181卓', '正常', 97.00, 67.50, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (209, '2019-2020-1', 'XX110100', 1, '201810313216', '曾云浩', '计算机181卓', '正常', 92.00, 69.50, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (210, '2019-2020-1', 'XX110100', 1, '201810313216', '朱映琏', '计算机181卓', '正常', 92.00, 91.50, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (211, '2019-2020-1', 'XX110100', 1, '201810313216', '罗欣然', '计算机181卓', '正常', 95.00, 94.50, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (212, '2019-2020-1', 'XX110100', 1, '201810313216', '符峻滔', '计算机181卓', '正常', 93.00, 84.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (213, '2019-2020-1', 'XX110100', 1, '201810313216', '吴远尘', '计算机181卓', '正常', 92.00, 91.50, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (214, '2019-2020-1', 'XX110100', 1, '201810313216', '黄颖宁', '计算机181卓', '正常', 94.00, 76.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (215, '2019-2020-1', 'XX110100', 1, '201810313216', '何庆庆', '计算机181卓', '正常', 93.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (216, '2019-2020-1', 'XX110100', 1, '201810313216', '孙亚东', '计算机181卓', '正常', 94.00, 91.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (217, '2019-2020-1', 'XX110100', 1, '201810313216', '孙宏宇', '计算机181卓', '正常', 93.00, 85.50, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (218, '2019-2020-1', 'XX110100', 1, '201810313216', '邹沈杰', '计算机181卓', '正常', 91.00, 84.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (219, '2019-2020-1', 'XX110100', 1, '201610117120', '杨怀', '计算机183', '正常', 90.00, 71.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (220, '2019-2020-1', 'XX110100', 1, '201710305280', '刘云丽', '计算机171卓', '正常', 80.50, 80.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (221, '2019-2020-1', 'XX110100', 1, '201710305280', '郑温鑫', '网络172', '正常', 89.00, 43.50, 57.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (222, '2019-2020-1', 'XX110100', 1, '201710305280', '李嘉祺', '计算机173', '正常', 89.00, 47.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (223, '2019-2020-1', 'XX110100', 1, '201710305280', '严沈宇', '网络172', '正常', 89.00, 72.00, 77.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (224, '2019-2020-1', 'XX110100', 1, '201710305280', '李祥捷', '网络172', '正常', 59.50, 59.50, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (225, '2019-2020-1', 'XX110100', 1, '201710305280', '梁宸', '网络171', '正常', 87.00, 18.50, 39.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (226, '2019-2020-1', 'XX110100', 1, '201810116608', '万运发', '计算机183', '正常', 92.00, 81.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (227, '2019-2020-1', 'XX110100', 1, '201810214912', '张永琦', '计算机183', '正常', 97.00, 83.50, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (228, '2019-2020-1', 'XX110100', 1, '201810214912', '冀冠楠', '计算机182', '正常', 95.00, 75.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (229, '2019-2020-1', 'XX110100', 1, '201810231296', '罗响', '计算机182', '正常', 89.00, 86.50, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (230, '2019-2020-1', 'XX110100', 1, '201810313216', '刘莹', '计算机183', '正常', 92.00, 74.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (231, '2019-2020-1', 'XX110100', 1, '201810313216', '秦弘升', '计算机182', '正常', 93.00, 80.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (232, '2019-2020-1', 'XX110100', 1, '201810313216', '吴旭鸿', '计算机182', '正常', 93.00, 68.50, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (233, '2019-2020-1', 'XX110100', 1, '201810313216', '唐霞', '计算机183', '正常', 93.00, 82.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (234, '2019-2020-1', 'XX110100', 1, '201810313216', '李瑞国', '计算机183', '正常', 91.00, 74.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (235, '2019-2020-1', 'XX110100', 1, '201810313216', '孙畅', '计算机182', '正常', 90.00, 84.50, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (236, '2019-2020-1', 'XX110100', 1, '201810313216', '张一健', '计算机183', '正常', 90.00, 86.50, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (237, '2019-2020-1', 'XX110100', 1, '201810313216', '万飙', '计算机183', '正常', 94.00, 81.50, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (238, '2019-2020-1', 'XX110100', 1, '201810313216', '陈嘉欢', '计算机182', '正常', 94.00, 76.50, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (239, '2019-2020-1', 'XX110100', 1, '201810313216', '王钺洲', '计算机183', '正常', 89.00, 63.50, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (240, '2019-2020-1', 'XX110100', 1, '201810313216', '王心怡', '计算机182', '正常', 93.00, 86.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (241, '2019-2020-1', 'XX110100', 1, '201810313216', '倪徐立', '计算机183', '正常', 93.00, 90.50, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (242, '2019-2020-1', 'XX110100', 1, '201810313216', '周宏健', '计算机183', '正常', 91.00, 77.50, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (243, '2019-2020-1', 'XX110100', 1, '201810313216', '朱文倬', '计算机182', '正常', 90.00, 80.00, 83.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (244, '2019-2020-1', 'XX110100', 1, '201810313216', '栗靖东', '计算机183', '正常', 91.00, 70.00, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (245, '2019-2020-1', 'XX110100', 1, '201810313216', '黄德玉', '计算机183', '正常', 94.00, 73.50, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (246, '2019-2020-1', 'XX110100', 1, '201810313216', '涂枭', '计算机182', '正常', 94.00, 70.50, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (247, '2019-2020-1', 'XX110100', 1, '201810313216', '杨怡林', '计算机183', '正常', 90.00, 62.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (248, '2019-2020-1', 'XX110100', 1, '201810313216', '贾想成', '计算机183', '正常', 91.00, 77.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (249, '2019-2020-1', 'XX110100', 1, '201810313216', '姚越成', '计算机183', '正常', 90.00, 53.50, 64.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (250, '2019-2020-1', 'XX110100', 1, '201810313216', '邓俊杰', '计算机183', '正常', 92.00, 75.50, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (251, '2019-2020-1', 'XX110100', 1, '201810313216', '徐光志', '计算机182', '正常', 90.00, 58.50, 68.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (252, '2019-2020-1', 'XX110100', 1, '201810313216', '曹轶凌', '计算机182', '正常', 91.00, 74.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (253, '2019-2020-1', 'XX110100', 1, '201810313216', '张杰', '计算机183', '正常', 93.00, 42.50, 58.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (254, '2019-2020-1', 'XX110100', 1, '201810313216', '周子涵', '计算机182', '正常', 94.00, 71.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (255, '2019-2020-1', 'XX110100', 1, '201810313216', '王玥', '计算机182', '正常', 90.00, 47.50, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (256, '2019-2020-1', 'XX110100', 1, '201810313216', '杨博文', '计算机182', '正常', 94.00, 75.00, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (257, '2019-2020-1', 'XX110100', 1, '201810313216', '侯泽宇', '计算机182', '正常', 91.00, 62.50, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (258, '2019-2020-1', 'XX110100', 1, '201810313216', '陈嘉宇', '计算机182', '正常', 91.00, 81.00, 84.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (259, '2019-2020-1', 'XX110100', 1, '201810313216', '张羽音', '计算机182', '正常', 91.00, 63.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (260, '2019-2020-1', 'XX110100', 1, '201810313216', '叶阳', '计算机182', '正常', 91.00, 68.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (261, '2019-2020-1', 'XX110100', 1, '201810313216', '王思敏', '计算机183', '正常', 93.00, 89.50, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (262, '2019-2020-1', 'XX110100', 1, '201810313216', '季胤喆', '计算机182', '正常', 92.00, 52.00, 64.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (263, '2019-2020-1', 'XX110100', 1, '201810313216', '施郁文', '计算机183', '正常', 92.00, 65.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (264, '2019-2020-1', 'XX110100', 1, '201810313216', '徐江晟', '计算机183', '正常', 91.00, 66.50, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (265, '2019-2020-1', 'XX110100', 1, '201810313216', '金雨晴', '计算机182', '正常', 90.00, 58.00, 68.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (266, '2019-2020-1', 'XX110100', 1, '201810313216', '江积硕', '计算机183', '正常', 90.00, 56.00, 66.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (267, '2019-2020-1', 'XX110100', 1, '201810313216', '罗韵盈', '计算机183', '正常', 90.00, 76.50, 81.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (268, '2019-2020-1', 'XX110100', 1, '201810313216', '王金晶', '计算机182', '正常', 90.00, 82.50, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (269, '2019-2020-1', 'XX110100', 1, '201810313216', '蒋飞宇', '计算机182', '正常', 89.00, 65.50, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (270, '2019-2020-1', 'XX110100', 1, '201810313216', '罗娅瑜', '计算机183', '正常', 94.00, 86.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (271, '2019-2020-1', 'XX110100', 1, '201810313216', '刘琨', '计算机183', '正常', 91.00, 52.00, 64.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (272, '2019-2020-1', 'XX110100', 1, '201810313216', '谭元昊', '计算机182', '正常', 89.00, 74.00, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (273, '2019-2020-1', 'XX110100', 1, '201810313216', '贺然*', '计算机183', '正常', 90.00, 62.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (274, '2019-2020-1', 'XX110100', 1, '201810313216', '吴逸铭', '计算机182', '正常', 93.00, 61.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (275, '2019-2020-1', 'XX110100', 1, '201810313216', '王源', '计算机183', '正常', 95.00, 88.50, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (276, '2019-2020-1', 'XX110100', 1, '201810313216', '周宁思远', '计算机182', '正常', 91.00, 74.50, 79.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (277, '2019-2020-1', 'XX110100', 1, '201810313216', '周昱全', '计算机182', '正常', 94.00, 61.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (278, '2019-2020-1', 'XX110100', 1, '201810313216', '李佳蕴', '计算机183', '正常', 93.00, 45.50, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (279, '2019-2020-1', 'XX110100', 1, '201810313216', '陈铃铃', '计算机182', '正常', 90.00, 65.00, 73.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (280, '2019-2020-1', 'XX110100', 1, '201810313216', '王研', '计算机182', '正常', 91.00, 87.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (281, '2019-2020-1', 'XX110100', 1, '201810313216', '李东亚', '计算机183', '正常', 91.00, 50.00, 62.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (282, '2019-2020-1', 'XX110100', 1, '201810313216', '阮天成', '计算机182', '正常', 90.00, 70.00, 76.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (283, '2019-2020-1', 'XX110100', 1, '201810313216', '唐泰峰', '计算机183', '正常', 90.00, 92.50, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (284, '2019-2020-1', 'XX110100', 1, '201810313216', '李苏武', '计算机183', '正常', 89.00, 54.50, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (285, '2019-2020-1', 'XX110100', 1, '201810313216', '王文庆', '计算机182', '正常', 91.00, 78.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (286, '2019-2020-1', 'XX110100', 1, '201810313216', '蒋龙英', '计算机183', '正常', 90.00, 57.50, 67.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (287, '2019-2020-1', 'XX110100', 1, '201810313216', '白松林', '计算机182', '正常', 91.00, 82.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (288, '2019-2020-1', 'XX110100', 1, '201810313216', '胡新洲', '计算机182', '正常', 91.00, 62.00, 71.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (289, '2019-2020-1', 'XX110100', 1, '201810313216', '李洋', '计算机182', '正常', 93.00, 60.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (290, '2019-2020-1', 'XX110100', 1, '201810313216', '金焕然', '计算机183', '正常', 93.00, 49.50, 63.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (291, '2019-2020-1', 'XX110100', 1, '201810313216', '吕雨蛟', '计算机183', '正常', 89.00, 67.50, 74.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `course` VALUES (292, '2019-2020-1', 'XX110100', 1, '201810313216', '钟嘉怡', '计算机182', '正常', 95.00, 91.50, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for courseaudit
-- ----------------------------
DROP TABLE IF EXISTS `courseaudit`;
CREATE TABLE `courseaudit`  (
  `module_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courseID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`module_name`, `courseID`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseaudit
-- ----------------------------
INSERT INTO `courseaudit` VALUES ('实验', 'XX110110s');
INSERT INTO `courseaudit` VALUES ('平时', 'XX110110');
INSERT INTO `courseaudit` VALUES ('平时', 'XX110240');
INSERT INTO `courseaudit` VALUES ('期末', 'XX110110');
INSERT INTO `courseaudit` VALUES ('期末', 'XX110240');

-- ----------------------------
-- Table structure for courseinfo
-- ----------------------------
DROP TABLE IF EXISTS `courseinfo`;
CREATE TABLE `courseinfo`  (
  `semester` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '审核学期',
  `info_cId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cTarget` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `excellent` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '优秀（>=90)',
  `good` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '良好(<90,>80)',
  `normal` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中等(<80,>70)',
  `pass` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '及格(<70,>60)',
  `poor` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '不及格(<60)',
  `course_type` int(11) DEFAULT 0 COMMENT '课程的类型：0-理论课，1-实验课，2-课程设计，3-毕业设计',
  `test_type` int(11) DEFAULT NULL COMMENT '考核类型：0-考试，1-考查',
  PRIMARY KEY (`info_cId`) USING BTREE,
  INDEX `info_cId`(`info_cId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of courseinfo
-- ----------------------------
INSERT INTO `courseinfo` VALUES (NULL, '00100061', '大学英语（一）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, '00100062', '大学英语（二）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, '00320006', '物流学概论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00330001', '海商法', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00330004', '海上货物运输法规', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00330011', '法律与社会', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00340028', '中国古典小说欣赏', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00350011', '职业汉语', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00370007', '武术散打', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, '00370010', '大学生心理健康教育', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'HH395003', '奇异的仿生学', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'JY120280', '供应链管理', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'JY191001', '港口概论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'JY391001', '国际航运概论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'QT110010', '物流信息系统', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'QT493001', '音乐名作鉴赏', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'QT620010', '军事理论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'QT620020', '形势与政策', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'QT820010', '第二课堂', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'QT892001', '美学通论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WL210011', '高等数学A（一）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL210012', '高等数学A（二）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL210040', '线性代数', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL210140', '概率论与数理统计', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL310011', '大学物理(一)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL310012', '大学物理(二)', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL320020', '物理实验', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WL410010', '中国近现代史纲要', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL410040', '马克思主义原理', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL410060', '概论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WL420020', '思想道德与法律基础', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL510011', '体育（一）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL510012', '体育（二）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL510013', '体育（三）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WL510014', '体育（四）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'WY110650', '物流英语', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WY110660', '口译实践', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WY110680', '口语实践', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WY120710', '中级口译', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'WY120721', '商务英语（一）', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES ('2018-2019-1', 'XX110110', '操作系统', ' 能运用操作系统的原理描述进程和线程，能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，会对比不同解决方案的优缺点，给出结论。 :]在具体场景和任务有变化时，能针对新的用户目标和需求，设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，并能分析解决方案在时间上或空间上的开销。:]能分析程序的并发性程度，用前趋图描述程序的并发执行，构建并发系统，能测算不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本。:]能就具体场景，模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，并能分析、对比不同操作方案的成本和局限性。:]', '能准确运用操作系统的原理描述进程和线程，能准备分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，能准确对比不同解决方案的优缺点。:]针对新的用户目标和需求，能系统设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，能合理分析解决方案在时间上或空间上的开销:]能准确分析程序的并发性程度，会用前趋图描述程序的并发执行，构建完善的并发系统，能准备测算不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本:]就具体场景，能准确模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，能准备分析、对比不同操作方案的成本和局限性:]', '能合理运用操作系统的原理描述进程和线程，能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，会对比不同解决方案的优缺点。:]针对新的用户目标和需求，能设计合理的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，能分析解决方案在时间上或空间上的开销:]能合理分析程序的并发性程度，会用前趋图描述程序的并发执行，构建并发系统，能测算不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本:]就具体场景，能合理模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，能合理分析、对比不同操作方案的时间和空间成本:]', '能合理运用操作系统的原理描述进程和线程，能分析影响处理调度、磁盘调度、存储器管理、文件管理和输ppppppp:]针对新的用户目标和需求，基本能设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，111111111111:]能合理分析程序的并发性程度，会用前趋图描述程序的并发执行，构建并发系统，能测算不同的调度机制、信号量和同步机制、存储方式和置换算法11111111111111111:]就具体场景，能合理模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，能合理分析、对比不同操作1111111111:]', '能运用操作系统的原理描述进程和线程，基本能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，基本上会对比不同解决方案的优缺点。:]针对新的用户目标和需求，基本能设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，基本能分析解决方案在时间上或空间上的开销:]基本能分析程序的并发性程度，基本会用前趋图描述程序的并发执行，能构建并发系统，基本能测算不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本:]就具体场景，基本能模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，能基本分析、对比不同操作方案的成本和局限性:]', '不能分析影响处理调度、磁盘调度、存储器管理、文件管理和输入输出系统的因素，不能对比不同解决方案的优缺点。:]不能针对新的用户目标和需求设计新的处理机调度方案、存储器访问方案、文件分配方案或设备管理方案，不能分析解决方案在时间上或空间上的开销:]无法分析程序的并发性程度，不会用前趋图描述程序的并发执行，不能能测算不同的调度机制、信号量和同步机制、存储方式和置换算法下的时间和空间的成本:]能就具体场景，模拟生产者消费者、磁盘调度、文件管理统或存储器管理的操作流程，设计系统，并能分析、对比不同操作方案的成本和局限性:]', 0, 0);
INSERT INTO `courseinfo` VALUES ('2018-2019-1', 'XX110110s', '操作系统实验', '能部署使用虚拟机，理解虚拟机和宿主机之间是可通讯的、共享宿主机的资源，一样存在信息安全问题；能操纵多进程的并发、所占资源，编写程序时自觉控制进程规模，保护计算机的健康和运行环境。:]能创建并设计含不同类型线程的并发系统，能根据需求设计处理机调度系统；在所设计的系统中，用恰当计算机语言、调用恰当的库函数，编写代码，测试运行；在所设计的系统中，能采集不同数据进行测试、对比、分析产生不同结果的原因。:]能分析计算机系统中的置换算法，构建模型，测试对比缺页率，寻找最佳操作点；能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行。:]', '会准确部署虚拟机，自主安装虚拟机和宿主机之间的通讯工具，准确理解虚拟机存在信息安全问题；能准确操纵多进程的并发，编写程序时会完美控制进程规模，保护计算机的健康和运行环境:]能自主阅读相关文献后创建并设计含不同类型线程的并发系统，能根据需求准确设计处理机调度系统；能准确调用合适的库函数，编写代码，测试运行；能准确采集不同数据进行测试、对比，准备分析产生不同结果的原因:]基本能分析计算机系统中的置换算法，能基本构建模型、测试对比缺页率，寻找最佳操作点；基本能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行:]', '会部署虚拟机，会安装虚拟机和宿主机之间的通讯工具，理解虚拟机存在信息安全问题；能操纵多进程的并发，编写程序时会控制进程规模，以保护计算机的健康和运行环境:]经提示，能创建并设计含不同类型线程的并发系统，基本能根据需求设计处理机调度系统；能自主调用合适的库函数，编写代码，测试运行；能自主采集不同数据进行测试、基本能对比，分析产生不同结果的原因:]基本能分析计算机系统中的置换算法，能基本构建模型、测试对比缺页率，寻找最佳操作点；基本能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行:]', '能部署虚拟机，能安装虚拟机和宿主机之间的通讯工具，比较理解虚拟机存在信息安全问题；操纵多进程的并发，编写程序时会控制进程规模，以保护计算机的健康和运行环境:]经提示，能创建并设计含不同类型线程的并发系统，基本能根据需求设计处理机调度系统；能自主调用合适的库函数，编写代码，测试运行；能自主采集不同数据进行测试、基本能对比，分析产生不同结果的原因:]基本能分析计算机系统中的置换算法，能基本构建模型、测试对比缺页率，寻找最佳操作点；基本能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行:]', '基本会部署虚拟机，经提示后会安装虚拟机和宿主机之间的通讯工具，基本理解虚拟机存在信息安全问题；基本能操纵多进程的并发，编写程序时会控制进程规模，以保护计算机的健康和运行环境:]经多次指导后，能创建并设计含不同类型线程的并发系统，基本能根据需求设计处理机调度系统；经多次指导后，能调用合适的库函数，编写代码，测试运行；经提示后，能采集不同数据进行测试，基本能对比、分析产生不同结果的原因:]基本能分析计算机系统中的置换算法，能基本构建模型、测试对比缺页率，寻找最佳操作点；基本能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行:]', '不会安装虚拟机，不会安装虚拟机和宿主机之间的通讯工具，不理解虚拟机存在信息安全问题；不能操纵多进程的并发，编写程序时不会控制进程规模:]经指导后，仍不能创建或设计含不同类型线程的并发系统，不能设计处理机调度系统；不会调用库函数，编写代码，测试运行；经提示后，仍旧不能采集不同数据进行测试，不能对比、分析产生不同结果的原因:]基本能分析计算机系统中的置换算法，能基本构建模型、测试对比缺页率，寻找最佳操作点；基本能分析文件系统中的读写问题，权衡利弊后选择符合需求的读写方式，编写函数功能，测试运行:]', 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110120', '电路与电子学', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110120s', '电路与电子学实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110170s', '高级语言程序设计实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110210', '计算机网络', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110210s', '计算机网络实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES ('2018-2019-1', 'XX110240', '计算机原理与汇编', '能描述计算机硬件系统的五大功能部件及其基本功能；能描述计算机的工作原理，能描述并区分计算机数据的表示方法及特点，能区分汇编语言不同句法概念和作用，能描述处理器内部各专用寄存器的概念，能描述不同控制器的概念和优缺点，能描述I/O不同传输方式的特点，能描述不同存储方式的特点，能描述计算机时序控制方式，能描述不同的寻址方式。:]能描述存储程序工作方式原理及计算机硬件组成方式，能描述计算机系统中不同的存储地址表示方式及原理，能转换不同码制、数制表示的机器数，能说明定点数、浮点数的表示方式，能描述控制器的原理，能分析不同指令的功能。:]能完成带符号的不同进制的加减法运算，能从计算机的角度完成定点数、浮点数的算术运算，能从计算机的角度完成定点数乘除的运算，能分析计算机硬件结构及其不同部件的功能、联通方式，从寄存器级的角度分析指令执行过程，能描述指令的表示方法，能根据指令扩展技术计算指令个数和设计指令操作码扩展方案，根据cache和虚存的不同映射方式能计算相应的地址表示。能分析如何将不同存储部件有机结合组成在一个存储层次体系中，具备分析和设计存储系统的初步能力。:]能分析存储器地址分段的原理和方法，逻辑地址与物理地址的关系，能分析80x86寻址方式及相关指令操作，能解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，利用汇编语言语法、结构化程序等知识，开发新的汇编语言程序根据工程需要实现算法功能。 :]', '能准确描述计算机硬件系统的部件及其基本功能及内部通路的信息传递过程，能明确分析、对比不同信息表示方法，能正确区分汇编语言不同句法概念和作用。:]能准确描述计算机硬件组成方式、存储程序工作方式和原理，能明确分析计算机系统中不同的存储地址表示方式及原理，能正确转换不同码制、数制表示的机器数，能准确说明定点数、浮点数的表示方式，能明确描述控制器的原理，能正确分析不同指令的功能。:]能正确完成带符号的不同进制的加减法运算、从计算机角度完成定点数、浮点数的算术运算、从计算机的角度完成定点数乘除的运算，能准确分析计算机硬件结构及其不同部件的功能、联通方式，并从寄存器级的角度分析指令执行过程，能根据指令扩展技术正确计算指令个数和设计指令操作码扩展方案，能根据cache和虚存的不同映射方式正确计算相应的地址表示。能正确分析如何将不同存储部件有机结合组成在一个存储层次体系中，具备扎实的分析和设计存储系统的能力。:]能正确使用80x86寻址方式及相关指令操作，能准确解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，能准确利用汇编语言语法、结构化程序等知识，高效开发新的汇编语言程序并根据工程需要正确实现算法功能。:]', '能描述计算机硬件系统的部件及其基本功能及内部通路的信息传递过程，但有些许遗漏，能分析、对比不同信息表示方法，能区分汇编语言不同句法概念和作用，但有些许错误。:]能描述计算机硬件组成方式、存储程序工作方式和原理，能分析计算机系统中不同的存储地址表示方式及原理，能转换不同码制、数制表示的机器数，能说明定点数、浮点数的表示方式，能描述控制器的原理，能分析不同指令的功能，但有些许遗漏或错误。:]能完成带符号的不同进制的加减法运算、从计算机角度完成定点数、浮点数的算术运算、从计算机的角度完成定点数乘除的运算，能分析计算机硬件结构及其不同部件的功能、联通方式，并从寄存器级的角度分析指令执行过程，能根据指令扩展技术计算指令个数和设计指令操作码扩展方案，能根据cache和虚存的不同映射方式计算相应的地址表示。能分析如何将不同存储部件有机结合组成在一个存储层次体系中，但以上任务有些许遗漏或错误，具备良好的分析和设计存储系统的能力。:]能使用80x86寻址方式及相关指令操作，能解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，能利用汇编语言语法、结构化程序等知识，开发新的汇编语言程序并根据工程需要实现算法功能，但以上任务有些许遗漏或错误。:]', '能描述计算机硬件系统的部件及其基本功能及内部通路的信息传递过程，但有较多遗漏，能分析、对比不同信息表示方法，能区分汇编语言不同句法概念和作用，但有较多错误。:]能描述计算机硬件组成方式、存储程序工作方式和原理，能分析计算机系统中不同的存储地址表示方式及原理，能转换不同码制、数制表示的机器数，能说明定点数、浮点数的表示方式，能描述控制器的原理，能分析不同指令的功能，但有较多遗漏或错误。:]能完成带符号的不同进制的加减法运算、从计算机角度完成定点数、浮点数的算术运算、从计算机的角度完成定点数乘除的运算，能分析计算机硬件结构及其不同部件的功能、联通方式，并从寄存器级的角度分析指令执行过程，能根据指令扩展技术计算指令个数和设计指令操作码扩展方案，能根据cache和虚存的不同映射方式计算相应的地址表示。能分析如何将不同存储部件有机结合组成在一个存储层次体系中，但以上任务有较多遗漏或错误，具备基本的分析和设计存储系统的能力。:]能使用80x86寻址方式及相关指令操作，能解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，能利用汇编语言语法、结构化程序等知识，开发新的汇编语言程序并根据工程需要实现算法功能，但以上任务有较多遗漏或错误。:]', '能描述计算机硬件系统的部件及其基本功能及内部通路的信息传递过程，但有很多遗漏，能分析、对比不同信息表示方法，能区分汇编语言不同句法概念和作用，但有很多错误。:]能描述计算机硬件组成方式、存储程序工作方式和原理，能分析计算机系统中不同的存储地址表示方式及原理，能转换不同码制、数制表示的机器数，能说明定点数、浮点数的表示方式，能描述控制器的原理，能分析不同指令的功能，但有很多遗漏或错误。:]能完成带符号的不同进制的加减法运算、从计算机角度完成定点数、浮点数的算术运算、从计算机的角度完成定点数乘除的运算，能分析计算机硬件结构及其不同部件的功能、联通方式，并从寄存器级的角度分析指令执行过程，能根据指令扩展技术计算指令个数和设计指令操作码扩展方案，能根据cache和虚存的不同映射方式计算相应的地址表示。能分析如何将不同存储部件有机结合组成在一个存储层次体系中，但以上任务有很多遗漏或错误，具备基本的分析和设计存储系统的能力。:]能使用80x86寻址方式及相关指令操作，能解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，能利用汇编语言语法、结构化程序等知识，开发新的汇编语言程序并根据工程需要实现算法功能，但以上任务有很多遗漏或错误。:]', '不能描述计算机硬件系统的部件及其基本功能及内部通路的信息传递过程，不能分析、对比不同信息表示方法，不能区分汇编语言不同句法概念和作用。:]不能完成下面的多项任务：描述计算机硬件组成方式、存储程序工作方式和原理，分析计算机系统中不同的存储地址表示方式及原理，转换不同码制、数制表示的机器数，说明定点数、浮点数的表示方式，描述控制器的原理，分析不同指令的功能。:]不能完成下面的多项任务：带符号的不同进制的加减法运算、从计算机角度完成定点数、浮点数的算术运算、从计算机的角度完成定点数乘除的运算，分析计算机硬件结构及其不同部件的功能、联通方式，并从寄存器级的角度分析指令执行过程，根据指令扩展技术计算指令个数和设计指令操作码扩展方案，根据cache和虚存的不同映射方式计算相应的地址表示。分析如何将不同存储部件有机结合组成在一个存储层次体系中，不具备分析和设计存储系统的能力。:]不能完成下面的多项任务：使用80x86寻址方式及相关指令操作，解释汇编语言程序和机器语言程序之间的关系并比较与高级语言的区别和特点，利用汇编语言语法、结构化程序等知识，开发新的汇编语言程序并根据工程需要实现算法功能。:]', 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110240s', '计算机原理与汇编实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110270', '离散数学', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110280', '面向对象程序设计', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110290s', '面向对象程序设计实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110360', '软件工程', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110380', '数据结构', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110380s', '数据结构实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110390', '数据库原理及应用', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110390s', '数据库原理及应用实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110420', '数字逻辑', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110420s', '数字逻辑实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110480', '微型计算机技术', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110480s', '微型计算机技术实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110590', '高级语言程序设计', NULL, '1', '2', '3', '4', '5', 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110820', '微机接口技术', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);
INSERT INTO `courseinfo` VALUES (NULL, 'XX110820s', '微机接口技术实验', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120180', '计算方法', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120200', '计算机图形学', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120230', '计算机系统结构', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120440', '算法设计与分析', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120620', 'JAVA编程基础', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120730', '计算机图像处理', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX120760', '计算机科学导论', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127010', '实用软件实践', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127030', '操作系统课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127040', '程序设计课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127060', '计算机硬件课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127090', '数据库原理及应用课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127110', '应用软件开发课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127270', '面向对象程序设计课程设计', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'XX127290', '毕业设计（论文）（含毕业实习）', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1);
INSERT INTO `courseinfo` VALUES (NULL, 'YS193001', '大学美术', NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);

-- ----------------------------
-- Table structure for experiment
-- ----------------------------
DROP TABLE IF EXISTS `experiment`;
CREATE TABLE `experiment`  (
  `sTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cNum` int(11) DEFAULT NULL,
  `sId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sState` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `p1` double(20, 2) DEFAULT NULL,
  `r1` double(20, 2) DEFAULT NULL,
  `p2` double(20, 2) DEFAULT NULL,
  `r2` double(20, 2) DEFAULT NULL,
  `p3` double(20, 2) DEFAULT NULL,
  `r3` double(20, 2) DEFAULT NULL,
  `p4` double(20, 2) DEFAULT NULL,
  `r4` double(20, 2) DEFAULT NULL,
  `p5` double(20, 2) DEFAULT NULL,
  `r5` double(20, 2) DEFAULT NULL,
  `p6` double(20, 2) DEFAULT NULL,
  `r6` double(20, 2) DEFAULT NULL,
  `p7` double(20, 2) DEFAULT NULL,
  `r7` double(20, 2) DEFAULT NULL,
  `p8` double(20, 2) DEFAULT NULL,
  `r8` double(20, 2) DEFAULT NULL,
  `regular` double(20, 2) DEFAULT NULL,
  `written` double(20, 2) DEFAULT NULL,
  `overall` double(20, 2) DEFAULT NULL,
  `exper_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`exper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 332 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experiment
-- ----------------------------
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410311039', '黄宇辰', '201410311039', '黄宇辰', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00, 5);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410311041', '朱峥阳', '信息152', '重修', 60.00, 65.00, 60.00, 65.00, 60.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 6);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410311044', '王彦楠', '计算机162', '正常', 55.00, 80.00, 85.00, 80.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 7);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410311062', '朱子豪', '计算机163', '正常', 75.00, 80.00, 75.00, 80.00, 40.00, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 8);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410311083', '王耀宗', '计算机162', '正常', 85.00, 85.00, 90.00, 88.00, 90.00, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 9);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201410314058', '李静', '网络162', '正常', 85.00, 90.00, 90.00, 88.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 10);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201510311060', '陈淇文', '计算机162', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 11);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610121041', '胡涛', '计算机163', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 12);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610121045', '赵波', '计算机163', '正常', 90.00, 90.00, 88.00, 85.00, 85.00, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 13);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610125010', '周徐榕', '计算机162', '正常', 90.00, 85.00, 85.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 14);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610223126', '盛文静', '计算机163', '正常', 90.00, 88.00, 75.00, 85.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 15);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311006', '何晓阳', '计算机162', '正常', 90.00, 80.00, 40.00, 75.00, 0.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 16);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311007', '郎思雯', '计算机162', '正常', 95.00, 95.00, 75.00, 85.00, 85.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 17);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311008', '吴佳晖', '计算机162', '正常', 92.00, 92.00, 80.00, 85.00, 60.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 18);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311009', '吴奥然', '计算机162', '正常', 90.00, 90.00, 90.00, 80.00, 60.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 19);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311012', '李天辰', '计算机162', '正常', 90.00, 90.00, 90.00, 90.00, 95.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 20);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311013', '吴子非', '计算机162', '正常', 95.00, 95.00, 92.00, 91.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 21);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311028', '占国志', '计算机162', '正常', 95.00, 93.00, 93.00, 95.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 22);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311030', '张健', '计算机162', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 23);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311032', '陈永聪', '计算机162', '正常', 90.00, 90.00, 75.00, 90.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 24);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311055', '刘小敏', '计算机162', '正常', 92.00, 95.00, 93.00, 94.00, 95.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 25);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311057', '王盛楠', '计算机162', '正常', 90.00, 90.00, 90.00, 92.00, 92.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 26);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311061', '冯灿', '计算机162', '正常', 95.00, 95.00, 90.00, 90.00, 50.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 27);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311066', '李昂', '计算机162', '正常', 80.00, 80.00, 80.00, 80.00, 70.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 28);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311070', '戴奕超', '计算机162', '正常', 90.00, 90.00, 80.00, 85.00, 65.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 29);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311072', '周雨岚', '计算机162', '正常', 85.00, 80.00, 70.00, 80.00, 60.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 30);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311074', '张静怡', '计算机162', '正常', 95.00, 95.00, 60.00, 80.00, 50.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 31);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311078', '屠林猛', '计算机162', '正常', 80.00, 80.00, 75.00, 75.00, 40.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 32);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311082', '赵理想', '计算机162', '正常', 92.00, 92.00, 85.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 33);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311084', '胡翔坤', '计算机162', '正常', 90.00, 92.00, 92.00, 92.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 34);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311088', '卓彦志', '计算机162', '正常', 85.00, 85.00, 80.00, 80.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 35);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311091', '邹晨露', '计算机162', '正常', 90.00, 95.00, 80.00, 90.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 36);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311094', '洪珊娜', '计算机162', '正常', 95.00, 95.00, 93.00, 90.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 37);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311096', '邓思庆', '计算机162', '正常', 93.00, 93.00, 90.00, 90.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 38);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311100', '来正强', '计算机162', '正常', 85.00, 75.00, 50.00, 50.00, 50.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 39);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311101', '龚逸文', '计算机162', '正常', 90.00, 85.00, 88.00, 85.00, 85.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 40);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311103', '潘徐杰', '计算机162', '正常', 65.00, 65.00, 45.00, 60.00, 45.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 41);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311104', '张俊帆', '计算机162', '正常', 90.00, 83.00, 92.00, 90.00, 60.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 42);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311106', '缪奕晟', '计算机162', '正常', 90.00, 80.00, 85.00, 40.00, 75.00, 40.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 43);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311108', '杨墨政', '计算机162', '正常', 90.00, 85.00, 85.00, 90.00, 60.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 44);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311109', '阮如刚', '计算机162', '正常', 90.00, 90.00, 75.00, 85.00, 75.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 45);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311117', '范立', '网络161', '正常', 60.00, 60.00, 55.00, 60.00, 60.00, 40.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 46);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311120', '吴琦瑄', '网络161', '正常', 80.00, 60.00, 80.00, 60.00, 40.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 47);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311121', '尹俊杰', '计算机162', '正常', 90.00, 85.00, 60.00, 75.00, 75.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 48);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311129', '徐刚', '计算机163', '正常', 95.00, 95.00, 80.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 49);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311130', '申博文', '计算机163', '正常', 95.00, 95.00, 95.00, 92.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 50);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311143', '郑安贤', '计算机163', '正常', 95.00, 90.00, 75.00, 80.00, 45.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 51);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311144', '袁雪芹', '计算机163', '正常', 90.00, 90.00, 90.00, 90.00, 90.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 52);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311147', '尹含磊', '计算机163', '正常', 95.00, 90.00, 60.00, 80.00, 50.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 53);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311148', '马杰', '计算机163', '正常', 95.00, 95.00, 60.00, 98.00, 0.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 54);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311153', '陈露健', '计算机163', '正常', 95.00, 95.00, 90.00, 90.00, 40.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 55);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311156', '黄恩浩', '计算机163', '正常', 95.00, 90.00, 92.00, 92.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 56);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311157', '刘杰寅', '计算机163', '正常', 90.00, 85.00, 30.00, 85.00, 92.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 57);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311165', '李源', '计算机163', '正常', 95.00, 90.00, 80.00, 85.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 58);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311183', '王建鑫', '计算机163', '正常', 95.00, 95.00, 95.00, 95.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 59);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311186', '杨笑成', '计算机163', '正常', 85.00, 82.00, 65.00, 60.00, 0.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 60);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311187', '唐煜', '计算机163', '正常', 95.00, 92.00, 92.00, 92.00, 92.00, 91.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 61);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311188', '秦振霄', '计算机163', '正常', 95.00, 80.00, 65.00, 80.00, 50.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 62);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311190', '陆锦晖', '计算机163', '正常', 90.00, 92.00, 85.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 63);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311201', '施天琦', '计算机163', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 64);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311214', '周安顺', '计算机163', '正常', 95.00, 95.00, 93.00, 90.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 65);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311216', '徐欣依', '计算机163', '正常', 95.00, 90.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 66);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311218', '张伊凡', '计算机163', '正常', 95.00, 90.00, 95.00, 95.00, 95.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 67);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311219', '冯源', '计算机163', '正常', 90.00, 85.00, 70.00, 88.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 68);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311225', '凡涛', '计算机163', '正常', 95.00, 95.00, 95.00, 94.00, 95.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 69);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311226', '王博元', '计算机163', '正常', 95.00, 88.00, 95.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 70);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311227', '郑翀', '计算机163', '正常', 95.00, 95.00, 95.00, 93.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 71);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311231', '周兴', '计算机163', '正常', 95.00, 95.00, 95.00, 88.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 72);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311232', '占锦明', '计算机163', '正常', 95.00, 95.00, 92.00, 90.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 73);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311235', '杨景优', '计算机163', '正常', 95.00, 85.00, 70.00, 90.00, 90.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 74);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311239', '王薪程', '计算机163', '正常', 75.00, 85.00, 85.00, 88.00, 90.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 75);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311246', '贺雪', '计算机163', '正常', 92.00, 92.00, 95.00, 92.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 76);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311249', '王彦淇', '计算机163', '正常', 90.00, 90.00, 75.00, 80.00, 80.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 77);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311251', '徐凌霄', '计算机163', '正常', 90.00, 80.00, 85.00, 75.00, 45.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 78);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311253', '奚好晨', '计算机163', '正常', 85.00, 85.00, 75.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 79);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311254', '王怡清', '计算机163', '正常', 95.00, 92.00, 95.00, 90.00, 95.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 80);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311265', '陈波', '计算机163', '正常', 95.00, 95.00, 95.00, 99.00, 98.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 81);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610320028', '唐文千', '计算机162', '正常', 95.00, 95.00, 94.00, 95.00, 90.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 82);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610733071', '刘娅', '计算机162', '正常', 95.00, 95.00, 90.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 83);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311011', '杨昕皓', '计算机161卓', '正常', 88.00, 88.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91.00, 84);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311017', '陈龙', '计算机161卓', '正常', 95.00, 95.00, 100.00, 100.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 85);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311043', '洪嘉晖', '计算机161卓', '正常', 95.00, 95.00, 88.00, 88.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 86);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311045', '范晓苇', '计算机161卓', '正常', 90.00, 90.00, 90.00, 90.00, 98.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 87);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311047', '冯一丁', '计算机161卓', '正常', 90.00, 90.00, 93.00, 93.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 88);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311049', '虞昌远', '计算机161卓', '正常', 93.00, 93.00, 95.00, 95.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 89);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311068', '施程博', '计算机161卓', '正常', 90.00, 90.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 90);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311069', '何宗正', '计算机161卓', '正常', 95.00, 95.00, 88.00, 88.00, 98.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 91);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311076', '樊陈', '计算机161卓', '正常', 88.00, 88.00, 93.00, 93.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91.00, 92);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311079', '钱品馨', '计算机161卓', '正常', 93.00, 93.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94.00, 93);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311085', '李钦源', '计算机161卓', '正常', 88.00, 88.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89.00, 94);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311105', '王晓晨', '计算机161卓', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 95);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311111', '井卓', '计算机161卓', '正常', 90.00, 90.00, 83.00, 83.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 96);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311112', '郁旭晖', '计算机161卓', '正常', 88.00, 88.00, 90.00, 90.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 97);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311113', '蔡颖锋', '计算机161卓', '正常', 98.00, 98.00, 93.00, 93.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 98);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311114', '叶玉萍', '计算机161卓', '正常', 90.00, 90.00, 93.00, 93.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 99);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311116', '李铠桐', '计算机161卓', '正常', 90.00, 90.00, 100.00, 100.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94.00, 100);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311133', '查自强', '计算机161卓', '正常', 98.00, 98.00, 98.00, 98.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 101);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311155', '王兆瑞', '计算机161卓', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 102);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311163', '左雪婷', '计算机161卓', '正常', 95.00, 95.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 103);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311166', '储锐', '计算机161卓', '正常', 93.00, 93.00, 90.00, 90.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 104);
INSERT INTO `experiment` VALUES ('2018-2019-1', 'XX110110s', 1, '201610311167', '胡静雨', '计算机161卓', '正常', 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 105);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311189', '李闯', '计算机161卓', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 106);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311196', '张子君', '计算机161卓', '正常', 95.00, 95.00, 98.00, 98.00, 98.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97.00, 107);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311198', '刘志丹', '计算机161卓', '正常', 95.00, 95.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 108);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311222', '黄李阳', '计算机161卓', '正常', 93.00, 93.00, 90.00, 90.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 109);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311224', '焦淑娜', '计算机161卓', '正常', 95.00, 95.00, 98.00, 98.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 110);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311228', '董文一', '计算机161卓', '正常', 90.00, 90.00, 95.00, 95.00, 98.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94.00, 111);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311234', '孙嘉珩', '计算机161卓', '正常', 90.00, 90.00, 95.00, 95.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 112);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311241', '金恺文', '计算机161卓', '正常', 90.00, 90.00, 80.00, 80.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82.00, 113);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311250', '王珊珊', '计算机161卓', '正常', 100.00, 100.00, 100.00, 100.00, 98.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 114);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610311256', '叶逸铭', '计算机161卓', '正常', 80.00, 80.00, 80.00, 80.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83.00, 115);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201410311039', '黄宇辰', '信息161', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 116);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201410311107', '张培铉', '信息162', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 117);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510121066', '冯盛', '计算机173', '正常', 80.00, 90.00, 80.00, 80.00, 60.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 118);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510121124', '杜中洲', '计算机172', '正常', 90.00, 88.00, 80.00, 85.00, 80.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 119);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510311165', '陈佳伟', '计算机173', '正常', 85.00, 90.00, 90.00, 85.00, 85.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 120);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510311184', '李晨光', '信息172', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 121);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510730056', '王伟', '计算机172', '正常', 93.00, 90.00, 86.00, 90.00, 80.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 122);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710121222', '付家栋', '计算机173', '正常', 93.00, 93.00, 93.00, 93.00, 92.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 123);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311001', '何弋帆', '计算机173', '正常', 93.00, 93.00, 80.00, 90.00, 80.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 124);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311009', '朱心蕊', '计算机172', '正常', 88.00, 85.00, 80.00, 83.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 125);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311014', '张若男', '计算机172', '正常', 93.00, 88.00, 88.00, 85.00, 30.00, 20.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 126);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311017', '陈人丘', '计算机173', '正常', 93.00, 93.00, 88.00, 88.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 127);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311020', '宗赟', '计算机172', '正常', 93.00, 93.00, 88.00, 90.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 128);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311022', '陈川源', '计算机173', '正常', 93.00, 93.00, 88.00, 90.00, 80.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 129);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311024', '钱思璇', '计算机173', '正常', 90.00, 85.00, 80.00, 80.00, 82.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 130);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311026', '奚铮杰', '计算机172', '正常', 90.00, 80.00, 85.00, 85.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 131);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311027', '彭诚颢', '计算机173', '正常', 96.00, 96.00, 96.00, 96.00, 96.00, 96.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 132);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311028', '张栩', '计算机173', '正常', 85.00, 85.00, 85.00, 90.00, 30.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 133);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311033', '黄美琳', '计算机172', '正常', 93.00, 93.00, 75.00, 85.00, 50.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 134);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311037', '陈思哲', '计算机172', '正常', 93.00, 90.00, 88.00, 85.00, 40.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 135);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311045', '施旸昱', '计算机173', '正常', 85.00, 85.00, 70.00, 88.00, 30.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 136);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311052', '蔡硕', '计算机173', '正常', 80.00, 80.00, 50.00, 80.00, 50.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 137);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311055', '李嘉祺', '计算机173', '正常', 92.00, 60.00, 80.00, 75.00, 75.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 138);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311061', '修亚辉', '计算机172', '正常', 92.00, 92.00, 90.00, 92.00, 50.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 139);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311072', '周彦勇', '计算机173', '正常', 90.00, 90.00, 88.00, 88.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 140);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311074', '乔若晨', '计算机173', '正常', 90.00, 90.00, 50.00, 60.00, 30.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 141);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311075', '周翱天', '计算机173', '正常', 90.00, 90.00, 92.00, 92.00, 92.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 142);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311083', '周明澍', '计算机172', '正常', 85.00, 90.00, 80.00, 70.00, 50.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 143);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311088', '王峥', '计算机173', '正常', 80.00, 80.00, 50.00, 80.00, 50.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 144);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311091', '范茜琳', '计算机183', '正常', 85.00, 85.00, 60.00, 60.00, 60.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 145);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311097', '盛昌', '计算机172', '正常', 96.00, 96.00, 95.00, 92.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 146);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311101', '江文全', '计算机173', '正常', 96.00, 96.00, 96.00, 96.00, 96.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 147);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311106', '何玉娜', '计算机172', '正常', 90.00, 90.00, 85.00, 88.00, 50.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 148);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311108', '严祥军', '计算机172', '正常', 96.00, 96.00, 77.00, 90.00, 83.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 149);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311111', '毛竹', '计算机172', '正常', 93.00, 93.00, 90.00, 90.00, 70.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 150);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311114', '赵继云', '计算机172', '正常', 93.00, 93.00, 88.00, 90.00, 75.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 151);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311116', '王自阳', '计算机172', '正常', 90.00, 90.00, 80.00, 88.00, 60.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 152);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311119', '陈冬珏', '计算机173', '正常', 90.00, 88.00, 85.00, 88.00, 75.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 153);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311121', '尤闻涛', '计算机172', '正常', 95.00, 93.00, 80.00, 90.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 154);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311122', '张海婷', '计算机172', '正常', 88.00, 88.00, 82.00, 85.00, 50.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 155);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311123', '顾佳琪', '计算机173', '正常', 90.00, 88.00, 85.00, 88.00, 60.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 156);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311127', '华怡芃', '计算机172', '正常', 90.00, 95.00, 93.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 157);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311128', '杨博文', '计算机173', '正常', 93.00, 93.00, 93.00, 93.00, 95.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 158);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311130', '叶佳磊', '计算机172', '正常', 85.00, 85.00, 60.00, 65.00, 60.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 159);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311142', '朱佳威', '计算机172', '正常', 92.00, 92.00, 80.00, 80.00, 40.00, 70.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 160);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311143', '贾世正', '计算机173', '正常', 96.00, 96.00, 94.00, 94.00, 90.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 161);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311159', '赵燕雯', '计算机172', '正常', 88.00, 88.00, 70.00, 70.00, 40.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55.00, 162);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311174', '彭燕玲', '计算机172', '正常', 90.00, 90.00, 70.00, 80.00, 50.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52.00, 163);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311176', '杨金坡', '计算机173', '正常', 93.00, 93.00, 78.00, 90.00, 65.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 164);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311183', '贾岳欣', '计算机173', '正常', 93.00, 93.00, 85.00, 92.00, 65.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 165);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311184', '陈奉天', '计算机173', '正常', 85.00, 85.00, 75.00, 75.00, 75.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 166);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311185', '曲莫沙子', '计算机172', '正常', 80.00, 80.00, 70.00, 70.00, 60.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 167);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311191', '黄超', '计算机172', '正常', 90.00, 90.00, 88.00, 90.00, 90.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 168);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311193', '陈文岩', '计算机173', '正常', 96.00, 96.00, 95.00, 90.00, 40.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 169);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311196', '钱多', '计算机173', '正常', 93.00, 93.00, 88.00, 90.00, 60.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 170);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311197', '徐天赐', '计算机172', '正常', 80.00, 80.00, 60.00, 80.00, 40.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 171);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311199', '张书楷', '计算机172', '正常', 85.00, 88.00, 85.00, 85.00, 40.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 172);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311207', '王萱仪', '计算机173', '正常', 93.00, 93.00, 60.00, 90.00, 40.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 173);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311211', '褚熠阳', '计算机173', '正常', 80.00, 88.00, 90.00, 85.00, 40.00, 50.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 174);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311215', '刘畅', '计算机172', '正常', 90.00, 90.00, 90.00, 88.00, 95.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 175);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311223', '方真', '计算机173', '正常', 90.00, 90.00, 65.00, 90.00, 40.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 176);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311226', '王梓同', '计算机172', '正常', 95.00, 93.00, 94.00, 93.00, 90.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 177);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311227', '曹杰', '计算机173', '正常', 95.00, 93.00, 90.00, 90.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 178);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311229', '傅成', '计算机172', '正常', 90.00, 90.00, 70.00, 85.00, 93.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 179);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311230', '顾卓成', '计算机173', '正常', 90.00, 80.00, 60.00, 80.00, 80.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 180);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311231', '康宇佳', '计算机173', '正常', 93.00, 93.00, 85.00, 85.00, 85.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 181);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311232', '罗鹏晖', '计算机173', '正常', 93.00, 93.00, 93.00, 90.00, 88.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 182);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311233', '杨春泉', '计算机172', '正常', 95.00, 95.00, 78.00, 90.00, 85.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 183);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311237', '龚一然', '计算机172', '正常', 93.00, 93.00, 78.00, 85.00, 40.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 184);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311241', '李佳骏', '计算机173', '正常', 95.00, 95.00, 95.00, 90.00, 95.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 185);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311245', '胡炳', '计算机172', '正常', 85.00, 85.00, 90.00, 82.00, 90.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 186);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311249', '金怡', '计算机172', '正常', 95.00, 95.00, 90.00, 90.00, 95.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 187);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311258', '李琦涛', '计算机173', '正常', 85.00, 85.00, 75.00, 85.00, 85.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 188);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311259', '庄一鸣', '计算机172', '正常', 95.00, 95.00, 93.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 189);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710320023', '樊润泽', '计算机173', '正常', 98.00, 98.00, 98.00, 98.00, 98.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 190);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710320168', '刘佳祺', '计算机172', '正常', 95.00, 95.00, 92.00, 93.00, 95.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 191);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710413007', '戚华菁', '计算机172', '正常', 90.00, 90.00, 82.00, 75.00, 90.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 192);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710413016', '黄漪钦', '船舶171卓', '正常', 94.00, 93.00, 94.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 193);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710414002', '杨毅铭', '计算机172', '正常', 95.00, 95.00, 88.00, 93.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 194);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201711010045', '赵兰洁', '计科171', '正常', 93.00, 93.00, 90.00, 95.00, 93.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 195);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201510311045', '俞子俊', '计算机171卓', '正常', 95.00, 95.00, 95.00, 95.00, 97.00, 97.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 196);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311011', '刘云丽', '计算机171卓', '正常', 97.00, 97.00, 97.00, 97.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 197);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311012', '寇嘉颖', '计算机171卓', '正常', 90.00, 90.00, 92.00, 92.00, 92.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 198);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311015', '陈颖', '计算机171卓', '正常', 87.00, 87.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 199);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311025', '徐逸凡', '计算机171卓', '正常', 95.00, 95.00, 97.00, 97.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 200);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311064', '高婧贤', '计算机171卓', '正常', 87.00, 87.00, 92.00, 92.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 201);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311070', '邱芷蕙', '计算机171卓', '正常', 87.00, 87.00, 92.00, 92.00, 92.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30.00, 202);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311077', '管俊洋', '计算机171卓', '正常', 93.00, 93.00, 93.00, 93.00, 87.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40.00, 203);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311085', '庞张灯', '计算机171卓', '正常', 90.00, 90.00, 90.00, 90.00, 87.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 204);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311092', '谢甜', '计算机171卓', '正常', 90.00, 90.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 205);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311093', '忻伟琦', '计算机171卓', '正常', 90.00, 90.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 206);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311100', '高铤', '计算机171卓', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 207);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311115', '冯佳琪', '计算机171卓', '正常', 90.00, 90.00, 98.00, 98.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.00, 208);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311118', '冯雪玲', '计算机171卓', '正常', 90.00, 90.00, 97.00, 97.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 209);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311140', '于霖', '计算机171卓', '正常', 85.00, 85.00, 85.00, 85.00, 87.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 210);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311148', '刘依依', '计算机171卓', '正常', 80.00, 80.00, 90.00, 90.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30.00, 211);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311150', '钮莹莹', '计算机171卓', '正常', 93.00, 93.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 212);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311151', '吴亦飞', '计算机171卓', '正常', 90.00, 90.00, 93.00, 93.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 213);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311152', '陈忠青', '计算机171卓', '正常', 82.00, 82.00, 85.00, 85.00, 87.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 214);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311155', '余荔恒', '计算机171卓', '正常', 100.00, 100.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 215);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311157', '高亚鹏', '计算机171卓', '正常', 85.00, 85.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 216);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311164', '周睛集', '计算机171卓', '正常', 90.00, 90.00, 90.00, 90.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 217);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311178', '金江林', '计算机171卓', '正常', 92.00, 92.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 218);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311181', '吴凡', '计算机171卓', '正常', 90.00, 90.00, 85.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 219);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311190', '楼玲妃', '计算机171卓', '正常', 86.00, 86.00, 87.00, 87.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 220);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311194', '钟昱祺', '计算机171卓', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50.00, 221);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311210', '李钰林', '计算机171卓', '正常', 87.00, 87.00, 87.00, 87.00, 87.00, 87.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 222);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311222', '沈康文', '计算机171卓', '正常', 87.00, 87.00, 80.00, 80.00, 82.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 223);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311235', '唐芮琪', '计算机171卓', '正常', 97.00, 97.00, 100.00, 100.00, 97.00, 97.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 224);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311242', '李兴业', '计算机171卓', '正常', 92.00, 92.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 225);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311243', '李颜言', '计算机171卓', '正常', 92.00, 92.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 226);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311256', '徐越', '计算机171卓', '正常', 90.00, 90.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 227);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311257', '汪宇', '计算机171卓', '正常', 88.00, 88.00, 97.00, 97.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30.00, 228);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201710311265', '何李杰', '计算机171卓', '正常', 97.00, 97.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 229);
INSERT INTO `experiment` VALUES ('2019-2020-1', 'XX110111s', 1, '201610111159', '杨怀', '计算机183', '正常', 93.00, 88.00, 93.00, 88.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78.00, 230);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201610311175', '杨童超', '网络172', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 231);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201711010065', '李盛', '计科171', '正常', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 232);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810210136', '张永琦', '计算机183', '正常', 95.00, 95.00, 97.00, 98.00, 98.00, 96.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 233);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810223067', '冀冠楠', '计算机182', '正常', 95.00, 98.00, 99.00, 98.00, 95.00, 97.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 234);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810230136', '罗响', '计算机182', '正常', 95.00, 95.00, 90.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 235);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311001', '刘莹', '计算机183', '正常', 91.00, 90.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 236);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311002', '秦弘升', '计算机182', '正常', 93.00, 90.00, 93.00, 88.00, 91.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 237);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311005', '吴旭鸿', '计算机182', '正常', 92.00, 90.00, 85.00, 85.00, 90.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 238);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311010', '唐霞', '计算机183', '正常', 92.00, 92.00, 97.00, 88.00, 93.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 239);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311014', '李瑞国', '计算机183', '正常', 98.00, 99.00, 98.00, 98.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 240);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311020', '孙畅', '计算机182', '正常', 95.00, 95.00, 99.00, 93.00, 96.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 241);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311026', '张一健', '计算机183', '正常', 92.00, 92.00, 85.00, 85.00, 87.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99.00, 242);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311027', '万飙', '计算机183', '正常', 88.00, 88.00, 94.00, 88.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 243);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311030', '陈嘉欢', '计算机182', '正常', 93.00, 93.00, 92.00, 94.00, 94.00, 94.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 244);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311037', '王钺洲', '计算机183', '正常', 88.00, 88.00, 93.00, 88.00, 85.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 245);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311039', '王心怡', '计算机182', '正常', 92.00, 90.00, 95.00, 92.00, 93.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 246);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311049', '倪徐立', '计算机183', '正常', 90.00, 88.00, 92.00, 88.00, 90.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 247);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311050', '周宏健', '计算机183', '正常', 91.00, 91.00, 92.00, 85.00, 92.00, 55.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 248);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311051', '朱文倬', '计算机182', '正常', 93.00, 93.00, 94.00, 85.00, 93.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 249);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311055', '栗靖东', '计算机183', '正常', 96.00, 96.00, 97.00, 96.00, 96.00, 96.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 250);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311061', '黄德玉', '计算机183', '正常', 93.00, 93.00, 98.00, 93.00, 94.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 251);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311062', '涂枭', '计算机182', '正常', 99.00, 99.00, 99.00, 99.00, 99.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 252);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311063', '杨怡林', '计算机183', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95.00, 253);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311064', '贾想成', '计算机183', '正常', 92.00, 92.00, 93.00, 88.00, 90.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 254);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311067', '姚越成', '计算机183', '正常', 90.00, 88.00, 90.00, 85.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 255);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311071', '邓俊杰', '计算机183', '正常', 93.00, 93.00, 98.00, 96.00, 99.00, 96.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93.00, 256);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311074', '徐光志', '计算机182', '正常', 92.00, 88.00, 92.00, 88.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 257);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311076', '曹轶凌', '计算机182', '正常', 95.00, 93.00, 98.00, 93.00, 95.00, 94.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 258);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311082', '张杰', '计算机183', '正常', 92.00, 92.00, 92.00, 90.00, 70.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 259);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311083', '周子涵', '计算机182', '正常', 92.00, 95.00, 88.00, 90.00, 92.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 260);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311086', '王玥', '计算机182', '正常', 92.00, 88.00, 94.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85.00, 261);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311092', '杨博文', '计算机182', '正常', 93.00, 93.00, 93.00, 93.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92.00, 262);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311099', '侯泽宇', '计算机182', '正常', 93.00, 93.00, 90.00, 88.00, 94.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 263);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311100', '陈嘉宇', '计算机182', '正常', 90.00, 90.00, 90.00, 90.00, 88.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 264);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311101', '张羽音', '计算机182', '正常', 94.00, 92.00, 94.00, 88.00, 92.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 265);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311103', '叶阳', '计算机182', '正常', 93.00, 93.00, 98.00, 94.00, 94.00, 94.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 266);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311113', '王思敏', '计算机183', '正常', 99.00, 99.00, 95.00, 95.00, 93.00, 94.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 267);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311129', '季胤喆', '计算机182', '正常', 90.00, 90.00, 50.00, 65.00, 88.00, 78.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 268);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311132', '施郁文', '计算机183', '正常', 92.00, 92.00, 85.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82.00, 269);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311133', '徐江晟', '计算机183', '正常', 92.00, 92.00, 90.00, 85.00, 88.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82.00, 270);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311137', '金雨晴', '计算机182', '正常', 92.00, 92.00, 88.00, 90.00, 92.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78.00, 271);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311138', '江积硕', '计算机183', '正常', 93.00, 93.00, 92.00, 93.00, 85.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 272);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311141', '罗韵盈', '计算机183', '正常', 92.00, 90.00, 94.00, 85.00, 90.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 273);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311142', '王金晶', '计算机182', '正常', 92.00, 92.00, 95.00, 88.00, 94.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 274);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311148', '蒋飞宇', '计算机182', '正常', 93.00, 90.00, 98.00, 92.00, 93.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 275);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311149', '罗娅瑜', '计算机183', '正常', 93.00, 92.00, 95.00, 94.00, 98.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 276);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311151', '刘琨', '计算机183', '正常', 92.00, 90.00, 93.00, 90.00, 80.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 277);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311154', '谭元昊', '计算机182', '正常', 93.00, 90.00, 92.00, 85.00, 75.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 278);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311155', '贺然', '计算机183', '正常', 91.00, 85.00, 90.00, 85.00, 72.00, 86.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 279);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311157', '吴逸铭', '计算机182', '正常', 93.00, 93.00, 92.00, 89.00, 90.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75.00, 280);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311170', '王源', '计算机183', '正常', 93.00, 93.00, 90.00, 94.00, 93.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 281);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311176', '周宁思远', '计算机182', '正常', 93.00, 93.00, 95.00, 90.00, 90.00, 93.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 282);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311177', '周昱全', '计算机182', '正常', 92.00, 92.00, 98.00, 98.00, 95.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 283);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311178', '李佳蕴', '计算机183', '正常', 90.00, 85.00, 75.00, 75.00, 45.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 284);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311179', '陈铃铃', '计算机182', '正常', 85.00, 85.00, 85.00, 75.00, 85.00, 60.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 285);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311188', '王研', '计算机182', '正常', 88.00, 85.00, 90.00, 90.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 286);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311194', '李东亚', '计算机183', '正常', 92.00, 90.00, 93.00, 90.00, 93.00, 92.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 287);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311195', '阮天成', '计算机182', '正常', 92.00, 92.00, 70.00, 80.00, 88.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 288);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311197', '唐泰峰', '计算机183', '正常', 90.00, 80.00, 85.00, 78.00, 80.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 289);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311199', '李苏武', '计算机183', '正常', 80.00, 70.00, 70.00, 60.00, 70.00, 65.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 290);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311200', '王文庆', '计算机182', '正常', 95.00, 95.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 291);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311229', '蒋龙英', '计算机183', '正常', 93.00, 93.00, 94.00, 88.00, 92.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 292);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311237', '白松林', '计算机182', '正常', 92.00, 94.00, 92.00, 90.00, 90.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 293);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311252', '胡新洲', '计算机182', '正常', 90.00, 90.00, 90.00, 88.00, 82.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70.00, 294);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311256', '李洋', '计算机182', '正常', 92.00, 90.00, 88.00, 85.00, 75.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 295);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311258', '金焕然', '计算机183', '正常', 92.00, 92.00, 90.00, 90.00, 50.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82.00, 296);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311259', '吕雨蛟', '计算机183', '正常', 92.00, 92.00, 95.00, 80.00, 92.00, 82.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80.00, 297);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810320040', '钟嘉怡', '计算机182', '正常', 96.00, 96.00, 95.00, 92.00, 95.00, 98.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98.00, 298);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311007', '李骑廷', '计算机181卓', '正常', 90.00, 90.00, 85.00, 85.00, 80.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64.00, 299);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311013', '马雍博', '计算机181卓', '正常', 90.00, 90.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.00, 300);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311019', '肖显扬', '计算机181卓', '正常', 90.00, 90.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88.00, 301);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311023', '张奕庆', '计算机181卓', '正常', 90.00, 90.00, 95.00, 95.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60.00, 302);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311052', '瞿茹芸', '计算机181卓', '正常', 98.00, 100.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28.00, 303);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311077', '郭晓民', '计算机181卓', '正常', 70.00, 70.00, 95.00, 95.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 304);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311078', '杨洪', '计算机181卓', '正常', 70.00, 70.00, 80.00, 80.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 305);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311084', '陶哲', '计算机181卓', '正常', 85.00, 85.00, 98.00, 100.00, 96.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8.00, 306);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311085', '史周胤', '计算机181卓', '正常', 75.00, 75.00, 80.00, 80.00, 80.00, 80.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 307);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311090', '王虹岚', '计算机181卓', '正常', 80.00, 80.00, 85.00, 85.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 308);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311091', '陈洁翔', '计算机181卓', '正常', 97.00, 100.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56.00, 309);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311094', '余凌霄', '计算机181卓', '正常', 80.00, 80.00, 80.00, 80.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48.00, 310);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311098', '黎逸瀛', '计算机181卓', '正常', 70.00, 70.00, 75.00, 75.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44.00, 311);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311106', '徐子荣', '计算机181卓', '正常', 100.00, 100.00, 90.00, 90.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 312);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311125', '张冯晨安', '计算机181卓', '正常', 90.00, 90.00, 80.00, 80.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 313);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311131', '冯亦凡', '计算机181卓', '正常', 70.00, 70.00, 80.00, 80.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 314);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311135', '徐仕豪', '计算机181卓', '正常', 80.00, 80.00, 80.00, 80.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76.00, 315);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311156', '胡娅欣', '计算机181卓', '正常', 95.00, 95.00, 95.00, 95.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84.00, 316);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311161', '卢宇星', '计算机181卓', '正常', 90.00, 90.00, 95.00, 95.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84.00, 317);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311163', '肖玮琦', '计算机181卓', '正常', 85.00, 85.00, 95.00, 95.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 318);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311164', '吴天昊', '计算机181卓', '正常', 100.00, 100.00, 85.00, 85.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 319);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311166', '黄辰恺', '计算机181卓', '正常', 80.00, 80.00, 90.00, 90.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 320);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311169', '夏天', '计算机181卓', '正常', 100.00, 100.00, 95.00, 95.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 321);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311184', '曾云浩', '计算机181卓', '正常', 90.00, 90.00, 80.00, 75.00, 85.00, 85.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 322);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311202', '朱映琏', '计算机181卓', '正常', 80.00, 80.00, 90.00, 90.00, 40.00, 40.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 323);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311211', '罗欣然', '计算机181卓', '正常', 100.00, 100.00, 95.00, 95.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76.00, 324);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311216', '符峻滔', '计算机181卓', '正常', 90.00, 90.00, 80.00, 80.00, 75.00, 75.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 325);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311230', '吴远尘', '计算机181卓', '正常', 95.00, 95.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 326);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311241', '黄颖宁', '计算机181卓', '正常', 90.00, 90.00, 80.00, 80.00, 90.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 327);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311245', '何庆庆', '计算机181卓', '正常', 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 328);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311247', '孙亚东', '计算机181卓', '正常', 90.00, 90.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96.00, 329);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311250', '孙宏宇', '计算机181卓', '正常', 95.00, 95.00, 90.00, 90.00, 95.00, 95.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 330);
INSERT INTO `experiment` VALUES ('2020-2021-1', 'XX110111s', 1, '201810311255', '邹沈杰', '计算机181卓', '正常', 95.00, 95.00, 90.00, 90.00, 92.00, 90.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100.00, 331);

-- ----------------------------
-- Table structure for gdesign
-- ----------------------------
DROP TABLE IF EXISTS `gdesign`;
CREATE TABLE `gdesign`  (
  `sTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cNum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `grade1_1` double(20, 2) DEFAULT NULL,
  `grade1_2` double(20, 2) DEFAULT NULL,
  `grade1_3` double(20, 2) DEFAULT NULL,
  `grade1_4` double(20, 2) DEFAULT NULL,
  `grade1_5` double(20, 2) DEFAULT NULL,
  `grade1_6` double(20, 2) DEFAULT NULL,
  `grade2_1` double(20, 2) DEFAULT NULL,
  `grade2_2` double(20, 2) DEFAULT NULL,
  `grade2_3` double(20, 2) DEFAULT NULL,
  `grade2_4` double(20, 2) DEFAULT NULL,
  `grade3_1` double(20, 2) DEFAULT NULL,
  `grade3_2` double(20, 2) DEFAULT NULL,
  `grade3_3` double(20, 2) DEFAULT NULL,
  `overall` double(20, 2) DEFAULT NULL,
  `gdesign_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`gdesign_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gdesign
-- ----------------------------
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201410311020', '曹阳', 3.00, 3.00, 3.00, 6.00, 3.00, 6.00, 3.00, 2.00, 10.00, 3.00, 6.00, 6.00, 6.00, 60.00, 3);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201410311027', '王林辉', 3.50, 4.00, 4.00, 8.00, 4.00, 7.00, 4.00, 3.00, 12.00, 4.00, 8.20, 7.70, 8.00, 77.40, 4);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201410311044', '王彦楠', 3.00, 2.00, 3.00, 6.00, 4.00, 7.00, 3.00, 3.00, 10.00, 3.00, 6.20, 6.20, 6.10, 62.50, 5);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201410311062', '朱子豪', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 14.00, 4.00, 8.00, 9.00, 8.70, 86.70, 6);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201410311083', '王耀宗', 4.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 8.00, 82.00, 7);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201510311017', '付嘉懿', 5.00, 5.00, 5.00, 8.00, 4.00, 7.00, 4.00, 4.00, 14.00, 4.00, 8.00, 8.50, 8.17, 84.67, 8);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610121041', '胡涛', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 3.00, 4.00, 12.00, 3.00, 7.60, 7.50, 7.50, 76.60, 9);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610121045', '赵波', 5.00, 4.00, 5.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 9.00, 8.00, 8.00, 84.00, 10);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610125010', '周徐榕', 4.00, 4.50, 4.00, 8.50, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.30, 7.70, 8.00, 81.00, 11);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610223126', '盛文静', 4.00, 4.00, 4.00, 8.00, 4.00, 7.00, 3.00, 3.50, 12.50, 3.00, 7.30, 8.00, 8.00, 76.30, 12);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311006', '何晓阳', 3.00, 3.00, 3.00, 7.00, 4.00, 7.00, 2.50, 3.00, 11.00, 2.50, 7.00, 6.70, 6.60, 66.30, 13);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311007', '郎思雯', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 3.50, 12.50, 2.50, 7.30, 7.00, 7.30, 74.10, 14);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311008', '吴佳晖', 4.00, 4.00, 4.00, 7.00, 4.00, 6.00, 3.00, 3.00, 12.00, 3.00, 7.20, 7.40, 7.20, 71.80, 15);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311009', '吴奥然', 4.30, 4.30, 4.20, 8.50, 4.30, 8.40, 4.00, 4.00, 12.00, 4.00, 7.10, 7.70, 7.00, 79.80, 16);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311011', '杨昕皓', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 9.00, 84.00, 17);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311012', '李天辰', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 12.00, 3.00, 7.30, 7.70, 7.00, 80.00, 18);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311013', '吴子非', 5.00, 5.00, 4.00, 8.00, 5.00, 7.00, 3.00, 4.00, 10.00, 3.00, 6.00, 7.00, 7.00, 74.00, 19);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311017', '陈龙', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 3.00, 7.70, 8.30, 7.70, 82.70, 20);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311028', '占国志', 5.00, 5.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 9.00, 8.00, 8.00, 85.00, 21);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311030', '张健', 5.00, 5.00, 4.00, 8.00, 4.00, 8.00, 4.00, 3.00, 11.00, 4.00, 7.00, 8.00, 7.00, 78.00, 22);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311032', '陈永聪', 5.00, 5.00, 4.00, 9.00, 5.00, 10.00, 5.00, 5.00, 13.00, 5.00, 9.00, 9.00, 9.00, 93.00, 23);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311037', '黄雅雯', 3.00, 3.00, 3.00, 6.00, 4.00, 6.00, 3.00, 3.00, 10.00, 3.00, 6.00, 6.00, 6.00, 62.00, 24);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311043', '洪嘉晖', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 3.50, 3.50, 13.00, 4.50, 8.70, 8.00, 8.70, 84.90, 25);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311045', '范晓苇', 5.00, 5.00, 5.00, 9.00, 5.00, 9.00, 5.00, 5.00, 13.00, 4.00, 9.00, 9.00, 9.00, 92.00, 26);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311047', '冯一丁', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 5.00, 4.00, 13.00, 4.00, 8.70, 9.00, 8.70, 87.40, 27);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311049', '虞昌远', 4.00, 4.00, 5.00, 9.00, 4.00, 8.00, 2.00, 3.00, 12.00, 3.00, 8.00, 8.00, 9.00, 79.00, 28);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311055', '刘小敏', 4.00, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 13.00, 4.00, 8.30, 8.00, 8.30, 84.10, 29);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311057', '王盛楠', 5.00, 5.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 4.00, 9.00, 9.00, 8.00, 86.00, 30);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311061', '冯灿', 4.00, 4.00, 4.00, 9.00, 5.00, 8.00, 5.00, 4.00, 12.00, 4.00, 8.60, 8.30, 8.50, 84.40, 31);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311066', '李昂', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 13.00, 4.00, 7.50, 7.30, 6.80, 76.60, 32);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311068', '施程博', 5.00, 5.00, 5.00, 8.00, 5.00, 7.00, 5.00, 3.00, 12.00, 4.00, 8.00, 7.70, 7.60, 82.30, 33);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311069', '何宗正', 4.00, 4.00, 5.00, 9.00, 4.00, 8.00, 5.00, 4.00, 12.00, 4.00, 8.00, 7.00, 7.00, 81.00, 34);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311070', '戴奕超', 4.00, 5.00, 5.00, 10.00, 4.00, 8.00, 3.50, 3.50, 11.00, 3.50, 7.30, 7.60, 7.50, 79.90, 35);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311072', '周雨岚', 4.00, 4.00, 4.00, 9.00, 5.00, 9.00, 4.00, 5.00, 14.00, 4.00, 8.00, 9.00, 8.00, 87.00, 36);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311074', '张静怡', 4.00, 4.00, 4.00, 8.00, 5.00, 9.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 82.00, 37);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311076', '樊陈', 4.00, 5.00, 4.00, 8.00, 5.00, 7.00, 3.00, 3.00, 12.00, 4.00, 7.80, 7.60, 7.10, 77.50, 38);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311078', '屠林猛', 4.00, 4.00, 4.00, 8.50, 4.50, 8.00, 4.00, 3.00, 12.00, 4.00, 8.20, 7.30, 7.70, 79.20, 39);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311079', '钱品馨', 4.00, 4.00, 4.00, 8.00, 4.00, 7.00, 4.00, 4.00, 11.00, 4.00, 7.00, 8.00, 7.00, 76.00, 40);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311082', '赵理想', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 11.00, 3.00, 6.40, 6.60, 6.30, 71.30, 41);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311084', '胡翔坤', 3.50, 3.50, 3.50, 7.50, 3.50, 7.50, 4.00, 4.00, 11.00, 4.00, 7.75, 7.60, 7.15, 74.50, 42);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311085', '李钦源', 4.00, 3.00, 3.00, 6.00, 3.00, 7.00, 4.00, 3.00, 11.00, 3.00, 6.50, 7.00, 6.50, 67.00, 43);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311088', '卓彦志', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 13.00, 4.00, 7.70, 7.50, 7.70, 77.90, 44);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311091', '邹晨露', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 3.00, 4.00, 13.00, 3.50, 8.70, 8.00, 8.30, 82.50, 45);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311094', '洪珊娜', 3.50, 3.50, 3.50, 7.50, 4.50, 7.50, 4.00, 3.00, 12.00, 3.00, 7.30, 7.30, 7.30, 73.90, 46);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311096', '邓思庆', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 10.00, 4.00, 8.10, 8.10, 8.10, 78.30, 47);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311100', '来正强', 3.00, 3.00, 3.00, 7.00, 3.00, 7.00, 4.00, 3.00, 11.00, 3.00, 6.00, 7.00, 7.00, 67.00, 48);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311101', '龚逸文', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.20, 8.30, 8.10, 80.60, 49);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311103', '潘徐杰', 3.00, 3.00, 3.00, 7.00, 3.00, 6.00, 3.00, 3.00, 9.00, 3.00, 6.80, 6.50, 6.30, 62.60, 50);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311104', '张俊帆', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 5.00, 4.50, 12.00, 4.00, 8.70, 8.10, 8.50, 84.80, 51);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311105', '王晓晨', 4.00, 3.00, 3.00, 7.00, 4.00, 7.00, 3.00, 4.00, 12.00, 3.00, 7.00, 7.00, 7.00, 71.00, 52);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311106', '缪奕晟', 4.50, 4.50, 5.00, 8.50, 4.50, 8.00, 4.00, 4.00, 13.00, 4.00, 8.80, 8.20, 8.80, 85.80, 53);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311108', '杨墨政', 3.60, 3.60, 3.60, 7.20, 3.70, 7.10, 4.00, 3.00, 10.00, 4.00, 7.00, 7.00, 7.00, 70.80, 54);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311109', '阮如刚', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 5.00, 4.00, 13.00, 4.00, 7.80, 8.00, 7.70, 82.50, 55);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311111', '井卓', 4.00, 4.00, 5.00, 9.00, 4.00, 9.00, 3.00, 4.00, 13.00, 4.00, 8.70, 8.70, 8.60, 85.00, 56);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311112', '郁旭晖', 4.30, 4.30, 4.20, 8.40, 4.50, 8.10, 4.00, 4.00, 14.00, 4.00, 8.10, 7.60, 7.70, 83.20, 57);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311113', '蔡颖锋', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 8.00, 9.00, 7.70, 84.70, 58);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311114', '叶玉萍', 5.00, 5.00, 5.00, 10.00, 5.00, 9.00, 4.00, 4.00, 15.00, 5.00, 9.60, 9.40, 9.30, 95.30, 59);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311116', '李铠桐', 4.50, 4.50, 4.50, 8.50, 5.00, 8.50, 4.00, 4.00, 13.00, 4.00, 8.80, 8.70, 8.60, 86.60, 60);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311121', '尹俊杰', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 3.00, 4.00, 12.00, 4.00, 7.00, 8.00, 7.00, 75.00, 61);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311125', '林佳琰', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 5.00, 4.00, 13.00, 4.00, 7.80, 7.70, 7.00, 78.50, 62);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311129', '徐刚', 3.50, 4.00, 4.00, 7.50, 2.50, 6.00, 3.00, 3.00, 10.00, 3.00, 6.50, 6.50, 6.50, 66.00, 63);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311130', '申博文', 4.00, 4.00, 5.00, 9.00, 5.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.50, 8.50, 9.00, 86.00, 64);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311133', '查自强', 4.00, 4.00, 4.00, 8.00, 4.00, 7.00, 4.00, 4.00, 11.00, 3.00, 7.00, 8.00, 7.00, 75.00, 65);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311143', '郑安贤', 4.00, 4.00, 3.00, 8.00, 4.00, 7.00, 4.00, 3.00, 12.00, 3.00, 7.70, 7.70, 7.50, 74.90, 66);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311144', '袁雪芹', 4.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.20, 8.10, 8.10, 81.40, 67);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311147', '尹含磊', 3.00, 4.00, 3.00, 8.00, 4.00, 4.00, 4.00, 3.00, 10.00, 3.00, 7.00, 7.00, 6.00, 66.00, 68);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311148', '马杰', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 3.00, 3.00, 12.00, 2.00, 6.80, 7.00, 6.80, 70.60, 69);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311153', '陈露健', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 3.50, 3.50, 12.00, 4.00, 7.80, 8.00, 8.00, 78.80, 70);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311155', '王兆瑞', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 12.00, 3.00, 7.70, 8.00, 7.70, 81.40, 71);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311156', '黄恩浩', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.40, 8.40, 8.40, 81.20, 72);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311157', '刘杰寅', 5.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 8.00, 83.00, 73);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311163', '左雪婷', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 3.00, 10.00, 3.00, 7.70, 7.70, 6.70, 75.10, 74);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311165', '李源', 5.00, 5.00, 5.00, 8.00, 4.00, 7.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 9.00, 84.00, 75);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311166', '储锐', 3.50, 3.50, 3.50, 7.00, 3.50, 7.00, 4.00, 4.00, 11.00, 4.00, 6.00, 6.00, 6.00, 69.00, 76);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311167', '胡静雨', 5.00, 5.00, 5.00, 9.00, 5.00, 10.00, 5.00, 4.00, 14.00, 4.00, 9.00, 9.00, 9.00, 93.00, 77);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311183', '王建鑫', 4.00, 5.00, 5.00, 9.00, 4.00, 9.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 84.00, 78);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311186', '杨笑成', 3.00, 4.00, 4.00, 7.00, 3.00, 7.00, 4.00, 4.00, 9.00, 4.00, 8.00, 8.00, 7.00, 72.00, 79);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311187', '唐煜', 4.00, 5.00, 4.00, 8.50, 5.00, 9.00, 4.00, 4.00, 13.00, 4.00, 9.00, 9.00, 8.00, 86.50, 80);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311188', '秦振霄', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 9.00, 83.00, 81);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311189', '李闯', 4.00, 5.00, 5.00, 8.00, 4.00, 9.00, 4.00, 4.00, 15.00, 5.00, 9.00, 9.00, 8.00, 89.00, 82);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311190', '陆锦晖', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 3.50, 3.50, 10.50, 3.50, 7.45, 7.60, 7.60, 75.65, 83);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311196', '张子君', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 9.00, 8.00, 8.00, 85.00, 84);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311198', '刘志丹', 4.50, 4.50, 4.50, 9.00, 4.50, 8.00, 5.00, 4.00, 13.00, 4.00, 9.00, 8.50, 8.50, 87.00, 85);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311201', '施天琦', 5.00, 5.00, 5.00, 9.00, 4.00, 9.00, 4.00, 4.00, 14.00, 5.00, 9.00, 9.00, 9.00, 91.00, 86);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311214', '周安顺', 4.00, 3.50, 3.50, 7.50, 3.00, 7.00, 4.00, 3.00, 12.00, 4.00, 8.00, 7.30, 7.00, 73.80, 87);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311216', '徐欣依', 4.00, 4.00, 4.50, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 3.00, 8.50, 8.20, 8.25, 82.45, 88);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311218', '张伊凡', 4.50, 4.50, 4.50, 8.00, 4.50, 8.00, 4.00, 4.00, 13.00, 4.00, 8.50, 8.50, 8.70, 84.70, 89);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311219', '冯源', 5.00, 5.00, 5.00, 9.00, 5.00, 9.00, 4.00, 4.00, 13.00, 4.00, 9.00, 8.00, 8.00, 88.00, 90);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311222', '黄李阳', 4.00, 5.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.67, 8.00, 8.00, 82.67, 91);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311224', '焦淑娜', 4.50, 4.50, 4.50, 8.50, 4.60, 8.50, 5.00, 4.00, 13.00, 4.00, 8.30, 8.70, 8.90, 87.00, 92);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311225', '凡涛', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 80.00, 93);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311226', '王博元', 4.00, 4.00, 4.00, 9.00, 5.00, 9.00, 4.00, 4.00, 14.00, 4.00, 9.00, 8.00, 8.00, 86.00, 94);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311227', '郑翀', 5.00, 5.00, 4.00, 9.00, 4.00, 8.00, 3.00, 4.00, 14.00, 4.00, 8.00, 8.00, 8.00, 84.00, 95);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311228', '董文一', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 11.00, 4.00, 8.00, 7.00, 8.00, 76.00, 96);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311231', '周兴', 5.00, 5.00, 5.00, 8.00, 5.00, 7.00, 4.50, 4.50, 13.00, 4.00, 8.50, 8.50, 8.70, 86.70, 97);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311232', '占锦明', 5.00, 5.00, 4.00, 9.00, 4.00, 9.00, 4.50, 4.00, 13.00, 4.00, 8.15, 8.00, 8.00, 85.65, 98);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311234', '孙嘉珩', 4.00, 4.00, 4.00, 8.00, 5.00, 7.00, 3.00, 3.00, 12.00, 4.00, 7.80, 7.70, 7.70, 77.20, 99);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311235', '杨景优', 4.00, 4.00, 3.50, 8.00, 3.00, 8.00, 4.00, 3.00, 13.00, 4.00, 6.50, 6.60, 6.70, 74.30, 100);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311239', '王薪程', 5.00, 4.00, 5.00, 9.00, 5.00, 9.00, 5.00, 5.00, 13.00, 4.00, 9.00, 9.00, 9.00, 91.00, 101);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311241', '金恺文', 3.00, 3.00, 3.00, 7.00, 3.00, 7.00, 3.00, 3.00, 10.00, 3.00, 6.70, 6.70, 6.40, 64.80, 102);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311246', '贺雪', 4.00, 4.00, 5.00, 9.00, 4.00, 9.00, 4.00, 4.00, 12.00, 3.00, 8.00, 7.85, 7.90, 81.75, 103);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311249', '王彦淇', 3.50, 3.50, 4.00, 7.00, 4.00, 7.00, 3.00, 4.00, 12.00, 2.00, 6.80, 7.20, 7.30, 71.30, 104);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311251', '徐凌霄', 4.00, 3.00, 4.00, 6.00, 3.00, 6.00, 3.00, 3.00, 9.00, 3.00, 6.00, 6.00, 6.00, 62.00, 105);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311253', '奚好晨', 4.00, 4.00, 3.00, 8.00, 4.00, 7.00, 4.00, 3.00, 12.00, 3.00, 7.40, 8.00, 7.70, 75.10, 106);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311254', '王怡清', 5.00, 4.00, 4.00, 9.00, 5.00, 9.00, 4.00, 4.00, 12.00, 4.00, 7.80, 7.50, 7.40, 82.70, 107);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311256', '叶逸铭', 5.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 14.00, 4.00, 9.00, 8.00, 9.00, 87.00, 108);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610311265', '陈波', 5.00, 5.00, 5.00, 9.00, 5.00, 9.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 86.00, 109);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610320028', '唐文千', 5.00, 5.00, 5.00, 8.00, 5.00, 7.00, 3.00, 4.00, 13.00, 4.00, 7.70, 7.70, 7.60, 82.00, 110);
INSERT INTO `gdesign` VALUES ('2019-2020-1', 'XX127130', '01', '201610733071', '刘娅', 5.00, 5.00, 5.00, 8.00, 5.00, 7.00, 5.00, 4.00, 12.00, 3.00, 7.70, 8.00, 7.80, 82.50, 111);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201510121066', '冯盛', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 3.00, 10.00, 4.00, 7.70, 8.20, 8.20, 77.00, 112);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201510121124', '杜中洲', 5.00, 3.00, 3.00, 7.00, 4.00, 8.00, 4.00, 3.00, 11.00, 3.00, 8.00, 8.00, 6.00, 73.00, 113);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201510311045', '俞子俊', 5.00, 5.00, 4.00, 8.00, 5.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.70, 8.70, 8.30, 87.00, 114);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201510311165', '陈佳伟', 4.00, 4.00, 4.00, 8.00, 4.00, 6.00, 3.00, 3.00, 10.00, 3.00, 7.30, 7.30, 7.00, 71.00, 115);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201510730056', '王伟', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 13.00, 3.00, 8.00, 7.70, 8.00, 81.00, 116);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710121222', '付家栋', 5.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 14.00, 4.00, 8.90, 8.90, 9.00, 87.00, 117);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311001', '何弋帆', 4.00, 4.00, 4.00, 8.00, 5.00, 10.00, 5.00, 4.00, 13.00, 5.00, 8.40, 7.60, 7.60, 86.00, 118);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311009', '朱心蕊', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 3.00, 12.00, 3.00, 7.40, 7.50, 7.50, 74.00, 119);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311011', '刘云丽', 5.00, 4.00, 5.00, 9.00, 5.00, 9.00, 4.00, 4.00, 14.00, 4.00, 9.00, 10.00, 9.00, 91.00, 120);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311012', '寇嘉颖', 5.00, 4.00, 5.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.20, 8.00, 83.00, 121);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311014', '张若男', 5.00, 5.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 9.00, 3.00, 7.50, 7.40, 7.50, 74.00, 122);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311015', '陈颖', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 5.00, 4.00, 12.00, 4.00, 9.00, 8.00, 8.00, 84.00, 123);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311017', '陈人丘', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 3.50, 3.50, 12.00, 3.80, 7.30, 7.70, 7.60, 75.00, 124);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311020', '宗赟', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 81.00, 125);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311022', '陈川源', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 81.00, 126);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311024', '钱思璇', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 8.00, 81.00, 127);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311025', '徐逸凡', 5.00, 5.00, 4.00, 8.00, 4.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.70, 8.70, 8.40, 86.00, 128);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311026', '奚铮杰', 5.00, 5.00, 4.00, 8.00, 5.00, 7.00, 4.20, 4.20, 13.00, 4.00, 7.80, 8.10, 8.10, 83.00, 129);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311027', '彭诚颢', 4.00, 5.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 8.50, 8.20, 8.20, 85.00, 130);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311028', '张栩', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 3.50, 3.50, 10.50, 3.50, 7.00, 7.50, 7.50, 75.00, 131);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311033', '黄美琳', 3.00, 3.00, 3.00, 7.00, 3.00, 7.00, 3.00, 4.00, 9.00, 3.00, 6.25, 6.75, 6.25, 64.00, 132);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311037', '陈思哲', 3.00, 4.00, 3.00, 8.00, 3.00, 7.00, 4.00, 4.00, 10.50, 4.00, 7.30, 7.40, 7.40, 73.00, 133);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311045', '施旸昱', 4.00, 5.00, 5.00, 9.00, 5.00, 10.00, 4.00, 4.00, 12.00, 4.00, 8.70, 8.80, 8.80, 88.00, 134);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311052', '蔡硕', 4.50, 4.00, 4.00, 8.50, 4.50, 8.50, 4.00, 4.00, 11.00, 4.00, 8.00, 8.00, 8.00, 81.00, 135);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311055', '李嘉祺', 3.90, 3.90, 3.90, 7.90, 4.30, 7.90, 4.00, 4.00, 10.00, 3.00, 7.00, 7.00, 7.00, 74.00, 136);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311061', '修亚辉', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 8.00, 83.00, 137);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311064', '高婧贤', 5.00, 5.00, 4.00, 9.00, 5.00, 9.00, 5.00, 4.00, 14.00, 5.00, 9.80, 9.60, 9.60, 94.00, 138);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311070', '邱芷蕙', 3.00, 3.00, 4.00, 8.00, 4.00, 8.00, 3.50, 4.00, 11.00, 3.50, 7.25, 7.25, 7.25, 74.00, 139);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311072', '周彦勇', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 81.00, 140);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311074', '乔若晨', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.50, 13.00, 4.50, 8.33, 8.50, 8.33, 83.00, 141);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311075', '周翱天', 5.00, 4.00, 5.00, 9.00, 5.00, 9.00, 5.00, 4.00, 15.00, 4.00, 9.00, 9.00, 9.00, 92.00, 142);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311077', '管俊洋', 5.00, 5.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 3.00, 8.00, 8.00, 8.00, 83.00, 143);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311083', '周明澍', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 80.00, 144);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311085', '庞张灯', 4.00, 5.00, 5.00, 8.00, 5.00, 9.00, 4.50, 4.50, 13.00, 4.00, 8.90, 8.90, 8.80, 89.00, 145);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311088', '王峥', 4.00, 4.00, 4.00, 7.00, 3.00, 7.00, 5.00, 4.00, 10.00, 4.00, 8.00, 8.00, 7.00, 75.00, 146);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311092', '谢甜', 5.00, 4.00, 4.00, 6.00, 4.00, 6.00, 4.00, 4.00, 12.00, 3.00, 7.50, 7.20, 7.30, 74.00, 147);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311093', '忻伟琦', 5.00, 4.00, 4.00, 9.00, 5.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.30, 8.30, 8.30, 86.00, 148);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311097', '盛昌', 4.00, 4.00, 4.00, 8.00, 4.00, 9.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 81.00, 149);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311100', '高铤', 4.00, 4.00, 4.00, 8.00, 5.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.50, 8.50, 8.30, 84.00, 150);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311101', '江文全', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 5.00, 4.00, 13.00, 4.00, 8.80, 8.90, 9.10, 85.00, 151);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311106', '何玉娜', 3.90, 3.90, 3.90, 7.90, 4.20, 7.90, 4.00, 4.00, 11.00, 3.00, 7.20, 7.20, 7.60, 76.00, 152);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311108', '严祥军', 4.50, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 10.00, 3.00, 9.00, 8.00, 8.00, 81.00, 153);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311111', '毛竹', 5.00, 5.00, 4.00, 8.00, 5.00, 8.00, 4.40, 4.40, 12.50, 4.40, 7.80, 8.10, 8.10, 85.00, 154);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311114', '赵继云', 5.00, 4.00, 4.00, 8.00, 5.00, 5.00, 3.70, 3.60, 11.10, 3.50, 7.20, 7.20, 7.30, 75.00, 155);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311115', '冯佳琪', 4.00, 4.00, 5.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 82.00, 156);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311116', '王自阳', 4.50, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 14.00, 4.00, 8.40, 8.60, 8.40, 86.00, 157);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311118', '冯雪玲', 4.80, 4.20, 4.20, 9.00, 4.30, 9.00, 4.50, 4.50, 13.00, 4.00, 8.80, 8.80, 8.80, 88.00, 158);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311119', '陈冬珏', 5.00, 4.00, 5.00, 8.00, 4.00, 8.50, 4.00, 4.00, 12.00, 4.00, 8.60, 8.50, 8.60, 84.00, 159);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311121', '尤闻涛', 3.00, 3.00, 3.00, 7.00, 3.00, 6.00, 3.00, 3.00, 10.00, 3.00, 6.40, 6.40, 6.30, 63.00, 160);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311122', '张海婷', 4.00, 4.00, 4.50, 8.50, 4.00, 8.00, 4.00, 4.00, 12.00, 3.00, 8.10, 8.00, 8.00, 80.00, 161);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311123', '顾佳琪', 4.50, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 14.00, 4.00, 8.50, 8.50, 9.00, 87.00, 162);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311127', '华怡芃', 4.50, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 14.00, 4.00, 8.50, 8.50, 9.00, 87.00, 163);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311128', '杨博文', 5.00, 4.50, 4.50, 8.50, 4.50, 8.00, 4.00, 4.00, 12.00, 4.00, 8.20, 8.30, 8.30, 84.00, 164);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311130', '叶佳磊', 5.00, 4.00, 4.00, 8.00, 5.00, 5.00, 3.70, 3.70, 11.00, 3.70, 7.40, 7.10, 7.10, 75.00, 165);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311140', '于霖', 5.00, 5.00, 5.00, 8.00, 4.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.20, 8.10, 8.10, 85.00, 166);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311142', '朱佳威', 5.00, 4.00, 4.00, 8.00, 4.00, 6.00, 4.00, 4.00, 12.00, 3.00, 8.00, 7.00, 8.00, 77.00, 167);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311143', '贾世正', 4.00, 4.00, 4.00, 9.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 9.00, 9.00, 84.00, 168);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311148', '刘依依', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 8.00, 8.00, 81.00, 169);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311150', '钮莹莹', 5.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 13.00, 3.00, 7.70, 7.30, 7.70, 78.00, 170);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311151', '吴亦飞', 4.50, 4.50, 4.50, 8.50, 4.50, 8.50, 4.00, 4.00, 13.00, 4.00, 8.00, 8.50, 8.50, 85.00, 171);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311152', '陈忠青', 4.00, 4.00, 5.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 82.00, 172);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311155', '余荔恒', 5.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 9.00, 83.00, 173);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311157', '高亚鹏', 5.00, 5.00, 5.00, 9.00, 5.00, 9.00, 5.00, 4.00, 14.00, 4.00, 9.00, 10.00, 9.00, 93.00, 174);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311159', '赵燕雯', 5.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 13.00, 3.00, 8.00, 8.00, 8.00, 82.00, 175);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311164', '周睛集', 5.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.20, 7.70, 8.20, 82.00, 176);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311174', '彭燕玲', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 80.00, 177);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311176', '杨金坡', 4.50, 4.50, 4.50, 8.90, 4.40, 8.90, 4.00, 5.00, 11.00, 4.00, 8.30, 8.30, 8.30, 85.00, 178);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311178', '金江林', 5.00, 5.00, 5.00, 8.00, 5.00, 8.00, 4.00, 5.00, 13.00, 4.00, 8.90, 8.90, 8.90, 89.00, 179);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311181', '吴凡', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.20, 12.00, 4.30, 8.00, 8.10, 8.40, 83.00, 180);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311183', '贾岳欣', 5.00, 4.00, 5.00, 8.00, 5.00, 7.00, 5.00, 4.00, 13.00, 4.00, 7.10, 7.80, 7.50, 82.00, 181);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311184', '陈奉天', 5.00, 5.00, 5.00, 8.00, 5.00, 8.00, 5.00, 4.00, 12.00, 4.00, 8.30, 8.00, 7.80, 85.00, 182);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311185', '曲莫沙子', 3.00, 3.00, 3.00, 7.00, 3.00, 6.00, 3.00, 3.00, 9.20, 4.00, 6.20, 6.50, 6.30, 63.00, 183);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311190', '楼玲妃', 4.00, 5.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 7.80, 7.70, 7.70, 81.00, 184);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311191', '黄超', 5.00, 4.00, 4.00, 8.00, 5.00, 10.00, 5.00, 4.00, 13.00, 4.00, 8.00, 8.00, 7.60, 86.00, 185);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311193', '陈文岩', 4.00, 4.00, 4.00, 8.00, 4.00, 7.00, 4.00, 4.00, 14.00, 4.00, 7.70, 7.80, 8.10, 81.00, 186);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311194', '钟昱祺', 5.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 7.90, 7.90, 8.00, 82.00, 187);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311196', '钱多', 3.50, 3.50, 4.00, 7.50, 4.00, 7.50, 4.00, 3.00, 12.00, 3.00, 7.00, 7.00, 7.00, 73.00, 188);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311197', '徐天赐', 4.00, 4.00, 4.00, 7.00, 4.00, 7.00, 4.00, 4.00, 11.00, 4.00, 7.80, 7.70, 7.50, 76.00, 189);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311199', '张书楷', 4.00, 4.00, 3.00, 7.00, 3.00, 7.00, 4.00, 4.00, 11.00, 4.00, 7.70, 7.70, 8.00, 74.00, 190);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311207', '王萱仪', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 9.00, 83.00, 191);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311210', '李钰林', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 80.00, 192);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311211', '褚熠阳', 3.00, 3.00, 4.00, 8.00, 3.00, 8.00, 4.00, 3.50, 10.50, 4.00, 7.20, 7.50, 7.30, 73.00, 193);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311215', '刘畅', 5.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.70, 8.90, 8.90, 86.00, 194);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311222', '沈康文', 5.00, 4.00, 5.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 7.70, 8.10, 8.10, 83.00, 195);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311223', '方真', 4.00, 4.00, 4.00, 9.00, 4.00, 8.00, 4.00, 3.00, 11.00, 3.00, 8.00, 7.90, 7.50, 77.00, 196);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311226', '王梓同', 5.00, 4.00, 5.00, 9.00, 5.00, 9.00, 4.00, 4.00, 10.00, 4.00, 9.00, 8.50, 8.60, 85.00, 197);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311227', '曹杰', 3.00, 3.00, 3.50, 7.00, 3.00, 6.00, 3.00, 3.00, 10.00, 3.00, 7.30, 7.40, 7.20, 66.00, 198);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311229', '傅成', 4.00, 5.00, 4.00, 8.00, 4.00, 7.00, 4.00, 3.00, 9.00, 3.00, 8.00, 7.00, 8.00, 74.00, 199);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311230', '顾卓成', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 200);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311231', '康宇佳', 5.00, 5.00, 5.00, 9.00, 4.00, 9.00, 3.00, 4.00, 10.00, 3.00, 8.00, 8.50, 7.50, 81.00, 201);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311232', '罗鹏晖', 5.00, 4.00, 5.00, 9.00, 4.00, 9.00, 4.00, 4.00, 8.00, 3.00, 8.00, 7.50, 7.50, 78.00, 202);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311233', '杨春泉', 4.00, 4.50, 4.00, 8.50, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 8.00, 81.00, 203);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311235', '唐芮琪', 4.60, 4.50, 4.50, 9.00, 4.00, 8.00, 5.00, 4.00, 13.00, 4.00, 8.50, 9.00, 8.60, 87.00, 204);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311237', '龚一然', 5.00, 4.00, 4.00, 8.00, 5.00, 7.00, 4.40, 4.50, 12.80, 4.40, 8.10, 8.10, 8.10, 83.00, 205);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311241', '李佳骏', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 14.00, 4.50, 9.00, 8.00, 8.00, 84.00, 206);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311242', '李兴业', 4.00, 4.00, 5.00, 8.00, 4.00, 8.00, 4.00, 4.50, 13.00, 4.50, 8.25, 8.50, 8.25, 84.00, 207);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311243', '李颜言', 5.00, 5.00, 4.00, 8.00, 4.00, 8.00, 5.00, 5.00, 12.00, 4.00, 8.60, 8.40, 8.10, 85.00, 208);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311245', '胡炳', 5.00, 5.00, 4.00, 8.00, 5.00, 8.00, 4.40, 4.40, 12.40, 4.40, 7.80, 8.10, 8.10, 85.00, 209);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311249', '金怡', 5.00, 4.00, 5.00, 8.00, 4.00, 8.00, 4.00, 4.00, 13.00, 4.00, 8.00, 9.00, 9.00, 85.00, 210);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311256', '徐越', 4.00, 5.00, 4.00, 9.00, 4.00, 9.00, 4.00, 4.00, 13.00, 4.00, 8.25, 8.25, 8.50, 85.00, 211);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311257', '汪宇', 4.00, 4.00, 4.00, 8.00, 4.00, 8.00, 4.00, 4.00, 12.00, 4.00, 8.00, 8.00, 9.00, 81.00, 212);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311258', '李琦涛', 4.00, 4.00, 4.00, 8.50, 4.00, 8.50, 4.00, 5.00, 12.00, 4.00, 8.25, 8.50, 8.25, 83.00, 213);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710311265', '何李杰', 4.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 9.00, 8.00, 8.00, 82.00, 214);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710320023', '樊润泽', 5.00, 5.00, 5.00, 9.00, 5.00, 9.00, 5.00, 5.00, 14.00, 5.00, 9.90, 9.80, 9.80, 97.00, 215);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710320168', '刘佳祺', 4.00, 4.00, 4.00, 9.00, 4.00, 9.00, 5.00, 5.00, 12.00, 4.00, 9.00, 8.00, 8.00, 85.00, 216);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710413007', '戚华菁', 4.00, 4.00, 3.00, 7.00, 4.00, 8.00, 4.00, 3.00, 11.00, 4.00, 7.60, 7.80, 7.50, 75.00, 217);
INSERT INTO `gdesign` VALUES ('2020-2021-1', 'XX127130', '01', '201710414002', '杨毅铭', 4.00, 4.00, 4.00, 8.00, 5.00, 8.00, 4.00, 4.00, 12.00, 4.00, 9.00, 8.00, 8.00, 82.00, 218);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卷面评分项',
  `item_value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评分项分值',
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 一门课一种计算方法',
  `part` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '对应期末模块的?部分',
  PRIMARY KEY (`item_name`, `cid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('大题五', '28', 'XX110110', '卷面');
INSERT INTO `item` VALUES ('大题四', '32', 'XX110110', '卷面');
INSERT INTO `item` VALUES ('大题三', '15', 'XX110110', '卷面');
INSERT INTO `item` VALUES ('大题二', '15', 'XX110110', '卷面');
INSERT INTO `item` VALUES ('大题一', '10', 'XX110110', '卷面');
INSERT INTO `item` VALUES ('程序P1+P2', '15', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('报告R1+R2', '10', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('程序P3+ P4', '20', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('报告R3+R4', '10', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('测试题', '20', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('程序P5+ P6', '15', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('报告R5+R6', '10', 'XX110110s', '程序和报告');
INSERT INTO `item` VALUES ('大题一', '24', 'XX110240', '卷面考试');
INSERT INTO `item` VALUES ('大题二', '16', 'XX110240', '卷面考试');
INSERT INTO `item` VALUES ('大题三', '36', 'XX110240', '卷面考试');
INSERT INTO `item` VALUES ('大题四', '24', 'XX110240', '卷面考试');

-- ----------------------------
-- Table structure for part
-- ----------------------------
DROP TABLE IF EXISTS `part`;
CREATE TABLE `part`  (
  `part` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平时成绩模块组成部分',
  `ratio` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '比例',
  `cid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '一门课有一种计算平时分组成的算法',
  `module_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`part`, `cid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of part
-- ----------------------------
INSERT INTO `part` VALUES ('卷面', '70', 'XX110110', '期末');
INSERT INTO `part` VALUES ('作业2', '3', 'XX110110', '平时');
INSERT INTO `part` VALUES ('作业1', '12', 'XX110110', '平时');
INSERT INTO `part` VALUES ('课堂表现', '8', 'XX110110', '平时');
INSERT INTO `part` VALUES ('考勤', '7', 'XX110110', '平时');
INSERT INTO `part` VALUES ('程序和报告', '100', 'XX110110s', '实验');
INSERT INTO `part` VALUES ('考勤', '5', 'XX110240', '平时');
INSERT INTO `part` VALUES ('课堂表现', '10', 'XX110240', '平时');
INSERT INTO `part` VALUES ('1-4章作业', '5', 'XX110240', '平时');
INSERT INTO `part` VALUES ('5-7章作业', '10', 'XX110240', '平时');
INSERT INTO `part` VALUES ('卷面考试', '70', 'XX110240', '期末');

-- ----------------------------
-- Table structure for procedure_standard
-- ----------------------------
DROP TABLE IF EXISTS `procedure_standard`;
CREATE TABLE `procedure_standard`  (
  `course_type` int(11) NOT NULL,
  `standard` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`course_type`, `standard`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of procedure_standard
-- ----------------------------
INSERT INTO `procedure_standard` VALUES (0, 'AB卷是否不雷同，且难度相同、题量相当');
INSERT INTO `procedure_standard` VALUES (0, '与上一届试卷的重复度是否低于30%');
INSERT INTO `procedure_standard` VALUES (0, '命题内容是否符合课程大纲');
INSERT INTO `procedure_standard` VALUES (0, '命题难度是否符合教学实际');
INSERT INTO `procedure_standard` VALUES (0, '题型结构是否符合多样化要求');
INSERT INTO `procedure_standard` VALUES (0, '题意123是否规范');
INSERT INTO `procedure_standard` VALUES (0, '题意、用词、符号、图形是否规范');
INSERT INTO `procedure_standard` VALUES (0, '题量是否符合考核时间要求');

-- ----------------------------
-- Table structure for study_goal
-- ----------------------------
DROP TABLE IF EXISTS `study_goal`;
CREATE TABLE `study_goal`  (
  `course_goal_id` int(20) NOT NULL COMMENT '课程目标号',
  `cid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程号',
  `graduate_require` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支撑毕业指标点',
  `eva_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '观测点',
  `total_score` float(20, 2) DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`course_goal_id`, `cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_goal
-- ----------------------------
INSERT INTO `study_goal` VALUES (0, 'XX110110', '2.4', '考勤,卷面：[大题一,大题二,大题三]', 35.00);
INSERT INTO `study_goal` VALUES (0, 'XX110110s', '8.3', '程序和报告：[程序P1+P2,报告R1+R2]', 25.00);
INSERT INTO `study_goal` VALUES (0, 'XX110240', '1.1', '考勤,卷面考试：[大题一]', 21.80);
INSERT INTO `study_goal` VALUES (1, 'XX110110', '3.3', '课堂表现,作业1', 20.00);
INSERT INTO `study_goal` VALUES (1, 'XX110110s', '4.2', '程序和报告：[程序P3+ P4,报告R3+R4,测试题]', 50.00);
INSERT INTO `study_goal` VALUES (1, 'XX110240', '2.1', '卷面考试：[大题二]', 11.20);
INSERT INTO `study_goal` VALUES (2, 'XX110110', '4.2', '卷面：[大题四]', 22.40);
INSERT INTO `study_goal` VALUES (2, 'XX110110s', '5.2', '程序和报告：[程序P5+ P6,报告R5+R6]', 25.00);
INSERT INTO `study_goal` VALUES (2, 'XX110240', '2.2', '课堂表现,1-4章作业,卷面考试：[大题三]', 40.20);
INSERT INTO `study_goal` VALUES (3, 'XX110110', '5.3', '卷面：[大题五],作业2', 22.60);
INSERT INTO `study_goal` VALUES (3, 'XX110240', '2.4', '5-7章作业,卷面考试：[大题四]', 26.80);

SET FOREIGN_KEY_CHECKS = 1;
