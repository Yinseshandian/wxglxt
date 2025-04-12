-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: wxglxt
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `wxglxt`
--

/*!40000 DROP DATABASE IF EXISTS `wxglxt`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `wxglxt` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `wxglxt`;

--
-- Table structure for table `baoxiuxinxi`
--

DROP TABLE IF EXISTS `baoxiuxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baoxiuxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  `weixiuwupin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修物品',
  `baoxiushijian` datetime DEFAULT NULL COMMENT '报修时间',
  `guzhangmiaoshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障描述',
  `baoxiutupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '报修图片',
  `guzhangdidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障地点',
  `baoxiuxiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '报修详情',
  `baoxiuzhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修状态',
  `jinjichengdu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '紧急程度',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='报修信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baoxiuxinxi`
--

LOCK TABLES `baoxiuxinxi` WRITE;
/*!40000 ALTER TABLE `baoxiuxinxi` DISABLE KEYS */;
INSERT INTO `baoxiuxinxi` VALUES (1,'2025-03-22 12:46:30','用户账号1','用户姓名1','13823888881','维修类型1','维修物品1','2025-03-22 20:46:30','故障描述1','upload/baoxiuxinxi_baoxiutupian1.jpg,upload/baoxiuxinxi_baoxiutupian2.jpg,upload/baoxiuxinxi_baoxiutupian3.jpg','故障地点1','报修详情1','已分配','紧急','是',''),(2,'2025-03-22 12:46:30','用户账号2','用户姓名2','13823888882','维修类型2','维修物品2','2025-03-22 20:46:30','故障描述2','upload/baoxiuxinxi_baoxiutupian2.jpg,upload/baoxiuxinxi_baoxiutupian3.jpg,upload/baoxiuxinxi_baoxiutupian4.jpg','故障地点2','报修详情2','已分配','紧急','是',''),(3,'2025-03-22 12:46:30','用户账号3','用户姓名3','13823888883','维修类型3','维修物品3','2025-03-22 20:46:30','故障描述3','upload/baoxiuxinxi_baoxiutupian3.jpg,upload/baoxiuxinxi_baoxiutupian4.jpg,upload/baoxiuxinxi_baoxiutupian5.jpg','故障地点3','报修详情3','已分配','紧急','是',''),(4,'2025-03-22 12:46:30','用户账号4','用户姓名4','13823888884','维修类型4','维修物品4','2025-03-22 20:46:30','故障描述4','upload/baoxiuxinxi_baoxiutupian4.jpg,upload/baoxiuxinxi_baoxiutupian5.jpg,upload/baoxiuxinxi_baoxiutupian6.jpg','故障地点4','报修详情4','已分配','紧急','是',''),(5,'2025-03-22 12:46:30','用户账号5','用户姓名5','13823888885','维修类型5','维修物品5','2025-03-22 20:46:30','故障描述5','upload/baoxiuxinxi_baoxiutupian5.jpg,upload/baoxiuxinxi_baoxiutupian6.jpg,upload/baoxiuxinxi_baoxiutupian7.jpg','故障地点5','报修详情5','已分配','紧急','是',''),(6,'2025-03-22 12:46:30','用户账号6','用户姓名6','13823888886','维修类型6','维修物品6','2025-03-22 20:46:30','故障描述6','upload/baoxiuxinxi_baoxiutupian6.jpg,upload/baoxiuxinxi_baoxiutupian7.jpg,upload/baoxiuxinxi_baoxiutupian8.jpg','故障地点6','报修详情6','已分配','紧急','是',''),(7,'2025-03-22 12:46:30','用户账号7','用户姓名7','13823888887','维修类型7','维修物品7','2025-03-22 20:46:30','故障描述7','upload/baoxiuxinxi_baoxiutupian7.jpg,upload/baoxiuxinxi_baoxiutupian8.jpg,upload/baoxiuxinxi_baoxiutupian1.jpg','故障地点7','报修详情7','已分配','紧急','是',''),(8,'2025-03-22 12:46:30','用户账号8','用户姓名8','13823888888','维修类型8','维修物品8','2025-03-22 20:46:30','故障描述8','upload/baoxiuxinxi_baoxiutupian8.jpg,upload/baoxiuxinxi_baoxiutupian1.jpg,upload/baoxiuxinxi_baoxiutupian2.jpg','故障地点8','报修详情8','已分配','紧急','是','');
/*!40000 ALTER TABLE `baoxiuxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg',NULL),(2,'picture2','upload/picture2.jpg',NULL),(3,'picture3','upload/picture3.jpg',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fenpeiweixiu`
--

DROP TABLE IF EXISTS `fenpeiweixiu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fenpeiweixiu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  `weixiuwupin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修物品',
  `baoxiushijian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修时间',
  `guzhangmiaoshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障描述',
  `baoxiutupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '报修图片',
  `guzhangdidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障地点',
  `weixiuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
  `weixiuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
  `weixiushenfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修身份',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `fenpeishijian` datetime DEFAULT NULL COMMENT '分配时间',
  `zhuangtai` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  `jinjichengdu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '紧急程度',
  `baoxiuxiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '报修详情',
  `sfsh` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COLLATE utf8mb4_unicode_ci COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分配维修';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fenpeiweixiu`
--

LOCK TABLES `fenpeiweixiu` WRITE;
/*!40000 ALTER TABLE `fenpeiweixiu` DISABLE KEYS */;
INSERT INTO `fenpeiweixiu` VALUES (1,'2025-03-22 12:46:30','用户账号1','用户姓名1','13823888881','维修类型1','维修物品1','报修时间1','故障描述1','upload/fenpeiweixiu_baoxiutupian1.jpg,upload/fenpeiweixiu_baoxiutupian2.jpg,upload/fenpeiweixiu_baoxiutupian3.jpg','故障地点1','维修账号1','维修姓名1','维修身份1','13823888881','2025-03-22 20:46:30','已处理','紧急程度1','报修详情1','是',''),(2,'2025-03-22 12:46:30','用户账号2','用户姓名2','13823888882','维修类型2','维修物品2','报修时间2','故障描述2','upload/fenpeiweixiu_baoxiutupian2.jpg,upload/fenpeiweixiu_baoxiutupian3.jpg,upload/fenpeiweixiu_baoxiutupian4.jpg','故障地点2','维修账号2','维修姓名2','维修身份2','13823888882','2025-03-22 20:46:30','已处理','紧急程度2','报修详情2','是',''),(3,'2025-03-22 12:46:30','用户账号3','用户姓名3','13823888883','维修类型3','维修物品3','报修时间3','故障描述3','upload/fenpeiweixiu_baoxiutupian3.jpg,upload/fenpeiweixiu_baoxiutupian4.jpg,upload/fenpeiweixiu_baoxiutupian5.jpg','故障地点3','维修账号3','维修姓名3','维修身份3','13823888883','2025-03-22 20:46:30','已处理','紧急程度3','报修详情3','是',''),(4,'2025-03-22 12:46:30','用户账号4','用户姓名4','13823888884','维修类型4','维修物品4','报修时间4','故障描述4','upload/fenpeiweixiu_baoxiutupian4.jpg,upload/fenpeiweixiu_baoxiutupian5.jpg,upload/fenpeiweixiu_baoxiutupian6.jpg','故障地点4','维修账号4','维修姓名4','维修身份4','13823888884','2025-03-22 20:46:30','已处理','紧急程度4','报修详情4','是',''),(5,'2025-03-22 12:46:30','用户账号5','用户姓名5','13823888885','维修类型5','维修物品5','报修时间5','故障描述5','upload/fenpeiweixiu_baoxiutupian5.jpg,upload/fenpeiweixiu_baoxiutupian6.jpg,upload/fenpeiweixiu_baoxiutupian7.jpg','故障地点5','维修账号5','维修姓名5','维修身份5','13823888885','2025-03-22 20:46:30','已处理','紧急程度5','报修详情5','是',''),(6,'2025-03-22 12:46:30','用户账号6','用户姓名6','13823888886','维修类型6','维修物品6','报修时间6','故障描述6','upload/fenpeiweixiu_baoxiutupian6.jpg,upload/fenpeiweixiu_baoxiutupian7.jpg,upload/fenpeiweixiu_baoxiutupian8.jpg','故障地点6','维修账号6','维修姓名6','维修身份6','13823888886','2025-03-22 20:46:30','已处理','紧急程度6','报修详情6','是',''),(7,'2025-03-22 12:46:30','用户账号7','用户姓名7','13823888887','维修类型7','维修物品7','报修时间7','故障描述7','upload/fenpeiweixiu_baoxiutupian7.jpg,upload/fenpeiweixiu_baoxiutupian8.jpg,upload/fenpeiweixiu_baoxiutupian1.jpg','故障地点7','维修账号7','维修姓名7','维修身份7','13823888887','2025-03-22 20:46:30','已处理','紧急程度7','报修详情7','是',''),(8,'2025-03-22 12:46:30','用户账号8','用户姓名8','13823888888','维修类型8','维修物品8','报修时间8','故障描述8','upload/fenpeiweixiu_baoxiutupian8.jpg,upload/fenpeiweixiu_baoxiutupian1.jpg,upload/fenpeiweixiu_baoxiutupian2.jpg','故障地点8','维修账号8','维修姓名8','维修身份8','13823888888','2025-03-22 20:46:30','已处理','紧急程度8','报修详情8','是','');
/*!40000 ALTER TABLE `fenpeiweixiu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COLLATE utf8mb4_unicode_ci COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2025-03-22 12:46:30','[{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"menu\":\"用户管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"维修人员\",\"menuJump\":\"列表\",\"tableName\":\"weixiurenyuan\"}],\"menu\":\"维修人员管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-vip\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"维修类型\",\"menuJump\":\"列表\",\"tableName\":\"weixiuleixing\"}],\"menu\":\"维修类型管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"维修类型\",\"紧急程度\",\"首页总数\",\"首页统计\",\"分配\"],\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"审核\",\"首页总数\",\"首页统计\",\"分配\"],\"menu\":\"报修信息\",\"menuJump\":\"列表\",\"tableName\":\"baoxiuxinxi\"}],\"menu\":\"报修信息管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"维修记录\"],\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"分配维修\",\"menuJump\":\"列表\",\"tableName\":\"fenpeiweixiu\"}],\"menu\":\"分配维修管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"员工维修次数\",\"维修结果\",\"首页总数\",\"首页统计\",\"维修确认\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"修改\",\"删除\",\"首页总数\",\"首页统计\",\"维修确认\"],\"menu\":\"维修记录\",\"menuJump\":\"列表\",\"tableName\":\"weixiujilu\"}],\"menu\":\"维修记录管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"维修知识库\",\"menuJump\":\"列表\",\"tableName\":\"weixiuzhishiku\"}],\"menu\":\"维修知识库管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修评价\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"维修结果\",\"menuJump\":\"列表\",\"tableName\":\"weixiujieguo\"}],\"menu\":\"维修结果管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"}],\"menu\":\"维修评价管理\"},{\"child\":[{\"allButtons\":[\"查看\",\"编辑名称\",\"编辑父级\",\"编辑权限\",\"删除\"],\"appFrontIcon\":\"cuIcon-taxi\",\"buttons\":[\"查看\",\"编辑名称\",\"编辑父级\",\"编辑权限\",\"删除\"],\"menu\":\"菜单列表\",\"tableName\":\"menu\"}],\"menu\":\"系统管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"维修类型\",\"紧急程度\",\"首页总数\",\"首页统计\",\"分配\"],\"appFrontIcon\":\"cuIcon-full\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"报修信息\",\"menuJump\":\"列表\",\"tableName\":\"baoxiuxinxi\"}],\"menu\":\"报修信息管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"维修记录\"],\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\"],\"menu\":\"分配维修\",\"menuJump\":\"列表\",\"tableName\":\"fenpeiweixiu\"}],\"menu\":\"分配维修管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"员工维修次数\",\"维修结果\",\"首页总数\",\"首页统计\",\"维修确认\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"维修评价\"],\"menu\":\"维修记录\",\"menuJump\":\"列表\",\"tableName\":\"weixiujilu\"}],\"menu\":\"维修记录管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"menu\":\"维修知识库\",\"menuJump\":\"列表\",\"tableName\":\"weixiuzhishiku\"}],\"menu\":\"维修知识库管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修评价\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\",\"维修评价\"],\"menu\":\"维修结果\",\"menuJump\":\"列表\",\"tableName\":\"weixiujieguo\"}],\"menu\":\"维修结果管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"}],\"menu\":\"维修评价管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"是\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"},{\"backMenu\":[{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"审核\",\"维修记录\"],\"appFrontIcon\":\"cuIcon-brand\",\"buttons\":[\"查看\",\"审核\",\"维修\",\"接取任务\",\"维修记录\"],\"menu\":\"分配维修\",\"menuJump\":\"列表\",\"tableName\":\"fenpeiweixiu\"}],\"menu\":\"分配维修管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"员工维修次数\",\"维修结果\",\"首页总数\",\"首页统计\",\"维修确认\"],\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"维修记录\",\"menuJump\":\"列表\",\"tableName\":\"weixiujilu\"}],\"menu\":\"维修记录管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-similar\",\"buttons\":[\"查看\"],\"menu\":\"维修知识库\",\"menuJump\":\"列表\",\"tableName\":\"weixiuzhishiku\"}],\"menu\":\"维修知识库管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"维修评价\"],\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"查看\"],\"menu\":\"维修结果\",\"menuJump\":\"列表\",\"tableName\":\"weixiujieguo\"}],\"menu\":\"维修结果管理\"},{\"child\":[{\"allButtons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"appFrontIcon\":\"cuIcon-album\",\"buttons\":[\"查看\"],\"menu\":\"维修评价\",\"menuJump\":\"列表\",\"tableName\":\"weixiupingjia\"}],\"menu\":\"维修评价管理\"}],\"frontMenu\":[],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"维修人员\",\"tableName\":\"weixiurenyuan\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popupremind`
--

DROP TABLE IF EXISTS `popupremind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popupremind` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '发布人id',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '个人' COMMENT '类型',
  `brief` longtext COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `remindtime` datetime DEFAULT NULL COMMENT '提醒时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='弹窗提醒';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popupremind`
--

LOCK TABLES `popupremind` WRITE;
/*!40000 ALTER TABLE `popupremind` DISABLE KEYS */;
INSERT INTO `popupremind` VALUES (1,'2025-03-22 12:46:30',1,'标题1','个人','简介1','内容1','2025-03-22 20:46:30'),(2,'2025-03-22 12:46:30',2,'标题2','个人','简介2','内容2','2025-03-22 20:46:30'),(3,'2025-03-22 12:46:30',3,'标题3','个人','简介3','内容3','2025-03-22 20:46:30'),(4,'2025-03-22 12:46:30',4,'标题4','个人','简介4','内容4','2025-03-22 20:46:30'),(5,'2025-03-22 12:46:30',5,'标题5','个人','简介5','内容5','2025-03-22 20:46:30'),(6,'2025-03-22 12:46:30',6,'标题6','个人','简介6','内容6','2025-03-22 20:46:30'),(7,'2025-03-22 12:46:30',7,'标题7','个人','简介7','内容7','2025-03-22 20:46:30'),(8,'2025-03-22 12:46:30',8,'标题8','个人','简介8','内容8','2025-03-22 20:46:30');
/*!40000 ALTER TABLE `popupremind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsregistercode`
--

DROP TABLE IF EXISTS `smsregistercode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsregistercode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mobile` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机',
  `role` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsregistercode`
--

LOCK TABLES `smsregistercode` WRITE;
/*!40000 ALTER TABLE `smsregistercode` DISABLE KEYS */;
INSERT INTO `smsregistercode` VALUES (1,'2025-03-22 12:46:30','手机1','角色1','验证码1'),(2,'2025-03-22 12:46:30','手机2','角色2','验证码2'),(3,'2025-03-22 12:46:30','手机3','角色3','验证码3'),(4,'2025-03-22 12:46:30','手机4','角色4','验证码4'),(5,'2025-03-22 12:46:30','手机5','角色5','验证码5'),(6,'2025-03-22 12:46:30','手机6','角色6','验证码6'),(7,'2025-03-22 12:46:30','手机7','角色7','验证码7'),(8,'2025-03-22 12:46:30','手机8','角色8','验证码8');
/*!40000 ALTER TABLE `smsregistercode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '商品id',
  `tablename` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '表名',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext COLLATE utf8mb4_unicode_ci COMMENT '图片',
  `type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `image` varchar(200) DEFAULT NULL COMMENT '头像',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','upload/image1.jpg','管理员','2025-03-22 12:46:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiujieguo`
--

DROP TABLE IF EXISTS `weixiujieguo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiujieguo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  `weixiuwupin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修物品',
  `baoxiushijian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修时间',
  `guzhangmiaoshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障描述',
  `weixiutupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修图片',
  `guzhangdidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障地点',
  `weixiuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
  `weixiuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
  `weixiushenfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修身份',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `querenshijian` datetime DEFAULT NULL COMMENT '确认时间',
  `querenbeizhu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '确认备注',
  `weixiujilu` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiujieguo`
--

LOCK TABLES `weixiujieguo` WRITE;
/*!40000 ALTER TABLE `weixiujieguo` DISABLE KEYS */;
INSERT INTO `weixiujieguo` VALUES (1,'2025-03-22 12:46:30','用户账号1','用户姓名1','13823888881','维修类型1','维修物品1','报修时间1','故障描述1','upload/weixiujieguo_weixiutupian1.jpg,upload/weixiujieguo_weixiutupian2.jpg,upload/weixiujieguo_weixiutupian3.jpg','故障地点1','维修账号1','维修姓名1','维修身份1','13823888881','2025-03-22 20:46:30','确认备注1','维修记录1'),(2,'2025-03-22 12:46:30','用户账号2','用户姓名2','13823888882','维修类型2','维修物品2','报修时间2','故障描述2','upload/weixiujieguo_weixiutupian2.jpg,upload/weixiujieguo_weixiutupian3.jpg,upload/weixiujieguo_weixiutupian4.jpg','故障地点2','维修账号2','维修姓名2','维修身份2','13823888882','2025-03-22 20:46:30','确认备注2','维修记录2'),(3,'2025-03-22 12:46:30','用户账号3','用户姓名3','13823888883','维修类型3','维修物品3','报修时间3','故障描述3','upload/weixiujieguo_weixiutupian3.jpg,upload/weixiujieguo_weixiutupian4.jpg,upload/weixiujieguo_weixiutupian5.jpg','故障地点3','维修账号3','维修姓名3','维修身份3','13823888883','2025-03-22 20:46:30','确认备注3','维修记录3'),(4,'2025-03-22 12:46:30','用户账号4','用户姓名4','13823888884','维修类型4','维修物品4','报修时间4','故障描述4','upload/weixiujieguo_weixiutupian4.jpg,upload/weixiujieguo_weixiutupian5.jpg,upload/weixiujieguo_weixiutupian6.jpg','故障地点4','维修账号4','维修姓名4','维修身份4','13823888884','2025-03-22 20:46:30','确认备注4','维修记录4'),(5,'2025-03-22 12:46:30','用户账号5','用户姓名5','13823888885','维修类型5','维修物品5','报修时间5','故障描述5','upload/weixiujieguo_weixiutupian5.jpg,upload/weixiujieguo_weixiutupian6.jpg,upload/weixiujieguo_weixiutupian7.jpg','故障地点5','维修账号5','维修姓名5','维修身份5','13823888885','2025-03-22 20:46:30','确认备注5','维修记录5'),(6,'2025-03-22 12:46:30','用户账号6','用户姓名6','13823888886','维修类型6','维修物品6','报修时间6','故障描述6','upload/weixiujieguo_weixiutupian6.jpg,upload/weixiujieguo_weixiutupian7.jpg,upload/weixiujieguo_weixiutupian8.jpg','故障地点6','维修账号6','维修姓名6','维修身份6','13823888886','2025-03-22 20:46:30','确认备注6','维修记录6'),(7,'2025-03-22 12:46:30','用户账号7','用户姓名7','13823888887','维修类型7','维修物品7','报修时间7','故障描述7','upload/weixiujieguo_weixiutupian7.jpg,upload/weixiujieguo_weixiutupian8.jpg,upload/weixiujieguo_weixiutupian1.jpg','故障地点7','维修账号7','维修姓名7','维修身份7','13823888887','2025-03-22 20:46:30','确认备注7','维修记录7'),(8,'2025-03-22 12:46:30','用户账号8','用户姓名8','13823888888','维修类型8','维修物品8','报修时间8','故障描述8','upload/weixiujieguo_weixiutupian8.jpg,upload/weixiujieguo_weixiutupian1.jpg,upload/weixiujieguo_weixiutupian2.jpg','故障地点8','维修账号8','维修姓名8','维修身份8','13823888888','2025-03-22 20:46:30','确认备注8','维修记录8');
/*!40000 ALTER TABLE `weixiujieguo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiujilu`
--

DROP TABLE IF EXISTS `weixiujilu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiujilu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  `weixiuwupin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修物品',
  `baoxiushijian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修时间',
  `guzhangmiaoshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障描述',
  `weixiutupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修图片',
  `guzhangdidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障地点',
  `weixiuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
  `weixiuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
  `weixiushenfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修身份',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `weixiushijian` datetime DEFAULT NULL COMMENT '维修时间',
  `weixiujieguo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修结果',
  `weixiujilu` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiujilu`
--

LOCK TABLES `weixiujilu` WRITE;
/*!40000 ALTER TABLE `weixiujilu` DISABLE KEYS */;
INSERT INTO `weixiujilu` VALUES (1,'2025-03-22 12:46:30','用户账号1','用户姓名1','13823888881','维修类型1','维修物品1','报修时间1','故障描述1','upload/weixiujilu_weixiutupian1.jpg,upload/weixiujilu_weixiutupian2.jpg,upload/weixiujilu_weixiutupian3.jpg','故障地点1','维修账号1','维修姓名1','维修身份1','13823888881','2025-03-22 20:46:30','已完成','维修记录1'),(2,'2025-03-22 12:46:30','用户账号2','用户姓名2','13823888882','维修类型2','维修物品2','报修时间2','故障描述2','upload/weixiujilu_weixiutupian2.jpg,upload/weixiujilu_weixiutupian3.jpg,upload/weixiujilu_weixiutupian4.jpg','故障地点2','维修账号2','维修姓名2','维修身份2','13823888882','2025-03-22 20:46:30','已完成','维修记录2'),(3,'2025-03-22 12:46:30','用户账号3','用户姓名3','13823888883','维修类型3','维修物品3','报修时间3','故障描述3','upload/weixiujilu_weixiutupian3.jpg,upload/weixiujilu_weixiutupian4.jpg,upload/weixiujilu_weixiutupian5.jpg','故障地点3','维修账号3','维修姓名3','维修身份3','13823888883','2025-03-22 20:46:30','已完成','维修记录3'),(4,'2025-03-22 12:46:30','用户账号4','用户姓名4','13823888884','维修类型4','维修物品4','报修时间4','故障描述4','upload/weixiujilu_weixiutupian4.jpg,upload/weixiujilu_weixiutupian5.jpg,upload/weixiujilu_weixiutupian6.jpg','故障地点4','维修账号4','维修姓名4','维修身份4','13823888884','2025-03-22 20:46:30','已完成','维修记录4'),(5,'2025-03-22 12:46:30','用户账号5','用户姓名5','13823888885','维修类型5','维修物品5','报修时间5','故障描述5','upload/weixiujilu_weixiutupian5.jpg,upload/weixiujilu_weixiutupian6.jpg,upload/weixiujilu_weixiutupian7.jpg','故障地点5','维修账号5','维修姓名5','维修身份5','13823888885','2025-03-22 20:46:30','已完成','维修记录5'),(6,'2025-03-22 12:46:30','用户账号6','用户姓名6','13823888886','维修类型6','维修物品6','报修时间6','故障描述6','upload/weixiujilu_weixiutupian6.jpg,upload/weixiujilu_weixiutupian7.jpg,upload/weixiujilu_weixiutupian8.jpg','故障地点6','维修账号6','维修姓名6','维修身份6','13823888886','2025-03-22 20:46:30','已完成','维修记录6'),(7,'2025-03-22 12:46:30','用户账号7','用户姓名7','13823888887','维修类型7','维修物品7','报修时间7','故障描述7','upload/weixiujilu_weixiutupian7.jpg,upload/weixiujilu_weixiutupian8.jpg,upload/weixiujilu_weixiutupian1.jpg','故障地点7','维修账号7','维修姓名7','维修身份7','13823888887','2025-03-22 20:46:30','已完成','维修记录7'),(8,'2025-03-22 12:46:30','用户账号8','用户姓名8','13823888888','维修类型8','维修物品8','报修时间8','故障描述8','upload/weixiujilu_weixiutupian8.jpg,upload/weixiujilu_weixiutupian1.jpg,upload/weixiujilu_weixiutupian2.jpg','故障地点8','维修账号8','维修姓名8','维修身份8','13823888888','2025-03-22 20:46:30','已完成','维修记录8');
/*!40000 ALTER TABLE `weixiujilu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiuleixing`
--

DROP TABLE IF EXISTS `weixiuleixing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiuleixing` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `weixiuleixing` (`weixiuleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiuleixing`
--

LOCK TABLES `weixiuleixing` WRITE;
/*!40000 ALTER TABLE `weixiuleixing` DISABLE KEYS */;
INSERT INTO `weixiuleixing` VALUES (1,'2025-03-22 12:46:30','维修类型1'),(2,'2025-03-22 12:46:30','维修类型2'),(3,'2025-03-22 12:46:30','维修类型3'),(4,'2025-03-22 12:46:30','维修类型4'),(5,'2025-03-22 12:46:30','维修类型5'),(6,'2025-03-22 12:46:30','维修类型6'),(7,'2025-03-22 12:46:30','维修类型7'),(8,'2025-03-22 12:46:30','维修类型8');
/*!40000 ALTER TABLE `weixiuleixing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiupingjia`
--

DROP TABLE IF EXISTS `weixiupingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiupingjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户姓名',
  `lianxifangshi` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `weixiuleixing` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修类型',
  `weixiufenlei` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修分类',
  `baoxiushijian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '报修时间',
  `guzhangmiaoshu` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障描述',
  `weixiutupian` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修图片',
  `guzhangdidian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障地点',
  `weixiuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修账号',
  `weixiuxingming` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修姓名',
  `weixiushenfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修身份',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `pingjiashijian` datetime DEFAULT NULL COMMENT '评价时间',
  `weixiupingfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修评分',
  `pingjianeirong` longtext COLLATE utf8mb4_unicode_ci COMMENT '评价内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiupingjia`
--

LOCK TABLES `weixiupingjia` WRITE;
/*!40000 ALTER TABLE `weixiupingjia` DISABLE KEYS */;
INSERT INTO `weixiupingjia` VALUES (1,'2025-03-22 12:46:30','用户账号1','用户姓名1','13823888881','维修类型1','维修分类1','报修时间1','故障描述1','upload/weixiupingjia_weixiutupian1.jpg,upload/weixiupingjia_weixiutupian2.jpg,upload/weixiupingjia_weixiutupian3.jpg','故障地点1','维修账号1','维修姓名1','维修身份1','13823888881','2025-03-22 20:46:30','1','评价内容1'),(2,'2025-03-22 12:46:30','用户账号2','用户姓名2','13823888882','维修类型2','维修分类2','报修时间2','故障描述2','upload/weixiupingjia_weixiutupian2.jpg,upload/weixiupingjia_weixiutupian3.jpg,upload/weixiupingjia_weixiutupian4.jpg','故障地点2','维修账号2','维修姓名2','维修身份2','13823888882','2025-03-22 20:46:30','1','评价内容2'),(3,'2025-03-22 12:46:30','用户账号3','用户姓名3','13823888883','维修类型3','维修分类3','报修时间3','故障描述3','upload/weixiupingjia_weixiutupian3.jpg,upload/weixiupingjia_weixiutupian4.jpg,upload/weixiupingjia_weixiutupian5.jpg','故障地点3','维修账号3','维修姓名3','维修身份3','13823888883','2025-03-22 20:46:30','1','评价内容3'),(4,'2025-03-22 12:46:30','用户账号4','用户姓名4','13823888884','维修类型4','维修分类4','报修时间4','故障描述4','upload/weixiupingjia_weixiutupian4.jpg,upload/weixiupingjia_weixiutupian5.jpg,upload/weixiupingjia_weixiutupian6.jpg','故障地点4','维修账号4','维修姓名4','维修身份4','13823888884','2025-03-22 20:46:30','1','评价内容4'),(5,'2025-03-22 12:46:30','用户账号5','用户姓名5','13823888885','维修类型5','维修分类5','报修时间5','故障描述5','upload/weixiupingjia_weixiutupian5.jpg,upload/weixiupingjia_weixiutupian6.jpg,upload/weixiupingjia_weixiutupian7.jpg','故障地点5','维修账号5','维修姓名5','维修身份5','13823888885','2025-03-22 20:46:30','1','评价内容5'),(6,'2025-03-22 12:46:30','用户账号6','用户姓名6','13823888886','维修类型6','维修分类6','报修时间6','故障描述6','upload/weixiupingjia_weixiutupian6.jpg,upload/weixiupingjia_weixiutupian7.jpg,upload/weixiupingjia_weixiutupian8.jpg','故障地点6','维修账号6','维修姓名6','维修身份6','13823888886','2025-03-22 20:46:30','1','评价内容6'),(7,'2025-03-22 12:46:30','用户账号7','用户姓名7','13823888887','维修类型7','维修分类7','报修时间7','故障描述7','upload/weixiupingjia_weixiutupian7.jpg,upload/weixiupingjia_weixiutupian8.jpg,upload/weixiupingjia_weixiutupian1.jpg','故障地点7','维修账号7','维修姓名7','维修身份7','13823888887','2025-03-22 20:46:30','1','评价内容7'),(8,'2025-03-22 12:46:30','用户账号8','用户姓名8','13823888888','维修类型8','维修分类8','报修时间8','故障描述8','upload/weixiupingjia_weixiutupian8.jpg,upload/weixiupingjia_weixiutupian1.jpg,upload/weixiupingjia_weixiutupian2.jpg','故障地点8','维修账号8','维修姓名8','维修身份8','13823888888','2025-03-22 20:46:30','1','评价内容8');
/*!40000 ALTER TABLE `weixiupingjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiurenyuan`
--

DROP TABLE IF EXISTS `weixiurenyuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiurenyuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weixiuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修账号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `weixiuxingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '维修姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年龄',
  `shoujihao` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `weixiujineng` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修技能',
  `weixiushenfen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修身份',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `pquestion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `weixiuzhanghao` (`weixiuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修人员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiurenyuan`
--

LOCK TABLES `weixiurenyuan` WRITE;
/*!40000 ALTER TABLE `weixiurenyuan` DISABLE KEYS */;
INSERT INTO `weixiurenyuan` VALUES (21,'2025-03-22 12:46:30','维修账号1','e10adc3949ba59abbe56e057f20f883e','维修姓名1','男','年龄1','13823888881','维修技能1','宿舍设施维修员','upload/weixiurenyuan_touxiang1.jpg','密保问题1','密保答案1'),(22,'2025-03-22 12:46:30','维修账号2','e10adc3949ba59abbe56e057f20f883e','维修姓名2','男','年龄2','13823888882','维修技能2','宿舍设施维修员','upload/weixiurenyuan_touxiang2.jpg','密保问题2','密保答案2'),(23,'2025-03-22 12:46:30','维修账号3','e10adc3949ba59abbe56e057f20f883e','维修姓名3','男','年龄3','13823888883','维修技能3','宿舍设施维修员','upload/weixiurenyuan_touxiang3.jpg','密保问题3','密保答案3'),(24,'2025-03-22 12:46:30','维修账号4','e10adc3949ba59abbe56e057f20f883e','维修姓名4','男','年龄4','13823888884','维修技能4','宿舍设施维修员','upload/weixiurenyuan_touxiang4.jpg','密保问题4','密保答案4'),(25,'2025-03-22 12:46:30','维修账号5','e10adc3949ba59abbe56e057f20f883e','维修姓名5','男','年龄5','13823888885','维修技能5','宿舍设施维修员','upload/weixiurenyuan_touxiang5.jpg','密保问题5','密保答案5'),(26,'2025-03-22 12:46:30','维修账号6','e10adc3949ba59abbe56e057f20f883e','维修姓名6','男','年龄6','13823888886','维修技能6','宿舍设施维修员','upload/weixiurenyuan_touxiang6.jpg','密保问题6','密保答案6'),(27,'2025-03-22 12:46:30','维修账号7','e10adc3949ba59abbe56e057f20f883e','维修姓名7','男','年龄7','13823888887','维修技能7','宿舍设施维修员','upload/weixiurenyuan_touxiang7.jpg','密保问题7','密保答案7'),(28,'2025-03-22 12:46:30','维修账号8','e10adc3949ba59abbe56e057f20f883e','维修姓名8','男','年龄8','13823888888','维修技能8','宿舍设施维修员','upload/weixiurenyuan_touxiang8.jpg','密保问题8','密保答案8');
/*!40000 ALTER TABLE `weixiurenyuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weixiuzhishiku`
--

DROP TABLE IF EXISTS `weixiuzhishiku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixiuzhishiku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `weixiubiaoti` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '维修标题',
  `fengmian` longtext COLLATE utf8mb4_unicode_ci COMMENT '封面',
  `guzhangbujian` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '故障部件',
  `guzhangyuanyin` longtext COLLATE utf8mb4_unicode_ci COMMENT '故障原因',
  `jiejuefangan` longtext COLLATE utf8mb4_unicode_ci COMMENT '解决方案',
  `weixiuxiangqing` longtext COLLATE utf8mb4_unicode_ci COMMENT '维修详情',
  `fabushijian` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='维修知识库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weixiuzhishiku`
--

LOCK TABLES `weixiuzhishiku` WRITE;
/*!40000 ALTER TABLE `weixiuzhishiku` DISABLE KEYS */;
INSERT INTO `weixiuzhishiku` VALUES (1,'2025-03-22 12:46:30','维修标题1','upload/weixiuzhishiku_fengmian1.jpg,upload/weixiuzhishiku_fengmian2.jpg,upload/weixiuzhishiku_fengmian3.jpg','故障部件1','故障原因1','解决方案1','维修详情1','2025-03-22 20:46:30'),(2,'2025-03-22 12:46:30','维修标题2','upload/weixiuzhishiku_fengmian2.jpg,upload/weixiuzhishiku_fengmian3.jpg,upload/weixiuzhishiku_fengmian4.jpg','故障部件2','故障原因2','解决方案2','维修详情2','2025-03-22 20:46:30'),(3,'2025-03-22 12:46:30','维修标题3','upload/weixiuzhishiku_fengmian3.jpg,upload/weixiuzhishiku_fengmian4.jpg,upload/weixiuzhishiku_fengmian5.jpg','故障部件3','故障原因3','解决方案3','维修详情3','2025-03-22 20:46:30'),(4,'2025-03-22 12:46:30','维修标题4','upload/weixiuzhishiku_fengmian4.jpg,upload/weixiuzhishiku_fengmian5.jpg,upload/weixiuzhishiku_fengmian6.jpg','故障部件4','故障原因4','解决方案4','维修详情4','2025-03-22 20:46:30'),(5,'2025-03-22 12:46:30','维修标题5','upload/weixiuzhishiku_fengmian5.jpg,upload/weixiuzhishiku_fengmian6.jpg,upload/weixiuzhishiku_fengmian7.jpg','故障部件5','故障原因5','解决方案5','维修详情5','2025-03-22 20:46:30'),(6,'2025-03-22 12:46:30','维修标题6','upload/weixiuzhishiku_fengmian6.jpg,upload/weixiuzhishiku_fengmian7.jpg,upload/weixiuzhishiku_fengmian8.jpg','故障部件6','故障原因6','解决方案6','维修详情6','2025-03-22 20:46:30'),(7,'2025-03-22 12:46:30','维修标题7','upload/weixiuzhishiku_fengmian7.jpg,upload/weixiuzhishiku_fengmian8.jpg,upload/weixiuzhishiku_fengmian1.jpg','故障部件7','故障原因7','解决方案7','维修详情7','2025-03-22 20:46:30'),(8,'2025-03-22 12:46:30','维修标题8','upload/weixiuzhishiku_fengmian8.jpg,upload/weixiuzhishiku_fengmian1.jpg,upload/weixiuzhishiku_fengmian2.jpg','故障部件8','故障原因8','解决方案8','维修详情8','2025-03-22 20:46:30');
/*!40000 ALTER TABLE `weixiuzhishiku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `mima` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '年龄',
  `touxiang` longtext COLLATE utf8mb4_unicode_ci COMMENT '头像',
  `mobile` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '手机号',
  `pquestion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密保答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2025-03-22 12:46:30','用户账号1','e10adc3949ba59abbe56e057f20f883e','用户姓名1','男','年龄1','upload/yonghu_touxiang1.jpg','13823888881','密保问题1','密保答案1'),(12,'2025-03-22 12:46:30','用户账号2','e10adc3949ba59abbe56e057f20f883e','用户姓名2','男','年龄2','upload/yonghu_touxiang2.jpg','13823888882','密保问题2','密保答案2'),(13,'2025-03-22 12:46:30','用户账号3','e10adc3949ba59abbe56e057f20f883e','用户姓名3','男','年龄3','upload/yonghu_touxiang3.jpg','13823888883','密保问题3','密保答案3'),(14,'2025-03-22 12:46:30','用户账号4','e10adc3949ba59abbe56e057f20f883e','用户姓名4','男','年龄4','upload/yonghu_touxiang4.jpg','13823888884','密保问题4','密保答案4'),(15,'2025-03-22 12:46:30','用户账号5','e10adc3949ba59abbe56e057f20f883e','用户姓名5','男','年龄5','upload/yonghu_touxiang5.jpg','13823888885','密保问题5','密保答案5'),(16,'2025-03-22 12:46:30','用户账号6','e10adc3949ba59abbe56e057f20f883e','用户姓名6','男','年龄6','upload/yonghu_touxiang6.jpg','13823888886','密保问题6','密保答案6'),(17,'2025-03-22 12:46:30','用户账号7','e10adc3949ba59abbe56e057f20f883e','用户姓名7','男','年龄7','upload/yonghu_touxiang7.jpg','13823888887','密保问题7','密保答案7'),(18,'2025-03-22 12:46:30','用户账号8','e10adc3949ba59abbe56e057f20f883e','用户姓名8','男','年龄8','upload/yonghu_touxiang8.jpg','13823888888','密保问题8','密保答案8');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-24 11:07:15
