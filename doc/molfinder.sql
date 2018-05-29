/*
Navicat MySQL Data Transfer

Source Server         : jjp
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : molfinder

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-05-29 15:16:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `admin_name` varchar(255) DEFAULT NULL,
  `admin_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('0', 'admin', '123');

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
  `ID_number` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `guaranteen_material` varchar(1024) DEFAULT NULL,
  `is_pass` varchar(10) DEFAULT 'CHECKING',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`certificate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_certification
-- ----------------------------
INSERT INTO `t_certification` VALUES ('7', '2', 'COMPANY', '阿里巴巴', 'Usher', '17858936109', '江建平', '342426199604231413', 'http://ouk4xua6o.bkt.clouddn.com/FpDLX1KcYH5cGwrwKi-eKRemvVZX', 'PASS', '2018-05-24 10:13:51');
INSERT INTO `t_certification` VALUES ('9', '3', 'COMPANY', '阿里巴巴', 'jianaa', '17858936189', 'Usher', '32131231231', 'http://ouk4xua6o.bkt.clouddn.com/FpDLX1KcYH5cGwrwKi-eKRemvVZX', 'PASS', '2018-05-27 11:43:59');

-- ----------------------------
-- Table structure for `t_company`
-- ----------------------------
DROP TABLE IF EXISTS `t_company`;
CREATE TABLE `t_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
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
-- Table structure for `t_goods_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_order`;
CREATE TABLE `t_goods_order` (
  `goods_order_id` varchar(100) NOT NULL COMMENT '订单id',
  `call_price_id` int(11) DEFAULT NULL COMMENT '报价实单或者询单id',
  `order_id` int(11) DEFAULT NULL COMMENT '实单、询单号',
  `seller_id` int(11) DEFAULT NULL COMMENT '卖家编号',
  `buyer_id` int(11) DEFAULT NULL,
  `express_way` varchar(20) DEFAULT NULL,
  `accept_goods_info_id` varchar(100) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL COMMENT '附件',
  `state` varchar(10) DEFAULT 'ORDER' COMMENT 'ORDER:买家已下单  SEND:卖家已发货  SUCCESS:成交  ',
  `remark` varchar(1024) DEFAULT NULL,
  `order_type` varchar(6) DEFAULT NULL COMMENT 'REAL:实单 QUERY:询单',
  `create_time` varchar(20) DEFAULT NULL,
  `order_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`goods_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods_order
-- ----------------------------
INSERT INTO `t_goods_order` VALUES ('1000000354042646', '7', '21', '2', '3', '送货上门', '5', null, 'SUCCESS', 'ASDA', 'REAL', '2018-05-27 16:51:56', '4000');

-- ----------------------------
-- Table structure for `t_login_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_record`;
CREATE TABLE `t_login_record` (
  `login_id` int(11) NOT NULL DEFAULT '0',
  `session_id` int(11) DEFAULT NULL,
  `try_login_time` varchar(255) DEFAULT NULL,
  `login_state` tinyint(4) DEFAULT NULL COMMENT '0:登录失败   1:登录成功  ',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_login_record
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
  `user_id` int(11) DEFAULT NULL COMMENT '买家id',
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
  `state` varchar(20) DEFAULT 'BIDDING',
  PRIMARY KEY (`query_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_query_order
-- ----------------------------
INSERT INTO `t_query_order` VALUES ('1', '2', '2311', 'asdgf', 'dsaf', '99%', '29.00g', '3-4', null, null, null, '2017-08-16 16:40:10', '2017-08-25 16:40:05', '啊手机打开', 'http://otncoonon.bkt.clouddn.com/1502243426324.png', null, '不开票', '0', 'CLOSE');

-- ----------------------------
-- Table structure for `t_query_order_callprice`
-- ----------------------------
DROP TABLE IF EXISTS `t_query_order_callprice`;
CREATE TABLE `t_query_order_callprice` (
  `query_call_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `query_order_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL COMMENT '买家id',
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
  `express_type` varchar(10) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '报价/抢单时间',
  PRIMARY KEY (`query_call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_query_order_callprice
-- ----------------------------
INSERT INTO `t_query_order_callprice` VALUES ('1', '1', null, '2', '4000元/10g', null, '98%', '3-4', '', '不开发票', '无啊啊啊', '1', null, '1', 'BIDDING', '送货上门', '2017-09-01 21:05:23');

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
  `state` varchar(20) DEFAULT 'BIDDING' COMMENT 'BIDDING:抢单中 CLOSE:已关闭 NOSEND:报价结束未派单 SEND:已派单 SUCCESS:已成单',
  PRIMARY KEY (`real_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_real_order
-- ----------------------------
INSERT INTO `t_real_order` VALUES ('1', '2', 'as23123-2', 'ASD', '阿斯达啊', '25g', '97%', '4000-5000', '3-4', '2018-01-08 22:23:40', '2018-01-10 20:58:47', 'LCMS,FNMR', '不开发票', '0.50', '0.50', '/pic/d941673f802c4725ae5e2619956c5654.jpg', null, 'asdas啊aaa', '0', 'CLOSE');
INSERT INTO `t_real_order` VALUES ('8', '2', 'aaa', 'aaa', '阿斯顿', '10g', '99', '111-112', '3-4', '2018-04-24 15:06:45', '2018-04-25 14:36:19', 'LCMS', '不开发票', null, null, '/pic/8b08ef9dede54517b0dfe3046c179506.png', null, null, '0', 'CLOSE');
INSERT INTO `t_real_order` VALUES ('19', '2', '啊实打实', 'aaaa', '艾斯德斯', '16g', '99%', '3000-4000元', '3-4', '2018-05-17 13:58:28', '2018-05-18 13:58:27', 'MS', '不开发票', '0.50', '0.50', '/pic/6fbb9fe54f4a428fad4812f968fe7bed.jpg', null, '萨达', '0', 'CLOSE');
INSERT INTO `t_real_order` VALUES ('20', '3', 'asda', 'asd', '阿斯达', '100g', '99%', '3000-4000元', '3-4', '2018-05-24 10:11:00', '2018-05-25 10:10:52', 'HPLC', '不开发票', null, null, '/pic/6c69b7fe616f4faaaa2d19fe20cbd2b9.jpg', null, '钱钱钱', '0', 'CLOSE');
INSERT INTO `t_real_order` VALUES ('21', '3', 'CAS', 'CAS', '擦手', '20g', '99%', '3000-4000元', '3-4', '2018-05-27 12:01:04', '2018-05-28 12:01:00', 'LCMS', '不开发票', null, null, '/pic/fe199992afc64d5ea32c38797a6ff62d.jpg', null, '阿斯达', '1', 'SUCCESS');
INSERT INTO `t_real_order` VALUES ('22', '3', 'asdas', 'asd', '啊实打实', '10g', '99%', '3000-4000元', '3-4', '2018-05-28 14:13:20', '2018-05-29 14:13:16', 'CNMR', '不开发票', null, null, '/pic/ff4245a31cfc4f3dbbfcd3ab4ea8e3ba.jpg', null, '阿斯达', '1', 'BIDDING');

-- ----------------------------
-- Table structure for `t_real_order_callprice`
-- ----------------------------
DROP TABLE IF EXISTS `t_real_order_callprice`;
CREATE TABLE `t_real_order_callprice` (
  `real_call_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `real_order_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL COMMENT '买家id',
  `user_id` int(11) DEFAULT '0' COMMENT '报价人id',
  `call_price_amount` varchar(20) DEFAULT NULL,
  `call_price_money` varchar(20) DEFAULT NULL,
  `call_price_validtime` varchar(20) DEFAULT NULL COMMENT '报价有效期',
  `call_purity` varchar(10) DEFAULT NULL,
  `call_submit_deadline` varchar(20) DEFAULT NULL,
  `offer_diagram` varchar(20) DEFAULT NULL,
  `make_bill` varchar(10) DEFAULT NULL COMMENT '是否开发票',
  `other_require` varchar(2024) DEFAULT NULL,
  `prepayed_money_amount` decimal(10,0) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `shape` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `vilation_money_amount` decimal(10,0) DEFAULT NULL,
  `state` varchar(10) DEFAULT 'BIDDING' COMMENT 'BIDDING:竞拍中  SENDED:竞拍成功',
  `express_type` varchar(20) DEFAULT '快递到门',
  `create_time` datetime DEFAULT NULL COMMENT '报价/抢单时间',
  PRIMARY KEY (`real_call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_real_order_callprice
-- ----------------------------
INSERT INTO `t_real_order_callprice` VALUES ('7', '21', '3', '2', '20g', '4000元', null, '99%', '3-4周', 'LCMS', '不开票', 'ASDA', null, null, '固体', '白色', null, 'HERE', '送货上门', '2018-05-27 12:11:42');
INSERT INTO `t_real_order_callprice` VALUES ('8', '22', '3', '2', '10g', '3000元', null, '99%', '3-4周', 'CNMR', '不开票', 'asd', null, null, '固体', '白色', null, 'BIDDING', '送货上门', '2018-05-28 14:14:58');

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
  `create_time` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT '1' COMMENT '0:拉黑  1：正常',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '123123', '12312', '0', '123', '2017-08-09 12:12:34', '1');
INSERT INTO `t_user` VALUES ('2', '17858936109', '810230010@qq.com', '1', '123', '2017-08-09 15:11:51', '1');
INSERT INTO `t_user` VALUES ('3', '123456', '810230010@qq.com', '1', '123', '2018-05-17 13:59:47', '1');

-- ----------------------------
-- Table structure for `t_user_accept_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_accept_address`;
CREATE TABLE `t_user_accept_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `accept_goods_username` varchar(10) DEFAULT NULL,
  `accept_goods_address` varchar(100) DEFAULT NULL,
  `contact_tel` varchar(20) DEFAULT NULL,
  `add_time` varchar(20) DEFAULT NULL,
  `update_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_accept_address
-- ----------------------------
INSERT INTO `t_user_accept_address` VALUES ('1', '2', '江建平', '浙江杭州余杭闲林', '17858936109', '2017-10-29', '2017-10-29');
INSERT INTO `t_user_accept_address` VALUES ('2', '2', '江建平', '北京西三旗小营东路5号院', '17858936109', '2017-10-29 21:06:20', '2017-10-29 21:06:20');
INSERT INTO `t_user_accept_address` VALUES ('4', '2', '马云', '杭州alibaba', '17858112312', '2017-10-29 21:12:41', '2017-10-29 21:12:41');
INSERT INTO `t_user_accept_address` VALUES ('5', '3', '江建平', '浙江大学', '17858936109', '2018-05-27 14:55:05', '2018-05-27 14:55:05');
INSERT INTO `t_user_accept_address` VALUES ('6', '3', '啊实打实', '啊实打实的风格', '123123', '2018-05-27 15:18:30', '2018-05-27 15:18:30');
DROP TRIGGER IF EXISTS `addJoinCount`;
DELIMITER ;;
CREATE TRIGGER `addJoinCount` AFTER INSERT ON `t_real_order_callprice` FOR EACH ROW update t_real_order set join_count = join_count+1 where real_order_id = new.real_order_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `decreaseJoincount`;
DELIMITER ;;
CREATE TRIGGER `decreaseJoincount` AFTER DELETE ON `t_real_order_callprice` FOR EACH ROW update t_real_order set join_count = join_count-1 where real_order_id = old.real_order_id
;;
DELIMITER ;
