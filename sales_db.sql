/*
Navicat MySQL Data Transfer

Source Server         : xeahsoon
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sales_db

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-15 16:21:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `fabric` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '价格',
  `picture` varchar(15) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17207004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('17020101', 'T恤', '95%棉+5%氨纶', '99.00', '17020101.jpg');
INSERT INTO `good` VALUES ('17020102', 'T恤', '100%棉', '145.00', '17020102.jpg');
INSERT INTO `good` VALUES ('17020201', '衬衫', '100%棉', '125.00', '17020201.jpg');
INSERT INTO `good` VALUES ('17021101', '短裤', '100%棉', '110.00', '17021101.jpg');
INSERT INTO `good` VALUES ('17021102', '短裤', '100%棉', '105.00', '17021102.jpg');
INSERT INTO `good` VALUES ('17021201', '长裤', '100%棉', '199.00', '17021201.jpg');
INSERT INTO `good` VALUES ('17202010', '长裤', '100%棉', '225.00', '17202010.jpg');
INSERT INTO `good` VALUES ('17207003', '短袖T恤', '100%棉', '99.00', '17207003.jpg');

-- ----------------------------
-- Table structure for `good_color`
-- ----------------------------
DROP TABLE IF EXISTS `good_color`;
CREATE TABLE `good_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_color` varchar(8) NOT NULL COMMENT '商品颜色',
  PRIMARY KEY (`id`),
  KEY `fk_gc_good` (`good_id`),
  CONSTRAINT `fk_gc_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_color
-- ----------------------------

-- ----------------------------
-- Table structure for `good_size`
-- ----------------------------
DROP TABLE IF EXISTS `good_size`;
CREATE TABLE `good_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_size` varchar(4) NOT NULL COMMENT '商品尺码',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `fk_gs_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_size
-- ----------------------------

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
  `birthday` date NOT NULL COMMENT '会员生日',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '会员折扣',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `intime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '入会时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('00000000001', '13257453246', '张三', '2017-12-12', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000002', '13578907894', '李四', '2017-12-12', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000003', '13213414143', '王五', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000004', '15270926232', '谢松', '1996-07-11', '0.75', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000005', '17234245234', '熊铨叙', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000006', '15521342349', '吴超忠', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000007', '18624242234', '许建雄', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000008', '13223535643', '占柳剑', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000009', '15290734505', '胡竞宇', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000010', '15723452890', '余文涛', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000011', '18529004523', '饶海明', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000012', '13804562356', '卢从发', '2017-12-25', '1.00', '0', '2017-12-26 08:41:45');
INSERT INTO `member` VALUES ('00000000018', '12314123132', '测试', '1994-07-13', '0.95', '0', '2017-12-26 14:24:34');
INSERT INTO `member` VALUES ('00000000020', '18812386791', '尹婷', '2009-01-15', '0.75', '0', '2017-12-28 11:18:13');

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
INSERT INTO `order` VALUES ('00000001', '2017-11-23 13:23:29', '0', '2', '324.00', '1', '邮寄至顾客家，地址见记事本，邮寄完成记得回馈单号给客户', '0001', '1');
INSERT INTO `order` VALUES ('00000002', '2017-11-23 13:27:32', '1', '1', '99.00', '3', '顾客明天下午四点到店自提，经手人：景云', '0003', '2');

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
  KEY `fk_od_good` (`good_id`),
  CONSTRAINT `fk_od_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`),
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1', '00000001', '00000000001', '17207003', '黑色', 'M', '1.00', '99.00', '99.00');
INSERT INTO `order_detail` VALUES ('2', '00000001', '00000000003', '17202010', '卡其色', '28', '1.00', '225.00', '225.00');
INSERT INTO `order_detail` VALUES ('3', '00000002', '00000000002', '17020101', '红色', 'XL', '1.00', '99.00', '99.00');

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
  `idcard` varchar(18) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('0001', '小黑', '13279475234', '368729199211084328', '江西省九江市浔阳区沿江路***小区18栋1502', '0');
INSERT INTO `staff` VALUES ('0002', '倩倩', '15279475235', '328729198806234327', '江西省九江市浔阳区沿江路***小区16栋1502', '0');
INSERT INTO `staff` VALUES ('0003', '松子', '13279475236', '468729199302134326', '江西省九江市浔阳区沿江路***小区14栋1502', '1');
INSERT INTO `staff` VALUES ('0004', '景云', '15279475237', '358729199012254325', '江西省九江市浔阳区沿江路***小区14栋1502', '1');
INSERT INTO `staff` VALUES ('0005', '小霞', '18279475238', '228729199411244324', '江西省九江市浔阳区沿江路***小区12栋1502', '0');
INSERT INTO `staff` VALUES ('0006', '婷婷', '17279475234', '348729199504244323', '江西省九江市浔阳区沿江路***小区10栋1101', '1');
INSERT INTO `staff` VALUES ('0007', 'test', '13257028730', '1231123', 'City.Test Road.Test', '1');
INSERT INTO `staff` VALUES ('0008', '测试1', '123', '132511', '电费根深蒂固', '0');
INSERT INTO `staff` VALUES ('0009', '测试2', '123', '', '', '1');
INSERT INTO `staff` VALUES ('0011', '测试23', '1234', '', '', '0');

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
INSERT INTO `user` VALUES ('0004', 'test', 'test', '测试用户', '123123', '1');
