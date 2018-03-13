-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sales_db
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '款号',
  `type` varchar(10) NOT NULL COMMENT '类型',
  `fabric` varchar(20) NOT NULL,
  `price` double(6,2) NOT NULL COMMENT '价格',
  `picture` varchar(15) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18040002 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
INSERT INTO `good` VALUES (17020101,'T恤','95%棉+5%氨纶',99.00,'17020101.jpg'),(17020102,'T恤','100%棉',145.00,''),(17020201,'衬衫','100%棉',125.00,''),(17021101,'短裤','100%棉',110.00,''),(17021102,'短裤','100%棉',105.00,''),(17021201,'长裤','100%棉',199.00,'17021201.jpg'),(17202010,'长裤','100%棉',225.00,''),(17207003,'风衣','100%棉',99.00,''),(18040001,'鞋子','/',439.00,NULL);
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_color`
--

DROP TABLE IF EXISTS `good_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_color` varchar(8) NOT NULL COMMENT '商品颜色',
  PRIMARY KEY (`id`),
  KEY `fk_gc_good` (`good_id`),
  CONSTRAINT `fk_gc_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_color`
--

LOCK TABLES `good_color` WRITE;
/*!40000 ALTER TABLE `good_color` DISABLE KEYS */;
INSERT INTO `good_color` VALUES (1,17020101,'黑色'),(2,17020101,'白色'),(3,17020101,'绿色'),(4,17020101,'粉色'),(5,17020101,'灰色'),(6,17020102,'黑色'),(7,17020102,'白色'),(8,17020102,'灰色'),(9,18040001,'黑色'),(10,18040001,'白色'),(11,18040001,'红色');
/*!40000 ALTER TABLE `good_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_size`
--

DROP TABLE IF EXISTS `good_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '商品编号',
  `good_size` varchar(4) NOT NULL COMMENT '商品尺码',
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `fk_gs_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_size`
--

LOCK TABLES `good_size` WRITE;
/*!40000 ALTER TABLE `good_size` DISABLE KEYS */;
INSERT INTO `good_size` VALUES (1,17020101,'S'),(2,17020101,'M'),(3,17020101,'L'),(4,17020101,'XL'),(5,17020101,'XXL'),(6,17020102,'S'),(7,17020102,'M'),(8,17020102,'L'),(9,17020102,'XL'),(10,17020102,'XXL'),(11,17020102,'XXL'),(12,18040001,'38'),(13,18040001,'39'),(14,18040001,'40'),(15,18040001,'41'),(16,18040001,'42'),(17,18040001,'43');
/*!40000 ALTER TABLE `good_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (0001,'admin','admin','管理员');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (00000000001,'13257453246','张三','2017-12-12',1.00,0,'2017-12-26 00:41:45'),(00000000002,'13578907894','李四','2017-12-12',1.00,0,'2017-12-26 00:41:45'),(00000000003,'13213414143','王五','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000004,'15270926232','谢松','1996-07-11',0.75,500,'2017-12-26 00:41:45'),(00000000005,'17234245234','熊铨叙','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000006,'15521342349','吴超忠','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000007,'18624242234','许建雄','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000008,'13223535643','占柳剑','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000009,'15290734505','胡竞宇','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000010,'15723452890','余文涛','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000011,'18529004523','饶海明','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000012,'13804562356','卢从发','2017-12-25',1.00,0,'2017-12-26 00:41:45'),(00000000018,'12314123132','测试','1994-07-13',1.00,0,'2017-12-26 06:24:34'),(00000000020,'18812386791','尹婷','2009-01-15',0.75,446,'2017-12-28 03:18:13');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '订单主键',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单日期',
  `print_count` int(11) NOT NULL DEFAULT '1' COMMENT '打印统计',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '订单总件数',
  `sum_money` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `pay_mode` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式（1/银行卡 2/支付宝 3/微信 4/现金）',
  `remark` text COMMENT '订单备注',
  `user_id` int(4) unsigned zerofill NOT NULL COMMENT '收银员',
  `member_id` int(11) unsigned DEFAULT NULL COMMENT '会员卡号',
  `return_flag` int(11) DEFAULT '0' COMMENT '退货标记',
  `return_date` timestamp NULL DEFAULT NULL COMMENT '退货日期',
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`user_id`),
  KEY `fk_order_member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (00000002,'2017-11-23 05:27:32',2,0,0.00,3,'顾客明天下午四点到店自提，经手人：小明',0003,2,1,'2018-03-08 01:45:33'),(00000003,'2018-02-02 02:06:34',3,2,89.10,1,'',0004,5,1,'2018-03-08 01:14:04'),(00000006,'2018-02-05 08:38:20',1,1,99.00,3,'这只是一条测试信息',0004,4,0,NULL),(00000007,'2018-02-05 08:39:49',3,2,486.00,2,'活动：三件75折',0004,4,1,NULL),(00000008,'2018-02-06 02:12:29',4,1,84.15,3,'我是备注哈哈\nha哈哈哈哈',0004,NULL,0,NULL),(00000009,'2018-03-01 08:05:49',2,1,373.15,3,'欢迎光临MyClothes',0004,NULL,0,NULL),(00000011,'2018-03-09 06:33:02',1,3,222.75,3,'',0004,20,0,NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `storage_id` int(11) unsigned zerofill NOT NULL COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `price` double(6,2) NOT NULL COMMENT '单价',
  `discount` double(4,2) NOT NULL DEFAULT '1.00' COMMENT '折扣',
  `dis_price` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '折后价',
  `return_flag` int(11) DEFAULT '0' COMMENT '退货标记',
  PRIMARY KEY (`id`),
  KEY `fk_od_order` (`order_id`),
  KEY `fk_od_good` (`good_id`),
  CONSTRAINT `fk_od_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,00000002,00000000002,17020101,'红色','XL',99.00,1.00,99.00,1),(4,00000003,00000000004,17020101,'白色','S',99.00,0.30,29.70,0),(5,00000003,00000000005,17020101,'白色','S',99.00,1.00,99.00,1),(6,00000003,00000000006,17020101,'BLACK','XXL',99.00,0.60,59.40,0),(7,00000003,00000000007,17020101,'BLACK','XXL',99.00,1.00,99.00,1),(8,00000006,00000000008,17020101,'黑色','M',99.00,1.00,99.00,0),(9,00000007,00000000009,17020101,'白色','XXL',99.00,0.75,74.25,0),(10,00000007,00000000010,17021101,'蓝色','30',110.00,0.75,82.50,1),(11,00000007,00000000011,18040001,'白色','41',439.00,0.75,329.25,0),(12,00000008,00000000012,17020101,'蓝色','XXXL',99.00,0.85,84.15,0),(13,00000009,00000000014,18040001,'白色','40',439.00,0.85,373.15,0),(15,00000011,00000000002,17020101,'红色','XL',99.00,0.75,74.25,0),(16,00000011,00000000005,17020101,'白色','S',99.00,0.75,74.25,0),(17,00000011,00000000007,17020101,'BLACK','XXL',99.00,0.75,74.25,0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_staff`
--

DROP TABLE IF EXISTS `order_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(8) unsigned zerofill NOT NULL COMMENT '订单号',
  `staff_id` int(4) unsigned zerofill NOT NULL COMMENT '员工编号',
  PRIMARY KEY (`id`),
  KEY `fk_os_order` (`order_id`),
  KEY `fk_os_staff` (`staff_id`),
  CONSTRAINT `fk_os_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_os_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_staff`
--

LOCK TABLES `order_staff` WRITE;
/*!40000 ALTER TABLE `order_staff` DISABLE KEYS */;
INSERT INTO `order_staff` VALUES (3,00000002,0001),(6,00000002,0003),(7,00000003,0001),(8,00000003,0002),(9,00000003,0003),(15,00000006,0006),(16,00000007,0003),(17,00000007,0006),(18,00000008,0003),(19,00000008,0006),(20,00000009,0003),(22,00000011,0003);
/*!40000 ALTER TABLE `order_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_temp`
--

DROP TABLE IF EXISTS `order_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `storage_id` int(11) NOT NULL COMMENT '条形码',
  `good_id` int(8) NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '尺码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ot_storage_id` (`storage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_temp`
--

LOCK TABLES `order_temp` WRITE;
/*!40000 ALTER TABLE `order_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(10) NOT NULL COMMENT '员工姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `idcard` varchar(18) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (0001,'小黑','13279475234','368729199211084328','江西省九江市浔阳区沿江路***小区18栋1502',1),(0002,'倩倩','15279475235','328729198806234327','江西省九江市浔阳区沿江路***小区16栋1502',0),(0003,'松子','13279475236','468729199302134326','江西省九江市浔阳区沿江路***小区14栋1502',1),(0004,'景云','15279475237','358729199012254325','江西省九江市浔阳区沿江路***小区14栋1502',1),(0005,'小霞','18279475238','228729199411244324','江西省九江市浔阳区沿江路***小区12栋1502',1),(0006,'婷婷','17279475234','348729199504244323','江西省九江市浔阳区沿江路***小区10栋1101',1),(0007,'test','13257028730','1231123','City.Test Road.Test',0),(0008,'测试1','123','132511','电费根深蒂固',0),(0009,'测试2','123','','',0),(0011,'测试23','1234','','',0),(0015,'11111','131231231','','',0),(0016,'13123','124124234','','',0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_effort`
--

DROP TABLE IF EXISTS `staff_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_effort` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `staff_id` int(4) unsigned zerofill NOT NULL COMMENT '员工编号',
  `effort` double NOT NULL DEFAULT '0' COMMENT '员工业绩',
  PRIMARY KEY (`id`),
  KEY `fk_se_staff` (`staff_id`),
  CONSTRAINT `fk_se_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_effort`
--

LOCK TABLES `staff_effort` WRITE;
/*!40000 ALTER TABLE `staff_effort` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '条形码',
  `good_id` int(8) unsigned zerofill NOT NULL COMMENT '款号',
  `color` varchar(8) NOT NULL COMMENT '颜色',
  `size` varchar(4) NOT NULL COMMENT '大小',
  `check_flag` int(11) NOT NULL DEFAULT '0' COMMENT '盘点标记',
  PRIMARY KEY (`id`),
  KEY `fk_storage_good` (`good_id`),
  CONSTRAINT `fk_storage_good` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (00000000013,18040001,'白色','40',1),(00000000014,18040001,'黑色','39',0);
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loginname` varchar(8) NOT NULL COMMENT '登录名',
  `password` varchar(12) NOT NULL COMMENT '密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(12) DEFAULT NULL COMMENT '手机号码',
  `status` int(11) DEFAULT '0' COMMENT '审核状态（0/待审核 1/已审核）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_loginname` (`loginname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0001,'J001','123123','店长1','0792-8316800',0),(0002,'J002','123123','店长2','0792-8968366',0),(0003,'J003','123123','店长3','0792-8135800',1),(0004,'test','test','测试用户','123123',1),(0005,'xeahsoon','123456','谢松','15270926232',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-13 17:35:20
