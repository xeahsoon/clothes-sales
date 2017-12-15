/*
Navicat MySQL Data Transfer

Source Server         : xeahsoon
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sales_db

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-14 16:25:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `price` double(6,2) NOT NULL COMMENT '价格',
  `picture` varchar(15) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17021202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('17020101', 'T恤', '99.00', '17020101.jpg');
INSERT INTO `good` VALUES ('17020102', 'T恤', '145.00', '17020102.jpg');
INSERT INTO `good` VALUES ('17020201', '衬衫', '125.00', '17020201.jpg');
INSERT INTO `good` VALUES ('17021101', '短裤', '110.00', '17021101.jpg');
INSERT INTO `good` VALUES ('17021102', '短裤', '105.00', '17021102.jpg');
INSERT INTO `good` VALUES ('17021201', '长裤', '199.00', '17021201.jpg');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('0001', 'admin', 'admin', '管理员');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(13) NOT NULL COMMENT '会员卡号',
  `name` varchar(20) NOT NULL COMMENT '会员姓名',
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '会员生日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('00000000001', '13257453246', '张三', '2017-12-12 11:25:58');
INSERT INTO `member` VALUES ('00000000002', '13578907894', '李四', '2017-12-12 11:26:21');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '订单主键',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `print_count` int(11) NOT NULL DEFAULT '0' COMMENT '打印统计',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '订单总件数',
  `sum_money` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `pay_mode` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式（1/银行卡 2/支付宝 3/微信 4/现金）',
  `remark` text COMMENT '订单备注',
  `user_id` int(4) unsigned zerofill NOT NULL COMMENT '收银员',
  `member_id` int(11) unsigned DEFAULT NULL COMMENT '会员卡号',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  KEY `fk_order_member` (`member_id`),
  CONSTRAINT `fk_order_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('00000001', '2017-11-23 13:23:29', '0', '2', '324.00', '1', '顾客明天早上至店里自取，请留意', '0001', '1');
INSERT INTO `order` VALUES ('00000002', '2017-11-23 13:27:32', '0', '1', '99.00', '3', '邮寄至顾客家，地址及联系方式见记事簿，经手人：松子', '0003', '2');

-- ----------------------------
-- Table structure for `order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `storage_id` int(11) unsigned zerofill NOT NULL COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣',
  `price` double(6,2) NOT NULL COMMENT '单价',
  `dis_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  PRIMARY KEY (`id`),
  KEY `fk_od_order` (`order_id`),
  KEY `uq_code` (`storage_id`) USING BTREE,
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '00000001', '00000000001', '17207003', '黑色', 'M', '1.00', '99.00', '99.00');
INSERT INTO `order_detail` VALUES ('2', '00000001', '00000000003', '17202010', '卡其色', 'S', '1.00', '225.00', '225.00');
INSERT INTO `order_detail` VALUES ('3', '00000002', '00000000002', '17200101', '红色', 'XL', '1.00', '99.00', '99.00');

-- ----------------------------
-- Table structure for `order_staff`
-- ----------------------------
DROP TABLE IF EXISTS `order_staff`;
CREATE TABLE `order_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `staff_id` int(4) unsigned zerofill NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`id`),
  KEY `fk_os_order` (`order_id`),
  KEY `fk_os_staff` (`staff_id`),
  CONSTRAINT `fk_os_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_os_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_staff
-- ----------------------------
INSERT INTO `order_staff` VALUES ('1', '00000001', '0003');
INSERT INTO `order_staff` VALUES ('2', '00000001', '0004');
INSERT INTO `order_staff` VALUES ('3', '00000002', '0001');
INSERT INTO `order_staff` VALUES ('4', '00000001', '0001');
INSERT INTO `order_staff` VALUES ('5', '00000001', '0002');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '员工姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('0001', '小黑', null, '0');
INSERT INTO `staff` VALUES ('0002', '倩倩', null, '0');
INSERT INTO `staff` VALUES ('0003', '松子', null, '1');
INSERT INTO `staff` VALUES ('0004', '景云', null, '1');
INSERT INTO `staff` VALUES ('0005', '小霞', null, '1');
INSERT INTO `staff` VALUES ('0006', '婷婷', null, '1');

-- ----------------------------
-- Table structure for `storage`
-- ----------------------------
DROP TABLE IF EXISTS `storage`;
CREATE TABLE `storage` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  PRIMARY KEY (`id`),
  KEY `fk_storage_good` (`good_id`),
  CONSTRAINT `fk_storage_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storage
-- ----------------------------
INSERT INTO `storage` VALUES ('00000000004', '17020101', '白色', 'S');
INSERT INTO `storage` VALUES ('00000000005', '17020101', '白色', 'S');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0001', 'J001', '123123', '店长1', '0792-8316800', '0');
INSERT INTO `user` VALUES ('0002', 'J002', '123123', '店长2', '0792-8968366', '0');
INSERT INTO `user` VALUES ('0003', 'J003', '123123', '店长3', '0792-8135800', '1');
INSERT INTO `user` VALUES ('0004', 'test', 'test', '测试用户', null, '1');
