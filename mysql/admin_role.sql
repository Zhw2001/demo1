/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : webtry

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2022-01-20 14:46:46
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
  `admin_authority_ids` longtext COLLATE utf8_unicode_ci COMMENT '角色权限id列表',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_timestamp` bigint(50) DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('1000000', 'super admin', 'super admin', 'Jh8z1f7yt,nGyHv8SMz,HtqdfZid0,fkXCvFOth,zJfUPY51P,r-tDtqr94,HkgJdDzEm,vljPAaWsL,wamK-ehtL,C3WtKzxS_,klUA63clP,YaLP9BQoz,m9a-NQsky,PUDwKVudl,orz0bQnAV,FWJS6cW_t,XFLI-Xiu9,rc8PyN-7e,FLcVmwUGf,vAlRwG42i,Aj46PocjE,NgMPyBTyt,hKNBbz3Id,7H5NYaABj,2tQfFmmDr,huW07hjGn,51F3xJ4YB,WCfpKOn6q,37xmomJUP,rK9yps5-n,IIjFU1b32,e1AenAQGh,KE5weIvJm,nImMMukuO,m60NSV9Uf,uNcakD-iu,PrlXMUprO,DD7uvMFqf,tpm47b-0g,U2Q9FyWqT,LV2W44Iea,SpJ9AeDIP,sL8GD5TNz,yG6HFsIaE,JFqDhmDlD,glXE-ZYMj,zrjH_hLgq,n47GLlyLh,hDzP4R-nh,8narmMp7Z,diWnCwOeO,xlhPC3Ca3,13ZrguVlC,bjrc297SQ,e7yBRAOsE,QOLvuDGrg,EJB_mpFOS,FH-mt55wt,MopXJpRWJ,yzTgrYRj1,rti2yTBeF,TCYdHQC8-,UKpCTczAb,eHn4RPta9,ng65zQpLN,yqKdT3eG4,nZmLbdb6r,phmbmxXQY,uArCKa7pn,eBoyfUCzY,pfbbT36eD,IrmOY2diJ,UfCwfriT8,UHPBS0djA,Ir45yOfTU', '2022-01-10 15:09:48', '1641798588');
INSERT INTO `admin_role` VALUES ('1000001', '测试', '测试', '_ts1BARKd,3ZA_ASSKM,IrmOY2diJ,UfCwfriT8,UHPBS0djA,Ir45yOfTU,tgl3FHTn4,_rTCS6yE0,XkKYXZL-h,qJ6bkT_HO', '2022-01-18 14:50:05', '1642488605');
