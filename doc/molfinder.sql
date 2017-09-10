/*
Navicat MySQL Data Transfer

Source Server         : jjp
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : molfinder

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-09-10 17:01:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_certification`
-- ----------------------------
DROP TABLE IF EXISTS `t_certification`;
CREATE TABLE `t_certification` (
  `certificate_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `certificate_type` varchar(10) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `guaranteen_material` varchar(100) DEFAULT NULL,
  `is_pass` varchar(10) DEFAULT '"CHECKING"',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`certificate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_certification
-- ----------------------------
INSERT INTO `t_certification` VALUES ('1', '2', 'COMPANY', 'alibaba', '啊阿斯顿', '12313543', '张三', null, null, '1', null);

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `certificate_id` int(11) DEFAULT NULL,
  `company_intro` varchar(2048) DEFAULT NULL COMMENT '公司简介',
  `company_logo` varchar(50) DEFAULT NULL COMMENT '公司图标',
  `reg_no` varchar(30) DEFAULT NULL COMMENT '工商注册号',
  `company_legal_person` varchar(20) DEFAULT NULL COMMENT '法人',
  `reg_money` varchar(10) DEFAULT NULL COMMENT '注册资本',
  `establish_time` varchar(40) DEFAULT NULL COMMENT '公司创立时间',
  `reg_status` varchar(30) DEFAULT NULL,
  `reg_place` varchar(50) DEFAULT NULL COMMENT '注册地点',
  `manage_range` varchar(200) DEFAULT NULL COMMENT '经营范围',
  `shareholder` varchar(50) DEFAULT NULL COMMENT '股东',
  `main_people` varchar(50) DEFAULT NULL,
  `company_address` varchar(50) DEFAULT NULL,
  `contact_person` varchar(20) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL COMMENT '公司被点评人数',
  `thumbup_count` int(11) DEFAULT NULL COMMENT '点赞人数',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_company
-- ----------------------------

-- ----------------------------
-- Table structure for `t_credit`
-- ----------------------------
DROP TABLE IF EXISTS `t_credit`;
CREATE TABLE `t_credit` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `rank` varchar(20) DEFAULT NULL,
  `credit_amount` int(11) DEFAULT NULL,
  `daily_max_credit` int(11) DEFAULT NULL,
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credit
-- ----------------------------

-- ----------------------------
-- Table structure for `t_credit_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_credit_log`;
CREATE TABLE `t_credit_log` (
  `credit_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '积分日志id',
  `credit_id` int(11) DEFAULT NULL,
  `credit_amount` int(11) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`credit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_credit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `t_goods_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_order`;
CREATE TABLE `t_goods_order` (
  `goods_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `call_price_id` int(11) DEFAULT NULL COMMENT '报价实单或者询单id',
  `buyer_id` int(11) DEFAULT NULL,
  `express_way` varchar(20) DEFAULT NULL,
  `accept_goods_place` varchar(100) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL COMMENT '附件',
  `state` varchar(10) DEFAULT NULL,
  `create_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`goods_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_order
-- ----------------------------

-- ----------------------------
-- Table structure for `t_material_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `t_material_purchase`;
CREATE TABLE `t_material_purchase` (
  `material_purchase_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '发布求购原料用户id',
  `cas_no` varchar(40) DEFAULT NULL,
  `purchase_amount` varchar(50) DEFAULT NULL,
  `accept_goods_place` varchar(50) DEFAULT NULL,
  `remark` varchar(2024) DEFAULT NULL COMMENT '备注',
  `is_info_show` tinyint(1) DEFAULT '1' COMMENT '信息是否公开',
  `create_time` datetime DEFAULT NULL COMMENT '发布求购时间',
  PRIMARY KEY (`material_purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_material_purchase
-- ----------------------------

-- ----------------------------
-- Table structure for `t_material_supply`
-- ----------------------------
DROP TABLE IF EXISTS `t_material_supply`;
CREATE TABLE `t_material_supply` (
  `material_supply_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cas_no` varchar(50) DEFAULT NULL COMMENT 'CAS号',
  `product_name` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '供应方id',
  `is_single_publish` tinyint(1) DEFAULT NULL,
  `multiple_publish_content` text,
  `create_time` datetime DEFAULT NULL COMMENT '发布供应时间',
  PRIMARY KEY (`material_supply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_material_supply
-- ----------------------------

-- ----------------------------
-- Table structure for `t_query_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_query_order`;
CREATE TABLE `t_query_order` (
  `query_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cas_no` varchar(50) DEFAULT NULL COMMENT 'CAS号',
  `english_name` varchar(50) DEFAULT NULL,
  `chinese_name` varchar(50) DEFAULT NULL,
  `purity` varchar(10) DEFAULT NULL,
  `buy_amount` varchar(10) DEFAULT NULL,
  `submit_deadline` varchar(20) DEFAULT NULL,
  `diagram_require` varchar(20) DEFAULT NULL,
  `guarantee_money_percent` double(10,2) DEFAULT NULL,
  `reward_money_percent` double(10,2) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `other_require` varchar(2024) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `refer_doc` varchar(200) DEFAULT NULL,
  `make_bill` varchar(50) DEFAULT NULL,
  `join_count` int(11) DEFAULT '0',
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`query_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_query_order
-- ----------------------------
INSERT INTO `t_query_order` VALUES ('1', '2', '2311', 'asdgf', 'dsaf', '99%', '29.00', '3-4', null, null, null, '2017-08-16 16:40:10', '2017-08-25 16:40:05', '啊手机打开', 'http://otncoonon.bkt.clouddn.com/1502243426324.png', null, '不开票', '0', 'ONSALE');

-- ----------------------------
-- Table structure for `t_query_order_callprice`
-- ----------------------------
DROP TABLE IF EXISTS `t_query_order_callprice`;
CREATE TABLE `t_query_order_callprice` (
  `query_call_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `query_order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '报价人id',
  `call_price_money` varchar(20) DEFAULT NULL,
  `call_price_validtime` varchar(20) DEFAULT NULL COMMENT '报价有效期',
  `call_purity` varchar(10) DEFAULT NULL,
  `call_submit_deadline` varchar(20) DEFAULT NULL,
  `offer_diagram` varchar(20) DEFAULT NULL,
  `make_bill` varchar(10) DEFAULT NULL COMMENT '是否开发票',
  `other_require` varchar(2024) DEFAULT NULL,
  `prepayed_money_amount` decimal(10,0) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `vilation_money_amount` decimal(10,0) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '报价/抢单时间',
  PRIMARY KEY (`query_call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_query_order_callprice
-- ----------------------------
INSERT INTO `t_query_order_callprice` VALUES ('1', '1', '2', '4000元/10g', null, null, '3-4周', 'hfds', '1', '无', '1', null, '1', 'BIDDING', '2017-09-01 21:05:23');

-- ----------------------------
-- Table structure for `t_real_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_real_order`;
CREATE TABLE `t_real_order` (
  `real_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '发布者id',
  `cas_no` varchar(50) DEFAULT '',
  `english_name` varchar(50) DEFAULT '',
  `chinese_name` varchar(50) DEFAULT '',
  `buy_amount` varchar(10) DEFAULT NULL,
  `purity` varchar(10) DEFAULT NULL,
  `price_between` varchar(10) DEFAULT NULL,
  `submit_deadline` varchar(30) DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL COMMENT '抢单发布时间',
  `end_time` datetime DEFAULT NULL,
  `diagram_require` varchar(15) DEFAULT NULL,
  `make_bill` varchar(10) DEFAULT NULL COMMENT '是否开发票  0:否 1:是',
  `guarantee_money_percent` double(10,2) DEFAULT NULL,
  `reward_money_percent` double(10,2) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `refer_doc` varchar(255) DEFAULT NULL COMMENT '参考文献',
  `remark` varchar(1024) DEFAULT NULL,
  `join_count` int(11) DEFAULT '0' COMMENT '参与人数',
  `state` varchar(20) DEFAULT 'BIDDING' COMMENT 'BIDDING:抢单中 DELETED:已删除 NOSEND:报价结束未派单 SENDED:已派单 FINISHED:已成单',
  PRIMARY KEY (`real_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_real_order
-- ----------------------------
INSERT INTO `t_real_order` VALUES ('1', '2', '21312', 'ASD', 'ASD', '25g', '97%', '4000-5000', '3-4', '2017-08-10 12:54:07', '2017-08-12 12:54:11', 'HNDS', '不开票', '0.50', '0.50', 'http://otncoonon.bkt.clouddn.com/1502243426324.png', null, null, '0', 'ONSALE');

-- ----------------------------
-- Table structure for `t_real_order_callprice`
-- ----------------------------
DROP TABLE IF EXISTS `t_real_order_callprice`;
CREATE TABLE `t_real_order_callprice` (
  `real_call_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `real_order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT '0' COMMENT '报价人id',
  `call_price_money` varchar(20) DEFAULT NULL,
  `call_price_validtime` varchar(20) DEFAULT NULL COMMENT '报价有效期',
  `call_purity` varchar(10) DEFAULT NULL,
  `call_submit_deadline` varchar(20) DEFAULT NULL,
  `offer_diagram` varchar(20) DEFAULT NULL,
  `make_bill` varchar(10) DEFAULT NULL COMMENT '是否开发票',
  `other_require` varchar(2024) DEFAULT NULL,
  `prepayed_money_amount` decimal(10,0) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `vilation_money_amount` decimal(10,0) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '报价/抢单时间',
  PRIMARY KEY (`real_call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_real_order_callprice
-- ----------------------------
INSERT INTO `t_real_order_callprice` VALUES ('1', '1', '2', '4000元/10g', null, '98', '3-4周', 'hfds', '1', '无', '1', null, '1', 'BIDDING', null);

-- ----------------------------
-- Table structure for `t_setting`
-- ----------------------------
DROP TABLE IF EXISTS `t_setting`;
CREATE TABLE `t_setting` (
  `setting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `is_certificated` tinyint(1) DEFAULT '0' COMMENT '是否实名认证',
  `password` varchar(20) DEFAULT NULL,
  `district` varchar(20) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL COMMENT '积分',
  `credit_rank` varchar(6) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123123', '12312', '0', null, null, '0', null, '2017-08-09 12:12:34');
INSERT INTO `t_user` VALUES ('2', '17858936109', '810230010@qq.com', '0', '123', null, null, null, '2017-08-09 15:11:51');
