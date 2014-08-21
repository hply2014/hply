-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.19 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for hplydb_new
CREATE DATABASE IF NOT EXISTS `hplydb_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hplydb_new`;


-- Dumping structure for table hplydb_new.t_arrears
CREATE TABLE IF NOT EXISTS `t_arrears` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `serial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `arrears_code` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `funds_using` varchar(200) DEFAULT NULL COMMENT '资金使用方',
  `arrears_type` varchar(50) DEFAULT NULL COMMENT '欠款分类',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '金额',
  `offset_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计欠款本金',
  `interest_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '利息额',
  `interest_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '利率',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `arrears_code_UNIQUE` (`arrears_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='07_往来欠款';

-- Dumping data for table hplydb_new.t_arrears: ~12 rows (approximately)
/*!40000 ALTER TABLE `t_arrears` DISABLE KEYS */;
INSERT INTO `t_arrears` (`id`, `serial_id`, `arrears_code`, `project_id`, `funds_using`, `arrears_type`, `pay_type`, `amount`, `offset_amount`, `interest_amount`, `interest_rate`, `bank_account`, `bank_name`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('c950c9f9-b250-4cbc-a724-b631c3b76c97', 1, 'WL-2014-0049', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '', '垫资', '现金', 200000.0000, 0.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:26:43', '2014-08-17 17:26:43', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:26:43', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('31bbce78-61d1-4b2e-b842-c954d2783446', 2, 'WL-2014-0051', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '', '垫资', '现金', 12000.0000, 200000.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:36:21', '2014-08-17 17:36:21', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:36:21', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('591e083d-7f86-43cb-8739-ce49c2842861', 3, 'WL-2014-0052', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '', '垫资', '现金', 12000.0000, 0.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:39:18', '2014-08-17 17:39:17', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:39:17', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('78aee83f-25a0-4b70-b491-8c05f90a6151', 4, 'WL-2014-0055', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '', '投标', '现金', 50000.0000, 262000.0000, 0.0000, 0.0000, '', '', '2014-08-17 17:48:55', '2014-08-17 17:48:54', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:48:54', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('bf356a94-6f5d-40a5-b8f8-3f7c8ec7f180', 5, 'WL-2014-0058', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '', '垫资', '现金', 150000.0000, 412000.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:51:54', '2014-08-17 17:51:54', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:51:54', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('8feb940f-2706-4b5b-927c-f17ae3783be4', 6, 'WL-2014-0059', '9df59274-635c-4369-b03f-22512abd2964', '', '垫资', '支票', 60000.0000, 0.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:54:36', '2014-08-17 17:54:35', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:54:35', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('c6b5536e-518f-4e8d-bb7d-daae4b3f45e5', 7, 'WL-2014-0060', 'b5434155-604a-4540-b06a-f592f4349ff4', '', '垫资', '现金', 7500.0000, 7500.0000, 0.0000, 1.0000, '', '', '2014-08-17 17:57:20', '2014-08-17 17:57:20', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:57:20', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('6679671f-dc9a-448a-b56d-608c96c88078', 8, 'WL-2014-0061', 'b5434155-604a-4540-b06a-f592f4349ff4', '', '投标', '现金', 1200.0000, 8700.0000, 0.0000, 0.0000, '', '', '2014-08-17 18:02:42', '2014-08-17 18:02:41', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:02:41', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('105bbeea-66a3-4a26-827f-b27e91515b18', 9, 'WL-2014-0062', 'b5434155-604a-4540-b06a-f592f4349ff4', '', '垫资', '现金', -50000.0000, 0.0000, 0.0000, 0.0000, '', '', '2014-08-17 18:08:50', '2014-08-17 18:08:49', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:08:49', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('6ec2cdf0-5a6d-4b07-8550-51c68e2a8d94', 10, 'WL-2014-0063', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '', '垫资', '现金', 50000.0000, 50000.0000, 0.0000, 1.0000, '', '', '2014-08-17 18:12:03', '2014-08-17 18:12:02', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:12:02', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('7adbf2b5-23cb-4fc1-89b7-22a2b3bfdeca', 11, 'WL-2014-0064', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '', '押金', '现金', 82087.4000, 0.0000, 0.0000, 0.0000, '', '', '2014-08-17 18:12:56', '2014-08-17 18:12:55', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:12:55', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL),
	('62871580-c7b2-47d1-b966-ecfb5914b587', 12, 'WL-2014-0065', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '', '垫资', '现金', 25000.0000, 75000.0000, 0.0000, 1.0000, '', '', '2014-08-17 18:14:29', '2014-08-17 18:14:29', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:14:29', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL);
/*!40000 ALTER TABLE `t_arrears` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_arrears_interest
CREATE TABLE IF NOT EXISTS `t_arrears_interest` (
  `id` char(36) DEFAULT NULL COMMENT 'uuid序号',
  `serial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `trice` date DEFAULT NULL COMMENT '计息时间',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '计息金额',
  `interest_amount` decimal(20,4) DEFAULT NULL COMMENT '计息基数',
  `pharse` varchar(50) DEFAULT NULL COMMENT '计息期数：201405期',
  `atday` int(11) DEFAULT NULL COMMENT '本期的第几天',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(500) DEFAULT NULL COMMENT '摘要',
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='往来欠款的利息计算明细';

-- Dumping data for table hplydb_new.t_arrears_interest: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_arrears_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_arrears_interest` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_chop
CREATE TABLE IF NOT EXISTS `t_chop` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `chop_code` varchar(50) DEFAULT NULL COMMENT '编号',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `project_code` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `project_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `manager` varchar(20) DEFAULT NULL COMMENT '项目经理',
  `content` varchar(500) DEFAULT NULL COMMENT '主要内容',
  `apply_user` char(36) DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `step1_idea` varchar(200) DEFAULT NULL COMMENT '事业部/项目部审核意见',
  `step1_user` char(36) DEFAULT NULL COMMENT '事业部/项目部审核人',
  `step1_time` datetime DEFAULT NULL COMMENT '事业部/项目部审核时间',
  `step2_idea` varchar(200) DEFAULT NULL COMMENT '财务部审核意见',
  `step2_user` char(36) DEFAULT NULL COMMENT '财务部审核人',
  `step2_time` datetime DEFAULT NULL COMMENT '财务部审核时间',
  `step3_idea` varchar(200) DEFAULT NULL COMMENT '经办人办理结果',
  `step3_user` char(36) DEFAULT NULL COMMENT '经办人',
  `step3_time` datetime DEFAULT NULL COMMENT '经办时间',
  `step_status` varchar(20) DEFAULT NULL COMMENT '流程状态',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='09_盖章管理';

-- Dumping data for table hplydb_new.t_chop: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_chop` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_chop` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_collections
CREATE TABLE IF NOT EXISTS `t_collections` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `ticket_code` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `source_of` varchar(50) DEFAULT NULL COMMENT '款项来源',
  `payment_type` varchar(50) DEFAULT NULL COMMENT '收款方式',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '收款金额',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '收款时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='05_收款情况';

-- Dumping data for table hplydb_new.t_collections: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_collections` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_contract_change
CREATE TABLE IF NOT EXISTS `t_contract_change` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `csa_code` varchar(50) DEFAULT NULL COMMENT '增补协议编号',
  `management_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '管理费率',
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '增减金额',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '增补时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='02_合同补充协议';

-- Dumping data for table hplydb_new.t_contract_change: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_contract_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_contract_change` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_customer_billing
CREATE TABLE IF NOT EXISTS `t_customer_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `invoice_code` varchar(50) DEFAULT NULL COMMENT '发票票号',
  `invoice_type` varchar(50) DEFAULT NULL COMMENT '发票类别',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '发票金额',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开票时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='04_客户开票情况';

-- Dumping data for table hplydb_new.t_customer_billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_customer_billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_customer_billing` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_field_types
CREATE TABLE IF NOT EXISTS `t_field_types` (
  `id` char(36) NOT NULL,
  `field_t01` varchar(50) DEFAULT NULL,
  `field_t02` decimal(20,4) DEFAULT NULL,
  `field_t03` varchar(200) DEFAULT NULL,
  `field_t04` varchar(500) DEFAULT NULL,
  `field_t05` varchar(20) DEFAULT NULL,
  `field_t06` timestamp NULL DEFAULT NULL,
  `field_t07` varchar(100) DEFAULT NULL,
  `field_t08` tinyint(4) DEFAULT NULL,
  `field_t09` smallint(6) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='所有数据类型的测试样表';

-- Dumping data for table hplydb_new.t_field_types: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_field_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_field_types` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_information
CREATE TABLE IF NOT EXISTS `t_information` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `project_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `developer` varchar(200) DEFAULT NULL COMMENT '开发商',
  `epc_corporation` varchar(200) DEFAULT NULL COMMENT '总包单位',
  `variety` varchar(100) DEFAULT NULL COMMENT '品种',
  `total_area` varchar(20) DEFAULT NULL COMMENT '总面积',
  `real_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `identification` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `subscriber` char(36) DEFAULT NULL COMMENT '登记人',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='10_信息登记';

-- Dumping data for table hplydb_new.t_information: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_information` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_party_billing
CREATE TABLE IF NOT EXISTS `t_party_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `invoice_code` varchar(50) DEFAULT NULL COMMENT '发票票号',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '发票金额',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开票时间',
  `tax_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '税率',
  `tax_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应收税金',
  `step1_idea` varchar(100) DEFAULT NULL COMMENT '审核意见',
  `step1_user` char(36) DEFAULT NULL COMMENT '审核人',
  `step1_time` datetime DEFAULT NULL COMMENT '审核时间',
  `step_status` varchar(20) DEFAULT NULL COMMENT '流程状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='03_甲方开票情况';

-- Dumping data for table hplydb_new.t_party_billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_party_billing` DISABLE KEYS */;
INSERT INTO `t_party_billing` (`id`, `project_id`, `invoice_code`, `amount`, `trice`, `tax_rate`, `tax_amount`, `step1_idea`, `step1_user`, `step1_time`, `step_status`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('60379e93-31d9-4357-ab2e-85d5b9cfe1af', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', 'SFK-2014', 150000.0000, '2014-08-17 13:06:38', 3.4000, 0.0000, '同意，审核通过', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 13:06:56', '1', '2014-08-17 13:06:38', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 13:06:55', '96ef9340-e169-4024-b7e5-ca7070b367fa', '首付款', 1, NULL);
/*!40000 ALTER TABLE `t_party_billing` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_payment
CREATE TABLE IF NOT EXISTS `t_payment` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `ticket_code` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `payment_item_id` char(36) DEFAULT NULL COMMENT '付款科目ID',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '付款金额',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '付款时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06_付款情况';

-- Dumping data for table hplydb_new.t_payment: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_payment` DISABLE KEYS */;
INSERT INTO `t_payment` (`id`, `project_id`, `ticket_code`, `pay_type`, `payment_item_id`, `amount`, `bank_account`, `bank_name`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('848e0db3-83ea-4920-a637-7aac38b2f717', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', 'FK-2014-0095', '现金', 'e00dfdf3-4193-476a-9612-b3ae31eefbc4', 1200.0000, '', '', '2014-08-17 17:19:42', '2014-08-17 17:19:41', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:19:41', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL);
/*!40000 ALTER TABLE `t_payment` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_payment_item
CREATE TABLE IF NOT EXISTS `t_payment_item` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '付款科目名称',
  `reimbursement_cap` decimal(20,4) DEFAULT '0.0000' COMMENT '报销比例上限',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06+A_付款科目';

-- Dumping data for table hplydb_new.t_payment_item: ~3 rows (approximately)
/*!40000 ALTER TABLE `t_payment_item` DISABLE KEYS */;
INSERT INTO `t_payment_item` (`id`, `item_name`, `reimbursement_cap`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`) VALUES
	('2762ebb5-a879-4c28-b4bf-28b622ae8011', '差旅费', 1.0000, '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('54bf359d-68d1-4170-8d92-0353d2526325', '期间费用', 2.0000, '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('e00dfdf3-4193-476a-9612-b3ae31eefbc4', '业务招待费', 5.0000, '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0);
/*!40000 ALTER TABLE `t_payment_item` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_profile
CREATE TABLE IF NOT EXISTS `t_profile` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) NOT NULL COMMENT '项目ID',
  `expected_value` decimal(20,4) DEFAULT '0.0000' COMMENT '预计用量',
  `profile_point` varchar(100) DEFAULT NULL COMMENT '型材点',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='08_型材';

-- Dumping data for table hplydb_new.t_profile: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_profile` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_project
CREATE TABLE IF NOT EXISTS `t_project` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_code` varchar(50) NOT NULL COMMENT '项目编号',
  `project_name` varchar(100) NOT NULL COMMENT '项目名称',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `party_name` varchar(100) DEFAULT NULL COMMENT '甲方名称',
  `party_address` varchar(200) DEFAULT NULL COMMENT '甲方地址',
  `manager` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `contract_code` varchar(50) DEFAULT NULL COMMENT '合同号',
  `corperation` varchar(100) DEFAULT NULL COMMENT '合作单位',
  `legal_assignee` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `is_withholding_offsite` tinyint(4) DEFAULT NULL COMMENT '异地代扣代缴',
  `management_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '管理费率',
  `tax_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '税金比率',
  `contract_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同金额',
  `settlement_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '结算金额',
  `duty_paid_time` datetime DEFAULT NULL COMMENT '印花税上交时间',
  `duty_paid_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '印花税上交金额',
  `duty_paid_code` varchar(50) DEFAULT NULL COMMENT '印花税收据编号',
  `capital_occupied` decimal(20,4) DEFAULT '0.0000' COMMENT '占用资金情况',
  `project_status` tinyint(4) DEFAULT NULL COMMENT '项目状态',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0' COMMENT '数据状态，0：草稿/1：正式',
  `management_plan_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应收管理费',
  `tax_plan_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应缴税金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='01_合同项目信息';

-- Dumping data for table hplydb_new.t_project: ~5 rows (approximately)
/*!40000 ALTER TABLE `t_project` DISABLE KEYS */;
INSERT INTO `t_project` (`id`, `project_code`, `project_name`, `organization_id`, `party_name`, `party_address`, `manager`, `contract_code`, `corperation`, `legal_assignee`, `is_withholding_offsite`, `management_rate`, `tax_rate`, `contract_amount`, `settlement_amount`, `duty_paid_time`, `duty_paid_amount`, `duty_paid_code`, `capital_occupied`, `project_status`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`, `management_plan_amount`, `tax_plan_amount`) VALUES
	('3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', 'XM-2014-0139', '再建一个项目', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 1200000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-17 18:10:51', '2014-08-17 18:10:50', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 18:10:50', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL, 43200.0000, 40800.0000),
	('61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', 'XM-2014-0135', '北京的项目一', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 650000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-17 13:11:59', '2014-08-17 13:11:59', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 13:11:59', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL, 23400.0000, 22100.0000),
	('9df59274-635c-4369-b03f-22512abd2964', 'XM-2014-0137', '廊坊的项目', '0ed44f90-0c3a-11e4-9300-001c42328937', '', '', '张三', '', '', '', NULL, 3.6000, 3.4000, 1200000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-17 17:53:53', '2014-08-17 17:53:52', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:53:52', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL, 43200.0000, 40800.0000),
	('b5434155-604a-4540-b06a-f592f4349ff4', 'XM-2014-0138', '好好计算利息的项目', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 1320000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-17 17:56:41', '2014-08-17 17:56:40', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 17:56:40', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL, 47520.0000, 44880.0000),
	('cc7d80bd-93a2-456d-9949-e062301bc7e2', 'XM-2014-0134', '又是一个新项目', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '成七一', '', '', '', NULL, 3.6000, 3.4000, 500000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-17 13:05:39', '2014-08-17 13:05:38', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-17 13:05:38', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0, NULL, 18000.0000, 17000.0000);
/*!40000 ALTER TABLE `t_project` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_project_summary
CREATE TABLE IF NOT EXISTS `t_project_summary` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `serial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录流程号',
  `trice` datetime DEFAULT NULL COMMENT '时间',
  `description` varchar(500) DEFAULT NULL COMMENT '摘要',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `project_code` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `contract_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同金额',
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同调增额',
  `change_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计调增额',
  `settlement_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同结算额',
  `management_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '比率',
  `management_plan_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应收管理费',
  `management_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '实收管理费',
  `management_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计收管理费',
  `management_owe_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '尚欠管理费',
  `party_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '发票金额',
  `party_billing_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计开票',
  `collections_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '收款金额',
  `collections_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计收款',
  `collections_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '回收率',
  `customer_billing_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '发票金额',
  `customer_billing_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计开票',
  `payment_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '支付金额',
  `payment_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计',
  `tax_rate` decimal(20,4) DEFAULT '0.0000' COMMENT '比率',
  `tax_plan_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应缴税金',
  `tax_real_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '已缴税金',
  `tax_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计已缴税金',
  `tax_owe_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '尚欠税金',
  `arrears_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '金额',
  `expected_value` decimal(20,4) DEFAULT '0.0000' COMMENT '预计用量',
  `profile_point` varchar(100) DEFAULT NULL COMMENT '型材点',
  `version` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，数据生成时间',
  `table_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='00_多项目汇总';

-- Dumping data for table hplydb_new.t_project_summary: ~54 rows (approximately)
/*!40000 ALTER TABLE `t_project_summary` DISABLE KEYS */;
INSERT INTO `t_project_summary` (`id`, `serial_id`, `trice`, `description`, `project_id`, `organization_id`, `project_code`, `project_name`, `contract_amount`, `change_amount`, `change_total_amount`, `settlement_amount`, `management_rate`, `management_plan_amount`, `management_real_amount`, `management_total_amount`, `management_owe_amount`, `party_billing_amount`, `party_billing_total_amount`, `collections_amount`, `collections_total_amount`, `collections_rate`, `customer_billing_amount`, `customer_billing_total_amount`, `payment_amount`, `payment_total_amount`, `tax_rate`, `tax_plan_amount`, `tax_real_amount`, `tax_total_amount`, `tax_owe_amount`, `arrears_amount`, `expected_value`, `profile_point`, `version`, `create_time`, `table_name`) VALUES
	('cc7d80bd-93a2-456d-9949-e062301bc7e2', 1, '2014-08-17 13:05:39', '新项目，', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-17 13:05:38', 't_project'),
	('60379e93-31d9-4357-ab2e-85d5b9cfe1af', 2, '2014-08-17 13:06:38', '已审批的甲方开票，首付款', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 150000.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 0.0000, 0.0000, '', 0, '2014-08-17 13:06:55', 't_party_billing'),
	('61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', 3, '2014-08-17 13:11:59', '新项目，', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-17 13:11:59', 't_project'),
	('848e0db3-83ea-4920-a637-7aac38b2f717', 4, '2014-08-17 17:19:42', '新增的付款，', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 0.0000, 0.0000, '', 0, '2014-08-17 17:19:41', 't_payment'),
	('c950c9f9-b250-4cbc-a724-b631c3b76c97', 5, '2014-08-17 17:26:43', '往来欠款，', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 200000.0000, 0.0000, '', 0, '2014-08-17 17:26:43', 't_arrears'),
	('31bbce78-61d1-4b2e-b842-c954d2783446', 6, '2014-08-17 17:36:21', '往来欠款，', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 212000.0000, 0.0000, '', 0, '2014-08-17 17:36:21', 't_arrears'),
	('591e083d-7f86-43cb-8739-ce49c2842861', 7, '2014-08-17 17:39:18', '往来欠款，', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 17:39:17', 't_arrears'),
	('78aee83f-25a0-4b70-b491-8c05f90a6151', 8, '2014-08-17 17:48:55', '往来欠款，', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 262000.0000, 0.0000, '', 0, '2014-08-17 17:48:54', 't_arrears'),
	('bf356a94-6f5d-40a5-b8f8-3f7c8ec7f180', 9, '2014-08-17 17:51:54', '往来欠款，', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 17:51:54', 't_arrears'),
	('9df59274-635c-4369-b03f-22512abd2964', 10, '2014-08-17 17:53:53', '新项目，', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-17 17:53:52', 't_project'),
	('8feb940f-2706-4b5b-927c-f17ae3783be4', 11, '2014-08-17 17:54:36', '往来欠款，', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 17:54:35', 't_arrears'),
	('b5434155-604a-4540-b06a-f592f4349ff4', 12, '2014-08-17 17:56:41', '新项目，', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-17 17:56:40', 't_project'),
	('c6b5536e-518f-4e8d-bb7d-daae4b3f45e5', 13, '2014-08-17 17:57:20', '往来欠款，', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 7500.0000, 0.0000, '', 0, '2014-08-17 17:57:20', 't_arrears'),
	('6679671f-dc9a-448a-b56d-608c96c88078', 14, '2014-08-17 18:02:42', '往来欠款，', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 8700.0000, 0.0000, '', 0, '2014-08-17 18:02:41', 't_arrears'),
	('105bbeea-66a3-4a26-827f-b27e91515b18', 15, '2014-08-17 18:08:50', '往来欠款，', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 18:08:49', 't_arrears'),
	('3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', 16, '2014-08-17 18:10:51', '新项目，', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-17 18:10:50', 't_project'),
	('6ec2cdf0-5a6d-4b07-8550-51c68e2a8d94', 17, '2014-08-17 18:12:03', '往来欠款，', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 50000.0000, 0.0000, '', 0, '2014-08-17 18:12:02', 't_arrears'),
	('7adbf2b5-23cb-4fc1-89b7-22a2b3bfdeca', 18, '2014-08-17 18:12:56', '往来欠款，', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 132087.4000, 0.0000, '', 0, '2014-08-17 18:12:55', 't_arrears'),
	('62871580-c7b2-47d1-b966-ecfb5914b587', 19, '2014-08-17 18:14:29', '往来欠款，', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 18:14:29', 't_arrears'),
	('5e93dc25-2601-11e4-a973-001c42328937', 20, '2014-08-17 23:13:07', '往来欠款，自动计息：##天，计息基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:13:07', 't_arrears'),
	('5e99c2c4-2601-11e4-a973-001c42328937', 21, '2014-08-17 23:13:07', '往来欠款，自动计息：##天，计息基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:13:07', 't_arrears'),
	('5e9b79b5-2601-11e4-a973-001c42328937', 22, '2014-08-17 23:13:07', '往来欠款，自动计息：##天，计息基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:13:07', 't_arrears'),
	('5e9c71fe-2601-11e4-a973-001c42328937', 23, '2014-08-17 23:13:07', '往来欠款，自动计息：##天，计息基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:13:07', 't_arrears'),
	('5e9d8440-2601-11e4-a973-001c42328937', 24, '2014-08-17 23:13:07', '往来欠款，自动计息：##天，计息基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:13:07', 't_arrears'),
	('7370347c-2601-11e4-a973-001c42328937', 25, '2014-08-17 23:13:42', '往来欠款，自动计息：##天，计息基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:13:42', 't_arrears'),
	('7372f7d3-2601-11e4-a973-001c42328937', 26, '2014-08-17 23:13:42', '往来欠款，自动计息：##天，计息基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:13:42', 't_arrears'),
	('737482b6-2601-11e4-a973-001c42328937', 27, '2014-08-17 23:13:42', '往来欠款，自动计息：##天，计息基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:13:42', 't_arrears'),
	('7375d49a-2601-11e4-a973-001c42328937', 28, '2014-08-17 23:13:42', '往来欠款，自动计息：##天，计息基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:13:42', 't_arrears'),
	('7377160c-2601-11e4-a973-001c42328937', 29, '2014-08-17 23:13:42', '往来欠款，自动计息：##天，计息基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:13:42', 't_arrears'),
	('77e1e611-2601-11e4-a973-001c42328937', 30, '2014-08-17 23:13:49', '往来欠款，自动计息：##天，计息基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:13:49', 't_arrears'),
	('77e46927-2601-11e4-a973-001c42328937', 31, '2014-08-17 23:13:49', '往来欠款，自动计息：##天，计息基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:13:49', 't_arrears'),
	('77e5e0a0-2601-11e4-a973-001c42328937', 32, '2014-08-17 23:13:50', '往来欠款，自动计息：##天，计息基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:13:50', 't_arrears'),
	('77e8890d-2601-11e4-a973-001c42328937', 33, '2014-08-17 23:13:50', '往来欠款，自动计息：##天，计息基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:13:50', 't_arrears'),
	('77e9b599-2601-11e4-a973-001c42328937', 34, '2014-08-17 23:13:50', '往来欠款，自动计息：##天，计息基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:13:50', 't_arrears'),
	('e939d884-2603-11e4-a973-001c42328937', 35, '2014-08-17 23:31:19', '往来欠款，自动计息：##天<br/>计息基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:31:19', 't_arrears'),
	('e93dfad7-2603-11e4-a973-001c42328937', 36, '2014-08-17 23:31:19', '往来欠款，自动计息：##天<br/>计息基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:31:19', 't_arrears'),
	('e93ea3ef-2603-11e4-a973-001c42328937', 37, '2014-08-17 23:31:19', '往来欠款，自动计息：##天<br/>计息基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:31:19', 't_arrears'),
	('e93f9a95-2603-11e4-a973-001c42328937', 38, '2014-08-17 23:31:19', '往来欠款，自动计息：##天<br/>计息基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:31:19', 't_arrears'),
	('e9403a26-2603-11e4-a973-001c42328937', 39, '2014-08-17 23:31:19', '往来欠款，自动计息：##天<br/>计息基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:31:19', 't_arrears'),
	('42f4b3d3-2605-11e4-a973-001c42328937', 40, '2014-08-17 23:40:59', '往来欠款，##天，基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:40:59', 't_arrears'),
	('42f6b0c5-2605-11e4-a973-001c42328937', 41, '2014-08-17 23:40:59', '往来欠款，##天，基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:40:59', 't_arrears'),
	('42f74de2-2605-11e4-a973-001c42328937', 42, '2014-08-17 23:40:59', '往来欠款，##天，基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:40:59', 't_arrears'),
	('42f7fca6-2605-11e4-a973-001c42328937', 43, '2014-08-17 23:40:59', '往来欠款，##天，基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:40:59', 't_arrears'),
	('42f8a502-2605-11e4-a973-001c42328937', 44, '2014-08-17 23:40:59', '往来欠款，##天，基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:40:59', 't_arrears'),
	('a62a7613-2605-11e4-a973-001c42328937', 45, '2014-08-17 23:43:46', '往来欠款，##天，基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:43:46', 't_arrears'),
	('a62cbe25-2605-11e4-a973-001c42328937', 46, '2014-08-17 23:43:46', '往来欠款，##天，基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:43:46', 't_arrears'),
	('a62d9241-2605-11e4-a973-001c42328937', 47, '2014-08-17 23:43:46', '往来欠款，##天，基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:43:46', 't_arrears'),
	('a62e2368-2605-11e4-a973-001c42328937', 48, '2014-08-17 23:43:46', '往来欠款，##天，基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:43:46', 't_arrears'),
	('a62ed594-2605-11e4-a973-001c42328937', 49, '2014-08-17 23:43:46', '往来欠款，##天，基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:43:46', 't_arrears'),
	('2c1cc3f1-2607-11e4-a973-001c42328937', 50, '2014-08-17 23:54:40', '往来欠款，##天，基数：#,##.00', '3a57b7d0-bfce-4787-9ead-ac0ecc0437bb', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0139', '再建一个项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 157087.4000, 0.0000, '', 0, '2014-08-17 23:54:40', 't_arrears'),
	('2c20a649-2607-11e4-a973-001c42328937', 51, '2014-08-17 23:54:40', '往来欠款，##天，基数：#,##.00', '61e92fc8-edc4-4e58-b6dd-b8d383f1e3af', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0135', '北京的项目一', 650000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 23400.0000, 0.0000, 0.0000, 23400.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 412000.0000, 0.0000, '', 0, '2014-08-17 23:54:40', 't_arrears'),
	('2c21e828-2607-11e4-a973-001c42328937', 52, '2014-08-17 23:54:40', '往来欠款，##天，基数：#,##.00', '9df59274-635c-4369-b03f-22512abd2964', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0137', '廊坊的项目', 1200000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 43200.0000, 0.0000, 0.0000, 43200.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 60000.0000, 0.0000, '', 0, '2014-08-17 23:54:40', 't_arrears'),
	('2c227c0c-2607-11e4-a973-001c42328937', 53, '2014-08-17 23:54:40', '往来欠款，##天，基数：#,##.00', 'b5434155-604a-4540-b06a-f592f4349ff4', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0138', '好好计算利息的项目', 1320000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 47520.0000, 0.0000, 0.0000, 47520.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, -41300.0000, 0.0000, '', 0, '2014-08-17 23:54:40', 't_arrears'),
	('2c23211f-2607-11e4-a973-001c42328937', 54, '2014-08-17 23:54:40', '往来欠款，##天，基数：#,##.00', 'cc7d80bd-93a2-456d-9949-e062301bc7e2', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0134', '又是一个新项目', 500000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 150000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 1200.0000, 3.4000, 5100.0000, 0.0000, 0.0000, 5100.0000, 12000.0000, 0.0000, '', 0, '2014-08-17 23:54:40', 't_arrears');
/*!40000 ALTER TABLE `t_project_summary` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_authorization
CREATE TABLE IF NOT EXISTS `t_sys_authorization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `resource_id` char(36) DEFAULT NULL COMMENT '资源ID',
  `user_id` char(36) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='13_授权关系';

-- Dumping data for table hplydb_new.t_sys_authorization: ~58 rows (approximately)
/*!40000 ALTER TABLE `t_sys_authorization` DISABLE KEYS */;
INSERT INTO `t_sys_authorization` (`id`, `resource_id`, `user_id`, `create_time`, `create_user`, `version`) VALUES
	('0200bc70-a5a4-4883-b182-62a05f17223c', '5be453c4-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('0361630e-ba65-4891-aa92-097bb86d2aee', '5be49301-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:52', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('160378c2-9bd6-42cf-8df4-1c14e6b96a42', '5bdd3b82-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:16', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1740066b-9d6b-4acd-8515-a1f867d0fae3', 'a5644308-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('19417d69-ef9d-4bdd-bfee-f48350ce6c37', '5be3c313-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1a03df24-3a43-4fb3-a011-5bb46b8322b1', '5be1956c-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:44', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1a7d9ebb-002c-4b3e-ad23-337d9d23c289', '5be33246-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:48', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1aea84e7-e844-4cbb-84e5-913f09b2d1e4', '5be055a9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:42', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('2090d8e1-7a0e-4072-83a9-a92f6cad098e', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:31', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('27dd317d-0fda-4fad-b5b4-1c9d94b2782a', '5be38674-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('2cff95d0-3c1a-44b7-8520-e6fc3330bda7', '5bd9e43d-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 07:40:58', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('3701f71a-9fc2-4399-a255-cff79a6445db', '5bd8b940-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('3b831c83-1119-4be1-afda-98fc240555d5', '5be4f0d5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('4ac32cc5-1c3a-4989-a4a4-0381b40ba895', '70222e65-32e7-451b-ba07-8001e920fa56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-15 19:39:30', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('4bf4c07f-1746-4d50-b8e8-cf4b62c6b1f0', 'a5644308-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:33', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5037dec1-45d7-41f9-92f2-59322a56512a', '5be5788b-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:54', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('560ab635-0c8f-49a5-a8cf-5422e373082e', '5be26834-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:45', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('587207e4-c9de-4026-b897-f7ad7f5bc530', '5bd952a7-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5c2b9847-9f90-4e30-93f2-932535b3fecd', '5bdddcff-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:17', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5daaec66-c6fb-4534-b3ed-5159693ab346', '7c37d393-276a-4551-9c2b-ab9a7ab4704d', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:05:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5dd33977-6f37-43ba-9bf7-8539b8653642', '5bdf11d3-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:19', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('68a4435e-5996-4d9c-b729-83bc8c3a8690', '5bda8270-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:12', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('696b318a-534e-4f80-a953-de9265fb61c3', '5bdc1299-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 20:44:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('70ff449a-5a49-409d-aa12-51e782e931b9', '5be3fdc9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('71d8cd18-24fa-40b4-8e9a-3a7d1728a7b8', '5be49301-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:37', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('75ce35b5-d67e-4215-b572-80481aa628aa', '5be2e82d-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('7e50720c-84cc-48d8-8520-298102dfbd05', '5bde20f9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:18', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('844bdc36-3857-4315-8a59-c8e83d55fa8c', '5bdd3b82-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:44', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('866517d0-9d5e-460f-b2e4-8ad8985e3a7c', '03772c78-a497-40c8-9338-07a835e3f2c1', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 21:53:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('8e010fec-f4bc-48a9-82ad-ffed737454b4', '5be131bc-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('90dc54d0-b511-49d8-8f18-2e9aed363fea', '5bdbd8c0-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:14', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('97cff52e-21b3-448d-a8e9-184646a868ad', '5be2abf8-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('98abea41-aba1-45c8-b98b-d4c9ef7c607f', '5bdcfa83-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('9d2933b1-750d-4435-81b7-08b171c1d550', '5be536f5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:54', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('9e307ba3-1d9e-4965-b8bc-e7fd74d94f77', '5be453c4-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:51', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('a5018595-1b3d-4c50-a6b3-2ecf69f8965b', '5bd84fbf-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:05', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('a6f90f45-d76a-4a12-b29e-1a6a6dad3e42', '03772c78-a497-40c8-9338-07a835e3f2c1', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('a76f5e9f-6d9d-4e42-b8df-70c92eeee353', '5bda33d9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:11', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ab35c44c-1900-4f48-9894-59b52c8eb80a', 'a5644308-1a00-11e4-a01a-001c42328939', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-06 23:34:22', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b2b7eb48-c766-4476-8cb8-97a7d884cfca', '5bdb83c8-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b2f71c83-6c6a-41bf-b92a-d36cb83a21b4', '5be5b341-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:55', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b3134283-1756-4cce-a5e5-430fde28c85b', '5bdf4a76-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:23', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('be4df5c8-93ba-417e-867b-9b6cd6dbc7a7', '5be01fb5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:42', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c0dd2fcb-dc93-401b-b2ce-084c0901b4a6', '5be64de5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:58', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c38eb4ea-2d86-4e5b-91c2-ae197d307137', '7c37d393-276a-4551-9c2b-ab9a7ab4704d', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c73cd940-2f65-4de7-99a0-622f0bd65903', '5bd90b40-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ca357851-2067-47d6-baee-7905f566607e', '5bdbd8c0-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('d653d6d1-fa91-4c13-820b-417788715da6', '5bd90b40-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:30', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('da00f7b5-6095-4149-889f-d17c7328e3b8', '5bd99809-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:09', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e0fb6621-1f3a-4de0-b182-1be7a2078b4a', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e5ca09df-1b4e-4330-8716-62bead3ac30c', '5bd9e43d-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e6a97c8f-27c8-4303-8d27-c03b1526f961', '5bdcfa83-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e7d94d85-01aa-468c-8c19-dc27a7d192d7', 'a5644308-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:04', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e9b34ee1-7a3e-4d3e-b703-ba9ec91d9ca2', '5be64de5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 21:54:02', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ec2cef47-e1f5-4834-af2b-ec0524550353', '5bdc8dba-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:14', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('f25a8936-4d83-40b7-862f-ecc640288b66', '5bdb83c8-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:13', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('f79f44a0-6b9d-4690-8616-067a60cd8643', '5be60849-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('fb6aae17-50d1-4dfe-a83a-bc4a123cc475', '5bdcc171-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 20:44:45', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0);
/*!40000 ALTER TABLE `t_sys_authorization` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_organization
CREATE TABLE IF NOT EXISTS `t_sys_organization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11+A_组织机构';

-- Dumping data for table hplydb_new.t_sys_organization: ~3 rows (approximately)
/*!40000 ALTER TABLE `t_sys_organization` DISABLE KEYS */;
INSERT INTO `t_sys_organization` (`id`, `organization_name`, `create_time`, `description`, `version`) VALUES
	('0ed38235-0c3a-11e4-9300-001c42328937', '事业部', '2014-07-16 00:07:02', NULL, 0),
	('0ed44f90-0c3a-11e4-9300-001c42328937', '项目部', '2014-07-16 00:07:02', NULL, 0),
	('0ed4d3a1-0c3a-11e4-9300-001c42328937', '财务部', '2014-07-16 00:07:02', NULL, 0);
/*!40000 ALTER TABLE `t_sys_organization` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_parameter
CREATE TABLE IF NOT EXISTS `t_sys_parameter` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `en_name` varchar(100) DEFAULT NULL COMMENT '参数英文名称',
  `cn_name` varchar(100) DEFAULT NULL COMMENT '参数中文名称',
  `param_value` varchar(500) DEFAULT NULL COMMENT '参数值',
  `default_value` varchar(500) DEFAULT NULL COMMENT '默认值',
  `is_inner` bit(1) DEFAULT NULL COMMENT '是否系统内置',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enname` (`en_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='14_系统参数';

-- Dumping data for table hplydb_new.t_sys_parameter: ~18 rows (approximately)
/*!40000 ALTER TABLE `t_sys_parameter` DISABLE KEYS */;
INSERT INTO `t_sys_parameter` (`id`, `en_name`, `cn_name`, `param_value`, `default_value`, `is_inner`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`) VALUES
	('0b8f1d89-8655-463a-97be-b8b033d29a8c', 'collections_code', '收款凭证号', '70', 'SK', b'0', '2014-08-08 23:47:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-17 13:13:26', 'mysql.get_next_code', 'SK-2014-0001', 4),
	('12bad01d-9282-44a1-9186-04f7ee7a0078', 'chop_code', '用章申请编号', '8', 'YZ', b'0', '2014-08-05 23:12:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-17 17:21:02', 'mysql.get_next_code', 'YZ-2014-0001', 4),
	('1fdae036-8ba5-4ad5-ad43-e68e38eda5e0', 'arrears_code', '往来欠款凭证号', '101', 'WL', b'0', '2014-08-08 23:52:38', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-17 23:54:40', 'mysql.get_next_code', 'WL-2014-0001', 0),
	('22085fc7-5804-4cbb-8940-afeda443a20f', 'pay_types', '支付方式', '现金/银行转帐/汇款/支票/汇票/其他 ', '现金/银行转帐/汇款/支票/汇票/其他 ', b'0', '2014-08-08 23:34:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '收款/付款/往来欠款中使用', 2),
	('2b0dce39-561a-42a8-835c-f488a6a63945', 'payment_code', '付款凭证号', '96', 'FK', b'0', '2014-08-08 23:51:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-17 17:19:45', 'mysql.get_next_code', 'FK-2014-0001', 0),
	('2f0a2f68-097f-11e4-a5cb-080027dbb782', 'appname', '应用名称', '工程项目核算系统', '工程项目核算系统', b'1', '2014-07-12 12:55:06', NULL, '2014-07-12 12:55:06', NULL, NULL, 0),
	('454bc450-6bd1-434b-af64-2f7b402aaccb', 'project_code', '项目编号', '139', 'XM', b'0', '2014-08-05 23:07:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-17 18:10:17', 'mysql.get_next_code', 'XM-2014-0001', 10),
	('4fd3df1e-145a-4d39-8164-679f555961fb', 'default_tax_rate', '默认税率', '3.4', '3.4', b'0', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('4fe8fe7f-097f-11e4-a5cb-080027dbb782', 'appversion', '应用版本号', 'V1.0', 'V1.0', b'1', '2014-07-12 12:56:02', NULL, '2014-07-12 12:56:02', NULL, NULL, 0),
	('5f9ddb3d-db23-4804-b5c8-bcee97364626', 'default_manager_rate', '默认管理费率', '3.6', '3.6', b'0', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('6e053860-097f-11e4-a5cb-080027dbb782', 'apppublishtime', '应用发布时间', '2014年8月12日', '2014年8月12日', b'1', '2014-07-12 12:56:52', NULL, '2014-08-05 22:45:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 2),
	('75b571d1-0629-4485-8fbf-c42ec95429a3', 'interest_rate', '默认月利率', '1', '1', b'0', '2014-08-16 21:41:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-16 21:41:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '往来欠款垫资默认月利率：1%', 0),
	('7b7cd4d0-acc2-4d0d-9a2b-d07659eef930', 'billing_types', '发票分类', '材料/劳务/其他', '材料/劳务/其他', b'0', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('8c6a8f67-26b7-11e4-b1a1-0021ccd107f8', 'proc_calc_all_interest', NULL, 'running', NULL, NULL, '2014-08-18 17:10:50', NULL, '2014-08-18 17:10:50', NULL, NULL, 0),
	('93fa58ac-188c-4b08-8afc-cbf0ce3b18bd', 'cc_code', '补充协议编号', '37', 'BC', b'0', '2014-08-05 23:09:18', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-16 22:28:03', 'mysql.get_next_code', 'BC-2014-0001', 4),
	('d8186e7b-ecf4-4e54-a18c-986513d78c30', 'project_status', '项目状态', '进行中/已暂停/已结算/已归档', '进行中/已暂停/已结算/已归档', NULL, '2014-08-05 22:00:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:14:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1),
	('ea2dc602-0c58-40d6-b7f7-cbc2b33e6a67', 'source_of', '款项来源', '工程款/税金/管理费/利息/其他', '工程款/税金/管理费/利息/其他', b'0', '2014-08-08 23:35:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:36:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '在收款情况中', 1),
	('ed8f1310-a315-4fe1-af52-a44974903a13', 'arrears_type', '往来欠款分类', '垫资/投标/押金/其他', '垫资/投标/押金/其他', b'0', '2014-08-16 21:40:48', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-16 21:42:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '其中只有“垫资”收利息', 1);
/*!40000 ALTER TABLE `t_sys_parameter` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_resource
CREATE TABLE IF NOT EXISTS `t_sys_resource` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `res_code` varchar(50) DEFAULT NULL COMMENT '资源编码',
  `res_name` varchar(200) DEFAULT NULL COMMENT '图标路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `res_url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `res_type` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `order_by` smallint(6) DEFAULT NULL COMMENT '顺序号',
  `parent_id` char(36) DEFAULT NULL COMMENT '父ID',
  `enabled` smallint(6) DEFAULT NULL COMMENT '是否禁用',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `allow_access_uri` varchar(1000) DEFAULT NULL COMMENT '可访问的URI',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12_系统资源';

-- Dumping data for table hplydb_new.t_sys_resource: ~38 rows (approximately)
/*!40000 ALTER TABLE `t_sys_resource` DISABLE KEYS */;
INSERT INTO `t_sys_resource` (`id`, `res_code`, `res_name`, `icon`, `res_url`, `res_type`, `order_by`, `parent_id`, `enabled`, `description`, `version`, `allow_access_uri`) VALUES
	('03772c78-a497-40c8-9338-07a835e3f2c1', NULL, '资源管理', NULL, '/sysresource', 'navigation', 495, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, NULL, 0, NULL),
	('5bd84fbf-1a00-11e4-a01a-001c42328937', '``', '财务核算', NULL, '', 'navigation', 10, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bd8b940-1a00-11e4-a01a-001c42328937', '`projectsummary`', '项目汇总表', NULL, '/projectsummary', 'navigation', 20, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '允许查看多项目汇总表。', 0, NULL),
	('5bd90b40-1a00-11e4-a01a-001c42328937', '`project`', '合同项目信息', NULL, '/project', 'navigation', 30, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bd952a7-1a00-11e4-a01a-001c42328937', '`project_create`', '新建', '', '/project/create', 'action', 40, '5bd90b40-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bda33d9-1a00-11e4-a01a-001c42328937', '`contractchange`', '合同补充协议', NULL, '/contractchange', 'navigation', 70, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bda8270-1a00-11e4-a01a-001c42328937', '`contractchange_create`', '新建', '', '/contractchange/create', 'action', 80, '5bda33d9-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bdb83c8-1a00-11e4-a01a-001c42328937', '`partybilling`', '甲方开票情况', NULL, '/partybilling', 'navigation', 110, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bdbd8c0-1a00-11e4-a01a-001c42328937', '`partybilling_create`', '申请', '', '/partybilling/create', 'action', 120, '5bdb83c8-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bdc8dba-1a00-11e4-a01a-001c42328937', '`partybilling_step1`', '审核', '', '/partybilling/modify', 'action', 140, '5bdb83c8-1a00-11e4-a01a-001c42328937', NULL, '', 1, NULL),
	('5bdcfa83-1a00-11e4-a01a-001c42328937', '`customerbilling`', '客户开票情况', NULL, '/customerbilling', 'navigation', 160, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bdd3b82-1a00-11e4-a01a-001c42328937', '`customerbilling_create`', '新建', '', '/customerbilling/create', 'action', 170, '5bdcfa83-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bdddcff-1a00-11e4-a01a-001c42328937', '`collections`', '收款情况', NULL, '/collections', 'navigation', 200, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bde20f9-1a00-11e4-a01a-001c42328937', '`collections_create`', '新建', '', '/collections/create', 'action', 210, '5bdddcff-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bdf11d3-1a00-11e4-a01a-001c42328937', '`payment`', '付款情况', NULL, '/payment', 'navigation', 240, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bdf4a76-1a00-11e4-a01a-001c42328937', '`payment_create`', '新建', '', '/payment/create', 'action', 250, '5bdf11d3-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5be01fb5-1a00-11e4-a01a-001c42328937', '`arrears`', '往来欠款', NULL, '/arrears', 'navigation', 280, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5be055a9-1a00-11e4-a01a-001c42328937', '`arrears_create`', '新建', '', '/arrears/create', 'action', 290, '5be01fb5-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5be131bc-1a00-11e4-a01a-001c42328937', '`profile`', '型材', NULL, '/profile', 'navigation', 320, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5be1956c-1a00-11e4-a01a-001c42328937', '`profile_create`', '新建', NULL, '', 'action', 330, '5be131bc-1a00-11e4-a01a-001c42328937', -3, '仅允许新建操作，不能对数据进行修改和删除。', 0, NULL),
	('5be26834-1a00-11e4-a01a-001c42328937', '`chop`', '盖章管理', NULL, '/chop', 'navigation', 360, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '此权限可查看盖章申请记录', 0, NULL),
	('5be2abf8-1a00-11e4-a01a-001c42328937', '`chop_create`', '用章申请', NULL, '/chop', 'navigation', 370, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 0, NULL),
	('5be2e82d-1a00-11e4-a01a-001c42328937', '`chop_check1`', '用章部门审核', NULL, '', 'action', 380, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '申请所在部门负责人审核', 0, NULL),
	('5be33246-1a00-11e4-a01a-001c42328937', '`chop_check2`', '财务审核', NULL, '', 'action', 390, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '财务部审核，此权限同时拥有审核委托权限，即可将审核权限委托给其他人。', 0, NULL),
	('5be38674-1a00-11e4-a01a-001c42328937', '`chop_check3`', '财务审核委托', NULL, '', 'action', 400, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '接收财务用章审核委托。', 0, NULL),
	('5be3c313-1a00-11e4-a01a-001c42328937', '`chop_check4`', '用章办理', NULL, '', 'action', 410, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '财务审核通过后，进行用章办理盖章的操作。', 0, NULL),
	('5be3fdc9-1a00-11e4-a01a-001c42328937', '`chopsummary`', '用章统计', NULL, '/chop/summary', 'navigation', 420, '5be26834-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5be453c4-1a00-11e4-a01a-001c42328937', '`information`', '信息登记', NULL, '/information', 'navigation', 430, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5be49301-1a00-11e4-a01a-001c42328937', '`information_view`', '检索', NULL, '/information', 'action', 440, '5be453c4-1a00-11e4-a01a-001c42328937', NULL, '允许检索信息', 0, NULL),
	('5be4f0d5-1a00-11e4-a01a-001c42328937', '`information_create`', '录入', NULL, '', 'action', 450, '5be453c4-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 0, NULL),
	('5be536f5-1a00-11e4-a01a-001c42328937', '`information_manage`', '管理', NULL, '', 'action', 460, '5be453c4-1a00-11e4-a01a-001c42328937', NULL, '允许创建，修改及删除数据。', 0, NULL),
	('5be5788b-1a00-11e4-a01a-001c42328937', '``', '系统管理', NULL, '', 'navigation', 470, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5be5b341-1a00-11e4-a01a-001c42328937', '`sysuser`', '用户管理', NULL, '/sysuser', 'navigation', 480, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, '系统用户的创建，修改，删除，以及重置密码', 0, NULL),
	('5be60849-1a00-11e4-a01a-001c42328937', '`sysorganization`', '部门管理', NULL, '/sysorganization', 'navigation', 490, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, '部门的创建，修改及删除', 0, NULL),
	('5be64de5-1a00-11e4-a01a-001c42328937', '`sysparameter`', '参数设置', NULL, '/sysparameter', 'navigation', 500, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, '系统参数的设置', 0, NULL),
	('70222e65-32e7-451b-ba07-8001e920fa56', '`project_modify`', '修改', '', '', 'action', 50, '5bd90b40-1a00-11e4-a01a-001c42328937', NULL, '', 3, NULL),
	('7c37d393-276a-4551-9c2b-ab9a7ab4704d', '`payment-item`', '付款科目设置', '', '/paymentitem', 'action', NULL, '5bdf11d3-1a00-11e4-a01a-001c42328937', NULL, '', 2, NULL),
	('a5644308-1a00-11e4-a01a-001c42328937', '', '系统功能结构', '', '/', 'navigation', NULL, 'root', NULL, '整个系统的根地址', 1, NULL);
/*!40000 ALTER TABLE `t_sys_resource` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_user
CREATE TABLE IF NOT EXISTS `t_sys_user` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登陆名',
  `real_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '最后登陆IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `fails` smallint(6) DEFAULT NULL COMMENT '连续登录失败次数',
  `logined` smallint(6) DEFAULT NULL COMMENT '登陆总次数',
  `position` varchar(50) DEFAULT NULL COMMENT '职务',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否禁用',
  `order_by` tinyint(4) DEFAULT NULL COMMENT '顺序号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `update_user` char(36) DEFAULT NULL COMMENT '修改用户',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `must_change_password` bit(1) DEFAULT NULL COMMENT '下次登录是否必须修改密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_loginName` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11_系统用户';

-- Dumping data for table hplydb_new.t_sys_user: ~13 rows (approximately)
/*!40000 ALTER TABLE `t_sys_user` DISABLE KEYS */;
INSERT INTO `t_sys_user` (`id`, `login_name`, `real_name`, `organization_id`, `password`, `last_login_ip`, `last_login_time`, `fails`, `logined`, `position`, `enabled`, `order_by`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `must_change_password`) VALUES
	('96ef9340-e169-4024-b7e5-ca7070b367fa', 'cqiyi', '成七一', '0ed44f90-0c3a-11e4-9300-001c42328937', '5be9a0e6cd0e287f09555a88abcca799803d66864b24f9ccf107f0030686cfdb', '10.211.55.3', '2014-08-17 23:28:48', 0, 9, '系统管理员', b'1', 20, '2014-08-03 10:18:48', '', '2014-08-17 23:28:47', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 20, b'0'),
	('a5bd3318-0c3a-11e4-9300-001c42328937', 'dujuan', '杜鹃', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'e06de91cb32695c121dc9e1315e9fb9c148dd8a4428f57c88154ed3af229b88a', '', NULL, 0, 0, '财务总监', b'1', 1, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 17, b'0'),
	('a5bf7c7c-0c3a-11e4-9300-001c42328937', 'zhangmeng', '张梦', '0ed4d3a1-0c3a-11e4-9300-001c42328937', '2294ae17936ae620d46f9936f0a6896fe5375eb8b61059953edb32fb70b6313f', '10.211.55.3', '2014-08-17 17:02:08', 0, 128, '财务经理，系统管理员', b'1', 2, '2014-07-16 00:11:15', '', '2014-08-17 17:02:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 146, b'0'),
	('a5bff42c-0c3a-11e4-9300-001c42328937', 'liuyuecui', '刘月翠', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'cc05a176aa0e3749ce79446536ad79805d160335d704814458dc2a1c4c522194', '', NULL, 0, 0, '财务核算员', b'1', 3, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 6, b'0'),
	('a5c05eb4-0c3a-11e4-9300-001c42328937', 'wangshuyan', '王书岩', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'f3cf3189f7bfb93ff9c31fa7881b76f392e4db0b7ff2ac80f200eb257b19231d', '', NULL, 0, 0, '盖章经办人', b'1', 4, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 6, b'0'),
	('a5c0b286-0c3a-11e4-9300-001c42328937', 'yangdeyou', '杨德友', '0ed44f90-0c3a-11e4-9300-001c42328937', '75d047f5e6b209ac13eee44de719f63c8c21bcc914bc653f05f5a7ef939a9a66', NULL, NULL, NULL, NULL, '项目部负责人', b'1', 5, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 7, b'1'),
	('a5c10025-0c3a-11e4-9300-001c42328937', 'wangyong', '王勇', '0ed44f90-0c3a-11e4-9300-001c42328937', 'a69dbd0d57a553412549024460449b002668fdf1c4213d2ea0efa0ad115323c6', '10.211.55.3', '2014-08-06 22:23:35', 0, 3, '项目部操作员', b'1', 6, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 14, b'0'),
	('a5c14c0b-0c3a-11e4-9300-001c42328937', 'xiadongyan', '夏冬燕', '0ed44f90-0c3a-11e4-9300-001c42328937', 'e0538b2fc407adf50acebd114b01bfc626241a0c9e716721cb39b14a8b1b9f11', NULL, NULL, NULL, NULL, '项目部操作员', b'1', 7, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 7, b'0'),
	('a5c18a31-0c3a-11e4-9300-001c42328937', 'zhangyan', '张岩', '0ed44f90-0c3a-11e4-9300-001c42328937', '2bb29ffc67276ee21d6c93497632b9333b728a9160351c7118c5f1047a98510d', NULL, NULL, 0, 0, '项目部操作员', b'1', 8, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 8, b'0'),
	('a5c1c216-0c3a-11e4-9300-001c42328937', 'wangpeng', '王鹏', '0ed44f90-0c3a-11e4-9300-001c42328937', '6fc4400c318ebcdc36a9f2d126dbd293cfa323cd5c64f9aebe57c79be810fa5d', NULL, NULL, NULL, NULL, '项目部操作员', b'1', 9, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 8, b'0'),
	('a5c2073b-0c3a-11e4-9300-001c42328937', 'wangyouqing', '王有青', '0ed38235-0c3a-11e4-9300-001c42328937', '12dbc56c4d13ac7b7d155f58f77cf70dd16da847ff495c2007932ce5db32c448', '', NULL, 0, 0, '事业部负责人', b'1', 10, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 6, b'0'),
	('a5c25820-0c3a-11e4-9300-001c42328937', 'zhoukai', '周楷', '0ed38235-0c3a-11e4-9300-001c42328937', '8b2b1b77ca1624e9e5d2133d20930aced57f9177edde39d9f37b4a854046faa5', '', NULL, 0, 0, '项目部操作员', b'1', 11, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 6, b'0'),
	('a5c299fc-0c3a-11e4-9300-001c42328937', 'wangjiaxin', '王佳鑫', '0ed38235-0c3a-11e4-9300-001c42328937', '198fb392bc37b94d43a162e586df478fd63fdd4d04dfa5c15d6633c84d84b42f', '', NULL, 0, 0, '项目部操作员', b'1', 12, '2014-07-16 00:11:15', '', '2014-08-17 11:12:34', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 6, b'0');
/*!40000 ALTER TABLE `t_sys_user` ENABLE KEYS */;


-- Dumping structure for procedure hplydb_new.proc_calc_all_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_all_interest`()
    COMMENT '计算往来欠款的利息'
proc: BEGIN
	-- 本程序每月20日凌晨3:00自动启动，如果过期未执行，则在第一次系统启动时执行，始终计算截至最近上一周期的20日的利息。
  	
  	declare const_interest_day int default 20;  -- 默认结息日为每月的20日
  
  	declare current_interest_day date;  -- 本次结息日
  	declare prior_interest_day date; -- 上次计息日
  	declare _project_id char(36);  -- 项目ID
  	declare _trice datetime;    -- 时间点
  	declare _month_days int; -- 上月的总天数
  	declare _days int;  -- 天数
  	declare _rcount int;  -- 记录行数
  	
  	declare _serial_id int default -1;
  	
  	declare _amount decimal(20, 4) default 0.0;
  	declare _offset_amount decimal(20, 4) default 0.0;
  	declare _offset_amount2 decimal(20, 4) default 0.0;
  	declare _interest_amount decimal(20, 4) default 0.0;
  	declare _interest_rate decimal(20, 4) default 0.0;  	
  	declare eof bit default 0; -- 定义游标的结束符
  	
  	declare exec_status varchar(100);  -- 过程执行状态
  
  	-- 准备遍历所有包含计息款项的项目ID
  	declare cur_for_project cursor for select distinct project_id from t_arrears where project_id is not null and interest_rate > 0;
  	declare continue handler for not found set eof = 1;  
  
  	set exec_status = get_param_value('proc_calc_all_interest');
  	-- TODO：检测如果正在执行，则退出。
  	if exec_status = 'running' then
		-- TODO 记录日志
		select '发现本过程正在执行，中途退出。';
    	leave	proc;
  	end if;
  
  	-- 开始执行，记录日志
  	call proc_set_param_value('proc_calc_all_interest', 'running');
  	
  	-- 获取默认月利率
  	set _interest_rate = get_param_value('interest_rate')/100;
  
  	-- 计算本次结息日，如果现在在20日之前，则上月20日为结息日， 否则本月20日为结息日
  	set current_interest_day = date_add(curdate(),interval - day(curdate()) + const_interest_day day);
  	if current_interest_day > now() then
    	set current_interest_day = current_interest_day + interval -1 month;
  	end if;
  	-- 计算上月的总天数
	set _month_days = day(last_day(current_interest_day + interval -1 month));
  
  	open cur_for_project;
  
  	top2: loop
    	fetch cur_for_project into _project_id;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top2;
    	end if;
    	
    	-- 1. 没有计息费用，略过该项目，进行下次循环
    	select count(*) into _rcount from t_arrears where project_id = _project_id and interest_rate > 0 and amount > 0;
    	if _rcount <= 0 then
    		iterate top2;
    	end if;
    	
    	-- 计算上次计息基数，若没有，则为0，计息数据version=9001
    	select serial_id, offset_amount into _serial_id, _offset_amount from t_arrears where serial_id=(select max(serial_id) from t_arrears where project_id=in_project_id and version = 9001);
	
	
    	-- 2. 最近一月计息记录未发生变化
    	select count(*) into _rcount from t_arrears where project_id = _project_id and interest_rate > 0 and version != 9000;
    	if _rcount <= 0 then
    		if _offset_amount > 0 then
    			-- 上次计息基数 > 0，尚有历史未还完的借款，sum(上月天数）
    			set _amount = _offset_amount * _month_days;
    			call proc_set_interest(_project_id, _offset_amount, _amount * _interest_rate, concat('天数：', _month_days, '，计息基数：', _amount));
    		end if;
    		iterate top2;
    	end if;
    	
    	-- 3. 最近一月发生了计息费用
    	
    	
    	-- 从上次结息日开始计算
  		set prior_interest_day = current_interest_day + interval -1 month;  
    	
    	-- 计算上次计息基数，若没有，则为0，计息数据version=9001
    	select serial_id, offset_amount into _serial_id, _offset_amount from t_arrears where serial_id=(select max(serial_id) from t_arrears where project_id=in_project_id and version=9001);
	
    
		set _days = 0;
		set _amount = _offset_amount;		
		
		-- 计算自上次结息日后，的最近一次计息费用
		select serial_id, trice, offset_amount into _serial_id, _trice, _offset_amount2 from t_arrears where project_id = in_project_id and serial_id > _serial_id and interest_rate > 0 and amount > 0 limit 1;
		
		
		
    	while prior_interest_day <= current_interest_day do
    		if  prior_interest_day = _trice then	
    			-- 当天有笔计息费用
				select serial_id, trice, offset_amount into _serial_id, _trice, _offset_amount2 from t_arrears where project_id = in_project_id and serial_id > _serial_id and interest_rate > 0 and amount > 0 limit 1;		
    		else
    			set _offset_amount = _offset_amount + _amount;
    		end if;
    	
    		set prior_interest_day = date_add(prior_interest_day, interval + 1 day);
  			set _days = _days +1;
    	end while;
    
    
    	insert into `t_arrears` 
			(`id`, 
			`arrears_code`, 
			`project_id`, 
			`funds_using`, 
			`arrears_type`, 
			`pay_type`, 
			`amount`, 
			`offset_amount`, 
			`interest_amount`, 
			`interest_rate`, 
			`bank_account`, 
			`bank_name`, 
			`trice`, 
			`create_time`, 
			`create_user`, 
			`update_time`, 
			`update_user`, 
			`description`, 
			`version`, 
			`status`) 
		values
			(/*id*/ uuid(), 
			/*arrears_code*/ get_next_code('arrears_code'), 
			/*project_id*/ _project_id, 
			/*funds_using*/ '', 
			/*arrears_type*/ '自动计息', 
			/*pay_type*/ '利息', 
			/*amount*/ 0.0000,  
			/*offset_amount*/ 0.0000, 
			/*interest_amount*/ 0.0000, 
			/*interest_rate*/ 0.0000, 
			/*bank_account*/ 0.0000, 
			/*bank_name*/ '', 
			/*trice*/ now(), 
			/*create_time*/ now(), 
			/*create_user*/ '', 
			/*update_time*/ now(), 
			/*update_user*/ '', 
			/*description*/ '##天，基数：#,##.00', 
			/*version*/ 9000, 
			/*status`*/ NULL);
    
    	-- select _id, _project_id, _amount, _interest_amount, _interest_rate, _trice;
    	-- update t_arrears set description = '计算过了' where id=_id;
    
    	update t_arrears set `version` = 300, description = concat(description, '，利息已结转') where project_id=_project_id and version != 9000 and amount > 0 and ifnull(interest_rate, 0) > 0 and trice < current_interest_day;
  	end loop top2;
  
  	close cur_for_project;
  	call proc_set_param_value('proc_calc_all_interest', 'finished');
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_set_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_set_interest`(IN `_project_id` varCHAR(50), IN `_offset_amount` deCIMAL(20,4), IN `_interest_amount` deCIMAL(20,4), IN `_description` varchar(100))
    COMMENT '写入自动计息数据'
BEGIN
    	insert into `t_arrears` 
			(`id`, 
			`arrears_code`, 
			`project_id`, 
			`funds_using`, 
			`arrears_type`, 
			`pay_type`, 
			`amount`, 
			`offset_amount`, 
			`interest_amount`, 
			`interest_rate`, 
			`bank_account`, 
			`bank_name`, 
			`trice`, 
			`create_time`, 
			`create_user`, 
			`update_time`, 
			`update_user`, 
			`description`, 
			`version`, 
			`status`) 
		values
			(/*id*/ uuid(), 
			/*arrears_code*/ get_next_code('arrears_code'), 
			/*project_id*/ _project_id, 
			/*funds_using*/ '', 
			/*arrears_type*/ '自动计息', 
			/*pay_type*/ '利息', 
			/*amount*/ 0.0000,  
			/*offset_amount*/ _offset_amount, 
			/*interest_amount*/ _interest_amount, 
			/*interest_rate*/ 0.0000, 
			/*bank_account*/'', 
			/*bank_name*/ '', 
			/*trice*/ now(), 
			/*create_time*/ now(), 
			/*create_user*/ '', 
			/*update_time*/ now(), 
			/*update_user*/ '', 
			/*description*/ _description, 
			/*version*/ 9001, 
			/*status`*/ 1);
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_set_param_value
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_set_param_value`(IN `in_en_name` varCHAR(50), IN `in_param_value` varCHAR(100))
    COMMENT '设置参数值'
BEGIN
	replace into t_sys_parameter(id, en_name, param_value) values(uuid(), in_en_name, in_param_value);
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_update_all_status
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_all_status`()
    COMMENT '将所有业务今天以前的数据的状态，从草稿修改为正式状态'
BEGIN
  -- 07_往来欠款
 UPDATE t_arrears SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 05_收款情况
 UPDATE t_collections SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 02_合同补充协议
 UPDATE t_contract_change SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 04_客户开票情况
 UPDATE t_customer_billing SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 10_信息登记
 UPDATE t_information SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 03_甲方开票情况
 UPDATE t_party_billing SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 06_付款情况
 UPDATE t_payment SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 08_型材
 UPDATE t_profile SET STATUS = 1 WHERE create_time < CURDATE();
 
  -- 01_合同项目信息
 UPDATE t_project SET STATUS = 1 WHERE create_time < CURDATE(); 
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_update_arrears_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_arrears_interest`(IN `_trice` datetime)
    COMMENT '根据当日往来欠款，计算利息情况'
proc:BEGIN
	-- 此过程每天凌晨3点执行，由MySQL事件机制调用
	
	declare _project_id varchar(50);
	declare _atday int;
	
	declare _amount decimal(20, 4);
	declare _a1 decimal(20, 4);
	declare _a2 decimal(20, 4);
	
	declare _trice datetime;
	declare _pharse varchar(100);
	
	declare eof bit default 0;
	
	-- 所有有计息往来欠款的项目ID
  	declare cur_for_project cursor for select distinct project_id from t_arrears where project_id is not null and interest_rate > 0;
  	declare continue handler for not found set eof = 1;  
  	
  	open cur_for_project;
  
  	top0: loop
    	fetch cur_for_project into _project_id;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top0;
    	end if;
    	
    	if (select count(*) from t_arrears_interest where project_id = _project_id and trice = date(_trice)) then
    		-- 该项目当天的利息已经算过，计算下一个项目
    		iterate top0;
    	end if;
    	
    	-- 获取往来欠款中，昨天的费用总和（指定日期）
    	select sum(amount) into _amount from t_arrears where project_id=_project_id and interest_rate > 0 and trice = date(_trice) - interval 1 day;
    	set _amount = ifnull(_amount, 0);
    	
    	-- 计算当前工程前天的欠款额与利息基数
    	select amount, interest_amount, atday into _a1, _a2, _atday from t_arrears_interest where project_id = _project_id and date(trice)= date(_trice) - interval 2 day;
    	set _a1 = ifnull(_a1, 0);
    	set _a2 = ifnull(_a2, 0);
    	set _atday = ifnull(_atday, 0);
    	
    	if _amount = 0 and _a1 = 0 then
    		-- 该项目所有欠款已还清，没有新借款项
    		iterate top0;
    	end if;
    	
    	set _pharse = date_format(if(day(_trice) > 20, _trice + interval 1 month, _trice), '%Y-%m');
    	
    	-- 每月21日，期内天数自动归零
    	if day(_trice) = 21 then
    		set _atday = 0;
    	end if;
    	
    	if _a1 > 0 then
    		set _a1 = if(_a1 + _amount > 0, _a1 + _amount, 0);
    		set _a2 = _a1 + _a2;
    		insert into t_arrears_interest(id, project_id, trice, amount, interest_amount, pharse, atday, description) values
			 (uuid(), _project_id, date(_trice), _a1, _a2, _pharse, _atday + 1, '');
    	
    	else
    		-- 没有利息明细
    		set _amount = if(_amount > 0, _amount, 0);
    		insert into t_arrears_interest(id, project_id, trice, amount, interest_amount, pharse, atday, description) values
			 (uuid(), _project_id, date(_trice), _amount, _amount, _pharse, 1, '');
    	end if;
    	
    	
    	-- select * from t_arrears_interest where serial_id=(select max(serial_id) from t_arrears_interest where project_id=_project_id)
   end loop top0;
   
   close cur_for_project;
END//
DELIMITER ;


-- Dumping structure for function hplydb_new.get_next_code
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_code`(`arg0` varchar(20)) RETURNS varchar(100) CHARSET utf8
    COMMENT '获取各个业务的唯一编码，以年为单位，到下一年自动归1'
BEGIN 
		DECLARE next_id INT DEFAULT 0; 
		DECLARE next_code VARCHAR(100) DEFAULT 'UNKNOW'; 
		
		SET arg0= UPPER(arg0);
		
		SELECT param_value, default_value INTO next_id, next_code FROM  t_sys_parameter 
				WHERE UPPER(en_name) = arg0 AND EXTRACT(YEAR FROM update_time) = EXTRACT(YEAR FROM NOW()); 
		
		SET next_id = next_id + 1;
		
		UPDATE t_sys_parameter SET  param_value = next_id, update_time = NOW(), update_user = 'mysql.get_next_code' 
				WHERE UPPER(en_name) = arg0; 
		
		SET next_code = CONCAT(next_code, '-', EXTRACT(YEAR FROM NOW()), '-', LPAD(next_id, 4, '0')); 
		
		RETURN next_code; 

END//
DELIMITER ;


-- Dumping structure for function hplydb_new.get_param_value
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_param_value`(`in_en_name` varCHAR(50)) RETURNS varchar(100) CHARSET utf8
BEGIN
	declare _param_value varchar(100);
	select param_value into _param_value from t_sys_parameter where en_name = in_en_name limit 1;
	return _param_value;
END//
DELIMITER ;


-- Dumping structure for function hplydb_new.get_total_amount
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_total_amount`(`in_project_id` varchar(50)) RETURNS decimal(20,4)
    COMMENT '获取工程总额'
BEGIN
declare _a1 decimal(20, 4) default 0;
declare _a2 decimal(20, 4) default 0;
declare _a3 decimal(20, 4) default 0;

select contract_amount, change_total_amount, settlement_amount into _a1, _a2, _a3 from t_project_summary 
where serial_id=(SELECT MAX(serial_id) FROM t_project_summary WHERE project_id=in_project_id AND VERSION >= 0);

return if(_a3 > 0, _a3, _a1 + _a2);
END//
DELIMITER ;


-- Dumping structure for event hplydb_new.evt_update_arrears_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `evt_update_arrears_interest` ON SCHEDULE EVERY 1 DAY STARTS '2014-08-21 02:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '每天凌晨三点计算利息' DO BEGIN
	call proc_update_arrears_interest(now());
END//
DELIMITER ;


-- Dumping structure for trigger hplydb_new.tr_arrears_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_arrears_after_insert` AFTER INSERT ON `t_arrears` FOR EACH ROW trig:BEGIN
	if new.version = 9001 then
		-- 计算利息结转的数据不记录
		leave trig;
	end if;

	INSERT INTO `t_project_summary`
				(`id`,
				`trice`,
				`description`,
				`project_id`,
				`organization_id`,
				`project_code`,
				`project_name`,
				`contract_amount`,
				`change_amount`,
				`change_total_amount`,
				`settlement_amount`,
				`management_rate`,
				`management_plan_amount`,
				`management_real_amount`,
				`management_total_amount`,
				`management_owe_amount`,
				`party_billing_amount`,
				`party_billing_total_amount`,
				`collections_amount`,
				`collections_total_amount`,
				`collections_rate`,
				`customer_billing_amount`,
				`customer_billing_total_amount`,
				`payment_amount`,
				`payment_total_amount`,
				`tax_rate`,
				`tax_plan_amount`,
				`tax_real_amount`,
				`tax_total_amount`,
				`tax_owe_amount`,
				`arrears_amount`,
				`expected_value`,
				`profile_point`,
				`version`,
				`create_time`,
				`table_name`)
	SELECT 
				 new.`id`,
				 /*登记时间*/ new.`trice`,
				 /*备注*/ CONCAT('往来欠款，',new.description),
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				 /*change_amount*/ 0,
					change_total_amount,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`,
				 /*management_real_amount*/ 0,
				 `management_total_amount`,
				 `management_owe_amount`,
				 /*party_billing_amount*/ 0,
				 `party_billing_total_amount`,
				 /* collections_amount */ 0,
				 `collections_total_amount`,
				 `collections_rate`,
				 /*customer_billing_amount*/ 0,
				 `customer_billing_total_amount`,
				 /* payment_amount */ 0,
				 `payment_total_amount`,
				 `tax_rate`,
				 `tax_plan_amount`,
				 /* tax_real_amount */ 0,
				 `tax_total_amount`,
				 `tax_owe_amount`,
				 /*arrears_amount，垫付资金，包含利息*/ new.amount + new.interest_amount + arrears_amount,
				 /* expected_value */ 0,
				 /* profile_point */ '',
	/*version*/0, 
				/*create_time*/ CURRENT_TIMESTAMP,
				/*table_name*/ 't_arrears'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_arrears_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_arrears_before_insert` BEFORE INSERT ON `t_arrears` FOR EACH ROW proc:BEGIN
	-- 计算本金的累积和
	declare _a1 decimal(20, 4) default 0;
	
	-- 禁用该触发器
	leave proc;
	
	if new.interest_rate > 0 then
		-- 计算当前项目，所有计息的，借款金额， amount>0，借，amount<0，还款
		select sum(amount) into _a1 from t_arrears where project_id = new.project_id and interest_rate > 0;
		set new.offset_amount = ifnull(new.amount, 0) + ifnull(_a1, 0);
	else	
		set new.offset_amount = 0;
	end if;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_collections_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_collections_after_insert` AFTER INSERT ON `t_collections` FOR EACH ROW BEGIN
INSERT INTO `t_project_summary`
				(`id`,
				`trice`,
				`description`,
				`project_id`,
				`organization_id`,
				`project_code`,
				`project_name`,
				`contract_amount`,
				`change_amount`,
				`change_total_amount`,
				`settlement_amount`,
				`management_rate`,
				`management_plan_amount`,
				`management_real_amount`,
				`management_total_amount`,
				`management_owe_amount`,
				`party_billing_amount`,
				`party_billing_total_amount`,
				`collections_amount`,
				`collections_total_amount`,
				`collections_rate`,
				`customer_billing_amount`,
				`customer_billing_total_amount`,
				`payment_amount`,
				`payment_total_amount`,
				`tax_rate`,
				`tax_plan_amount`,
				`tax_real_amount`,
				`tax_total_amount`,
				`tax_owe_amount`,
				`arrears_amount`,
				`expected_value`,
				`profile_point`,
				`version`,
				`create_time`,
				`table_name`)
SELECT 
					new.`id`,
				 /*登记时间*/ new.`trice`,
				 /*备注*/ CONCAT('新的收款，',new.description),
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				 `change_amount`,
					`change_total_amount`,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`, IF(new.source_of = '管理费', new.amount, 0) AS `management_real_amount`, IF(new.source_of = '管理费', new.amount, 0) + `management_total_amount` AS `management_total_amount`, IF(new.source_of = '管理费', management_owe_amount - new.amount, management_owe_amount) AS `management_owe_amount`,
				 `party_billing_amount`,
				 `party_billing_total_amount`,
				 new.amount,
				 new.amount + collections_total_amount AS `collections_total_amount`,
				 (new.amount + collections_total_amount)/ IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + change_total_amount) `collections_rate`,
				 `customer_billing_amount`,
				 `customer_billing_total_amount`,
				 `payment_amount`,
				 `payment_total_amount`,
				 `tax_rate`,
				 `tax_plan_amount`, IF(new.source_of = '税金', new.amount, 0) AS `tax_real_amount`, IF(new.source_of = '税金', new.amount, 0) + tax_total_amount AS `tax_total_amount`, IF(new.source_of = '税金', tax_owe_amount - new.amount, tax_owe_amount) AS `tax_owe_amount`,
				 `arrears_amount`,
				 `expected_value`,
				 `profile_point`,
	/*version*/0, 
				/*create_time*/ CURRENT_TIMESTAMP,
				/*table_name*/ 't_collections'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_contract_change_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_contract_change_after_insert` AFTER INSERT ON `t_contract_change` FOR EACH ROW BEGIN
INSERT INTO `t_project_summary`
			(`id`,
			`trice`,
			`description`,
			`project_id`,
			`organization_id`,
			`project_code`,
			`project_name`,
			`contract_amount`,
			`change_amount`,
			`change_total_amount`,
			`settlement_amount`,
			`management_rate`,
			`management_plan_amount`,
			`management_real_amount`,
			`management_total_amount`,
			`management_owe_amount`,
			`party_billing_amount`,
			`party_billing_total_amount`,
			`collections_amount`,
			`collections_total_amount`,
			`collections_rate`,
			`customer_billing_amount`,
			`customer_billing_total_amount`,
			`payment_amount`,
			`payment_total_amount`,
			`tax_rate`,
			`tax_plan_amount`,
			`tax_real_amount`,
			`tax_total_amount`,
			`tax_owe_amount`,
			`arrears_amount`,
			`expected_value`,
			`profile_point`,
			`version`,
			`create_time`,
			`table_name`)
SELECT 
		 new.`id`,
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('发生了调增，',new.description),
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 new.`change_amount`,
		 /*累计增减金额*/ new.`change_amount` + `change_total_amount` AS `change_total_amount`,
		 `settlement_amount`,
		 /*管理费率*/ new.`management_rate`,
		 /*应收管理费*/ new.`management_rate` * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) AS `management_plan_amount`,
		 `management_real_amount`,
		 `management_total_amount`,
		 new.`management_rate` * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) - `management_total_amount` AS `management_owe_amount`,
		 /* party_billing_amount */ 0,
		 `party_billing_total_amount`,
		 /* collections_amount */ 0,
		 `collections_total_amount`,
		 `collections_rate`,
		 /* customer_billing_amount */ 0,
		 `customer_billing_total_amount`,
		 /* payment_amount */ 0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		 `arrears_amount`,
		 /* expected_value */ 0,
		 /* profile_point */ '',
	/*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ 't_contract_change'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_customer_billing_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_customer_billing_after_insert` AFTER INSERT ON `t_customer_billing` FOR EACH ROW BEGIN
INSERT INTO `t_project_summary`
		(`id`,
		`trice`,
		`description`,
		`project_id`,
		`organization_id`,
		`project_code`,
		`project_name`,
		`contract_amount`,
		`change_amount`,
		`change_total_amount`,
		`settlement_amount`,
		`management_rate`,
		`management_plan_amount`,
		`management_real_amount`,
		`management_total_amount`,
		`management_owe_amount`,
		`party_billing_amount`,
		`party_billing_total_amount`,
		`collections_amount`,
		`collections_total_amount`,
		`collections_rate`,
		`customer_billing_amount`,
		`customer_billing_total_amount`,
		`payment_amount`,
		`payment_total_amount`,
		`tax_rate`,
		`tax_plan_amount`,
		`tax_real_amount`,
		`tax_total_amount`,
		`tax_owe_amount`,
		`arrears_amount`,
		`expected_value`,
		`profile_point`,
		`version`,
		`create_time`,
		`table_name`)
SELECT 
		 new.`id`,
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('新增的客户开票，',new.description),
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 /*change_amount*/ 0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		 /*management_real_amount*/ 0,
		 `management_total_amount`,
		 `management_owe_amount`,
		 /*party_billing_amount*/ 0,
		 `party_billing_total_amount`,
		 /* collections_amount */ 0,
		 `collections_total_amount`,
		 `collections_rate`,
		 /*customer_billing_amount*/ new.amount,
		 new.amount + `customer_billing_total_amount` AS `customer_billing_total_amount`,
		 /* payment_amount */ 0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		 /*arrears_amount*/ 0,
		 /* expected_value */ 0,
		 /* profile_point */ '',
	/*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ 't_customer_billing'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_party_billing_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_party_billing_after_insert` AFTER UPDATE ON `t_party_billing` FOR EACH ROW BEGIN IF new.step_status = 1 AND ifnull(old.step_status, 0) != 1 THEN 	
		/*流程审批通过时，触发*/
INSERT INTO `t_project_summary`
			(`id`,
			`trice`,
			`description`,
			`project_id`,
			`organization_id`,
			`project_code`,
			`project_name`,
			`contract_amount`,
			`change_amount`,
			`change_total_amount`,
			`settlement_amount`,
			`management_rate`,
			`management_plan_amount`,
			`management_real_amount`,
			`management_total_amount`,
			`management_owe_amount`,
			`party_billing_amount`,
			`party_billing_total_amount`,
			`collections_amount`,
			`collections_total_amount`,
			`collections_rate`,
			`customer_billing_amount`,
			`customer_billing_total_amount`,
			`payment_amount`,
			`payment_total_amount`,
			`tax_rate`,
			`tax_plan_amount`,
			`tax_real_amount`,
			`tax_total_amount`,
			`tax_owe_amount`,
			`arrears_amount`,
			`expected_value`,
			`profile_point`,
			`version`,
			`create_time`,
			`table_name`)
SELECT 
	 new.`id`,
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('已审批的甲方开票，',new.description),
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 /*change_amount*/ 0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		 /*management_real_amount*/ 0,
		 `management_total_amount`,
		 `management_owe_amount`,
		 new.amount party_billing_amount,
		 new.amount + party_billing_total_amount AS `party_billing_total_amount`,
		 /* collections_amount */ 0,
		 `collections_total_amount`,
		 `collections_rate`,
		 /* customer_billing_amount */ 0,
		 `customer_billing_total_amount`,
		 /* payment_amount */ 0,
		 `payment_total_amount`, IF(IFNULL(new.`tax_rate`, 0) > 0, new.`tax_rate`, `tax_rate`) AS `tax_rate`,
		 (IF(IFNULL(new.`tax_rate`, 0) > 0, new.`tax_rate`, `tax_rate`)/100) * (new.amount + party_billing_total_amount) AS `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 (IF(IFNULL(new.`tax_rate`, 0) > 0, new.`tax_rate`, `tax_rate`)/100) * (new.amount + party_billing_total_amount) - tax_total_amount AS `tax_owe_amount`,
		 /*arrears_amount*/ 0,
		 /* expected_value */ 0,
		 /* profile_point */ '',
	/*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ 't_party_billing'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_payment_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_payment_after_insert` AFTER INSERT ON `t_payment` FOR EACH ROW BEGIN
INSERT INTO `t_project_summary`
		(`id`,
		`trice`,
		`description`,
		`project_id`,
		`organization_id`,
		`project_code`,
		`project_name`,
		`contract_amount`,
		`change_amount`,
		`change_total_amount`,
		`settlement_amount`,
		`management_rate`,
		`management_plan_amount`,
		`management_real_amount`,
		`management_total_amount`,
		`management_owe_amount`,
		`party_billing_amount`,
		`party_billing_total_amount`,
		`collections_amount`,
		`collections_total_amount`,
		`collections_rate`,
		`customer_billing_amount`,
		`customer_billing_total_amount`,
		`payment_amount`,
		`payment_total_amount`,
		`tax_rate`,
		`tax_plan_amount`,
		`tax_real_amount`,
		`tax_total_amount`,
		`tax_owe_amount`,
		`arrears_amount`,
		`expected_value`,
		`profile_point`,
		`version`,
		`create_time`,
		`table_name`)
SELECT 
		new.`id`,
	 /*登记时间*/ new.`trice`,
	 /*备注*/ CONCAT('新增的付款，',new.description),
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	 /*change_amount*/ 0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	 /*management_real_amount*/ 0,
	 `management_total_amount`,
	 `management_owe_amount`,
	 /*party_billing_amount*/ 0,
	 `party_billing_total_amount`,
	 /* collections_amount */ 0,
	 `collections_total_amount`,
	 `collections_rate`,
	 /*customer_billing_amount*/ 0,
	 `customer_billing_total_amount`,
	 /* payment_amount */ new.amount,
	 new.amount + payment_total_amount AS `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	 /* tax_real_amount */ 0,
	 `tax_total_amount`,
	 `tax_owe_amount`,
	 /*arrears_amount*/ 0,
	 /* expected_value */ 0,
	 /* profile_point */ '',
	/*version*/0, 
	/*create_time*/ CURRENT_TIMESTAMP,
	/*table_name*/ 't_payment'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_profile_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_profile_after_insert` AFTER INSERT ON `t_profile` FOR EACH ROW BEGIN
INSERT INTO `t_project_summary`
		(`id`,
		`trice`,
		`description`,
		`project_id`,
		`organization_id`,
		`project_code`,
		`project_name`,
		`contract_amount`,
		`change_amount`,
		`change_total_amount`,
		`settlement_amount`,
		`management_rate`,
		`management_plan_amount`,
		`management_real_amount`,
		`management_total_amount`,
		`management_owe_amount`,
		`party_billing_amount`,
		`party_billing_total_amount`,
		`collections_amount`,
		`collections_total_amount`,
		`collections_rate`,
		`customer_billing_amount`,
		`customer_billing_total_amount`,
		`payment_amount`,
		`payment_total_amount`,
		`tax_rate`,
		`tax_plan_amount`,
		`tax_real_amount`,
		`tax_total_amount`,
		`tax_owe_amount`,
		`arrears_amount`,
		`expected_value`,
		`profile_point`,
		`version`,
		`create_time`,
		`table_name`)
SELECT 
		new.`id`,
	 /*登记时间*/ new.`trice`,
	 /*备注*/ CONCAT('型材点，',new.description),
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	 /*change_amount*/ 0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	 /*management_real_amount*/ 0,
	 `management_total_amount`,
	 `management_owe_amount`,
	 /*party_billing_amount*/ 0,
	 `party_billing_total_amount`,
	 /* collections_amount */ 0,
	 `collections_total_amount`,
	 `collections_rate`,
	 /*customer_billing_amount*/ 0,
	 `customer_billing_total_amount`,
	 /* payment_amount */ 0,
	 `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	 /* tax_real_amount */ 0,
	 `tax_total_amount`,
	 `tax_owe_amount`,
	 `arrears_amount`,
	 /* expected_value */ new.expected_value,
	 /* profile_point */ new.profile_point,
	/*version*/0, 
	/*create_time*/ CURRENT_TIMESTAMP,
	/*table_name*/ 't_profile'
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_project_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_project_after_insert` AFTER INSERT ON `t_project` FOR EACH ROW BEGIN
		INSERT INTO `t_project_summary`
			(`id`,
			`trice`,
			`description`,
			`project_id`,
			`organization_id`,
			`project_code`,
			`project_name`,
			`contract_amount`,
			`change_amount`,
			`change_total_amount`,
			`settlement_amount`,
			`management_rate`,
			`management_plan_amount`,
			`management_real_amount`,
			`management_total_amount`,
			`management_owe_amount`,
			`party_billing_amount`,
			`party_billing_total_amount`,
			`collections_amount`,
			`collections_total_amount`,
			`collections_rate`,
			`customer_billing_amount`,
			`customer_billing_total_amount`,
			`payment_amount`,
			`payment_total_amount`,
			`tax_rate`,
			`tax_plan_amount`,
			`tax_real_amount`,
			`tax_total_amount`,
			`tax_owe_amount`,
			`arrears_amount`,
			`expected_value`,
			`profile_point`,
			`version`,
			`create_time`,
			`table_name`)
		VALUES
			(/*id:*/ new.id, 
			/*trice*/ new.trice, 
			/*description*/ CONCAT('新项目，',new.description) , 
			/*project_id*/ new.id, 
			/*organization_id*/ new.organization_id, 
			/*project_code*/ new.project_code, 
			/*project_name*/ new.project_name, 
			/*contract_amount*/ new.contract_amount, 
			/*change_amount*/0.0000, 
			/*change_total_amount*/ 0.0000,
			/*settlement_amount*/ new.settlement_amount, 
			/*management_rate*/ new.management_rate, 
			/*management_plan_amount*/ new.management_plan_amount, 
			/*management_real_amount*/0.0000, 
			/*management_total_amount*/0.0000, 
			/*management_owe_amount*/ new.management_plan_amount, 
			/*party_billing_amount*/0.0000, 
			/*party_billing_total_amount*/0.0000, 
			/*collections_amount*/0.0000, 
			/*collections_total_amount*/0.0000, 
			/*collections_rate*/0.0000, 
			/*customer_billing_amount*/0.0000, 
			/*customer_billing_total_amount*/0.0000, 
			/*payment_amount*/0.0000, 
			/*payment_total_amount*/0.0000, 
			/*tax_rate*/ new.tax_rate, 
			/*tax_plan_amount*/ 0, 
			/*tax_real_amount*/0.0000, 
			/*tax_total_amount*/0.0000, 
			/*tax_owe_amount*/ 0, 
			/*arrears_amount*/0.0000, 
			/*expected_value*/0.0000, 
			/*profile_point*/ '', 
			/*version*/0, 
			/*create_time*/CURRENT_TIMESTAMP,
			/*table_name*/'t_project');
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_project_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_project_after_update` AFTER UPDATE ON `t_project` FOR EACH ROW BEGIN 	
	INSERT INTO `t_project_summary`
			(`id`,
			`trice`,
			`description`,
			`project_id`,
			`organization_id`,
			`project_code`,
			`project_name`,
			`contract_amount`,
			`change_amount`,
			`change_total_amount`,
			`settlement_amount`,
			`management_rate`,
			`management_plan_amount`,
			`management_real_amount`,
			`management_total_amount`,
			`management_owe_amount`,
			`party_billing_amount`,
			`party_billing_total_amount`,
			`collections_amount`,
			`collections_total_amount`,
			`collections_rate`,
			`customer_billing_amount`,
			`customer_billing_total_amount`,
			`payment_amount`,
			`payment_total_amount`,
			`tax_rate`,
			`tax_plan_amount`,
			`tax_real_amount`,
			`tax_total_amount`,
			`tax_owe_amount`,
			`arrears_amount`,
			`expected_value`,
			`profile_point`,
			`version`,
			`create_time`,
			`table_name`)
	SELECT 
			new.`id`,
		 /*登记时间*/ now(),
		 /*备注*/ CONCAT('修改合同项目信息，',new.description),
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 /*change_amount*/ 0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 /*直接修改了应收管理费总额*/ new.management_plan_amount as `management_plan_amount`,
		 /*management_real_amount*/ 0,
		 `management_total_amount`,
		 /*尚欠管理费*/ (new.management_plan_amount - old.management_plan_amount) + `management_owe_amount`,
		 /*party_billing_amount*/ 0,
		 `party_billing_total_amount`,
		 /* collections_amount */ 0,
		 `collections_total_amount`,
		 `collections_rate`,
		 /*customer_billing_amount*/ 0,
		 `customer_billing_total_amount`,
		 /* payment_amount */ 0,
		 `payment_total_amount`,
		 `tax_rate`,
		 new.tax_plan_amount as `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 (new.tax_plan_amount - old.tax_plan_amount) + `tax_owe_amount`,
		 `arrears_amount`,
		 /* expected_value */ 0,
		 /* profile_point */ '',
		/*version*/ 1, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ 't_project'
	FROM `t_project_summary`
	WHERE serial_id=(
	SELECT MAX(serial_id)
	FROM t_project_summary
	WHERE project_id=new.id AND VERSION >= 0); /*version =-1 作为删除标记*/ 

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
