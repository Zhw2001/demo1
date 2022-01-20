/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-20 14:46:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_authority`
-- ----------------------------
DROP TABLE IF EXISTS `admin_authority`;
CREATE TABLE `admin_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `authority_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限ID',
  `authority_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限名字',
  `authority_type` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限类型',
  `authority_parent_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限父ID',
  `authority_parent_name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父权限名字',
  `authority_url` char(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限树的连接路径',
  `authority_sort` int(20) DEFAULT NULL COMMENT '权限树的排序',
  `authority_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限描述',
  `enable` tinyint(1) DEFAULT NULL COMMENT '是否可以显示',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_timestamp` bigint(50) DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_authority
-- ----------------------------
INSERT INTO `admin_authority` VALUES ('1', 'AaZjGoX4K', '文章管理', '1', '', '', 'article_mange', '1', '文章管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('2', 'M5_VrV7vx', '文章汇总', '1', 'AaZjGoX4K', '文章管理', 'article', '0', 'dasddasd', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('3', 'Jh8z1f7yt', '获取文章列表', '2', 'M5_VrV7vx', '文章汇总', '/article/list', '5', '查看文章列表的权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('4', 'nGyHv8SMz', '更新文章', '2', 'M5_VrV7vx', '文章汇总', '/article/edit', '1', '修改文章的一些字段', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('5', 'HtqdfZid0', '删除文章', '2', 'M5_VrV7vx', '文章汇总', '/article/delete', '2', '删除文章的权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('6', 'QZuaQAqRs', '文章标签', '1', 'AaZjGoX4K', '文章管理', 'article_tag', '1', '文章的标签栏修改', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('7', 'fkXCvFOth', '获取文章标签列表', '2', 'QZuaQAqRs', '文章标签', '/article-tag/list', '0', '获取文章所有的标签列表，并且分页', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('8', 'zJfUPY51P', '创建文章标签', '2', 'QZuaQAqRs', '文章标签', '/article-tag/create', '1', '创建文章标签', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('9', 'r-tDtqr94', '更新文章标签', '2', 'QZuaQAqRs', '文章标签', '/article-tag/update', '2', '更新文章标签', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('10', 'HkgJdDzEm', '删除文章标签', '2', 'QZuaQAqRs', '文章标签', '/article-tag/delete', '3', '删除文章标签', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('11', 'wFaa7X0k-', '文章专栏', '1', 'AaZjGoX4K', '文章管理', 'article_column', '2', '文章专栏', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('12', 'vljPAaWsL', '获取文章专栏列表', '2', 'wFaa7X0k-', '文章专栏', '/article-column/list', '0', '获取文章专栏列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('13', 'wamK-ehtL', '创建文章专栏', '2', 'wFaa7X0k-', '文章专栏', '/article-column/create', '1', '创建文章专栏', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('14', 'C3WtKzxS_', '更新文章专栏', '2', 'wFaa7X0k-', '文章专栏', '/article-column/update', '2', '更新文章专栏', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('15', 'klUA63clP', '删除文章专栏', '2', 'wFaa7X0k-', '文章专栏', '/article-column/delete', '3', '删除文章专栏', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('16', 'f-_KRK5ZL', '用户管理', '1', '', '', 'user_manger', '1', '用户管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('17', 'lnRP0Lc5L', '用户', '1', 'f-_KRK5ZL', '用户管理', 'user', '0', '用户管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('18', 'YaLP9BQoz', '获取用户列表', '2', 'lnRP0Lc5L', '用户', '/user/list', '0', '获取用户列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('19', 'm9a-NQsky', '更新用户', '2', 'lnRP0Lc5L', '用户', '/user/edit', '1', '更新用户', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('20', 'PUDwKVudl', '删除用户', '2', 'lnRP0Lc5L', '用户', '/user/delete', '2', '删除用户', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('21', 'Fg5quebwd', '用户角色', '1', 'f-_KRK5ZL', '用户管理', 'user_role', '1', '用户角色', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('22', 'orz0bQnAV', '获取用户角色列表', '2', 'Fg5quebwd', '用户角色', '/user-role/list', '0', '获取用户角色列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('23', 'FWJS6cW_t', '创建用户角色', '2', 'Fg5quebwd', '用户角色', '/user-role/create', '1', '创建用户角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('24', 'XFLI-Xiu9', '获取全部用户角色', '2', 'Fg5quebwd', '用户角色', '/user-role/all', '2', '获取全部用户角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('25', 'rc8PyN-7e', '更新用户角色', '2', 'Fg5quebwd', '用户角色', '/user-role/update', '3', '更新用户角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('26', 'FLcVmwUGf', '删除用户角色', '2', 'Fg5quebwd', '用户角色', '/user-role/delete', '4', '删除用户角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('27', 'yoUnDy1tf', '评论管理', '1', 'f-_KRK5ZL', '用户管理', 'comment', '2', '文章评论管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('28', 'vAlRwG42i', '获取评论列表', '2', 'yoUnDy1tf', '评论管理', '/article-comment/list', '0', '获取评论列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('29', 'Aj46PocjE', '更新评论', '2', 'yoUnDy1tf', '评论管理', '/article-comment/update', '1', '更新评论', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('30', 'NgMPyBTyt', '删除评论', '2', 'yoUnDy1tf', '评论管理', '/article-comment/delete', '2', '删除评论', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('31', 'YKlhCT_Pq', '新闻管理', '1', '', '', 'news', '7', '新闻管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('32', 'T9-d0xqEp', '创建新闻', '1', 'YKlhCT_Pq', '新闻管理', 'createNew', '0', '创建新闻', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('33', 'cVzO4cmP7', '新闻汇总', '1', 'YKlhCT_Pq', '新闻管理', 'newsList', '1', '新闻汇总', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('34', '6uMXf6-Ns', 'EmailTemplate', '1', '', '', 'EmailTemplate', '8', 'EmailTemplate', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('35', '6To3LKkAJ', 'Template', '1', '6uMXf6-Ns', 'EmailTemplate', 'Template', '0', 'Template', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('36', '62EbYFQ4K', '网站管理', '1', '', '', 'web', '2', '网站管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('37', '5ZNcql-CR', 'JoinUs', '1', '62EbYFQ4K', '网站管理', 'JoinUs', '4', 'JoinUs', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('38', 'KqurnYC_e', 'beta', '1', '62EbYFQ4K', '网站管理', 'beta', '5', 'beta', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('39', 'Fg332SacC', '图库', '1', '62EbYFQ4K', '网站管理', 'picture', '1', '图库', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('40', 'hKNBbz3Id', '获取图片列表', '2', 'Fg332SacC', '图库', '/picture/list', '0', '获取图片列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('41', '7H5NYaABj', '上传图片', '2', 'Fg332SacC', '图库', '/picture/create', '1', '上传图片', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('42', '2tQfFmmDr', '更新图片', '2', 'Fg332SacC', '图库', '/picture/update', '2', '更新图片', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('43', 'huW07hjGn', '删除图片', '2', 'Fg332SacC', '图库', '/picture/delete', '3', '删除图片', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('44', 'mmnVfpVml', '系统管理', '1', '', '', 'admin', '3', '系统管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('45', 'jKF3lIYO0', '管理员管理', '1', 'mmnVfpVml', '系统管理', 'admin_user', '0', '管理员管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('46', '51F3xJ4YB', '获取管理员列表', '2', 'jKF3lIYO0', '管理员管理', '/admin-user/list', '0', '获取管理员列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('47', 'WCfpKOn6q', '创建管理员', '2', 'jKF3lIYO0', '管理员管理', '/admin-user/create', '1', '创建管理员', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('48', '37xmomJUP', '更新管理员', '2', 'jKF3lIYO0', '管理员管理', '/admin-user/edit', '2', '更新管理员', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('49', 'rK9yps5-n', '删除管理员', '2', 'jKF3lIYO0', '管理员管理', '/admin-user/delete', '3', '删除管理员', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('50', 'f__A7Zf22', '角色管理', '1', 'mmnVfpVml', '系统管理', 'admin_role', '1', '角色管理', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('51', 'IIjFU1b32', '获取角色列表', '2', 'f__A7Zf22', '角色管理', '/admin-role/list', '0', '获取角色列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('52', 'e1AenAQGh', '创建角色', '2', 'f__A7Zf22', '角色管理', '/admin-role/create', '1', '创建角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('53', 'KE5weIvJm', '更新角色', '2', 'f__A7Zf22', '角色管理', '/admin-role/edit', '2', '更新角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('54', 'nImMMukuO', '删除角色', '2', 'f__A7Zf22', '角色管理', '/admin-role/delete', '3', '删除角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('55', 'kl66VGwzs', '权限菜单', '1', 'mmnVfpVml', '系统管理', 'admin_authority', '2', '权限菜单', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('56', 'm60NSV9Uf', '获取所有权限菜单', '2', 'kl66VGwzs', '权限菜单', '/admin-authority/list', '0', '获取所有权限菜单', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('57', 'uNcakD-iu', '创建权限', '2', 'kl66VGwzs', '权限菜单', '/admin-authority/create', '1', '创建权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('58', 'PrlXMUprO', '更新权限', '2', 'kl66VGwzs', '权限菜单', '/admin-authority/update', '2', '更新权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('59', 'DD7uvMFqf', '删除权限', '2', 'kl66VGwzs', '权限菜单', '/admin-authority/delete', '3', '删除权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('60', 'EdU0eCL53', '系统配置', '1', 'mmnVfpVml', '系统管理', 'system_config', '3', '系统配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('61', 'tpm47b-0g', '查看系统配置', '2', 'EdU0eCL53', '系统配置', '/system-config/info', '0', '查看系统配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('62', 'U2Q9FyWqT', '更新系统配置', '2', 'EdU0eCL53', '系统配置', '/system-config/update', '1', '更新系统配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('63', 'F1-0EJhfj', '系统日志', '1', 'mmnVfpVml', '系统管理', 'admin_system_log', '4', '系统日志', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('64', 'LV2W44Iea', '获取系统日志列表', '2', 'F1-0EJhfj', '系统日志', '/admin-system-log/list', '0', '获取系统日志列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('65', 'SpJ9AeDIP', '删除系统日志', '2', 'F1-0EJhfj', '系统日志', '/admin-system-log/delete', '1', '删除系统日志', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('66', 'sL8GD5TNz', '获取全部文章标签', '2', 'QZuaQAqRs', '文章标签', '/article-tag/all', '4', '一次获取所有的文章标签', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('67', 'yG6HFsIaE', '获取全部角色', '2', 'f__A7Zf22', '角色管理', '/admin-role/all', '4', '一次性获取全部的管理员用户角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('68', 'BvTHaZGiy', '网站配置', '1', '62EbYFQ4K', '网站管理', 'website_config', '1', '网站配置公告等等', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('69', 'JFqDhmDlD', '创建网站配置', '2', 'BvTHaZGiy', '网站配置', '/options/create', '0', '创建网站配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('70', 'glXE-ZYMj', '更新网站配置', '2', 'BvTHaZGiy', '网站配置', '/options/update', '1', '更新网站配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('71', 'zrjH_hLgq', '删除网站配置', '2', 'BvTHaZGiy', '网站配置', '/options/delete', '2', '删除网站配置', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('72', 'n47GLlyLh', '获取网站配置项列表', '2', 'BvTHaZGiy', '网站配置', '/options/list', '3', '获取网站配置项列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('73', '8nzhEmgmS', '用户权限', '1', 'f-_KRK5ZL', '用户管理', 'user_authority', '3', '用户权限', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('74', 'hDzP4R-nh', '获取用户权限列表', '2', '8nzhEmgmS', '用户权限', '/user-authority/list', '0', '获取用户权限列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('75', '8narmMp7Z', '创建用户权限', '2', '8nzhEmgmS', '用户权限', '/user-authority/create', '1', '创建用户权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('76', 'diWnCwOeO', '更新用户权限', '2', '8nzhEmgmS', '用户权限', '/user-authority/update', '2', '更新用户权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('77', 'xlhPC3Ca3', '删除用户权限', '2', '8nzhEmgmS', '用户权限', '/user-authority/delete', '3', '删除用户权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('78', '13ZrguVlC', '设置用户角色权限', '2', '8nzhEmgmS', '用户权限', '/user-role-authority/set', '4', '设置用户角色权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('79', 'bjrc297SQ', '设置管理员角色', '2', 'jKF3lIYO0', '管理员管理', '/admin-user-role/create', '4', '设置管理员角色', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('80', 'e7yBRAOsE', '管理员角色设置权限', '2', 'f__A7Zf22', '角色管理', '/admin-role-authority/set', '5', '管理员角色设置权限', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('81', 'F2cVbkCIn', '用户头像审核', '1', 'f-_KRK5ZL', '用户管理', 'user_avatar_review', '4', '用户头像审核', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('82', 'QOLvuDGrg', '获取待审核头像列表', '2', 'F2cVbkCIn', '用户头像审核', '/user/avatar-review-list', '0', '获取待审核头像列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('83', 'EJB_mpFOS', '审核用户头像', '2', 'F2cVbkCIn', '用户头像审核', '/user/avatar-review-set', '1', '审核用户头像', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('84', 'FH-mt55wt', '禁言评论或文章', '2', 'lnRP0Lc5L', '用户', '/user/ban', '3', '禁言用户的评论或文章', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('85', 'xWIFibb79', '动态管理', '1', '', '', 'dynamic', '4', 'dynamic', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('86', 'iZA1hoZbJ', '动态话题', '1', 'xWIFibb79', '动态管理', 'dynamicTopic', '0', '动态话题', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('87', 'MopXJpRWJ', '查看所有动态话题', '2', 'iZA1hoZbJ', '动态话题', '/dynamic-topic/all', '0', '查看所有动态', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('88', 'yzTgrYRj1', '获取动态话题列表', '2', 'iZA1hoZbJ', '动态话题', '/dynamic-topic/list', '1', '获取动态话题列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('89', 'rti2yTBeF', '创建动态话题', '2', 'iZA1hoZbJ', '动态话题', '/dynamic-topic/create', '2', '创建动态话题', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('90', 'TCYdHQC8-', '更新动态话题', '2', 'iZA1hoZbJ', '动态话题', '/dynamic-topic/update', '3', '更新动态话题', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('91', 'UKpCTczAb', '删除动态话题', '2', 'iZA1hoZbJ', '动态话题', '/dynamic-topic/delete', '4', '删除动态话题', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('92', 'x2dKZeadJ', '动态汇总', '1', 'xWIFibb79', '动态管理', 'dynamics', '1', '动态汇总', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('93', 'eHn4RPta9', '动态列表', '2', 'x2dKZeadJ', '动态汇总', '/dynamic/list', '0', '动态列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('94', 'ng65zQpLN', '动态更新', '2', 'x2dKZeadJ', '动态汇总', '/dynamic/update', '1', '动态更新', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('95', 'yqKdT3eG4', '动态删除', '2', 'x2dKZeadJ', '动态汇总', '/dynamic/delete', '2', '动态删除', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('96', 'QlseovySJ', '动态评论', '1', 'xWIFibb79', '动态管理', 'dynamicComment', '2', '动态评论', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('97', 'nZmLbdb6r', '动态评论列表', '2', 'QlseovySJ', '动态评论', '/dynamic-comment/list', '0', '动态评论列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('98', 'phmbmxXQY', '动态评论更新', '2', 'QlseovySJ', '动态评论', '/dynamic-comment/update', '1', '动态评论更新', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('99', 'uArCKa7pn', '动态评论删除', '2', 'QlseovySJ', '动态评论', '/dynamic-comment/delete', '2', '动态评论删除', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('100', 'JBxkiGzwB', '个人专栏', '1', 'AaZjGoX4K', '文章管理', 'articleBlog', '4', '个人专栏', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('101', 'eBoyfUCzY', '获取个人专栏列表', '2', 'JBxkiGzwB', '个人专栏', '/article-blog/list', '0', '获取个人专栏列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('102', 'pfbbT36eD', '更新个人专栏', '2', 'JBxkiGzwB', '个人专栏', '/article-blog/update', '1', '更新个人专栏', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('103', 'cJUIxtPmM', '新闻管理', '1', '', '', 'news', '5', 'news', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('104', 'Ff8Y2PQOH', '创建新闻', '1', 'cJUIxtPmM', '新闻管理', 'createNew', '0', '创建新闻', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('105', '4pMp2JRiK', '新闻汇总', '1', 'cJUIxtPmM', '新闻管理', 'newsList', '1', '新闻汇总', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('106', '_ts1BARKd', 'Launcher', '1', '', '', 'launcher', '6', 'launcher', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('107', '3ZA_ASSKM', 'LauncherConfig', '1', '_ts1BARKd', 'Launcher', 'launcher_config', '0', 'launcher_config', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('108', 'IrmOY2diJ', '创建记录列表', '2', '3ZA_ASSKM', 'LauncherConfig', '/launcher/create', '0', '创建记录列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('109', 'UfCwfriT8', '获取记录列表', '2', '3ZA_ASSKM', 'LauncherConfig', '/launcher/list', '1', '获取记录列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('110', 'UHPBS0djA', '获取记录列表', '2', '3ZA_ASSKM', 'LauncherConfig', '/launcher/update', '2', '更新记录列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('111', 'Ir45yOfTU', '删除记录列表', '2', '3ZA_ASSKM', 'LauncherConfig', '/launcher/delete', '3', '删除记录列表', '0', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('112', 'tgl3FHTn4', 'LauncherTemplate', '1', '_ts1BARKd', 'Launcher', 'launcher_template', '1', 'launcher_template', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('113', '_rTCS6yE0', 'LauncherNotice', '1', '_ts1BARKd', 'Launcher', 'launcher_notice', '2', 'launcher_notice', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('114', 'XkKYXZL-h', 'LauncherProject', '1', '_ts1BARKd', 'Launcher', 'launcher_project', '3', 'launcher_project', '1', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_authority` VALUES ('115', 'qJ6bkT_HO', 'EnginesLogs', '1', '_ts1BARKd', 'Launcher', 'engines_logs', '4', 'engines_logs', '1', '2022-01-10 15:09:48', '1641798588');
