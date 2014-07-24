CREATE DATABASE  IF NOT EXISTS `hplydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hplydb`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: hplydb
-- ------------------------------------------------------
-- Server version	5.6.19

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
-- Table structure for table `t_sys_resource`
--

DROP TABLE IF EXISTS `t_sys_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sys_resource` (
  `ID` char(36) NOT NULL,
  `ResCode` varchar(50) DEFAULT NULL,
  `ResName` varchar(50) DEFAULT NULL,
  `Icon` varchar(200) DEFAULT NULL,
  `ResUrl` varchar(500) DEFAULT NULL,
  `ResType` varchar(50) DEFAULT NULL,
  `OrderBy` int(11) DEFAULT '0',
  `ParentID` char(36) DEFAULT NULL,
  `Enabled` int(11) DEFAULT '1',
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_resource`
--

LOCK TABLES `t_sys_resource` WRITE;
/*!40000 ALTER TABLE `t_sys_resource` DISABLE KEYS */;
INSERT INTO `t_sys_resource` VALUES ('07a79289-099b-11e4-8624-080027dbb782','root','系统功能结构',NULL,NULL,NULL,0,'root',1,NULL),('3e34b2b6-06a5-11e4-99f8-6cf049046039',NULL,'系统框架',NULL,NULL,NULL,1,'3e5c52dc-06a5-11e4-99f8-6cf049046039',1,'该模块是整个系统的基础及核心，用于为其他各模块提供统一的接口协议，包括提供统一的人机交互界面，以及数据存储访问管理服务。'),('3e371732-06a5-11e4-99f8-6cf049046039',NULL,'登录认证',NULL,NULL,NULL,2,'3e5c52dc-06a5-11e4-99f8-6cf049046039',1,'该模块提供用户、密码登录验证及安全访问控制功能，登录密码采用非对称加密算法（MD5），防止破坏性攻击，保证系统的访问安全。'),('3e38c710-06a5-11e4-99f8-6cf049046039',NULL,'修改个人信息',NULL,NULL,NULL,3,'3e5c52dc-06a5-11e4-99f8-6cf049046039',1,'为已经登录系统的用户修改自己的个人信息，包括密码的功能。'),('3e3a6287-06a5-11e4-99f8-6cf049046039',NULL,'报表导出',NULL,NULL,NULL,4,'3e5c52dc-06a5-11e4-99f8-6cf049046039',1,'提供报表数据导出功能，可将单项目统计和多项目汇总功能导出成Excel文件。'),('3e3c0dc6-06a5-11e4-99f8-6cf049046039',NULL,'用户管理',NULL,NULL,NULL,1,'9f8fd7da-06a3-11e4-99f8-6cf049046039',1,'该模块提供系统登录帐户信息的管理功能，包括用户的新建，修改及删除，以及用户信息及密码的重置功能。'),('3e3daf8e-06a5-11e4-99f8-6cf049046039',NULL,'角色管理',NULL,NULL,NULL,2,'3e5df6af-06a5-11e4-99f8-6cf049046039',1,'该模块用于新建/修改/删除系统角色，以及为角色授权。'),('3e3f51db-06a5-11e4-99f8-6cf049046039',NULL,'权限控制',NULL,NULL,NULL,3,'3e5df6af-06a5-11e4-99f8-6cf049046039',1,'该模块用于控制其他各业务模块的访问权限，提供基于用户的权限控制管理，通过该模块可以设置每个登录帐户可以访问哪些模块。'),('3e41155e-06a5-11e4-99f8-6cf049046039',NULL,'项目汇总表',NULL,NULL,NULL,1,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现多项目汇总的3张报表，包括按全部、项目部或事业部分别输出报表。'),('3e42e4cb-06a5-11e4-99f8-6cf049046039',NULL,'汇总参数设置',NULL,NULL,NULL,2,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'通过该功能可以设置系统的结算周期，比如指定25日为结算日，则系统所有数据的汇总统计按照上月26日~本月25日的结算周期。'),('3e44ed45-06a5-11e4-99f8-6cf049046039',NULL,'合同项目信息',NULL,NULL,NULL,3,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现合同项目信息功能'),('3e46ee28-06a5-11e4-99f8-6cf049046039',NULL,'合同补充协议',NULL,NULL,NULL,4,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现合同补充协议功能'),('3e4a5617-06a5-11e4-99f8-6cf049046039',NULL,'甲方开票情况',NULL,NULL,NULL,5,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现甲方开票功能，包括审核功能。'),('3e4bf5b2-06a5-11e4-99f8-6cf049046039',NULL,'客户开票情况',NULL,NULL,NULL,6,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现客户开票功能。'),('3e4da43c-06a5-11e4-99f8-6cf049046039',NULL,'收款情况',NULL,NULL,NULL,7,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现收款情况功能。'),('3e4f4136-06a5-11e4-99f8-6cf049046039',NULL,'付款情况',NULL,NULL,NULL,8,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现付款情况功能，包括期间费用报销功能，以及报销比例的设置，报销上限及剩余金额的计算与控制。'),('3e50df95-06a5-11e4-99f8-6cf049046039',NULL,'往来欠款',NULL,NULL,NULL,9,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现往来欠款功能，包括利率的设置，以及利息的计算。'),('3e52735d-06a5-11e4-99f8-6cf049046039',NULL,'型材',NULL,NULL,NULL,10,'3e5f96d2-06a5-11e4-99f8-6cf049046039',1,'按业务需求实现型材功能。'),('3e540ad8-06a5-11e4-99f8-6cf049046039','chop_apply','用章申请',NULL,NULL,NULL,1,'3e6233a7-06a5-11e4-99f8-6cf049046039',1,'由项目部或事业部人员填写用章申请,并提交给财务部审核'),('3e55c97c-06a5-11e4-99f8-6cf049046039','chop_control','用章审批控制',NULL,NULL,NULL,2,'3e6233a7-06a5-11e4-99f8-6cf049046039',1,'财务部对用章申请进行审批,当财务主管外出,可将审批权限委托给财务经理，财务经办人根据审批通过的用章申请进行盖章。'),('3e5789ad-06a5-11e4-99f8-6cf049046039','chop_statistics','用章统计表',NULL,NULL,NULL,3,'3e6233a7-06a5-11e4-99f8-6cf049046039',1,'包括用章的申请各环节的业务控制，以及输出按月的用章统计表。'),('3e591e58-06a5-11e4-99f8-6cf049046039','retrieve','信息检索',NULL,NULL,NULL,1,'3e63c511-06a5-11e4-99f8-6cf049046039',1,'提供按关键字进行信息检索的功能，进行模糊搜索匹配展示信息检索结果。'),('3e5abc88-06a5-11e4-99f8-6cf049046039','input','信息录入',NULL,NULL,NULL,2,'3e63c511-06a5-11e4-99f8-6cf049046039',1,'提供信息管理平台的录入管理功能，包括信息的新建/修改与删除。'),('3e5c52dc-06a5-11e4-99f8-6cf049046039','core','基础平台',NULL,NULL,NULL,1,'07a79289-099b-11e4-8624-080027dbb782',1,NULL),('3e5df6af-06a5-11e4-99f8-6cf049046039','system','系统管理',NULL,NULL,NULL,2,'07a79289-099b-11e4-8624-080027dbb782',1,NULL),('3e5f96d2-06a5-11e4-99f8-6cf049046039','financial','财务核算',NULL,NULL,NULL,3,'07a79289-099b-11e4-8624-080027dbb782',1,NULL),('3e6233a7-06a5-11e4-99f8-6cf049046039','chop','盖章管理',NULL,NULL,NULL,4,'07a79289-099b-11e4-8624-080027dbb782',1,NULL),('3e63c511-06a5-11e4-99f8-6cf049046039','info','信息登记',NULL,NULL,NULL,5,'07a79289-099b-11e4-8624-080027dbb782',1,NULL);
/*!40000 ALTER TABLE `t_sys_resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-15 23:38:30
