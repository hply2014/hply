-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.19 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.3.0.4811
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
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `arrears_code_UNIQUE` (`arrears_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='07_往来欠款';

-- Dumping data for table hplydb_new.t_arrears: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_arrears` DISABLE KEYS */;
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
  `version` int(11) DEFAULT NULL,
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

-- Dumping data for table hplydb_new.t_information: ~1 rows (approximately)
/*!40000 ALTER TABLE `t_information` DISABLE KEYS */;
INSERT INTO `t_information` (`id`, `organization_id`, `project_name`, `address`, `developer`, `epc_corporation`, `variety`, `total_area`, `real_name`, `identification`, `contact`, `subscriber`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('796d07d7-2118-4344-a849-0d968328af9d', '0ed44f90-0c3a-11e4-9300-001c42328937', '张璋', '发', '', '', '', '', '张旭明', '', '', '', '2014-09-06 08:00:00', '2014-09-06 14:45:24', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-09-06 17:57:56', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 3, 1);
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

-- Dumping data for table hplydb_new.t_payment_item: ~4 rows (approximately)
/*!40000 ALTER TABLE `t_payment_item` DISABLE KEYS */;
INSERT INTO `t_payment_item` (`id`, `item_name`, `reimbursement_cap`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`) VALUES
	('2762ebb5-a879-4c28-b4bf-28b622ae8011', '差旅费', 1.0000, '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('54bf359d-68d1-4170-8d92-0353d2526325', '期间费用', 2.0000, '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('af61d269-2184-496c-924d-bfd412e074dc', '其他', 100.0000, '2014-09-06 07:46:15', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-09-06 07:46:15', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 0),
	('e00dfdf3-4193-476a-9612-b3ae31eefbc4', '业务招待费', 0.8300, '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0);
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
  `project_status` varchar(50) DEFAULT NULL COMMENT '项目状态',
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_code` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='01_合同项目信息';

-- Dumping data for table hplydb_new.t_project: ~1 rows (approximately)
/*!40000 ALTER TABLE `t_project` DISABLE KEYS */;
INSERT INTO `t_project` (`id`, `project_code`, `project_name`, `organization_id`, `party_name`, `party_address`, `manager`, `contract_code`, `corperation`, `legal_assignee`, `is_withholding_offsite`, `management_rate`, `tax_rate`, `contract_amount`, `settlement_amount`, `duty_paid_time`, `duty_paid_amount`, `duty_paid_code`, `capital_occupied`, `project_status`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`, `management_plan_amount`, `tax_plan_amount`) VALUES
	('6e71321c-5535-45c2-b6e3-57080754559c', 'XM-2014-0009', '项目1', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '成七一', '', '', '', NULL, 3.6000, 3.4000, 1000000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-09-07 08:32:09', '2014-09-07 08:31:48', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-09-07 08:32:08', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 1, NULL, 36000.0000, 34000.0000);
/*!40000 ALTER TABLE `t_project` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_project_init
CREATE TABLE IF NOT EXISTS `t_project_init` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `trice` date DEFAULT NULL COMMENT '摘要信息/时间',
  `description` varchar(500) DEFAULT NULL COMMENT '摘要信息/摘要',
  `project_code` varchar(200) DEFAULT NULL COMMENT '合同项目信息/项目编号',
  `project_name` varchar(200) DEFAULT NULL COMMENT '合同项目信息/项目名称',
  `organization_name` varchar(200) DEFAULT NULL COMMENT '合同项目信息/所在部门',
  `party_name` varchar(200) DEFAULT NULL COMMENT '合同项目信息/甲方名称',
  `party_address` varchar(200) DEFAULT NULL COMMENT '合同项目信息/甲方地址',
  `manager` varchar(200) DEFAULT NULL COMMENT '合同项目信息/项目经理',
  `corperation` varchar(200) DEFAULT NULL COMMENT '合同项目信息/合作单位',
  `legal_assignee` varchar(200) DEFAULT NULL COMMENT '合同项目信息/法人代表',
  `is_withholding_offsite` varchar(20) DEFAULT NULL COMMENT '合同项目信息/异地代扣代缴',
  `contract_code` varchar(20) DEFAULT NULL COMMENT '合同项目信息/合同号',
  `contract_amount` decimal(20,4) DEFAULT NULL COMMENT '合同项目信息/合同金额',
  `change_amount` decimal(20,4) DEFAULT NULL COMMENT '合同项目信息/合同调增额',
  `change_total_amount` decimal(20,4) DEFAULT NULL COMMENT '合同项目信息/累计调增额',
  `settlement_amount` decimal(20,4) DEFAULT NULL COMMENT '合同项目信息/合同结算额',
  `duty_paid_code` varchar(200) DEFAULT NULL COMMENT '合同项目信息/印花税收据编号',
  `duty_paid_time` date DEFAULT NULL COMMENT '合同项目信息/印花税上交时间',
  `duty_paid_amount` decimal(20,4) DEFAULT NULL COMMENT '合同项目信息/印花税上交金额',
  `capital_occupied` varchar(20) DEFAULT NULL COMMENT '合同项目信息/占用资金情况',
  `project_status` varchar(20) DEFAULT NULL COMMENT '合同项目信息/项目状态',
  `management_rate` decimal(20,4) DEFAULT NULL COMMENT '管理费情况/比率',
  `management_plan_amount` decimal(20,4) DEFAULT NULL COMMENT '管理费情况/应收管理费',
  `management_real_amount` decimal(20,4) DEFAULT NULL COMMENT '管理费情况/实收管理费',
  `management_total_amount` decimal(20,4) DEFAULT NULL COMMENT '管理费情况/累计收管理费',
  `management_owe_amount` decimal(20,4) DEFAULT NULL COMMENT '管理费情况/尚欠管理费',
  `party_billing_amount` decimal(20,4) DEFAULT NULL COMMENT '甲方开票情况/发票金额',
  `party_billing_total_amount` decimal(20,4) DEFAULT NULL COMMENT '甲方开票情况/累计开票',
  `collections_amount` decimal(20,4) DEFAULT NULL COMMENT '从甲方收款情况/收款金额',
  `collections_total_amount` decimal(20,4) DEFAULT NULL COMMENT '从甲方收款情况/累计收款',
  `collections_rate` decimal(20,4) DEFAULT NULL COMMENT '从甲方收款情况/回收率',
  `customer_billing_amount` decimal(20,4) DEFAULT NULL COMMENT '客户开票情况/发票金额',
  `customer_billing_total_amount` decimal(20,4) DEFAULT NULL COMMENT '客户开票情况/累计开票',
  `payment_amount` decimal(20,4) DEFAULT NULL COMMENT '支付工程款情况/支付金额',
  `payment_amount_clv` decimal(20,4) DEFAULT NULL COMMENT '支付工程款情况/差旅费',
  `payment_amount_cliang` decimal(20,4) DEFAULT NULL COMMENT '支付工程款情况/车辆费用',
  `payment_amount_zdai` decimal(20,4) DEFAULT NULL COMMENT '支付工程款情况/业务招待费',
  `payment_total_amount` decimal(20,4) DEFAULT NULL COMMENT '支付工程款情况/累计支付',
  `tax_rate` decimal(20,4) DEFAULT NULL COMMENT '税金情况/比率',
  `tax_plan_amount` decimal(20,4) DEFAULT NULL COMMENT '税金情况/应缴税金',
  `tax_real_amount` decimal(20,4) DEFAULT NULL COMMENT '税金情况/已缴税金',
  `tax_total_amount` decimal(20,4) DEFAULT NULL COMMENT '税金情况/累计已缴税金',
  `tax_owe_amount` decimal(20,4) DEFAULT NULL COMMENT '税金情况/尚欠税金',
  `arrears_amount` decimal(20,4) DEFAULT NULL COMMENT '垫付资金情况/金额',
  `expected_value` decimal(20,4) DEFAULT NULL COMMENT '型材（吨）/预计用量',
  `profile_point` varchar(20) DEFAULT NULL COMMENT '型材（吨）/型材点',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `project_code` (`project_code`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='数据初始化表';

-- Dumping data for table hplydb_new.t_project_init: ~214 rows (approximately)
/*!40000 ALTER TABLE `t_project_init` DISABLE KEYS */;
INSERT INTO `t_project_init` (`serial_id`, `trice`, `description`, `project_code`, `project_name`, `organization_name`, `party_name`, `party_address`, `manager`, `corperation`, `legal_assignee`, `is_withholding_offsite`, `contract_code`, `contract_amount`, `change_amount`, `change_total_amount`, `settlement_amount`, `duty_paid_code`, `duty_paid_time`, `duty_paid_amount`, `capital_occupied`, `project_status`, `management_rate`, `management_plan_amount`, `management_real_amount`, `management_total_amount`, `management_owe_amount`, `party_billing_amount`, `party_billing_total_amount`, `collections_amount`, `collections_total_amount`, `collections_rate`, `customer_billing_amount`, `customer_billing_total_amount`, `payment_amount`, `payment_amount_clv`, `payment_amount_cliang`, `payment_amount_zdai`, `payment_total_amount`, `tax_rate`, `tax_plan_amount`, `tax_real_amount`, `tax_total_amount`, `tax_owe_amount`, `arrears_amount`, `expected_value`, `profile_point`, `create_time`) VALUES
	(1, '2008-03-01', '项目部表,第2行', 'XMF08-02', '中国国际贸易中心三期', '项目部', '中国国际贸易中心股份有限公司', '北京市', '柯秋惠', '北京宇光装饰有限公司', '柯秋惠', '否', NULL, 3950000.0000, 838394.6200, NULL, 4596964.0000, NULL, NULL, NULL, NULL, '完工', 0.0360, 172382.2063, 179181.0000, 179181.0000, NULL, 4986186.2000, 4986186.2000, 4637476.2000, 4986186.2000, 0.8532, 4931516.1700, 4931516.1700, 4979331.1700, NULL, NULL, NULL, 4979331.1700, 0.0340, 169530.3308, 169529.0000, 169529.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(2, '2010-04-15', '项目部表,第3行', 'XMF10-11', '商品房A01楼等6项、商品房A04楼等5项', '项目部', '北京日月房地产开发有限公司', '北京市', '魏增坡', '北京和平泛华装饰有限公司', '魏增坡', '否', NULL, 4300000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '完工', 0.0360, 154800.0000, 154800.0000, 154800.0000, 0.0000, 3940000.0000, 3940000.0000, 3651240.0000, 3940000.0000, 0.8491, 3814968.9000, 3814968.9000, 3908218.9000, NULL, NULL, NULL, 3908218.9000, 0.0340, 133960.0000, 133960.0000, 133960.0000, 0.0000, NULL, 65.0000, '亦庄', '2014-08-27 20:43:32'),
	(3, '2010-11-09', '项目部表,第4行', 'XMF10-40', '幸福三村', '项目部', '北京市第二建筑工程有限责任公司', '北京市', '江志真', '北京美伦美门窗制品有限公司', '江志真', '否', NULL, 842038.0000, NULL, NULL, NULL, NULL, NULL, 253.0000, NULL, '完工', 0.0360, 30313.3680, 30313.0000, 30313.0000, 0.0000, 700000.0000, 700000.0000, 652687.0000, 700000.0000, 0.7751, 693200.0000, 693200.0000, 693200.0000, NULL, NULL, NULL, 693200.0000, 0.0340, 23800.0000, 17000.0000, 17000.0000, 6800.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(4, '2010-10-16', '项目部表,第5行', 'XMF10-51', '中国传媒大学图书馆工程', '项目部', '北京市第三建筑工程有限公司', '北京市', '李春光', '北京邦士富生物科技有限公司', '李玉斌', '否', NULL, 1787170.0000, 868000.0000, NULL, 2610000.0000, NULL, NULL, NULL, NULL, '完工', 0.0360, 93960.0000, 94830.0000, 94830.0000, 0.0000, 2610000.0000, 2610000.0000, 2226430.0000, 2410000.0000, 0.8530, 2356517.0000, 2356517.0000, 2407227.0800, NULL, NULL, NULL, 2407227.0800, 0.0340, 88740.0000, 88740.0000, 88740.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(5, '2011-05-20', '项目部表,第6行', 'XMF11-21', '永定华庭地下车库出入口外装饰幕墙', '项目部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(6, '2011-10-12', '项目部表,第7行', 'XMF11-48', '生物技术研发中心二期', '项目部', '北京中关村生命科学院发展有限责任公司', '北京市', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '否', NULL, 21611588.0000, 2802330.8300, NULL, NULL, '0139123', '2011-10-17', 6484.0000, NULL, '完工', 0.0300, 732417.5649, 671920.0000, 671920.0000, 60497.5649, 22758059.4700, 22758059.4700, 21312366.4700, 22758059.4700, 0.8730, 20358173.6200, 20358173.6200, 21886603.4200, NULL, NULL, NULL, 21886603.4200, 0.0340, 773774.0220, 773773.0000, 773773.0000, 0.0000, NULL, 140.0000, '管庄', '2014-08-27 20:43:32'),
	(7, '2012-01-01', '项目部表,第8行', 'XMF12-01', '北京邮件综合处理中心', '项目部', '中建二局第三建筑工程有限公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 1950000.0000, 6281535.0000, NULL, NULL, '9110694', '2012-05-16', 585.0000, NULL, '完工', 0.0300, 246946.0500, 229500.0000, 229500.0000, 17446.0500, 8231535.0000, 8231535.0000, 7722163.0000, 8231535.0000, 0.9381, 7143200.0000, 7143200.0000, 8223072.0000, NULL, NULL, NULL, 8223072.0000, 0.0340, 279872.1900, 279872.0000, 279872.0000, 0.0000, NULL, 5.0000, '亦庄', '2014-08-27 20:43:32'),
	(8, '2012-01-01', '项目部表,第9行', 'XMF12-02', '门头沟新城冯村（一期）居住项目A西区', '项目部', '华润置地发展（北京）有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 3098310.0000, NULL, NULL, NULL, '0088619', '2012-02-18', 930.0000, NULL, '完工', 0.0360, 111539.1600, 111539.0000, 111539.0000, 0.0000, 2463563.0000, 2463563.0000, 2268263.0000, 2463563.0000, 0.7321, 2225711.9800, 2225711.9800, 2424472.9800, NULL, NULL, NULL, 2424472.9800, 0.0340, 83761.1420, 83761.0000, 83761.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(9, '2011-12-30', '项目部表,第10行', 'XMF12-03', '空军9011工程空地勤综合楼', '项目部', '北京城建十六建筑工程有限责任公司', '北京市', '赵长亮', '北京雄博兴业装饰设计有限公司', '李国兵', '否', NULL, 3405024.0000, NULL, NULL, NULL, '0097964', '2012-03-06', 1175.0000, NULL, '完工', 0.0360, 122580.8640, 122581.0000, 122581.0000, 0.0000, 3111296.0000, 3111296.0000, 2882931.0000, 3111296.0000, 0.8467, 2496087.7700, 2496087.7700, 3049860.3200, NULL, NULL, NULL, 3049860.3200, 0.0340, 105784.0640, 105784.0000, 105784.0000, 0.0000, NULL, 36.0000, '正和平', '2014-08-27 20:43:32'),
	(10, '2012-01-01', '项目部表,第11行', 'XMF12-04', '春晖园1#综合楼一段等4项工程', '项目部', '北京春晖园投资有限责任公司', '北京市', '纪树军', '北京中建润泽建筑工程有限公司 ', '李邦海', '否', NULL, 9708632.2600, 2846340.0000, NULL, NULL, '0097921', '2012-03-07', 2913.0000, NULL, '完工', 0.0300, 376649.1678, 362780.0000, 362780.0000, 13869.1678, 12554972.2600, 12554972.2600, 11036186.4900, 11825835.4900, 0.8790, 10650362.2800, 10650362.2800, 11370776.6400, NULL, 17830.0000, 275.0000, 11388881.6400, 0.0340, 426869.0568, 426869.0000, 426869.0000, 0.0000, NULL, 80.0000, '亦庄', '2014-08-27 20:43:32'),
	(11, '2012-02-01', '项目部表,第12行', 'XMF12-05', '北京绿地密云国际花都项目', '项目部', '北京绿地京宏置业有限公司', '北京市', '李金光', '北京丰益宏业装饰有限公司', '李金光', '否', NULL, 14568703.8800, 651269.0000, NULL, NULL, '0091571', '2012-06-01', 4371.0000, NULL, '完工', 0.0300, 456599.1864, 437061.0000, 437061.0000, 19538.1864, 11975108.0000, 11975108.0000, 10209857.0000, 11054072.0000, 0.6708, 10047825.7500, 10047825.7500, 10954969.7500, NULL, 4010.0000, NULL, 10958979.7500, 0.0340, 407153.6720, 407154.0000, 407154.0000, 0.0000, NULL, 220.0000, '管庄、昌平', '2014-08-27 20:43:32'),
	(12, '2012-02-01', '项目部表,第13行', 'XMF12-07', '中国原子能科学研究院3号楼', '项目部', '北京城乡建设集团有限责任公司', '北京市', '曲刚', '北京京业正通建筑材料有限责任公司', '王艳', '否', NULL, 20000000.0000, 5102771.0000, NULL, 25102771.0000, '0097929', '2012-03-13', 6000.0000, NULL, '完工', 0.0300, 753083.1300, 753083.0000, 753083.0000, 0.0000, 23847632.4500, 23847632.4500, 22283729.4500, 23847632.4500, 0.8877, 23095725.1700, 23095725.1700, 23847632.1700, NULL, NULL, NULL, 23847632.1700, 0.0340, 810819.5033, 810820.0000, 810820.0000, 0.0000, NULL, 50.0000, '管庄', '2014-08-27 20:43:32'),
	(13, '2012-02-01', '项目部表,第14行', 'XMF12-08', '六郎庄拆迁安置房一标段', '项目部', '中国新兴建设开发总公司', '北京市', '付仁福', '北京富恒兴达装饰工程有限公司', '付仁福', '否', NULL, 33000000.0000, NULL, NULL, NULL, '5032993', '2012-07-05', 10752.0000, NULL, '完工', 0.0350, 1155000.0000, 1155000.0000, 1155000.0000, 0.0000, 22720000.0000, 22720000.0000, 19792520.0000, 21720000.0000, 0.5998, 19634904.4700, 19634904.4700, 21702791.4700, NULL, NULL, NULL, 21702791.4700, 0.0340, 772480.0000, 772480.0000, 772480.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(14, '2012-02-01', '项目部表,第15行', 'XMF12-09', '六郎庄拆迁安置房二标段', '项目部', '中国中铁航空港建设集团有限公司北京第八分公司', '北京市', '付仁福', '北京富恒兴达装饰工程有限公司', '付仁福', '否', NULL, 20000000.0000, NULL, NULL, NULL, '5032982', '2012-06-21', 6465.0000, NULL, '完工', 0.0350, 700000.0000, 700000.0000, 700000.0000, 0.0000, 18500000.0000, 18500000.0000, 16171000.0000, 17500000.0000, 0.8086, 16533332.5000, 16533332.5000, 17304686.4100, NULL, NULL, 2200.0000, 17306886.4100, 0.0340, 629000.0000, 629000.0000, 629000.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(15, '2012-03-01', '项目部表,第16行', 'XMF12-11', '京西宾馆东楼群房改建工程', '项目部', '上海建工七建集团有限公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 15000000.0000, 60000.0000, NULL, NULL, '0098166', '2012-03-21', 4500.0000, NULL, '完工', 0.0300, 451800.0000, 450000.0000, 450000.0000, 1800.0000, 12400000.0000, 12400000.0000, 11528400.0000, 12400000.0000, 0.7655, 12114323.5600, 12114323.5600, 12399923.5600, NULL, NULL, NULL, 12399923.5600, 0.0340, 421600.0000, 421600.0000, 421600.0000, 0.0000, NULL, 25.0000, '亦庄', '2014-08-27 20:43:32'),
	(16, '2012-04-01', '项目部表,第17行', 'XMF12-12', '爱博精电生产楼等2项工程', '项目部', NULL, '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 1315898.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '完工', 0.0360, 47372.3280, NULL, NULL, 47372.3280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, 6.0000, '三河', '2014-08-27 20:43:32'),
	(17, '2012-03-20', '项目部表,第18行', 'XMF12-13', '环能院实验楼幕墙工程', '项目部', '中国建筑技术集团有限公司', '北京市', '刘乃适', '北京中适广发智能门有限公司', '刘乃适', '否', NULL, 1523208.3100, NULL, NULL, NULL, '0099400', '2014-04-19', 538.0000, NULL, '完工', 0.0360, 54835.4992, 54835.5000, 54835.5000, 0.0000, 1294727.0600, 1294727.0600, 1195870.5600, 1294727.0600, 0.7851, 1049652.0700, 1049652.0700, 1294623.4800, NULL, NULL, NULL, 1294623.4800, 0.0340, 44020.7200, 44021.0000, 44021.0000, 0.0000, NULL, 20.0000, '管庄', '2014-08-27 20:43:32'),
	(18, '2012-03-20', '项目部表,第19行', 'XMF12-14', '印刷大楼改造工程', '项目部', ' 中国印刷总公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 3701841.5500, 4570557.6500, NULL, NULL, '0091567', '2012-04-27', 1049.0000, NULL, '正常进行', 0.0300, 248171.9760, 248172.0000, 248172.0000, 0.0000, 7316811.7300, 7316811.7300, 6797456.4500, 7294401.4500, 0.8217, 6832563.9600, 6832563.9600, 7155469.4600, NULL, NULL, NULL, 7155469.4600, 0.0340, 248771.5988, 248773.0000, 248773.0000, 0.0000, NULL, 57.0000, '三河', '2014-08-27 20:43:32'),
	(19, '2012-03-21', '项目部表,第20行', 'XMF12-15', '大兴黄村地铁枣园路站居住项目', '项目部', '北京城建建设工程有限公司', '北京市', '季长友', '北京诚和信装饰装潢有限责任公司', '鲍云锋', '否', NULL, 5578834.3000, NULL, NULL, NULL, '0099381', '2012-03-24', 1674.0000, NULL, '完工', 0.0360, 200838.0348, 200838.0000, 200838.0000, 0.0000, 3416000.0000, 3416000.0000, 3099018.0000, 3416000.0000, 0.5555, 3252562.4500, 3252562.4500, 3409775.6400, NULL, NULL, NULL, 3409775.6400, 0.0340, 116144.0000, 116144.0000, 116144.0000, 0.0000, NULL, 64.0000, '大兴', '2014-08-27 20:43:32'),
	(20, '2012-03-30', '项目部表,第21行', 'XMF12-16', '宇泰佳苑住宅楼', '项目部', '河南益通置业有限公司', '河南郑州', '熊斌', '郭大龙', NULL, '异地交税', NULL, 5045600.0000, 118800.0000, NULL, NULL, '0099396', '2012-04-13', 1514.0000, NULL, '完工', 0.0360, 185918.4000, 185919.8500, 185919.8500, 0.0000, 4624200.0000, 4624200.0000, 4551495.0100, 4737414.8600, 0.8813, 4276212.7900, 4276212.7900, 4737414.8600, NULL, NULL, NULL, 4737414.8600, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 54.0000, '郭大龙', '2014-08-27 20:43:32'),
	(21, '2012-04-07', '项目部表,第22行', 'XMF12-17', '大兴黄村新城北区16号项目', '项目部', '北京金地融侨房地产开发有限公司', '北京市', '杨广', '北京龙辰塑钢门窗公司', '杨晓峰', '否', NULL, 4328546.0000, NULL, NULL, NULL, '5032998', '2012-07-10', 1299.0000, NULL, '完工', 0.0460, 199113.1160, 199113.0000, 199113.0000, 0.0000, 3462837.0000, 3462837.0000, 3145987.0000, 3462837.0000, 0.7268, 3278949.2600, 3278949.2600, 3462635.8600, NULL, NULL, NULL, 3462635.8600, 0.0340, 117736.4580, 117737.0000, 117737.0000, 0.0000, NULL, 55.0000, '管庄', '2014-08-27 20:43:32'),
	(22, '2012-04-01', '项目部表,第23行', 'XMF12-18', '密云县穆家岭镇华润希望小镇展示', '项目部', '北京华润希望发展有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 416950.0000, 36973.6000, NULL, 453923.6000, '9110683', '2012-05-03', 126.0000, NULL, '完工', 0.0360, 16341.2496, 15010.0000, 15010.0000, 1331.2496, 431228.0000, 431228.0000, 401556.0000, 431228.0000, 0.8846, 255500.0000, 255500.0000, 427020.0000, NULL, NULL, NULL, 427020.0000, 0.0340, 14661.7520, 14662.0000, 14662.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(23, '2012-05-02', '项目部表,第24行', 'XMF12-19', '京昌高科技信息产业园2#厂房', '项目部', '北京市昌平一建建筑有限责任公司第二分公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 1785000.0000, NULL, NULL, NULL, '9110684', '2012-05-03', 536.0000, NULL, '完工', 0.0360, 64260.0000, 64260.0000, 64260.0000, 0.0000, 500000.0000, 500000.0000, 418740.0000, 500000.0000, 0.2346, 395996.0000, 395996.0000, 499041.9700, NULL, NULL, NULL, 499041.9700, 0.0340, 17000.0000, 17000.0000, 17000.0000, 0.0000, NULL, 20.0000, '管庄', '2014-08-27 20:43:32'),
	(24, '2012-05-10', '项目部表,第25行', 'XMF12-20', '总参气象水文局经济适用住房工程', '项目部', '北京城建七建设工程有限公司', '北京市', '吴荣', '北京佳盛杰瑞商贸有限公司', '季福成', '否', NULL, 2220000.0000, 351000.0000, NULL, 2571000.0000, '0091576', '2012-06-15', 666.0000, NULL, '完工', 0.0360, 92556.0000, 92556.0000, 92556.0000, 0.0000, 1550000.0000, 1550000.0000, 1384744.0000, 1530000.0000, 0.5386, 954836.0000, 954836.0000, 1530000.0000, NULL, NULL, NULL, 1530000.0000, 0.0340, 52700.0000, 52700.0000, 52700.0000, 0.0000, NULL, 26.0000, '管庄', '2014-08-27 20:43:32'),
	(25, '2012-05-01', '项目部表,第26行', 'XMF12-21', '天津红星国际广场2#地酒店式公寓', '项目部', '天津市华运商贸物业有限公司', '天津市', '闫禄章', '北京奥维尔建筑材料销售有限公司', '闫禄章', '异地交税', NULL, 5473241.0000, 47753.0000, NULL, 5520994.0000, NULL, NULL, NULL, NULL, '完工', 0.0300, 165629.8200, 164197.0000, 164197.0000, 1432.8200, 5520994.0000, 5520994.0000, 5080747.3000, 5244944.3000, 0.9203, 4583453.1900, 4583453.1900, 5238901.4700, NULL, NULL, NULL, 5238901.4700, 0.0374, 206485.1756, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(26, '2012-05-21', '项目部表,第27行', 'XMF12-22', '老城厢12号地块', '项目部', '中建一局集团建设发展有限公司/天津中新名仕房地产开发有限公司', '天津市', '丁有智', '沈阳市渤海保温门窗工程有限公司', '丁有智', '异地交税', NULL, 36296483.0000, 1293588.0000, NULL, NULL, NULL, NULL, NULL, NULL, '完工', 0.0300, 1127702.1300, 1127608.0000, 1127608.0000, 94.1300, 33307394.0000, 33307394.0000, 32179786.0000, 33307394.0000, 0.8561, 28631226.4000, 28631226.4000, 33434705.1700, NULL, NULL, NULL, 33434705.1700, 0.0374, 1245696.5356, NULL, NULL, 0.0000, NULL, 320.0000, '管庄', '2014-08-27 20:43:32'),
	(27, '2012-05-01', '项目部表,第28行', 'XMF12-23', '现代农业生物研发平台工程', '项目部', '中铁建设集团有限公司', '北京市', '杨如林', '北京和平芙蓉商贸有限公司', '董宴春', '否', NULL, 3831227.5700, NULL, NULL, NULL, '5032991', '2012-07-04', 1150.0000, NULL, '完工', 0.0360, 137924.1925, 137924.0000, 137924.0000, 0.0000, 3831180.0000, 3831180.0000, 2761816.0000, 3030000.0000, 0.7209, 2725866.3300, 2725866.3300, 3007274.1300, NULL, NULL, NULL, 3007274.1300, 0.0340, 130260.1200, 130260.0000, 130260.0000, 0.0000, NULL, 31.0000, '亦庄', '2014-08-27 20:43:32'),
	(28, '2012-06-13', '项目部表,第29行', 'XMF12-24', '厂房一等4项铝合金门窗工程', '项目部', '格兰达投资管理（北京）有限公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 1444588.7000, 1770220.4700, NULL, NULL, '5033000', '2012-07-11', 966.0000, NULL, '完工', 0.0360, 115733.1301, 115733.0000, 115733.0000, 0.0000, 2500366.4400, 2500366.4400, 2299619.4400, 2500366.4400, 0.7153, 2230332.1000, 2230332.1000, 2492151.1000, NULL, NULL, NULL, 2492151.1000, 0.0340, 85012.4590, 85014.0000, 85014.0000, 0.0000, NULL, 31.0000, '三河', '2014-08-27 20:43:32'),
	(29, '2012-07-02', '项目部表,第30行', 'XMF12-26', '爱迪学校报告厅', '项目部', '北京爱迪学校', '北京市', '李春光', '北京邦士富生物科技有限公司', '李玉斌', '否', NULL, 1508400.0000, NULL, NULL, NULL, '5032989', '2012-07-02', 453.0000, NULL, '完工', 0.0360, 54302.4000, 54302.0000, 54302.0000, 0.0000, 1190000.0000, 1190000.0000, 1105143.0000, 1199905.0000, 0.7327, 1152231.9300, 1152231.9300, 1192691.9300, NULL, NULL, NULL, 1192691.9300, 0.0340, 40460.0000, 40460.0000, 40460.0000, 0.0000, NULL, 7.0000, '管庄', '2014-08-27 20:43:32'),
	(30, '2012-07-01', '项目部表,第31行', 'XMF12-27', '中国劳动关系学院教学楼修缮工程', '项目部', '中国劳动关系学院', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 742782.7900, 149141.7800, NULL, NULL, '0099942', '2012-07-19', 223.0000, NULL, '完工', 0.0360, 32109.2845, 26920.0000, 26920.0000, 5189.2845, 891924.5700, 891924.5700, 834599.5700, 891924.5700, 0.9357, 426993.5700, 426993.5700, 886924.5700, NULL, NULL, NULL, 886924.5700, 0.0340, 30325.4354, 30405.0000, 30405.0000, -79.5646, NULL, 8.0000, '三河', '2014-08-27 20:43:32'),
	(31, '2012-07-27', '项目部表,第32行', 'XMF12-28', '密云县穆家岭镇华润希望小镇乡村酒店', '项目部', '北京华润希望发展有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 328000.0000, 34031.0000, NULL, NULL, '0099956', '2012-07-27', 99.0000, NULL, '完工', 0.0360, 13033.1160, 13033.0000, 13033.0000, 0.0000, 343930.0000, 343930.0000, 319204.0000, 343930.0000, 0.8817, 114435.8200, 114435.8200, 339814.0000, NULL, NULL, NULL, 339814.0000, 0.0340, 11693.6200, 11693.0000, 11693.0000, 0.0000, NULL, 4.0000, '管庄', '2014-08-27 20:43:32'),
	(32, '2012-07-01', '项目部表,第33行', 'XMF12-29', '春晖园1#综合楼一段等4项工程', '项目部', '北京春晖园投资有限责任公司', '北京市', '纪树军', '北京中建润泽建筑工程有限公司 ', '李邦海', '否', NULL, 4400000.0000, NULL, NULL, NULL, '0097769', '2012-08-16', 1320.0000, NULL, '完工', 0.0300, 132000.0000, 132000.0000, 132000.0000, 0.0000, 4100000.0000, 4100000.0000, 3055800.0000, 3300000.0000, 0.6945, 3180103.7100, 3180103.7100, 3292303.7100, NULL, NULL, NULL, 3292303.7100, 0.0340, 139400.0000, 112200.0000, 112200.0000, 27200.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(33, '2012-07-01', '项目部表,第34行', 'XMF12-30', '天津国际城诗景颂苑二标段12#-16#', '项目部', '中铁十三局集团有限公司', '天津市', '于洋', '北京城建长城伟达装饰公司', '孙国强', '异地交税', NULL, 5538662.0000, 3392971.0000, NULL, NULL, NULL, NULL, NULL, NULL, '完工', 0.0300, 267948.9900, 267949.0000, 267949.0000, 0.0000, 7570000.0000, 7570000.0000, 7018933.0000, 7570000.0000, 0.7859, 7355941.4200, 7355941.4200, 7552961.8900, NULL, NULL, NULL, 7552961.8900, 0.0374, 283118.0000, 283118.0000, 283118.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(34, '2012-07-18', '项目部表,第35行', 'XMF12-31', '2011工程', '项目部', '中建一局集团第二建筑有限公司', '北京市', '霍林宝', '中国人民解放军61159部队后勤部', '霍林宝', '否', NULL, 8443771.0000, 1126543.3600, NULL, NULL, '0097761', '2012-08-06', 2534.0000, NULL, '完工', 0.0300, 287109.4308, 287109.0000, 287109.0000, 0.0000, 8599000.0000, 8599000.0000, 8019525.0000, 8599000.0000, 0.8380, 5958030.2600, 5958030.2600, 8594025.5300, NULL, NULL, NULL, 8594025.5300, 0.0340, 292366.0000, 292366.0000, 292366.0000, 0.0000, NULL, 72.0000, '亦庄', '2014-08-27 20:43:32'),
	(35, '2012-07-23', '项目部表,第36行', 'XMF12-32', '宝鼎商场', '项目部', '华美财务（北京）科技有限公司', '北京市', '王晨', '北京润勤洲际建材有限责任公司', '杨晓彬 ', '否', NULL, 4520000.0000, NULL, NULL, NULL, '0099952', '2012-07-24', 1356.0000, NULL, '完工', 0.0360, 162720.0000, 162720.0000, 162720.0000, 0.0000, 4395540.7500, 4395540.7500, 3303832.0000, 3616000.0000, 0.7309, 3533736.0000, 3533736.0000, 3616000.0000, NULL, NULL, NULL, 3616000.0000, 0.0340, 149448.3855, 149448.0000, 149448.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(36, '2012-07-23', '项目部表,第37行', 'XMF12-33', '朝阳区东坝驹子房农民安置房', '项目部', '北京市朝阳城市建设综合开发公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 8171765.0000, NULL, NULL, NULL, '0097768', '2012-08-14', 2452.0000, NULL, '完工', 0.0300, 245152.9500, 245153.0000, 245153.0000, 0.0000, 6000000.0000, 6000000.0000, 5550847.0000, 6000000.0000, 0.6793, 5613614.3500, 5613614.3500, 5991760.6000, NULL, NULL, NULL, 5991760.6000, 0.0340, 204000.0000, 204000.0000, 204000.0000, 0.0000, NULL, 100.0000, '管庄', '2014-08-27 20:43:32'),
	(37, '2012-08-07', '项目部表,第38行', 'XMF12-34', '小屯新村B03、B06回迁楼及B04配套', '项目部', '北京绿林双泉房地产开发有限公司天鸿美域项目分公司', '北京市', '江志真', '北京美伦美门窗制品有限公司', '江志真', '否', NULL, 5170956.9400, NULL, NULL, NULL, '0097779', '2012-08-29', 1552.0000, NULL, '完工', 0.0300, 155128.7082, 155129.0000, 155129.0000, 0.0000, 4912409.0900, 4912409.0900, 4590258.0900, 4912409.0900, 0.8877, 4676282.4500, 4676282.4500, 4902104.4500, NULL, NULL, NULL, 4902104.4500, 0.0340, 167021.9091, 167022.0000, 167022.0000, 0.0000, NULL, 16.0000, '亦庄', '2014-08-27 20:43:32'),
	(38, '2012-08-09', '项目部表,第39行', 'XMF12-35', '衙门口居住及公建项目', '项目部', '北京天石基业房地产开发有限公司', '北京市', '李智勇', '北京通联门窗有限公司', '吕松岩', '否', NULL, 7737463.3500, NULL, NULL, NULL, '3166153', '2012-09-19', 2321.0000, NULL, '完工', 0.0300, 232123.9005, 232124.0000, 232124.0000, 0.0000, 7737463.3600, 7737463.3600, 7242265.3600, 7737463.3600, 0.9360, 6908727.1100, 6908727.1100, 7736045.2100, 38.0000, 402.0000, 743.0000, 7737228.2100, 0.0340, 263073.7542, 263074.0000, 263074.0000, 0.0000, NULL, 10.0000, '管庄', '2014-08-27 20:43:32'),
	(39, '2012-08-09', '项目部表,第40行', 'XMF12-36', '西北旺六里屯农民定置点定向房', '项目部', '中建一局集团第三建筑有限公司/中航天建设工程有限公司/北京昊海建设有限公司', '北京市', '王军', '北京军建凯达幕墙装饰有限公司', '秦存国', '否', NULL, 1615034.9000, 20970833.4000, NULL, NULL, '0097765', '2012-08-13', 485.0000, NULL, '完工', 0.0300, 677576.0490, 677576.0000, 677576.0000, 0.0000, 19750000.0000, 19750000.0000, 17500924.0000, 18850000.0000, 0.7749, 16568345.4000, 16568345.4000, 18818897.6100, NULL, NULL, NULL, 18818897.6100, 0.0340, 671500.0000, 671500.0000, 671500.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(40, '2012-09-03', '项目部表,第41行', 'XMF12-46', '空军装备研究院防控所', '项目部', '北京朝林建设集团有限公司第四分公司', '北京市', '钱金花', '北京笠融建筑工程有限公司', '钱金花', '否', NULL, 20572132.0700, NULL, NULL, NULL, '3088688', '2012-10-17', 6981.0000, NULL, '完工', 0.0300, 617163.9621, 617164.0000, 617164.0000, 0.0000, 8450000.0000, 8450000.0000, 10497836.0000, 11402300.0000, 0.5103, 9476128.4500, 9476128.4500, 10916099.6700, NULL, NULL, NULL, 10916099.6700, 0.0340, 287300.0000, 287300.0000, 287300.0000, 0.0000, NULL, 55.0000, '管庄', '2014-08-27 20:43:32'),
	(41, '2012-09-03', '项目部表,第42行', 'XMF12-47', 'D型公寓D4一单元铝合金窗', '项目部', '北京春晖园文化娱乐有限责任公司', '北京市', '纪树军', '北京中建润泽建筑工程有限公司 ', '李邦海', '否', NULL, 500000.0000, 1680151.0900, NULL, NULL, '3166142', '2012-09-03', 220.0000, NULL, '完工', 0.0300, 65404.5327, 65405.0000, 65405.0000, 0.0000, 1736110.4800, 1736110.4800, 1557271.2600, 1681703.2600, 0.7143, 1289913.1600, 1289913.1600, 1348940.1600, NULL, NULL, NULL, 1348940.1600, 0.0340, 59027.7563, 59027.0000, 59027.0000, 0.0000, NULL, 63.0000, '管庄', '2014-08-27 20:43:32'),
	(42, '2012-09-20', '项目部表,第43行', 'XMF12-51', '总政318信息化业务楼', '项目部', '中国人民解放军总政治部机关营建办公室', '北京市', '李玉朝', '北京若愚装饰有限公司', '杨书芳', '否', NULL, 7729248.0000, 364302.0000, NULL, NULL, '3088687', '2012-10-17', 2319.0000, NULL, '完工', 0.0300, 242806.5000, 242806.0000, 242806.0000, 0.0000, 5370000.0000, 5370000.0000, 4953794.0000, 5370000.0000, 0.6121, 4906391.0000, 4906391.0000, 5097012.5000, NULL, 511.5000, 974.0000, 5098498.0000, 0.0340, 182580.0000, 173400.0000, 173400.0000, 9180.0000, NULL, 50.0000, '昌平', '2014-08-27 20:43:32'),
	(43, '2012-11-29', '项目部表,第44行', 'XMF12-60', '岳各庄居住东区1#地128公建', '项目部', '中铁建设集团有限公司', '北京市', '杨如林', '北京和平芙蓉商贸有限公司', '董宴春', '否', NULL, 1947790.0000, 3958320.0000, NULL, NULL, '0019537', '2012-12-04', 1773.0000, NULL, '完工', 0.0300, 177183.3000, 177183.0000, 177183.0000, 0.0000, 4929108.8000, 4929108.8000, 4335028.0000, 4679800.0000, 0.7340, 3570320.7100, 3570320.7100, 3905909.7100, NULL, NULL, NULL, 3905909.7100, 0.0340, 167589.6992, 167589.0000, 167589.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(44, '2013-01-10', '项目部表,第45行', 'XMF13-01', '北池子大街35号院翻改建', '项目部', '北京城建亚泰建设集团有限公司', '北京市', '霍林宝', '中国人民解放军61159部队后勤部', '霍林宝', '否', NULL, 1973264.0000, 1837947.0000, NULL, NULL, '0007311', '2013-07-06', 1144.0000, NULL, '完工', 0.0360, 137203.5960, 137204.0000, 137204.0000, 0.0000, 1500000.0000, 1500000.0000, 1311796.0000, 1500000.0000, 0.3442, 1373403.7000, 1373403.7000, 1424403.7000, NULL, NULL, NULL, 1424403.7000, 0.0340, 51000.0000, 51000.0000, 51000.0000, 0.0000, NULL, 20.0000, '亦庄', '2014-08-27 20:43:32'),
	(45, '2013-01-23', '项目部表,第46行', 'XMF13-04', '61886部队食堂及文体活动用房', '项目部', '中国人名解放军61886部队后勤部', '北京市', '霍林宝', '中国人民解放军61886部队后勤部', '霍林宝', '否', NULL, 478942.0000, 19643.0000, NULL, NULL, '0007312', '2013-07-16', 144.0000, NULL, '完工', 0.0360, 17949.0600, 17831.0000, 17831.0000, 118.0600, 498585.0000, 498585.0000, 438872.0000, 473655.0000, 0.8802, 450000.0000, 450000.0000, 466952.0000, NULL, NULL, NULL, 466952.0000, 0.0340, 16951.8900, 16952.0000, 16952.0000, 0.0000, NULL, 6.0000, '亦庄', '2014-08-27 20:43:32'),
	(46, '2013-01-20', '项目部表,第47行', 'XMF13-05', '平谷金海湖小镇定向安置房', '项目部', '首创嘉铭新城镇投资发展有限公司', '北京市', '王娜', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 5145173.2100, NULL, NULL, NULL, '0007306', '2013-06-28', 1544.0000, NULL, '完工', 0.0300, 154355.1963, 154355.0000, 154355.0000, 0.0000, 4112000.0000, 4112000.0000, 3817839.0000, 4112000.0000, 0.7420, 3963512.8100, 3963512.8100, 4103320.8100, NULL, NULL, NULL, 4103320.8100, 0.0340, 139808.0000, 139806.0000, 139806.0000, 0.0000, NULL, 75.0000, '大兴', '2014-08-27 20:43:32'),
	(47, '2013-01-25', '项目部表,第48行', 'XMF13-06', '广安门铁路住宅小区工程', '项目部', '中铁建工集团有限公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 5903500.0000, NULL, NULL, NULL, '0027651', '2013-03-28', 1772.0000, NULL, '完工', 0.0400, 236140.0000, 236140.0000, 236140.0000, 0.0000, 5400000.0000, 5400000.0000, 3580260.0000, 4000000.0000, 0.6065, 2706499.3200, 2706499.3200, 3999943.5800, NULL, NULL, NULL, 3999943.5800, 0.0340, 183600.0000, 183600.0000, 183600.0000, 0.0000, NULL, 74.0000, '亦庄', '2014-08-27 20:43:32'),
	(48, '2013-01-20', '项目部表,第49行', 'XMF13-07', '国隆府综合楼玻璃幕墙工程', '项目部', '河北国隆房地产开发有限公司', '河北省', '王胜来', '廊坊祖寺千首门窗公司', '王胜来', '异地交税', NULL, 8338455.0000, 1516000.0000, NULL, NULL, '9061363', '2013-10-22', 2502.0000, NULL, '完工', 0.0300, 295633.6500, 295634.0000, 295634.0000, 0.0000, 4000000.0000, 4000000.0000, 5704366.0000, 6000000.0000, 0.5789, 2634546.0000, 2634546.0000, 4265306.0000, NULL, NULL, NULL, 4265306.0000, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 75.0000, '亦庄', '2014-08-27 20:43:32'),
	(49, '2013-01-25', '项目部表,第50行', 'XMF13-08', '4#生物研发楼等三项', '项目部', '北京中关村生命科学园发展有限责任公司', '北京市', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '否', NULL, 1707600.0000, NULL, NULL, NULL, '0027654', '2013-04-02', 513.0000, NULL, '完工', 0.0300, 51228.0000, 51228.0000, 51228.0000, 0.0000, 1536840.0000, 1536840.0000, 1433359.0000, 1536840.0000, 0.8394, 1484089.7000, 1484089.7000, 1536342.7000, NULL, NULL, NULL, 1536342.7000, 0.0340, 52252.5600, 52253.0000, 52253.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(50, '2013-01-29', '项目部表,第51行', 'XMF13-09', '广安门铁路住宅小区B段', '项目部', '中铁电气化局集团北京建筑工程有限公司广安门项目', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 3171737.0000, NULL, NULL, NULL, '0027652', '2013-03-28', 952.0000, NULL, '完工', 0.0400, 126869.4800, 126870.0000, 126870.0000, 0.0000, 3000000.0000, 3000000.0000, 2771130.0000, 3000000.0000, 0.8737, 2209075.2000, 2209075.2000, 2947212.5400, NULL, NULL, NULL, 2947212.5400, 0.0340, 102000.0000, 102000.0000, 102000.0000, 0.0000, NULL, 40.0000, '亦庄', '2014-08-27 20:43:32'),
	(51, '2013-01-30', '项目部表,第52行', 'XMF13-10', '广安门铁路住宅小区A段', '项目部', '中扶建设有限责任公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 3688900.0000, 2437951.6100, NULL, NULL, '0027653', '2013-03-28', 1107.0000, NULL, '完工', 0.0400, 245074.0644, 245074.0000, 245074.0000, 0.0000, 4400000.0000, 4400000.0000, 4005326.0000, 4400000.0000, 0.6537, 3910369.0700, 3910369.0700, 4363087.0700, NULL, NULL, NULL, 4363087.0700, 0.0340, 149600.0000, 149600.0000, 149600.0000, 0.0000, NULL, 78.0000, '亦庄', '2014-08-27 20:43:32'),
	(52, '2013-02-25', '项目部表,第53行', 'XMF13-11', '来广营B2地块项目', '项目部', '北京方兴融创房地产开发有限公司', '北京市', '姚志刚', '中盛泰和（北京）进出口有限公司', '孙辉', '否', NULL, 10242431.9300, NULL, NULL, NULL, '0027643', '2013-03-09', 3073.0000, NULL, '完工', 0.0300, 307272.9579, 307273.0000, 307273.0000, 0.0000, 5355000.0000, 5355000.0000, 4865657.0000, 5355000.0000, 0.4750, 4746409.2500, 4746409.2500, 5006374.9500, NULL, NULL, NULL, 5006374.9500, 0.0340, 182070.0000, 182070.0000, 182070.0000, 0.0000, NULL, 150.0000, '管庄', '2014-08-27 20:43:32'),
	(53, '2013-03-01', '项目部表,第54行', 'XMF13-12', '新华联雅园一期工程', '项目部', '内蒙古新华联置业有限公司', '内蒙古', '金生文', '北京长风幕墙装饰有限公司', '李猛', '异地交税', NULL, 10182154.2000, NULL, NULL, NULL, '0027646', '2013-03-18', 3055.0000, NULL, '完工', 0.0300, 305464.6260, 305465.0000, 305465.0000, 0.0000, 6658381.3200, 6658381.3200, 6352916.3200, 6658381.3200, 0.6239, 5550984.4000, 5550984.4000, 6656819.7600, NULL, NULL, NULL, 66566819.7600, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 123.0000, '亦庄', '2014-08-27 20:43:32'),
	(54, '2013-03-28', '项目部表,第55行', 'XMF13-13', '北京国际文化贸易企业集散中心', '项目部', '北京歌华美创空港置业有限公司', '北京市', '刘乃适', '北京中适广发智能门有限公司', '刘乃适', '否', NULL, 35281540.5500, 1087789.1900, NULL, NULL, '0026991', '2013-05-16', 10585.0000, NULL, '完工', 0.0300, 1091079.8922, 1064887.0000, 1064887.0000, 26192.8922, 25050105.0000, 25050105.0000, 23133513.0000, 25050105.0000, 0.6361, 23540714.6400, 23540714.6400, 25042419.6400, NULL, NULL, NULL, 25042419.6400, 0.0340, 851703.5700, 851705.0000, 851705.0000, 0.0000, NULL, 180.0000, '管庄', '2014-08-27 20:43:32'),
	(55, '2013-03-28', '项目部表,第56行', 'XMF13-14', '京昌高科技信息产业园3#厂房', '项目部', '北京市昌平一建建筑有限责任公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 1995000.0000, NULL, NULL, NULL, '0026999', '2013-06-04', 599.0000, NULL, NULL, 0.0360, 71820.0000, NULL, NULL, 71820.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, 26.0000, '管庄', '2014-08-27 20:43:32'),
	(56, '2013-03-28', '项目部表,第57行', 'XMF13-15', '61599部队清河经济适用住房工程', '项目部', '中建交通建设集团有限公司', '北京市', '吴荣', '北京佳盛杰瑞商贸有限公司', '季福成', '否', NULL, 9000000.0000, NULL, NULL, NULL, '0027658', '2013-04-20', 2700.0000, NULL, '完工', 0.0300, 270000.0000, 210000.0000, 210000.0000, 60000.0000, 9000000.0000, 9000000.0000, 4284000.0000, 4800000.0000, 0.4760, 2571030.1900, 2571030.1900, 4800000.0000, NULL, NULL, NULL, 4800000.0000, 0.0340, 306000.0000, 306000.0000, 306000.0000, 0.0000, NULL, 10.0000, '管庄', '2014-08-27 20:43:32'),
	(57, '2013-04-13', '项目部表,第58行', 'XMF13-16', '解放军总医院研究大楼改造', '项目部', '中国人民解放军总医院第一附属医院', '北京市', '付仁福', '北京富恒兴达装饰工程有限公司', '付仁福', '否', NULL, 2600000.0000, NULL, NULL, NULL, '0027659', '2013-04-25', 780.0000, NULL, '完工', 0.0360, 93600.0000, 93600.0000, 93600.0000, 0.0000, 2894471.0000, 2894471.0000, 2702459.0000, 2894471.0000, 1.0394, 2705613.6800, 2705613.6800, 2804025.6800, NULL, NULL, NULL, 2804025.6800, 0.0340, 98412.0140, 98412.0000, 98412.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(58, '2013-04-01', '项目部表,第59行', 'XMF13-17', '朝阳区东坝驹子房农民安置房F区', '项目部', '北京市朝阳城市建设综合开发公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 12491680.0000, NULL, NULL, NULL, '0007301', '2013-06-04', 3748.0000, NULL, '正常进行', 0.0300, 374750.4000, 374750.0000, 374750.0000, 0.0000, 11200000.0000, 11200000.0000, 10444450.0000, 11200000.0000, 0.8361, 10579700.5100, 10579700.5100, 11184000.5100, NULL, NULL, NULL, 11184000.5100, 0.0340, 380800.0000, 380800.0000, 380800.0000, 0.0000, NULL, 145.0000, '三河', '2014-08-27 20:43:32'),
	(59, '2013-04-01', '项目部表,第60行', 'XMF13-18', '华北运转中心项目仓储物流及附属设施', '项目部', '北京京都圆通速递有限公司', '北京市', '王治国', '北京和平银泰装饰有限公司', '王松琴', '否', NULL, 1195559.0000, 934441.0000, NULL, NULL, '0026984', '2013-05-16', 359.0000, NULL, '完工', 0.0360, 76680.0000, 76680.0000, 76680.0000, 0.0000, 2130000.0000, 2130000.0000, 1874400.0000, 2023500.0000, 0.8800, 1200000.0000, 1200000.0000, 1971374.8000, NULL, NULL, NULL, 1971374.8000, 0.0340, 72420.0000, 72420.0000, 72420.0000, 0.0000, NULL, 16.0000, '亦庄', '2014-08-27 20:43:32'),
	(60, '2013-05-02', '项目部表,第61行', 'XMF13-19', '西郊机场西区12#住宅楼工程', '项目部', '空军第一建筑安装工程总队', '北京市', '赵长亮', '北京雄博兴业装饰设计有限公司', '李国兵', '否', NULL, 1258749.0000, NULL, NULL, NULL, '0026982', '2013-05-16', 378.0000, NULL, '完工', 0.0360, 45314.9640, 45315.0000, 45315.0000, 0.0000, 1052000.0000, 1052000.0000, 970917.0000, 1052000.0000, 0.7713, 1009286.0000, 1009286.0000, 1045054.0000, NULL, NULL, NULL, 1045054.0000, 0.0340, 35768.0000, 35768.0000, 35768.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(61, '2013-05-01', '项目部表,第62行', 'XMF13-20', '厦门高崎国际机场T4航站楼', '项目部', '森特士兴集团股份有限公司', '福建厦门', '杨如林', '北京和平芙蓉商贸有限公司', '董宴春', '否', NULL, 2894611.0000, NULL, NULL, NULL, '0007313', '2013-07-08', 869.0000, NULL, '完工', 0.0360, 104205.9960, 104206.0000, 104206.0000, 0.0000, 1528383.3000, 1528383.3000, 1372212.3000, 1528383.3000, 0.4741, 1476000.0000, 1476000.0000, 1527965.0000, NULL, NULL, NULL, 1527965.0000, 0.0340, 51965.0322, 51965.0000, 51965.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(62, '2013-05-01', '项目部表,第63行', 'XMF13-21', '西郊机场西区10#住宅楼工程', '项目部', '95959部队', '北京市', '赵长亮', '北京雄博兴业装饰设计有限公司', '李国兵', '否', NULL, 1691837.0100, NULL, NULL, NULL, '0007303', '2013-06-06', 508.0000, NULL, '完工', 0.0360, 60906.1324, 60906.0000, 60906.0000, 0.0000, 1892244.0000, 1892244.0000, 1767002.0000, 1892244.0000, 1.1185, 1729640.0000, 1729640.0000, 1796006.0000, NULL, NULL, NULL, 1796006.0000, 0.0340, 64336.2960, 64336.0000, 64336.0000, 0.0000, NULL, 15.0000, '京顺', '2014-08-27 20:43:32'),
	(63, '2013-05-18', '项目部表,第64行', 'XMF13-22', '红星国际广场3#地地块', '项目部', '天津市华运商贸物业有限公司', '天津市', '闫禄章', '北京奥维尔建筑材料销售有限公司', '闫禄章', '异地交税', NULL, 6498959.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '完工', 0.0300, 194968.7700, 194969.0000, 194969.0000, 0.0000, 5165199.2000, 5165199.2000, 4553398.0500, 4941545.5000, 0.7604, 4612419.2000, 4612419.2000, 4934017.4500, NULL, NULL, NULL, 4934017.4500, 0.0374, 193178.4501, 193178.4500, 193178.4500, 0.0001, NULL, 80.0000, '管庄', '2014-08-27 20:43:32'),
	(64, '2013-05-23', '项目部表,第65行', 'XMF13-23', '衙门口居住公建A1地块', '项目部', '北京天石基业房地产开发有限公司', '北京市', '李智勇', '北京通联门窗有限公司', '吕松岩', '否', NULL, 6000000.0000, 2023835.0400, NULL, NULL, '0026998', '2013-05-30', 1800.0000, NULL, '完工', 0.0300, 240715.0512, 240715.0000, 240715.0000, 0.0000, 8023835.0400, 8023835.0400, 7510310.0400, 8023835.0400, 1.0000, 7479804.7500, 7479804.7500, 7749964.7500, NULL, NULL, NULL, 7749964.7500, 0.0340, 272810.3914, 272810.0000, 272810.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(65, '2013-06-13', '项目部表,第66行', 'XMF13-24', '朝阳区十八里店周庄三期', '项目部', '北京市朝阳田华建筑集团公司/北京大洋房地产开发有限够告诉你', '北京市', '柯善波', '北京福宏杰幕墙门窗技术有限公司', '柯善波', '否', NULL, 15283442.5800, 1303649.5600, NULL, NULL, '0007305', '2013-06-14', 4586.0000, NULL, '正常进行', 0.0400, 658269.0874, 658269.0000, 658269.0000, 0.0000, 14335455.0800, 14335455.0800, 12287421.4400, 13433095.4400, 0.8099, 13740016.2900, 13740016.2900, 14227421.2900, NULL, NULL, NULL, 14227421.2900, 0.0340, 487405.4727, 487405.0000, 487405.0000, 0.4727, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(66, '2013-06-14', '项目部表,第67行', 'XMF13-25', '北京市平谷检察院办案和专业技术房', '项目部', '北京诚通新新建设有限公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 1712229.7100, NULL, NULL, NULL, '0061064', '2013-08-09', 514.0000, NULL, '正常进行', 0.0360, 61640.2696, 61640.0000, 61640.0000, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, NULL, NULL, 19.0000, '三河', '2014-08-27 20:43:32'),
	(67, '2013-06-18', '项目部表,第68行', 'XMF13-26', '铁科院永丰基地扩建项目', '项目部', '中铁电气化局集团北京建筑工程有限公司', '北京市', '何金才', '徐水县鸿飞橡塑制品有限公司', '周俊才', '否', NULL, 7389748.0000, 1116572.0000, NULL, NULL, '0007318', '2013-07-29', 2217.0000, NULL, '正常进行', 0.0300, 255189.6000, 255192.2700, 255191.2700, 0.0000, 8506320.0000, 8506320.0000, 7961913.7300, 8506320.0000, 1.0000, 8036530.9500, 8036530.9500, 8505439.0700, NULL, NULL, NULL, 8505439.0700, 0.0340, 289214.8800, 289214.0000, 289214.0000, 0.0000, NULL, 50.0000, '管庄', '2014-08-27 20:43:32'),
	(68, '2013-07-01', '项目部表,第69行', 'XMF13-27', '国贸世纪公寓样板间外墙工程', '项目部', '中国国际贸易中心有限公司', '北京市', '柯秋惠', '北京宇光装饰有限公司', '柯秋惠', '否', NULL, 205000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 7380.0000, 7380.0000, 7380.0000, 0.0000, 194750.0000, 194750.0000, 180748.0000, 194750.0000, 0.9500, 155447.2000, 155447.2000, 192069.2000, NULL, NULL, NULL, 192069.2000, 0.0340, 6621.5000, 6622.0000, 6622.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(69, '2013-07-02', '项目部表,第70行', 'XMF13-28', '利生大厦综合办公楼项目外立面', '项目部', NULL, '北京市', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '否', NULL, 5287718.0000, NULL, NULL, NULL, '0061074', '2013-09-14', 1587.0000, NULL, '正常进行', 0.0300, 158631.5400, NULL, NULL, 158631.5400, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, NULL, NULL, 15.0000, '管庄', '2014-08-27 20:43:32'),
	(70, '2013-07-04', '项目部表,第71行', 'XMF13-29', '航天长征睿特科技天津生产基地', '项目部', '北京航天万源建筑工程有限责任公司', '天津市', '李玉朝', '北京若愚装饰有限公司', '杨书芳', '异地交税', NULL, 2440063.9000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0460, 112242.9394, 112243.7500, 112243.7500, 0.0000, 2352756.3200, 2352756.3200, 1751814.2800, 1952051.1200, 0.8000, 1554257.7500, 1554257.7500, 1936975.9300, NULL, NULL, NULL, 1936975.9300, 0.0374, 87993.0864, 87993.0900, 87993.0900, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(71, '2013-07-15', '项目部表,第72行', 'XMF13-30', '96819部队工程', '项目部', '中国新兴建设开发总公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 1457017.9400, NULL, NULL, NULL, '0061065', '2013-08-13', 438.0000, NULL, '正常进行', 0.0360, 52452.6458, 52453.0000, 52453.0000, 0.0000, 1400000.0000, 1400000.0000, 1299947.0000, 1400000.0000, 0.9609, 1335000.0000, 1335000.0000, 1384348.0000, NULL, NULL, NULL, 1384348.0000, 0.0340, 47600.0000, 47600.0000, 47600.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(72, '2013-07-17', '项目部表,第73行', 'XMF13-31', '中国国际贸易中心二座幕墙工程', '项目部', '中国国际贸易中心股份有限公司二期物业中心', '北京市', '柯秋惠', '北京宇光装饰有限公司', '柯秋惠', '否', NULL, 190000.0000, NULL, NULL, NULL, '0061068', '2013-08-29', 57.0000, NULL, '正常进行', 0.0360, 6840.0000, NULL, NULL, 6840.0000, 180500.0000, 180500.0000, 57000.0000, 57000.0000, 0.3000, NULL, NULL, 50000.0000, NULL, NULL, NULL, 50000.0000, 0.0340, 6137.0000, NULL, NULL, 6137.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(73, '2013-07-29', '项目部表,第74行', 'XMF13-32', '密云县穆家岭希望一期3#地', '项目部', '北京华润希望发展有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 2768475.0000, NULL, NULL, NULL, '0064207', '2013-09-04', 831.0000, NULL, '完工', 0.0360, 99665.1000, 99665.0000, 99665.0000, 0.0000, 2353204.0000, 2353204.0000, 2173530.0000, 2353204.0000, 0.8500, 2021228.9900, 2021228.9900, 2338304.9900, NULL, NULL, NULL, 2338304.9900, 0.0340, 80008.9360, 80009.0000, 80009.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(74, '2013-07-29', '项目部表,第75行', 'XMF13-33', '大兴北臧村镇居住及配套项目', '项目部', '北京博大经开建设有限公司', '北京市', '张永强', '北京泰顺源装饰装潢有限公司', '张永强', '异地交税', NULL, 19543207.1300, NULL, NULL, NULL, '0061071', '2013-09-05', 5863.0000, NULL, '正常进行', 0.0300, 586296.2139, 586297.0000, 586297.0000, 0.0000, 12820000.0000, 12820000.0000, 6970803.0000, 7790000.0000, 0.3567, 10117250.5200, 10117250.5200, 10577625.8200, NULL, NULL, NULL, 10577625.8200, 0.0340, 435880.0000, 232900.0000, 232900.0000, NULL, NULL, 96.0000, '管庄', '2014-08-27 20:43:32'),
	(75, '2013-08-08', '项目部表,第76行', 'XMF13-34', '天津东疆港瞰海轩工程', '项目部', NULL, '天津市', '王培俊', '北京玉林强钢化玻璃有限公司', '王培俊', '异地交税', NULL, 8061172.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 241835.1600, 240000.0000, 240000.0000, 1835.1600, 1600000.0000, 1600000.0000, 740160.0000, 1040000.0000, 0.0918, 1002259.0000, 1002259.0000, 1039549.0000, NULL, NULL, NULL, 1039549.0000, 0.0374, 59840.0000, 59840.0000, 59840.0000, 0.0000, NULL, 105.0000, '管庄', '2014-08-27 20:43:32'),
	(76, '2013-08-01', '项目部表,第77行', 'XMF13-35', '红星国际广场3#地A1楼铝合金门窗', '项目部', '天津市华运商贸物业有限公司', '天津市', '闫禄章', '北京奥维尔建筑材料销售有限公司', '闫禄章', '异地交税', NULL, 3427568.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 102827.0400, 102827.0000, 102827.0000, 0.0000, 2742054.4000, 2742054.4000, 2371539.8500, 2576919.6800, 0.6919, 2316496.2500, 2316496.2500, 2572434.8600, NULL, NULL, NULL, 2572434.8600, 0.0374, 102552.8346, 102552.8300, 102552.8300, 0.0046, NULL, 42.0000, '管庄', '2014-08-27 20:43:32'),
	(77, '2013-08-10', '项目部表,第78行', 'XMF13-36', '温泉公寓B型公寓一期外立面', '项目部', '北京春晖园文化娱乐有限责任公司', '北京市', '纪树军', '北京中建润泽建筑工程有限公司 ', '李邦海', '否', NULL, 2823828.2000, NULL, NULL, NULL, '0061067', '2013-08-26', 848.0000, NULL, '正常进行', 0.0300, 84714.8460, 84715.0000, 84715.0000, 0.0000, 2034096.6300, 2034096.6300, 1880221.6300, 2034096.6300, 0.6658, 1735922.1100, 1735922.1100, 1805082.1100, NULL, NULL, NULL, 1805082.1100, 0.0340, 69159.2854, 69160.0000, 69160.0000, 0.0000, NULL, 6.0000, '管庄', '2014-08-27 20:43:32'),
	(78, '2013-08-20', '项目部表,第79行', 'XMF13-37', '新宁波站改建工程', '项目部', '中铁建设集团有限公司宁波铁路枢纽工程项目经理部', '浙江宁波', '杨如林', '北京和平芙蓉商贸有限公司', '董宴春', '异地交税', NULL, 17411600.0000, 14846.0000, NULL, NULL, '0061070', '2013-09-04', 5224.0000, NULL, '正常进行', 0.0300, 522793.3800, 522348.0000, 522348.0000, 445.3800, 17426446.0000, 17426446.0000, 11357652.0000, 11880000.0000, 0.6517, 11232076.7000, 11232076.7000, 11735031.7400, NULL, NULL, NULL, 11735031.7400, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(79, '2013-08-25', '项目部表,第80行', 'XMF13-38', '国网智能电网研究院倒班宿舍楼', '项目部', '中铁建设集团有限公司', '北京市', '杨如林', '北京和平芙蓉商贸有限公司', '董宴春', '否', NULL, 407310.9800, NULL, NULL, NULL, '0061073', '2013-09-06', 123.0000, NULL, '正常进行', 0.0360, 14663.1953, 14663.0000, 14663.0000, 0.0000, 407310.9800, 407310.9800, 321488.0000, 350000.0000, 0.7893, 300000.0000, 300000.0000, 313849.0000, NULL, NULL, NULL, 313849.0000, 0.0340, 13848.5733, 13849.0000, 13849.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(80, '2013-09-02', '项目部表,第81行', 'XMF13-39', '锋创科技园4#研发办公楼', '项目部', '锋创科技发展（北京）有限公司', '北京市', '苏洪波', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 8700000.0000, 7411961.0000, NULL, NULL, '0245333', '2014-01-08', 2610.0000, NULL, '正常进行', 0.0300, 483358.8300, 476853.0000, 476853.0000, 6505.8300, 10308167.6400, 10308167.6400, 8516370.0500, 9343700.0500, 0.5286, 7420626.7900, 7420626.7900, 8252263.7900, NULL, NULL, NULL, 8252263.7900, 0.0340, 350477.6998, 350477.0000, 350477.0000, 0.0000, NULL, 90.0000, '管庄', '2014-08-27 20:43:32'),
	(81, '2013-09-05', '项目部表,第82行', 'XMF13-40', '望海楼南侧', '项目部', '北京德海鸿业投资有限公司', '北京市', '纪树军', '北京中建润泽建筑工程有限公司 ', '李邦海', '否', NULL, 360000.0000, NULL, NULL, NULL, '0061075', '2013-09-23', 108.0000, NULL, '完工', 0.0360, 12960.0000, 12960.0000, 12960.0000, 0.0000, 251827.0000, 251827.0000, 229305.0000, 250827.0000, 0.6370, 239535.1000, 239535.1000, 248097.1000, NULL, NULL, NULL, 248097.1000, 0.0340, 8562.1180, 8562.0000, 8562.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(82, '2013-11-10', '项目部表,第83行', 'XMF13-41', '欧逸丽庭二期北标段项目', '项目部', '三河成功房地产开发有限公司/中建二局第一建筑工程有限公司', '河北燕郊', '王军', '北京军建凯达幕墙装饰有限公司', '秦存国', '异地交税', NULL, 20420000.0000, NULL, NULL, NULL, '9061373', '2013-11-26', 6126.0000, NULL, '正常进行', 0.0300, 612600.0000, 612600.5000, 612600.5000, 0.0000, 7357840.3600, 7357840.3600, 6745239.8600, 7357840.3600, 0.3303, 7006009.7000, 7006009.7000, 7147414.3300, 121.0000, 956.0000, 1825.0000, 7150316.3300, 0.0356, 261939.1168, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(83, '2013-09-15', '项目部表,第84行', 'XMF13-42', '成功（中国）大广场休闲娱乐中心', '项目部', '成功（中国）大广场有限公司/中国建筑第二工程局有限公司', '河北燕郊', '王军', '北京军建凯达幕墙装饰有限公司', '秦存国', '异地交税', NULL, 26077738.8000, NULL, NULL, NULL, '9061374', '2013-11-26', 7824.0000, NULL, '正常进行', 0.0300, 782332.1640, 6047.0000, 6047.0000, 776285.1640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0356, 0.0000, NULL, NULL, NULL, NULL, 180.0000, '管庄', '2014-08-27 20:43:32'),
	(84, '2013-09-18', '项目部表,第85行', 'XMF13-43', '华远大厦维修项目', '项目部', '北京市华远集团有限公司', '北京市', '金生文', '北京长风幕墙装饰有限公司', '李猛', '否', NULL, 937580.0000, NULL, NULL, NULL, '0061077', '2013-09-30', 282.0000, NULL, '正常进行', 0.0360, 33752.8800, 33753.0000, 33753.0000, 0.0000, 589567.2000, 589567.2000, 535769.2000, 589567.2000, 0.5714, 562960.0000, 562960.0000, 583005.0000, NULL, NULL, NULL, 583005.0000, 0.0340, 20045.2848, 20045.0000, 20045.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(85, '2013-10-10', '项目部表,第86行', 'XMF13-44', '香河鸿坤理想城阳光项目', '项目部', '香河县鸿坤房地产开发有限公司', '河北香河', '冯国亮', '三河市益吉装饰工程有限公司', '冯国亮', '否', NULL, 7763574.6600, NULL, NULL, NULL, '0245329', '2013-12-19', 2330.0000, NULL, '正常进行', 0.0300, 232907.2398, 92979.0000, 92979.0000, 139928.2398, 4906233.0000, 4906233.0000, 3243597.0000, 3423677.0000, 0.4178, 3263646.1900, 3263646.1900, 3414292.4200, NULL, NULL, NULL, 3414292.4200, 0.0340, 166811.9220, 87101.0000, 87101.0000, NULL, NULL, 100.0000, '三河', '2014-08-27 20:43:32'),
	(86, '2013-10-15', '项目部表,第87行', 'XMF13-45', '1#楼生物技术研发中心项目幕墙工程', '项目部', '北京城建七建设工程有限公司', '北京市', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '否', NULL, 11700792.6900, NULL, NULL, NULL, '1245398', '2014-05-23', 4111.0000, NULL, '正常进行', 0.0300, 351023.7807, 351024.0000, 351024.0000, 0.0000, 5874521.0000, 5874521.0000, 5323764.0000, 5874521.0000, 0.4550, 5402150.1300, 5402150.1300, 5800083.1300, NULL, NULL, NULL, 5800083.1300, 0.0340, 199733.7140, 199733.0000, 199733.0000, 0.0000, NULL, 85.0000, '管庄', '2014-08-27 20:43:32'),
	(87, '2013-10-19', '项目部表,第88行', 'XMF13-46', 'A1厂房等8项-B1研发楼', '项目部', '北京港荣食品有限公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 3443591.3900, NULL, NULL, NULL, '1251028', '2014-04-07', 1034.0000, NULL, '正常进行', 0.0360, 123969.2900, 123969.0000, 123969.0000, 0.0000, 2421795.4200, 2421795.4200, 2215485.4200, 2421795.4200, 0.6434, 2312874.5800, 2312874.5800, 2359931.3900, NULL, NULL, 10613.0000, 2370544.3900, 0.0340, 82341.0443, 82341.0000, 82341.0000, 0.0000, NULL, 52.0000, '三河', '2014-08-27 20:43:32'),
	(88, '2013-10-05', '项目部表,第89行', 'XMF13-47', '数据技术研发中心建设项目6#楼', '项目部', '汇天网络科技有限公司', '北京市', '李智勇', '北京通联门窗有限公司', '吕松岩', '否', NULL, 14920000.0000, 53188404.7100, NULL, NULL, '1251034', '2014-04-10', 4476.0000, NULL, '正常进行', 0.0250, 1702710.1178, 1103347.0000, 1103347.0000, 599363.1178, 15000000.0000, 15000000.0000, 13365153.0000, 14978500.0000, 0.1962, 11787002.5600, 11787002.5600, 12097000.5600, NULL, NULL, NULL, 12097000.5600, 0.0340, 510000.0000, 510000.0000, 510000.0000, 0.0000, NULL, 210.0000, '管庄', '2014-08-27 20:43:32'),
	(89, '2013-10-15', '项目部表,第90行', 'XMF13-48', '研发办公楼D座等16项', '项目部', '中国新兴建设开发总公司', '北京市', '曲刚', '北京京业正通建筑材料有限责任公司', '王艳', '是', NULL, 126591039.3900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0200, 2531820.7878, 2317283.8600, 2317283.8600, 214536.9278, 43167474.4600, 43167474.4600, 40850190.1200, 43167473.9800, 0.3227, 36009565.6400, 36009565.6400, 40907590.8700, NULL, NULL, NULL, 40907590.8700, 0.0336, 1450427.1419, NULL, NULL, NULL, NULL, 530.0000, '管庄', '2014-08-27 20:43:32'),
	(90, '2013-10-18', '项目部表,第91行', 'XMF13-49', '天津红星国际广场3#地A2-A4楼', '项目部', '天津市华运商贸物业有限公司', '天津市', '闫禄章', '北京奥维尔建筑材料销售有限公司', '闫禄章', '异地交税', NULL, 5992383.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 179771.4900, 129771.0000, 129771.0000, 50000.4900, 4194668.0000, 4194668.0000, 4064897.0000, 4194668.0000, 0.6783, 3543290.0000, 3543290.0000, 3845489.2400, NULL, NULL, NULL, 3845489.2400, 0.0374, 156880.5832, NULL, NULL, NULL, NULL, 66.0000, '管庄', '2014-08-27 20:43:32'),
	(91, '2013-11-01', '项目部表,第92行', 'XMF13-50', '金宝花园', '项目部', '北京金宝房地产开发有限公司', '北京市', '韩魁', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 3117195.9800, NULL, NULL, NULL, '0245330', '2013-12-19', 936.0000, NULL, '正常进行', 0.0360, 112219.0553, 112219.0000, 112219.0000, 0.0000, 1555000.0000, 1555000.0000, 1354911.0000, 1520000.0000, 0.4347, 1449499.6400, 1449499.6400, 1502369.6400, NULL, NULL, NULL, 1502369.6400, 0.0340, 52870.0000, 52870.0000, 52870.0000, 0.0000, NULL, 35.0000, '大兴', '2014-08-27 20:43:32'),
	(92, '2013-11-21', '项目部表,第93行', 'XMF13-51', '大兴定向安置房（榆垡）', '项目部', '北京万兴建筑集团有限公司', '北京市', '孙磊', '北京红星日晟门窗厂', '李书玉', '否', NULL, 5811890.0000, NULL, NULL, NULL, '0245328', '2013-11-21', 1744.0000, NULL, '完工', 0.0400, 232475.6000, 232476.0000, 232476.0000, 0.0000, 2200000.0000, 2200000.0000, 1892724.0000, 2200000.0000, 0.3257, 1623974.0000, 1623974.0000, 1698774.0000, NULL, NULL, NULL, 1698774.0000, 0.0340, 74800.0000, 74800.0000, 74800.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(93, '2013-11-05', '项目部表,第94行', 'XMF13-52', '橡树湾售楼样板间', '项目部', '北京优高雅装饰工程有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 76467.0000, 479.0000, NULL, NULL, '0245339', '2014-01-18', 23.0000, NULL, '完工', 0.0360, 2770.0560, 2753.0000, 2753.0000, 17.0560, 76946.0000, 76946.0000, 48631.0000, 54000.0000, 0.6320, 50000.0000, 50000.0000, 52616.0000, NULL, NULL, NULL, 52616.0000, 0.0340, 2616.1640, 2616.0000, 2616.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(94, '2013-11-14', '项目部表,第95行', 'XMF13-53', '肽谷生命科学园1-2期', '项目部', '固安肽谷药业科技有限公司', '河北固安', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '异地交税', NULL, 3058486.0000, NULL, NULL, NULL, '9061371', '2013-11-18', 918.0000, NULL, '完工', 0.0360, 110105.4960, 110105.3600, 110105.3600, 0.0000, 2140940.2000, 2140940.2000, 2030834.8400, 2140940.2000, 0.6640, 1955643.6400, 1955643.6400, 2022412.1700, 714.0000, 3016.5000, 3827.0000, 2029969.6700, NULL, 0.0000, NULL, NULL, NULL, NULL, 30.0000, '管庄', '2014-08-27 20:43:32'),
	(95, '2013-11-18', '项目部表,第96行', 'XMF13-54', '门头沟项目B区铝合金门窗及百叶', '项目部', '华润置地发展（北京）有限公司/中天建设集团有限公司', '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 12067070.0000, NULL, NULL, NULL, '0446167', '2014-06-05', 3621.0000, NULL, '正常进行', 0.0300, 362012.1000, NULL, NULL, 362012.1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, 140.0000, '大厂', '2014-08-27 20:43:32'),
	(96, '2013-12-01', '项目部表,第97行', 'XMF13-55', '德州康博公馆一期一标段工程', '项目部', '青建集团股份公司', '山东德州', '李金光', '北京丰益宏业装饰有限公司', '李金光', '异地交税', NULL, 11000000.0000, NULL, NULL, NULL, '0245321', '2013-12-06', 3300.0000, NULL, '正常进行', 0.0300, 330000.0000, 330000.0000, 330000.0000, 0.0000, 5500000.0000, 5500000.0000, 4670000.0000, 5000000.0000, 0.4245, 4680000.0000, 4680000.0000, 4916450.0000, NULL, NULL, NULL, 4916450.0000, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 120.0000, '昌平', '2014-08-27 20:43:32'),
	(97, '2013-12-01', '项目部表,第98行', 'XMF13-56', '房山长沟镇改造一期', '项目部', '中国新兴建设开发总公司', '北京市', '付仁福', '北京富恒兴达装饰工程有限公司', '付仁福', '否', NULL, 924545.0000, NULL, NULL, NULL, '0245327', '2013-12-17', 278.0000, NULL, '正常进行', 0.0300, 27736.3500, 2200.0000, 2200.0000, 25536.3500, 300000.0000, 300000.0000, 287600.0000, 300000.0000, 0.3111, 202490.0000, 202490.0000, 219322.4900, NULL, NULL, 2490.0000, 221812.4900, 0.0340, 10200.0000, 10200.0000, 10200.0000, 0.0000, NULL, 7.0000, '亦庄', '2014-08-27 20:43:32'),
	(98, '2013-12-10', '项目部表,第99行', 'XMF13-57', '合肥南站', '项目部', '中铁建设集团有限公司', '安徽合肥', '颜自成', '杭州创基建筑装饰工程有限公司', '王艳', '异地交税', NULL, 19413696.1600, NULL, NULL, NULL, '1251031', '2014-04-10', 5825.0000, NULL, '正常进行', 0.0300, 582410.8848, 582411.0000, 582411.0000, 0.0000, 11410745.0000, 11410745.0000, 11737589.0000, 12320000.0000, 0.6046, 11478428.5500, 11478428.5500, 11478428.5500, NULL, NULL, NULL, 11478428.5500, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(99, '2013-12-18', '项目部表,第100行', 'XMF13-58', '华茂嘉园住宅小区隔热', '项目部', '江苏金月房地产集团有限公司', NULL, '马泽永', '天津市百环工贸有限公司', '王同利', NULL, NULL, 8060000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 241800.0000, 241800.0000, 241800.0000, 0.0000, NULL, NULL, 2815358.0000, 3057158.0000, 0.3493, 2765096.5200, 2765096.5200, 2765096.5200, NULL, NULL, NULL, 2765096.5200, NULL, NULL, NULL, NULL, 0.0000, NULL, 104.0000, '三河', '2014-08-27 20:43:32'),
	(100, '2013-12-18', '项目部表,第101行', 'XMF13-59', '5#生物研发楼外幕墙工程', '项目部', '北京中关村生命科学院园发展有限责任公司', '北京市', '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', '否', NULL, 229276.0000, NULL, NULL, NULL, '0446161', '2014-05-23', 69.0000, NULL, '完工', 0.0300, 6878.2800, NULL, NULL, 6878.2800, 91710.7600, 91710.7600, 88592.7600, 91710.7600, 0.3864, 60349.0000, 60349.0000, 66158.0000, NULL, NULL, NULL, 66158.0000, 0.0340, 3118.1658, 3118.0000, 3118.0000, 0.0000, NULL, 2.0000, '管庄', '2014-08-27 20:43:32'),
	(101, '2013-12-20', '项目部表,第102行', 'XMF13-60', '总政机关黄寺礼堂', '项目部', '中国人民解放军总政治部机关营建办公室', '北京市', '李玉朝', '北京若愚装饰有限公司', '杨书芳', '否', NULL, 330000.0000, NULL, NULL, NULL, '0245332', '2013-12-25', 99.0000, NULL, '完工', 0.0360, 11880.0000, 3405.5000, 3405.5000, 8474.5000, 180000.0000, 180000.0000, 170474.5000, 180000.0000, 0.5166, 170720.0000, 170720.0000, 176120.0000, NULL, 720.0000, NULL, 176840.0000, 0.0340, 6120.0000, 6120.0000, 6120.0000, 0.0000, NULL, 5.0000, '昌平', '2014-08-27 20:43:32'),
	(102, '2014-01-01', '项目部表,第103行', 'XMF14-01', '贵阳北站', '项目部', '中铁建设集团有限公司贵阳北站项目经理部', '贵州省贵阳市', '王江军', '杭州蓝博凯盾防火门有限公司', '王江军', '异地交税', NULL, 61225227.0000, NULL, NULL, NULL, '1251022', '2014-02-27', 18368.0000, NULL, '正常进行', 0.0250, 1530630.6750, 790000.0000, 790000.0000, 740630.6750, 28124956.1800, 28124956.1800, 18897469.3300, 19687469.3300, 0.3087, 14697501.2800, 14697501.2800, 17777554.5600, NULL, NULL, NULL, 17777554.5600, 0.0356, 1001248.4400, NULL, NULL, NULL, NULL, NULL, '亦庄', '2014-08-27 20:43:32'),
	(103, '2014-01-01', '项目部表,第104行', 'XMF14-02', '3829玻璃石材幕墙及断桥铝合金', '项目部', '61195部队后勤部管理处财务科', '北京市', '霍林宝', '中国人民解放军61159部队后勤部', '霍林宝', '否', NULL, 14355608.0700, NULL, NULL, NULL, '1251023', '2014-03-05', 4307.0000, NULL, '正常进行', 0.0320, 459379.4582, 459379.0000, 459379.0000, 0.0000, 10766705.5800, 10766705.5800, 9941258.5800, 10766705.5800, 0.6925, 8237236.8900, 8237236.8900, 10005119.2400, NULL, NULL, NULL, 10005119.2400, 0.0340, 366067.9897, 366068.0000, 366068.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(104, '2014-01-01', '项目部表,第105行', 'XMF14-03', '解放军302医院感染综合楼', '项目部', '中国人民解放军第三〇二医院', '北京市', '邵幸来', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(105, '2014-01-01', '项目部表,第106行', 'XMF14-04', '北京实创科技园开发建设股份有限公司', '项目部', '中集建设集团有限公司', '北京市', '金生文', '北京长风幕墙装饰有限公司', '李猛', '否', NULL, 42615176.3500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 1278455.2905, 800000.0000, 800000.0000, 478455.2905, 17886113.5000, 17886113.5000, 16477985.5000, 17886113.5000, 0.3867, 16222938.1000, 16222938.1000, 17003848.5200, NULL, NULL, NULL, 17003848.5200, 0.0340, 608127.8590, 608128.0000, 608128.0000, 0.0000, NULL, 150.0000, '亦庄', '2014-08-27 20:43:32'),
	(106, '2014-03-01', '项目部表,第107行', 'XMF14-06', '北京嘉里中心翻装项目办公楼', '项目部', '北京嘉奥房地产开发有限公司', '北京市', '柯秋惠', '北京宇光装饰有限公司', '柯秋惠', '否', NULL, 261648.4100, NULL, NULL, NULL, '1251026', '2014-03-26', 79.0000, NULL, '正常进行', 0.0360, 9419.3428, 9419.0000, 9419.0000, 0.0000, 248565.9900, 248565.9900, 230605.9900, 248565.9900, 0.8814, 109977.0000, 109977.0000, 248518.0000, NULL, NULL, NULL, 248518.0000, 0.0340, 8451.2437, 8541.0000, 8541.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(107, '2014-03-01', '项目部表,第108行', 'XMF14-07', '德州康博公馆一期2#工程', '项目部', '中天建设集团有限公司德厚分公司', '山东德州', '李金光', '北京丰益宏业装饰有限公司', '李金光', NULL, NULL, 1054353.5300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 31630.6059, 31631.0000, 31631.0000, 0.0000, 200000.0000, 200000.0000, 161569.0000, 200000.0000, 0.1532, 80000.0000, 80000.0000, 86800.0000, NULL, NULL, NULL, 86800.0000, 0.0340, 6800.0000, 6800.0000, 6800.0000, 0.0000, NULL, 15.0000, '昌平', '2014-08-27 20:43:32'),
	(108, '2014-04-01', '项目部表,第109行', 'XMF14-08', '北京联合大学第二教学楼', '项目部', '北京市第五建筑工程集团有限公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 1393840.0000, 853433.7000, NULL, NULL, '1245385', '2014-05-04', 419.0000, NULL, '正常进行', 0.0360, 50178.2400, 50613.0000, 50613.0000, -434.7600, 1142434.7100, 1142434.7100, 1052979.7100, 1142434.7100, 0.4686, 932058.0500, 932058.0500, 972572.0500, NULL, NULL, NULL, 972572.0500, 0.0340, 38842.7801, 38842.0000, 38842.0000, 0.0000, NULL, 20.0000, '三河', '2014-08-27 20:43:32'),
	(109, '2014-04-01', '项目部表,第110行', 'XMF14-09', '北京西红门兴海学校扩建项目', '项目部', '北京鸿坤伟业房地产开发有限公司', '北京市', '冯国亮', '三河市益吉装饰工程有限公司', '冯国亮', '否', NULL, 1470000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 52920.0000, NULL, NULL, 52920.0000, 1176000.0100, 1176000.0000, 624049.2800, 664033.2800, 0.4245, 243938.2400, 243938.2400, 283922.2400, NULL, NULL, NULL, 283922.2400, 0.0340, 39984.0000, 39984.0000, 39984.0000, 0.0000, NULL, 1.0000, '三河', '2014-08-27 20:43:32'),
	(110, '2014-04-16', '项目部表,第111行', 'XMF14-10', '中国人民解放军96819部队综合管理楼', '项目部', '中国新兴建设开发总公司', '北京市', '马泽永', '天津市百环工贸有限公司', '王同利', '否', NULL, 1287679.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 46356.4440, 46356.0000, 46356.0000, 0.0000, 400000.0000, 400000.0000, 340044.0000, 400000.0000, 0.2641, 353418.7200, 353418.7200, 367018.7200, NULL, NULL, NULL, 367018.7200, 0.0340, 13600.0000, 13600.0000, 13600.0000, 0.0000, NULL, 20.0000, '三河', '2014-08-27 20:43:32'),
	(111, '2014-04-18', '项目部表,第112行', 'XMF14-11', '大兴京城高尔夫俱乐部', '项目部', '北京建工博海建设有限公司', '北京市', '孙超', '北京海锐广告有限公司', '孙超', '否', NULL, 420488.3000, NULL, NULL, NULL, '0446164', '2014-05-30', 127.0000, NULL, '正常进行', 0.0360, 15137.5788, NULL, NULL, 15137.5788, 378000.0000, 378000.0000, 365148.0000, 378000.0000, 0.8684, 318684.4900, 318684.4900, 351536.4900, NULL, NULL, NULL, 351536.4900, 0.0340, 12852.0000, 12852.0000, 12852.0000, 0.0000, NULL, 5.0000, '三河', '2014-08-27 20:43:32'),
	(112, '2014-04-15', '项目部表,第113行', 'XMF14-12', '援肯尼亚卡通都医院', '项目部', NULL, NULL, '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', NULL, NULL, 1414102.4900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 50907.6896, 50908.0000, 50908.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 15.0000, '管庄', '2014-08-27 20:43:32'),
	(113, '2014-05-01', '项目部表,第114行', 'XMF14-13', '天津东疆港瞰海轩工程', '项目部', '浙江宝业建设集团有限公司', '天津市', '王培俊', '北京玉林强钢化玻璃有限公司', '王培俊', '异地交税', NULL, 10118443.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 303553.2900, 100000.0000, 100000.0000, 203553.2900, 4800000.0000, 4800000.0000, 1520480.0000, 1800000.0000, 0.1503, 1739791.0000, 1739791.0000, 1800811.0000, NULL, NULL, NULL, 1800811.0000, 0.0374, 179520.0000, 179520.0000, 179520.0000, 0.0000, NULL, 132.0000, '管庄', '2014-08-27 20:43:32'),
	(114, '2014-05-08', '项目部表,第115行', 'XMF14-14', '国家体育总局乒乓球馆', '项目部', '北京建工集团有限责任公司', '北京市', '韩魁', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 944953.4100, NULL, NULL, NULL, '125391', '2014-05-14', 284.0000, NULL, '正常进行', 0.0360, 34018.3228, 19298.8000, 19298.8000, 14719.5228, 500000.0000, 500000.0000, 470501.2000, 500000.0000, 0.4979, 358429.0900, 358429.0900, 404563.0900, NULL, NULL, NULL, 404563.0900, 0.0340, 17000.0000, 10200.0000, 10200.0000, 6800.0000, NULL, 4.0000, '大兴', '2014-08-27 20:43:32'),
	(115, '2014-05-01', '项目部表,第116行', 'XMF14-15', '双井宿舍楼工程', '项目部', '中国国际贸易中心有限公司', '北京市', '柯秋惠', '北京宇光装饰有限公司', '柯秋惠', '否', NULL, 14986416.5300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 449592.4959, NULL, NULL, 449592.4959, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 110.0000, '三河', '2014-08-27 20:43:32'),
	(116, '2014-05-01', '项目部表,第117行', 'XMF14-16', '天津武清红星广场示范区', '项目部', NULL, '天津市', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(117, '2014-05-01', '项目部表,第118行', 'XMF14-17', '大兴旧宫中学改扩建项目', '项目部', NULL, '北京市', '孙磊', '北京红星日晟门窗厂', NULL, NULL, NULL, 769500.0000, NULL, NULL, NULL, '0446168', '2014-06-06', 231.0000, NULL, '正常进行', 0.0460, 35397.0000, 35397.0000, 35397.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 6.0000, '亦庄', '2014-08-27 20:43:32'),
	(118, '2014-05-20', '项目部表,第119行', 'XMF14-18', 'M5样板间外立面幕墙', '项目部', '北京五居投资有限公司', '北京市', '许谊', '北京闵铝鑫门窗有限公司', '许谊', '否', NULL, 520000.0000, NULL, NULL, NULL, '0446165', '2014-06-03', 156.0000, NULL, '正常进行', 0.0360, 18720.0000, 18720.0000, 18720.0000, 0.0000, 156000.0000, 156000.0000, 131976.0000, 156000.0000, 0.2538, 140000.0000, 140000.0000, 145304.0000, NULL, NULL, NULL, 145304.0000, 0.0340, 5304.0000, 5304.0000, 5304.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(119, '2014-06-01', '项目部表,第120行', 'XMF14-19', '东北旺农场科研楼一号楼', '项目部', '北京城建道桥建设集团有限公司', '北京市', '李金光', '北京丰益宏业装饰有限公司', '李金光', '否', NULL, 14800000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, 3300000.0000, 3300000.0000, 0.2230, 1261050.0000, 1261050.0000, 1261050.0000, NULL, NULL, NULL, 1261050.0000, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, 44.0000, '昌平', '2014-08-27 20:43:32'),
	(120, '2014-06-01', '项目部表,第121行', 'XMF14-20', '61785部队二期经济适用房', '项目部', NULL, '北京市', '霍林宝', '中国人民解放军61159部队后勤部', '霍林宝', '否', NULL, 3326070.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 119738.5200, NULL, NULL, 119738.5200, 300000.0000, 300000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 10200.0000, NULL, NULL, 10200.0000, NULL, 35.0000, '亦庄', '2014-08-27 20:43:32'),
	(121, '2014-06-30', '项目部表,第122行', 'XMF14-21', '北京中医药大学良乡校区东院', '项目部', NULL, '北京市', '倪勇', '上海昂亚装饰有限公司', '倪勇', '否', NULL, 5305357.6000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 159160.7280, 100000.0000, 100000.0000, 59160.7280, 1060000.0000, 1060000.0000, 923960.0000, 1060000.0000, 0.1742, 356366.4300, 356366.4300, 428446.4300, NULL, NULL, NULL, 428446.4300, 0.0340, 36040.0000, 36040.0000, 36040.0000, 0.0000, NULL, 72.0000, '三河', '2014-08-27 20:43:32'),
	(122, '2014-07-01', '项目部表,第123行', 'XMF14-22', '天津武清原乡郡项目示范区', '项目部', NULL, '天津市', '冯国亮', '三河市益吉装饰工程有限公司', '冯国亮', NULL, NULL, 743283.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 26758.1880, NULL, NULL, 26758.1880, 631790.5500, 631790.5500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, 10.0000, '三河', '2014-08-27 20:43:32'),
	(123, '2014-07-17', '项目部表,第124行', 'XMF14-23', '万兴综合楼工程', '项目部', NULL, NULL, '罗刚', '北京世纪锦湖装饰工程有限公司', '罗刚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(124, '2014-07-17', '项目部表,第125行', 'XMF14-24', '靓景明居四期', '项目部', NULL, '北京市', '徐建军', '高碑店市嘉鑫靓景窗业有限公司', '李成军', '否', NULL, 5519500.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0300, 165585.0000, 50000.0000, 50000.0000, 115585.0000, 1000000.0000, 1000000.0000, 916000.0000, 1000000.0000, 0.1660, 701510.9200, 701510.9200, 735510.9200, NULL, NULL, NULL, 735510.9200, 0.0340, 34000.0000, 34000.0000, 34000.0000, 0.0000, NULL, 77.0000, '管庄', '2014-08-27 20:43:32'),
	(125, '2014-07-17', '项目部表,第126行', 'XMF14-25', '海淀清河二期B4区', '项目部', NULL, '北京市', '余斌', '博洋恒润（北京）幕墙装饰工程有限公司', '余斌', '否', NULL, 14892896.9900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', NULL, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(126, '2014-07-01', '项目部表,第127行', 'XMF14-26', '6201工程', '项目部', '中国人民解放军战略规划综合局', '北京市', '霍林宝', '中国人民解放军61159部队后勤部', '霍林宝', '否', NULL, 1885067.2000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 67862.4192, NULL, NULL, 67862.4192, 565520.0000, 565520.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 19227.6800, NULL, NULL, 19227.6800, NULL, 21.0000, '亦庄', '2014-08-27 20:43:32'),
	(127, '2014-07-01', '项目部表,第128行', 'XMF14-27', '21#住宅楼等18项', '项目部', NULL, '北京市', '李春光', '北京邦士富生物科技有限公司', '李玉斌', '否', NULL, 1679000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 60444.0000, NULL, NULL, 60444.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, 19.0000, '亦庄', '2014-08-27 20:43:32'),
	(128, '2014-07-01', '项目部表,第129行', 'XMF14-28', '北京市十一学校改造工程', '项目部', NULL, '北京市', '王军', '北京军建凯达幕墙装饰有限公司', '秦存国', '否', NULL, 1758061.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 63290.1960, NULL, NULL, 63290.1960, 527418.3000, 527418.3000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 17932.2222, NULL, NULL, 17932.2222, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(129, '2014-08-04', '项目部表,第130行', 'XMF14-29', '总政机关东区34号楼断桥铝合金', '项目部', '总政机关营建办公室', '北京市', '李玉朝', '北京若愚装饰有限公司', '杨书芳', '否', NULL, 100000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '正常进行', 0.0360, 3600.0000, NULL, NULL, 3600.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0340, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '2014-08-27 20:43:32'),
	(130, '2009-03-01', '刘海青', 'SY2009-03', '四方景园工程', '事业部', NULL, NULL, '刘海青', NULL, '刘海青', '否', NULL, 85000.0000, NULL, NULL, 85000.0000, NULL, NULL, NULL, '否', '已结算', 0.0660, 5610.0000, 5610.0000, 5610.0000, 0.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 41400.0000, NULL, NULL, NULL, 41400.0000, 0.0340, 2890.0000, 2890.0000, 2890.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(131, '2010-01-01', '刘海青', 'SY2010-01', '中直机关', '事业部', NULL, NULL, '刘海青', NULL, '刘海青', '否', NULL, 7494658.1800, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0660, 494647.4399, 494647.4400, 494647.4400, -0.0001, NULL, NULL, 6632228.2200, 6632228.2200, 0.8849, NULL, NULL, 6578447.8700, NULL, NULL, NULL, 6578447.8700, 0.0340, 254818.3781, 254818.3800, 254818.3800, -0.0019, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(132, '2010-02-01', '刘海青', 'SY2010-02', '大万综合楼', '事业部', NULL, NULL, '刘海青', NULL, '刘海青', '否', NULL, 3283372.2100, NULL, NULL, 0.0000, NULL, NULL, NULL, '是', '已暂停', 0.0660, 216702.5659, 216702.5700, 216702.5700, -0.0041, NULL, NULL, 2335165.1400, 2335165.1400, 0.7112, NULL, NULL, NULL, NULL, NULL, NULL, 2551867.7100, 0.0340, 111634.6551, 89817.2900, 89817.2900, 21817.3651, 704031.4900, NULL, NULL, '2014-08-27 20:44:08'),
	(133, '2010-03-01', '刘海青', 'SY2010-03', '北京嘉泽生态园', '事业部', NULL, NULL, '刘海青', NULL, '刘海青', '否', NULL, 7212049.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0660, 475995.2340, 475995.2300, 475995.2300, 0.0040, NULL, NULL, 5870276.2400, 5870276.2400, 0.8140, NULL, NULL, NULL, NULL, NULL, NULL, 6277110.3500, 0.0340, 245209.6660, 223367.7300, 223367.7300, 21841.9360, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(134, '2011-01-01', '事业一部', 'SY2011-01', '北京汽车城', '事业部', '中国中铁航空港建设集团有限公司', '北京市顺义区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 66000.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0660, 4356.0000, 0.0000, 0.0000, 4356.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0340, 2244.0000, 0.0000, 0.0000, 2244.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(135, '2011-05-01', '事业一部', 'SY2011-05', '顺义汽车城', '事业部', '中国中铁航空港建设集团有限公司', '北京市顺义区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 3283372.2100, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0660, 216702.5659, 216702.5700, 216702.5700, -0.0041, NULL, NULL, 2335165.1400, 2335165.1400, 0.7112, NULL, NULL, NULL, NULL, NULL, NULL, 2551867.7100, 0.0340, 111634.6551, 89817.2900, 89817.2900, 21817.3651, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(136, '2011-07-01', '事业一部', 'SY2011-07', '顺义汽车城（幕墙工程）', '事业部', '中国中铁航空港建设集团有限公司', '北京市顺义区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 7212049.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0660, 475995.2340, 475995.2300, 475995.2300, 0.0040, NULL, NULL, 5870276.2400, 5870276.2400, 0.8140, NULL, NULL, NULL, NULL, NULL, NULL, 6277110.3500, 0.0340, 245209.6660, 223367.7300, 223367.7300, 21841.9360, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(137, '2011-07-01', '事业一部', 'SY2011-07增', '顺义汽车城', '事业部', '中国中铁航空港建设集团有限公司', '北京市顺义区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 665109.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0400, 26604.3600, 0.0000, 0.0000, 26604.3600, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 22613.7060, 0.0000, 0.0000, 22613.7060, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(138, '2012-01-01', '孙景龙', 'SY2012-01', '鸿嘉会所', '事业部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10343049.9300, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0350, 362006.7476, 362006.7500, 362006.7500, -0.0024, NULL, NULL, 7387562.4600, 7387562.4600, 0.7143, NULL, NULL, 7748729.1300, NULL, NULL, NULL, 7748729.1300, 0.0340, 351663.6976, 111118.8000, 111118.8000, 240544.8976, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(139, '2012-02-01', '孙景龙', 'SY2012-02', '鸿嘉商务楼', '事业部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90000.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0640, 5760.0000, 5760.0000, 5760.0000, 0.0000, NULL, NULL, 61200.0000, 61200.0000, 0.6800, NULL, NULL, 66960.0000, NULL, NULL, NULL, 66960.0000, 0.0560, 5040.0000, 5040.0000, 5040.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(140, '2012-03-01', '孙景龙', 'SY2012-03', '融科智地', '事业部', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 552000.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0860, 47472.0000, 41668.0900, 41668.0900, 5803.9100, NULL, NULL, 438868.7100, 438868.7100, 0.7951, NULL, NULL, 480537.0000, NULL, NULL, NULL, 480537.0000, NULL, 16263.2000, 16263.2000, 16263.2000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(141, '2012-04-01', '事业三部', 'SY2012-04', '江西908综合楼', '事业部', '海力建设集团有限公司(甲方1）                中国航空国际建设有限公司（甲方2）', '江西洪都航空工业集团有限责任公司院内', '李平', '北京九天装饰有限责任公司', '李平', '是', NULL, 28833444.8000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '正常进行', 0.0560, 1614672.9088, 1614673.0000, 1614673.0000, -0.0912, NULL, NULL, 21052082.8000, 21052082.8000, 0.7301, NULL, NULL, 22653028.3800, NULL, NULL, NULL, 22653028.3800, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(142, '2012-06-01', '事业五部', 'SY2012-06', '兴城莲花酒店', '事业部', '葫芦岛海上海莲花商务酒店有限公司', '兴城市', '邵永辉', '葫芦岛志远事业有限公司', '邵永辉', '是', NULL, 6196000.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0400, 247840.0000, NULL, 0.0000, 247840.0000, NULL, NULL, 3500000.0000, 3500000.0000, 0.5649, NULL, NULL, 3489148.6500, NULL, NULL, NULL, 3489148.6500, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(143, '2012-07-01', '事业五部', 'SY2012-07', '兴城公安局', '事业部', '兴城公安局', '兴城市', '邵永辉', '葫芦岛志远事业有限公司', '邵永辉', '是', NULL, 1810092.0000, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0400, 72403.6800, 72404.0000, 72404.0000, -0.3200, NULL, NULL, 1727596.0000, 1727596.0000, 0.9544, NULL, NULL, 1796144.0000, NULL, NULL, NULL, 1796144.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(144, '2012-08-01', '事业一部', 'SY2012-08', '唐山君熙', '事业部', '唐山君熙房地产开发有限公司', '唐山丰南区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '是', NULL, 10343049.9300, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '已暂停', 0.0350, 362006.7476, 362006.7500, 362006.7500, -0.0024, NULL, NULL, 7387562.4600, 7387562.4600, 0.7143, NULL, NULL, 7748729.1300, NULL, NULL, NULL, 7748729.1300, 0.0340, 351663.6976, 111118.8000, 111118.8000, 240544.8976, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(145, '2012-09-01', '事业十部', 'SY2012-09', '呼市中海御龙湾', '事业部', '呼和浩特市中海宏洋地产有限公司', '呼和浩特市', '高元生', '北京源生缘门窗有限公司', '高元生', '是', NULL, 10102313.3300, NULL, NULL, 0.0000, NULL, NULL, NULL, '否', '正常进行', 0.0500, 505115.6665, 505116.0000, 505116.0000, -0.3335, NULL, NULL, 7269904.7600, 7269904.7600, 0.7196, NULL, NULL, 7517811.9900, NULL, NULL, NULL, 7517811.9900, NULL, 0.0000, 306828.0800, 306828.0800, -306828.0800, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(146, '2012-10-01', '事业十二部', 'SY2012-10', '北京军区装备部', '事业部', '中航天建设工程有限公司', '北京市丰台区东大街41号', '陈建中', '北京源泰力建筑装饰工程有限公司', '陈建中', '否', NULL, 5400000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 216000.0000, 216000.0000, 216000.0000, 0.0000, NULL, NULL, 3876209.0000, 3876209.0000, 0.7178, NULL, NULL, 4091973.9600, NULL, NULL, NULL, 4091973.9600, 0.0340, 183600.0000, 144033.0000, 144033.0000, 39567.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(147, '2012-10-01', '事业十二部', 'SY2012-10增1', '北京军区装备部', '事业部', '中航天建设工程有限公司', '北京市丰台区东大街42号', '陈建中', '北京源泰力建筑装饰工程有限公司', '陈建中', '否', NULL, 248322.8000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 9932.9120, 9933.0000, 9933.0000, -0.0880, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(148, '2012-11-01', '事业十部', 'SY2012-11', '大兴教委会', '事业部', '大兴区教育委员会', '北京市大兴区', '高元生', '北京源生缘门窗有限公司', '高元生', '否', NULL, 1095654.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 43826.1600, 43827.0000, 43827.0000, -0.8400, NULL, NULL, 854553.0000, 854553.0000, 0.7799, NULL, NULL, 898120.1500, NULL, NULL, NULL, 898120.1500, 0.0346, 37909.6284, 31620.0000, 31620.0000, 6289.6284, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(149, '2012-12-01', '事业二部', 'SY2012-12', '西藏自然博物馆', '事业部', '中国机械工业建设集团有限公司', '西藏自治区拉萨市', '王培俊', '北京玉林强钢化玻璃有限公司', '王培彦', '是', NULL, 7400000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 296000.0000, 296000.0000, 296000.0000, 0.0000, NULL, NULL, 2781684.5800, 2781684.5800, 0.3759, NULL, NULL, 3103690.0000, NULL, NULL, NULL, 3103690.0000, 0.0340, 251600.0000, 54365.4200, 54365.4200, 197234.5800, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(150, '2012-12-01', '事业二部', 'SY2012-12增1', '西藏自然博物馆', '事业部', '中国机械工业建设集团有限公司', '西藏自治区拉萨市', '王培俊', '北京玉林强钢化玻璃有限公司', '王培彦', '是', NULL, 1679000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 60444.0000, 0.0000, 0.0000, 60444.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 57086.0000, 0.0000, 0.0000, 57086.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(151, '2012-12-01', '事业十六部', 'SY2012-13', '西城区扩建办公楼', '事业部', '北京建工集团有限公司', '北京市西城区西内冠英园西区联络处', '韩魁', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 1424272.9000, NULL, NULL, 679820.0000, NULL, NULL, NULL, '否', '已结算', 0.0400, 27192.8000, 27192.8000, 27192.8000, 0.0000, NULL, NULL, 596850.8100, 596850.8100, 0.8780, NULL, NULL, 620287.3900, NULL, NULL, NULL, 620287.3900, 0.0340, 23113.8800, 21965.3900, 21965.3900, 1148.4900, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(152, '2012-12-01', '孙景龙', 'SY2012-14', '平阳景苑', '事业部', '山西恒实平阳房地产开发有限公司', '山西', NULL, NULL, NULL, '是', NULL, 560000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0650, 36400.0000, 36400.0000, 36400.0000, 0.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(153, '2012-12-01', '事业十一部', 'SY2012-15', '丹东万达', '事业部', '丹东万达广场有限公司', '锦山大街以北，立交新路以西', '李文达', '三河市汇远通达装饰有限公司', '李文达', '否', NULL, 10496879.0000, NULL, NULL, 12240225.0000, NULL, NULL, NULL, '否', '已结算', 0.0350, 428407.8750, 367390.7600, 367390.7600, 61017.1150, NULL, NULL, 9025311.0300, 9025311.0300, 0.8598, NULL, NULL, 9234785.1900, NULL, NULL, NULL, 9234785.1900, NULL, 414478.4100, 414478.4100, 414478.4100, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(154, '2013-01-01', '事业十二部', 'SY2013-01', '阜外心血管玻璃幕墙', '事业部', '中国医学科学院阜外心血管医院', '门头沟区永定镇冯村西里阜外医院西山院区', '陈建中', '北京源泰力建筑装饰工程有限公司', '陈建中', '否', NULL, 3323897.0800, NULL, NULL, 4884000.0000, NULL, NULL, NULL, '否', '已结算', 0.0400, 195360.0000, 195360.0000, 195360.0000, 0.0000, NULL, NULL, 3491755.0000, 3491755.0000, 1.0505, NULL, NULL, 3658680.6700, NULL, NULL, NULL, 3658680.6700, 0.0340, 113012.5007, 129743.0000, 129743.0000, -16730.4993, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(155, '2013-02-01', '事业一部', 'SY2013-02', '唐山君熙太和石材幕墙', '事业部', '唐山君熙房地产开发有限公司', '唐山丰南区', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '是', NULL, 24479188.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0350, 856771.5800, 856771.5800, 856771.5800, 0.0000, NULL, NULL, 13373796.7700, 13373796.7700, 0.5463, NULL, NULL, 14128142.7400, NULL, NULL, NULL, 14128142.7400, 0.0370, 905729.9560, 603593.6700, 603593.6700, 302136.2860, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(156, '2013-03-01', '事业三部', 'SY2013-03', '神农架机场航站楼', '事业部', '北京金港机场建设有限责任公司', '神农架林区红坪镇', '李平', '北京九天装饰有限责任公司', '李平', '是', NULL, 735929.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 32437.1600, 32438.0000, 32438.0000, -0.8400, NULL, NULL, 337501.5300, 337501.5300, 0.4586, NULL, NULL, 369384.0000, NULL, NULL, NULL, 369384.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(157, '2013-04-01', '事业五部', 'SY2013-04', '渤海船舶职业学院', '事业部', '渤海船舶职业学院', '葫芦岛', '邵永辉', '葫芦岛志远事业有限公司', '邵永辉', '是', NULL, 7457847.7100, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 298313.9084, 298314.0000, 298314.0000, -0.0916, NULL, NULL, 6409257.5900, 6409257.5900, 0.8594, NULL, NULL, 6685410.4400, NULL, NULL, NULL, 6685410.4400, 0.0340, 253566.8221, 140035.0700, 140035.0700, 113531.7521, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(158, '2013-05-01', '事业三部', 'SY2013-05', 'B1-01、B1-02厂房外墙', '事业部', '江西洪都航空工业股份有限公司', '南昌航空城航空路以东', '李平', '北京九天装饰有限责任公司', '李平', '是', NULL, 4596832.5100, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 183873.3004, 183873.8900, 183873.8900, -0.5896, NULL, NULL, 3081717.4100, 3081717.4100, 0.6704, NULL, NULL, 3112799.8000, NULL, NULL, NULL, 3112799.8000, NULL, 137474.6700, 137474.6700, 137474.6700, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(159, '2013-05-01', '事业三部', 'SY2013-05增1', '南昌物流中心B02厂房外墙', '事业部', '江西洪都航空工业股份有限公司', '南昌航空城航空路以东', '李平', '北京九天装饰有限责任公司', '李平', '是', NULL, 573502.8400, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 22940.1136, 22940.1100, 22940.1100, 0.0036, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(160, '2013-06-01', '事业十五部', 'SY2013-06', '漯河驻京办事处', '事业部', '漯河市人民政府驻北京联络处', '北京市西城区西直门内大街南草厂街', '周成军', '北京荣发建筑装饰工程有限公司', '周成军', '否', NULL, 773935.0400, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 30957.4016, 30958.0000, 30958.0000, -0.5984, NULL, NULL, 567138.0000, 567138.0000, 0.7328, NULL, NULL, 525687.9100, NULL, NULL, NULL, 525687.9100, 0.0340, 26313.7914, 21051.0000, 21051.0000, 5262.7914, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(161, '2013-07-01', '事业十部', 'SY2013-07', '呼市宇生苑售楼中心', '事业部', '内蒙古南璞房地产开发有限公司', '呼和浩特市新城区南店滨水新村', '高元生', '北京源生缘门窗有限公司', '高元生', '是', NULL, 238178.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 9527.1200, 9569.0000, 9569.0000, -41.8800, NULL, NULL, 151279.0400, 151279.0400, 0.6352, NULL, NULL, 178578.0000, NULL, NULL, NULL, 178578.0000, 0.0346, 8240.9588, 8240.9600, 8240.9600, -0.0012, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(162, '2013-08-01', '事业十五部', 'SY2013-08', '办公综合楼（冠京先河）', '事业部', '北京市冠京先河建筑工程有限公司', '北京市丰台区角门北路6号', '周成军', '北京荣发建筑装饰工程有限公司', '周成军', '否', NULL, 6455953.0800, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 258238.1232, 258238.1200, 258238.1200, 0.0032, NULL, NULL, 5665239.7300, 5665239.7300, 0.8775, NULL, NULL, 5413506.1700, NULL, NULL, NULL, 5413506.1700, 0.0340, 219502.4047, 208486.9600, 208486.9600, 11015.4447, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(163, '2013-09-01', '事业十六部', 'SY2013-09', '北京总参塔院干休所住宅楼', '事业部', '中国新兴保信建设总公司', '海淀区花园路甲1号', '韩魁', '北京嘉世弘商贸有限公司', '韩魁', '否', NULL, 1860000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 74400.0000, 74400.0000, 74400.0000, 0.0000, NULL, NULL, 1133100.0000, 1133100.0000, 0.6092, NULL, NULL, 1088668.1500, NULL, NULL, NULL, 1088668.1500, 0.0340, 63240.0000, 42500.0000, 42500.0000, 20740.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(164, '2013-10-01', '事业十三部', 'SY2013-10', '西安中海国际社区', '事业部', '中海兴业（西安）有限公司', '西安市曲江新区', '曾灵', '北京华阜家园装饰装修有限公司', '陈明霞 ', '是', NULL, 4095378.2500, NULL, NULL, NULL, NULL, NULL, NULL, '是', '正常进行', 0.0400, 163815.1300, 82026.1000, 82026.1000, 81789.0300, NULL, NULL, 2790560.6700, 2790560.6700, 0.6814, NULL, NULL, 2211953.5000, NULL, NULL, NULL, 2211953.5000, NULL, 148512.0000, 78290.9200, 78290.9200, 70221.0800, 322921.0000, NULL, NULL, '2014-08-27 20:44:08'),
	(165, '2013-11-01', '事业一部', 'SY2013-11', '廊坊幸福园', '事业部', '廊坊市京御幸福房地产开发有限公司', '廊坊市北凤道以北，永兴路以东', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '是', NULL, 5489711.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 164691.3300, 164692.0000, 164692.0000, -0.6700, NULL, NULL, 4068533.9400, 4068533.9400, 0.7411, NULL, NULL, 4131953.8300, NULL, NULL, NULL, 4131953.8300, 0.0361, 198178.5671, 158542.8600, 158542.8600, 39635.7071, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(166, '2013-12-01', '事业一部', 'SY2013-12及增1', '门头沟天台山居住项目', '事业部', '北京市天台山房地产开发有限公司', '门头沟区新城城子地区21-218地块', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 9753320.8200, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 292599.6246, 271590.5500, 271590.5500, 21009.0746, NULL, NULL, 4542577.1800, 4542577.1800, 0.4657, NULL, NULL, 4727621.0000, NULL, NULL, NULL, 4727621.0000, 0.0340, 331612.9079, 169442.6900, 169442.6900, 162170.2179, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(167, '2013-12-01', '事业十二部', 'SY2013-13', '阜外心血管后勤服务中心', '事业部', '中国医学科学院阜外心血管医院', '门头沟区永定镇冯村西里阜外医院西山院区', '陈建中', '北京源泰力建筑装饰工程有限公司', '陈建中', '否', NULL, 449812.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 17992.4800, 17992.4800, 17992.4800, 0.0000, NULL, NULL, 340027.5200, 340027.5200, 0.7559, NULL, NULL, 365664.6000, NULL, NULL, NULL, 365664.6000, 0.0340, 15293.6080, 12580.0000, 12580.0000, 2713.6080, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(168, '2013-12-01', '事业二十部', 'SY2013-14', '内蒙金隅丽港售楼处', '事业部', '内蒙古金隅置地投资有限公司', '呼和浩特市赛罕区南二环以南', '袭祥林', '呼和浩特市龙衣铁艺有限公司', '袭祥林', '是', NULL, 1440423.3200, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 57616.9328, 57617.0000, 57617.0000, -0.0672, NULL, NULL, 1089663.5100, 1089663.5100, 0.7565, NULL, NULL, 1145710.0000, NULL, NULL, NULL, 1145710.0000, NULL, 52719.4900, 52719.4900, 52719.4900, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(169, '2013-12-01', '事业三部', 'SY2013-15及增1', '航空城北区一号门房', '事业部', '江西军工思波实业有限公司', '南昌市高新开发区', '李平', '北京九天装饰有限责任公司', '李平', '是', NULL, 710641.6000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 25583.0976, 25583.1000, 25583.1000, -0.0024, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(170, '2013-12-01', '事业一部', 'SY2013-16', '北七家公建住宅', '事业部', '北京宁科置业有限责任公司', '北京市昌平区北七家镇', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 4036583.4800, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 145317.0053, 145317.0000, 145317.0000, 0.0053, NULL, NULL, 3214867.5200, 3214867.5200, 0.7964, NULL, NULL, 3359296.7500, NULL, NULL, NULL, 3359296.7500, 0.0340, 137243.8383, 118235.4000, 118235.4000, 19008.4383, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(171, '2013-12-01', '事业十五部', 'SY2013-17及增1', '衡水大厦', '事业部', '北京衡水饭店', '北京市丰台区角门北路', '周成军', '北京荣发建筑装饰工程有限公司', '周成军', '否', NULL, 1236415.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 49456.6000, 47920.0000, 47920.0000, 1536.6000, NULL, NULL, 857139.6900, 857139.6900, 0.6932, NULL, NULL, 859342.8600, NULL, NULL, NULL, 859342.8600, 0.0340, 42038.1100, 31855.3100, 31855.3100, 10182.8000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(172, '2013-12-01', '事业二十部', 'SY2013-18', '金隅时代二期', '事业部', '内蒙古金隅置业投资有限公司', '呼和浩特市赛罕区', '袭祥林', '呼和浩特市龙衣铁艺有限公司', '袭祥林', '是', NULL, 1674815.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0400, 66992.6000, 66993.0000, 66993.0000, -0.4000, NULL, NULL, 1171708.7700, 1171708.7700, 0.6996, NULL, NULL, 1233232.5000, NULL, NULL, NULL, 1233232.5000, 0.0366, 61298.2290, 61298.2300, 61298.2300, -0.0010, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(173, '2013-12-01', '事业二十三部', 'SY2013-19', '无锡万达文化旅游展示中心', '事业部', '无锡万达城投资有限公司', '无锡', '张友良', '北京泽幕工程咨询有限公司', '金光成', '是', NULL, 260000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 22360.0000, 22360.0000, 22360.0000, 0.0000, NULL, NULL, 159640.0000, 159640.0000, 0.6140, NULL, NULL, 182000.0000, NULL, NULL, NULL, 182000.0000, 0.0340, 8840.0000, NULL, 0.0000, 8840.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(174, '2013-12-01', '事业三部', 'SY2013-20', '卢沟桥小瓦窑村1#回迁房', '事业部', '中建-大成建筑有限责任公司', '北京市丰台区卢沟桥乡小瓦窑村', '李平', '北京九天装饰有限责任公司', '李平', '否', NULL, 1042588.3000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 37533.1788, 2892.4800, 2892.4800, 34640.6988, NULL, NULL, 286907.5200, 286907.5200, 0.2752, NULL, NULL, 289800.0000, NULL, NULL, NULL, 289800.0000, 0.0340, 35448.0022, 10200.0000, 10200.0000, 25248.0022, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(175, '2013-12-01', '事业十六部', 'SY2013-21', '创新国际2#5#6#8#楼铝合金门窗', '事业部', '山东创新置业有限公司', '山东邹平鹤伴二路', '韩魁', '北京嘉世弘商贸有限公司', '韩魁', '是', NULL, 3480350.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 125292.6000, 125292.6000, 125292.6000, 0.0000, NULL, NULL, 1387395.0700, 1387395.0700, 0.3986, NULL, NULL, 1596613.9100, NULL, NULL, NULL, 1596613.9100, 0.0340, 118331.9000, 51187.4500, 51187.4500, 67144.4500, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(176, '2013-12-01', '事业二十三部', 'SY2013-22', '东莞厚街万达广场', '事业部', '东莞厚街万达广场投资有限公司', '东莞市厚街镇宝屯、珊美社区', '张友良', '北京泽幕工程咨询有限公司', '金光成', '是', NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, 4300.0000, 4300.0000, 0.0000, NULL, NULL, 34340.0000, 34340.0000, 0.6868, NULL, NULL, 40000.0000, NULL, NULL, NULL, 40000.0000, 0.0340, 1700.0000, 1360.0000, 1360.0000, 340.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(177, '2013-12-01', '事业二十二部', 'SY2013-23', '曲美家具', '事业部', '北京曲美馨家商业有限公司', '北苑路和大屯路交叉口', '莫琳轶', '天津市恒铝幕墙装饰工程有限公司', '莫琳轶', '否', NULL, 1976165.9800, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 71141.9753, NULL, 0.0000, 71141.9753, NULL, NULL, 1552375.2000, 1552375.2000, 0.7855, NULL, NULL, 1529184.1200, NULL, NULL, NULL, 1529184.1200, 0.0340, 67189.6433, 33594.8000, 33594.8000, 33594.8433, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(178, '2013-12-01', '事业二十三部', 'SY2013-24', '南昌万达广场', '事业部', '南昌万达城投资有限公司', '南昌', '张友良', '北京泽幕工程咨询有限公司', '金光成', '是', NULL, 600000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 51600.0000, 25800.0000, 25800.0000, 25800.0000, NULL, NULL, 90120.0000, 90120.0000, 0.1502, NULL, NULL, 120000.0000, NULL, NULL, NULL, 120000.0000, 0.0340, 20400.0000, 4080.0000, 4080.0000, 16320.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(179, '2014-01-01', '事业一部', 'SY2014-01', '九棵树三标段', '事业部', '北京祁连房地产开发有限公司', '通州区九棵树', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 8084018.7400, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 242520.5622, 121260.0000, 121260.0000, 121260.5622, NULL, NULL, 1403475.3700, 1403475.3700, 0.1736, NULL, NULL, 1516729.0000, NULL, NULL, NULL, 1516729.0000, 0.0340, 274856.6372, 53665.6300, 53665.6300, 221191.0072, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(180, '2014-02-01', '事业一部', 'SY2014-02及增1', '和泓四季9#外墙装饰及门窗', '事业部', '北京东和伟业房地产开发有限公司', '海淀区常青路', '马冬雷', '北京和平简商贸有限公司', '马冬雷', '否', NULL, 2915737.5600, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 104966.5522, 97955.7100, 97955.7100, 7010.8422, NULL, NULL, 1188529.3100, 1188529.3100, 0.4076, NULL, NULL, 1145067.9500, NULL, NULL, NULL, 1145067.9500, 0.0340, 99135.0770, 74010.9800, 74010.9800, 25124.0970, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(181, '2014-03-01', '事业十九部', 'SY2014-03', '大同国金中心', '事业部', '大同市阳光嘉业房地产开发有限责任公司', '山西省大同迎宾街', '魏增坡', '北京和平泛华装饰有限公司', '魏增坡', '是', NULL, 12750000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 382500.0000, 382500.0000, 382500.0000, 0.0000, NULL, NULL, 6916086.9200, 6916086.9200, 0.5424, NULL, NULL, 6030422.2000, NULL, NULL, NULL, 6030422.2000, NULL, 297937.5000, 297937.5000, 297937.5000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(182, '2014-04-01', '事业二十三部', 'SY2014-04', '黄石万达广场设计合同', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, 4300.0000, 4300.0000, 0.0000, NULL, NULL, 34000.0000, 34000.0000, 0.6800, NULL, NULL, 40000.0000, NULL, NULL, NULL, 40000.0000, 0.0340, 1700.0000, 1700.0000, 1700.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(183, '2014-05-01', '事业二十三部', 'SY2014-05', '天津河东万达广场', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, 4300.0000, 4300.0000, 0.0000, NULL, NULL, 35700.0000, 35700.0000, 0.7140, NULL, NULL, 40000.0000, NULL, NULL, NULL, 40000.0000, 0.0340, 1700.0000, 0.0000, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(184, '2014-06-01', '事业二十三部', 'SY2014-06', '沈阳太原街万达广场', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(185, '2014-07-01', '事业二十三部', 'SY2014-07', '沈阳铁西万达广场', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(186, '2014-07-01', '事业十一部', 'SY2014-08及增1', '重庆巴南万达', '事业部', NULL, NULL, '李文达', NULL, NULL, NULL, NULL, 6378103.0400, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 191343.0912, NULL, 0.0000, 191343.0912, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, 188631.2500, NULL, NULL, NULL, 188631.2500, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(187, '2014-07-01', '事业二部', 'SY2014-09', '兰州理工大学设计合同', '事业部', NULL, NULL, '王培俊', NULL, NULL, NULL, NULL, 630000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 54180.0000, 54180.0000, 54180.0000, 0.0000, NULL, NULL, 371826.0000, 371826.0000, 0.5902, NULL, NULL, 400000.0000, NULL, NULL, NULL, 400000.0000, 0.0340, 21420.0000, 14994.0000, 14994.0000, 6426.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(188, '2014-07-01', '事业二十三部', 'SY2014-10及增1', '通辽万达广场商业设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 1250000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 107500.0000, 51600.0000, 51600.0000, 55900.0000, NULL, NULL, 548400.0000, 548400.0000, 0.4387, NULL, NULL, 600000.0000, NULL, NULL, NULL, 600000.0000, 0.0340, 42500.0000, NULL, 0.0000, 42500.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(189, '2014-07-01', '事业二十三部', 'SY2014-11', '东莞厚街万达采光顶', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 1826701.8300, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 157096.3574, 78548.1800, 78548.1800, 78548.1774, NULL, NULL, 286792.1800, 286792.1800, 0.1570, NULL, NULL, 365340.3600, NULL, NULL, NULL, 365340.3600, 0.0340, 62107.8622, NULL, 0.0000, 62107.8622, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(190, '2014-07-01', '事业一部', 'SY2014-12', '北七家TBD云集团项目幕墙工程（标段3）合同', '事业部', NULL, NULL, '马冬雷', '北京和平简商贸有限公司', '马冬雷', NULL, NULL, 23840000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 715200.0000, NULL, 0.0000, 715200.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 810560.0000, NULL, 0.0000, 810560.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(191, '2014-07-01', '事业三部', 'SY2014-13', '南昌A101行政办公楼', '事业部', NULL, NULL, '李平', NULL, NULL, NULL, NULL, 9995935.1100, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 299878.0533, 11900.0000, 11900.0000, 287978.0533, NULL, NULL, 2513153.2000, 2513153.2000, 0.2514, NULL, NULL, 1627060.2200, NULL, NULL, NULL, 1627060.2200, NULL, 0.0000, 273808.6300, 273808.6300, NULL, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(192, '2014-07-01', '事业二十三部', 'SY2014-14', '合肥万达文化旅游城A2地块设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 882200.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 75869.2000, 37934.6000, 37934.6000, 37934.6000, NULL, NULL, 138505.4000, 138505.4000, 0.1570, NULL, NULL, 176440.0000, NULL, NULL, NULL, 176440.0000, 0.0340, 29994.8000, NULL, 0.0000, 29994.8000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(193, '2014-07-01', '事业十七部', 'SY2014-15', '中科院新园区8标段（体育中心、礼堂）', '事业部', NULL, NULL, '马龙', NULL, NULL, NULL, NULL, 4215575.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 151760.7000, NULL, 0.0000, 151760.7000, NULL, NULL, 500000.0000, 500000.0000, 0.1186, NULL, NULL, 502460.9200, NULL, NULL, NULL, 502460.9200, 0.0340, 143329.5500, NULL, 0.0000, 143329.5500, 700000.0000, NULL, NULL, '2014-08-27 20:44:08'),
	(194, '2014-07-01', '事业二十三部', 'SY2014-16', '呼和浩特幕墙安全隐患整改设计合同', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(195, '2014-07-01', '事业二十三部', 'SY2014-17', '通辽万达广场销售及回迁物业设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 1800000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 154800.0000, 77400.0000, 77400.0000, 77400.0000, NULL, NULL, 282600.0000, 282600.0000, 0.1570, NULL, NULL, 360000.0000, NULL, NULL, NULL, 360000.0000, 0.0340, 61200.0000, NULL, 0.0000, 61200.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(196, '2014-07-01', '事业二十三部', 'SY2014-18', '宿州万达广场售楼处', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 60000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 5160.0000, 5160.0000, 5160.0000, 0.0000, NULL, NULL, 42840.0000, 42840.0000, 0.7140, NULL, NULL, 48000.0000, NULL, NULL, NULL, 48000.0000, 0.0340, 2040.0000, NULL, 0.0000, 2040.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(197, '2014-07-01', '事业二十三部', 'SY2014-19', '桂林万达城展示中心', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 48000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4128.0000, NULL, 0.0000, 4128.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1632.0000, NULL, 0.0000, 1632.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(198, '2014-07-01', '事业十一部', 'SY2014-20', '泰安万达广场', '事业部', NULL, NULL, '李文达', NULL, NULL, NULL, NULL, 9298739.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 278962.1700, NULL, 0.0000, 278962.1700, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(199, '2014-07-01', '事业二十九部', 'SY2014-21', '三利.中和城售楼处及样板间', '事业部', NULL, NULL, '尤长华', NULL, NULL, NULL, NULL, 507387.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 18265.9320, NULL, 0.0000, 18265.9320, NULL, NULL, 279062.8500, 279062.8500, 0.5500, NULL, NULL, 154000.0000, NULL, NULL, NULL, 154000.0000, 0.0340, 17251.1580, NULL, 0.0000, 17251.1580, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(200, '2014-07-01', '事业二十三部', 'SY2014-22', '广州南沙万达广场售楼处', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(201, '2014-07-01', '事业二十三部', 'SY2014-23', '苏州吴中万达广场样板段', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 80000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 6880.0000, NULL, 0.0000, 6880.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 2720.0000, NULL, 0.0000, 2720.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(202, '2014-07-01', '事业十五部', 'SY2014-24', '冠京饭店改造', '事业部', NULL, NULL, '周成军', NULL, NULL, NULL, NULL, 1108000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 39888.0000, NULL, 0.0000, 39888.0000, NULL, NULL, 119400.0000, 119400.0000, 0.1078, NULL, NULL, 137713.0000, NULL, NULL, NULL, 137713.0000, 0.0340, 37672.0000, 30600.0000, 30600.0000, 7072.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(203, '2014-07-01', '事业二十三部', 'SY2014-25', '南通港闸万达售楼处设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(204, '2014-07-01', '事业二十三部', 'SY2014-26', '青岛CBD万达安全隐患整改设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 45000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 3870.0000, NULL, 0.0000, 3870.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1530.0000, NULL, 0.0000, 1530.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(205, '2014-07-01', '事业二十三部', 'SY2014-27', '乌鲁木齐经开万达广场设计合同', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 2063932.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 177498.1520, NULL, 0.0000, 177498.1520, NULL, NULL, 309589.8000, 309589.8000, 0.1500, NULL, NULL, 309589.8000, NULL, NULL, NULL, 309589.8000, 0.0340, 70173.6880, NULL, 0.0000, 70173.6880, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(206, '2014-07-01', '事业二十五部', 'SY2014-28', '中关村e世界大厦玻璃幕墙改造', '事业部', NULL, NULL, '杨立国', NULL, NULL, NULL, NULL, 304724.2900, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 10970.0744, NULL, 0.0000, 10970.0744, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 10360.6259, 2073.0000, 2073.0000, 8287.6259, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(207, '2014-07-01', '孙景龙', 'SY2014-29', '大连开发区万达广场', '事业部', NULL, NULL, '孙景龙', NULL, NULL, NULL, NULL, 737750.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 63446.5000, NULL, 0.0000, 63446.5000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 25083.5000, NULL, 0.0000, 25083.5000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(208, '2014-07-01', '事业二十三部', 'SY2014-30', '郫县万达广场销售中心外幕墙', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 50000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 4300.0000, NULL, 0.0000, 4300.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 1700.0000, NULL, 0.0000, 1700.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(209, '2014-07-01', '事业十七部', 'SY2014-31', '大兴区黄村镇四-六街安置房', '事业部', NULL, NULL, '马龙', NULL, NULL, NULL, NULL, 8649410.8000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0300, 259482.3240, NULL, 0.0000, 259482.3240, NULL, NULL, 7657.4000, 7657.4000, 0.0009, NULL, NULL, 439657.4000, NULL, NULL, NULL, 439657.4000, 0.0340, 294079.9672, NULL, 0.0000, 294079.9672, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(210, '2014-07-01', '事业二十五部', 'SY2014-32', '西山9号院采光顶改造工程', '事业部', NULL, NULL, '杨立国', NULL, NULL, NULL, NULL, 660000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 23760.0000, NULL, 0.0000, 23760.0000, NULL, NULL, 191268.0000, 191268.0000, 0.2898, NULL, NULL, 151800.0000, NULL, NULL, NULL, 151800.0000, 0.0340, 22440.0000, 6732.0000, 6732.0000, 15708.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(211, '2014-07-01', '事业二十三部', 'SY2014-33', '广州增城万达文化旅游展示中心', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 248000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 21328.0000, NULL, 0.0000, 21328.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 8432.0000, NULL, 0.0000, 8432.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(212, '2014-07-01', '事业十七部', 'SY2014-34', '中国科学院大学玉泉营小区改造工程', '事业部', NULL, NULL, '马龙', NULL, NULL, NULL, NULL, 465000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 16740.0000, NULL, 0.0000, 16740.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 15810.0000, 4743.0000, 4743.0000, 11067.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(213, '2014-07-01', '事业二十三部', 'SY2014-35', '十堰万达售楼处设计', '事业部', NULL, NULL, '张友良', NULL, NULL, NULL, NULL, 65000.0000, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0860, 5590.0000, NULL, 0.0000, 5590.0000, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0340, 2210.0000, NULL, 0.0000, 2210.0000, NULL, NULL, NULL, '2014-08-27 20:44:08'),
	(214, '2014-07-01', '事业十一部', 'SY2014-36', '岗亭购销合同', '事业部', NULL, NULL, '李文达', NULL, NULL, NULL, NULL, 967901.0400, NULL, NULL, NULL, NULL, NULL, NULL, '否', '正常进行', 0.0360, 34844.4374, NULL, 0.0000, 34844.4374, NULL, NULL, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, '2014-08-27 20:44:08');
/*!40000 ALTER TABLE `t_project_init` ENABLE KEYS */;


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
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='00_多项目汇总';

-- Dumping data for table hplydb_new.t_project_summary: ~2 rows (approximately)
/*!40000 ALTER TABLE `t_project_summary` DISABLE KEYS */;
INSERT INTO `t_project_summary` (`id`, `serial_id`, `trice`, `description`, `project_id`, `organization_id`, `project_code`, `project_name`, `contract_amount`, `change_amount`, `change_total_amount`, `settlement_amount`, `management_rate`, `management_plan_amount`, `management_real_amount`, `management_total_amount`, `management_owe_amount`, `party_billing_amount`, `party_billing_total_amount`, `collections_amount`, `collections_total_amount`, `collections_rate`, `customer_billing_amount`, `customer_billing_total_amount`, `payment_amount`, `payment_total_amount`, `tax_rate`, `tax_plan_amount`, `tax_real_amount`, `tax_total_amount`, `tax_owe_amount`, `arrears_amount`, `expected_value`, `profile_point`, `version`, `create_time`, `table_name`) VALUES
	('5adc4faf-3626-11e4-a447-001c42328937', 1, '2014-09-07 08:31:49', '创建新项目，', '6e71321c-5535-45c2-b6e3-57080754559c', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0009', '项目1', 1000000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 36000.0000, 0.0000, 0.0000, 36000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-09-07 08:31:48', '/project/detail/6e71321c-5535-45c2-b6e3-57080754559c'),
	('6690aff3-3626-11e4-a447-001c42328937', 2, '2014-09-07 08:32:08', '修改合同项目信息，', '6e71321c-5535-45c2-b6e3-57080754559c', '0ed38235-0c3a-11e4-9300-001c42328937', 'XM-2014-0009', '项目1', 1000000.0000, 0.0000, 0.0000, 0.0000, 3.6000, 36000.0000, 0.0000, 0.0000, 36000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 34000.0000, 0.0000, 0.0000, 34000.0000, 0.0000, 0.0000, '', 1, '2014-09-07 08:32:08', '/project/detail/6e71321c-5535-45c2-b6e3-57080754559c');
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

-- Dumping data for table hplydb_new.t_sys_authorization: ~48 rows (approximately)
/*!40000 ALTER TABLE `t_sys_authorization` DISABLE KEYS */;
INSERT INTO `t_sys_authorization` (`id`, `resource_id`, `user_id`, `create_time`, `create_user`, `version`) VALUES
	('0361630e-ba65-4891-aa92-097bb86d2aee', '5be49301-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:52', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('160378c2-9bd6-42cf-8df4-1c14e6b96a42', '5bdd3b82-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:16', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1740066b-9d6b-4acd-8515-a1f867d0fae3', 'a5644308-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('19417d69-ef9d-4bdd-bfee-f48350ce6c37', '5be3c313-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1a03df24-3a43-4fb3-a011-5bb46b8322b1', '5be1956c-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:44', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1a7d9ebb-002c-4b3e-ad23-337d9d23c289', '5be33246-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:48', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1aea84e7-e844-4cbb-84e5-913f09b2d1e4', '5be055a9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:42', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('27dd317d-0fda-4fad-b5b4-1c9d94b2782a', '5be38674-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('3701f71a-9fc2-4399-a255-cff79a6445db', '5bd8b940-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('3b831c83-1119-4be1-afda-98fc240555d5', '5be4f0d5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('4ac32cc5-1c3a-4989-a4a4-0381b40ba895', '70222e65-32e7-451b-ba07-8001e920fa56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-15 19:39:30', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5037dec1-45d7-41f9-92f2-59322a56512a', '5be5788b-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:54', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('560ab635-0c8f-49a5-a8cf-5422e373082e', '5be26834-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:45', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('587207e4-c9de-4026-b897-f7ad7f5bc530', '5bd952a7-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5c2b9847-9f90-4e30-93f2-932535b3fecd', '5bdddcff-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:17', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5daaec66-c6fb-4534-b3ed-5159693ab346', '7c37d393-276a-4551-9c2b-ab9a7ab4704d', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:05:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5dd33977-6f37-43ba-9bf7-8539b8653642', '5bdf11d3-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:19', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('68a4435e-5996-4d9c-b729-83bc8c3a8690', '5bda8270-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:12', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('70ff449a-5a49-409d-aa12-51e782e931b9', '5be3fdc9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
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
	('a497e96e-073f-48e6-b054-9cafe1b4888a', '70222e65-32e7-451b-ba07-8001e920fa56', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-09-06 08:33:21', '96ef9340-e169-4024-b7e5-ca7070b367fa', 0),
	('a5018595-1b3d-4c50-a6b3-2ecf69f8965b', '5bd84fbf-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:05', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('a6f90f45-d76a-4a12-b29e-1a6a6dad3e42', '03772c78-a497-40c8-9338-07a835e3f2c1', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('a76f5e9f-6d9d-4e42-b8df-70c92eeee353', '5bda33d9-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:11', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b2b7eb48-c766-4476-8cb8-97a7d884cfca', '5bdb83c8-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b2f71c83-6c6a-41bf-b92a-d36cb83a21b4', '5be5b341-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:55', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('b3134283-1756-4cce-a5e5-430fde28c85b', '5bdf4a76-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:23', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('be4df5c8-93ba-417e-867b-9b6cd6dbc7a7', '5be01fb5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:42', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c0dd2fcb-dc93-401b-b2ce-084c0901b4a6', '5be64de5-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:58', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c38eb4ea-2d86-4e5b-91c2-ae197d307137', '7c37d393-276a-4551-9c2b-ab9a7ab4704d', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c73cd940-2f65-4de7-99a0-622f0bd65903', '5bd90b40-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ca357851-2067-47d6-baee-7905f566607e', '5bdbd8c0-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e0fb6621-1f3a-4de0-b182-1be7a2078b4a', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e6a97c8f-27c8-4303-8d27-c03b1526f961', '5bdcfa83-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e7d94d85-01aa-468c-8c19-dc27a7d192d7', 'a5644308-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:04', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e9b34ee1-7a3e-4d3e-b703-ba9ec91d9ca2', '5be64de5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 21:54:02', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ec2cef47-e1f5-4834-af2b-ec0524550353', '5bdc8dba-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:14', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('f25a8936-4d83-40b7-862f-ecc640288b66', '5bdb83c8-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:15:13', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('f79f44a0-6b9d-4690-8616-067a60cd8643', '5be60849-1a00-11e4-a01a-001c42328937', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-14 23:16:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0);
/*!40000 ALTER TABLE `t_sys_authorization` ENABLE KEYS */;


-- Dumping structure for table hplydb_new.t_sys_exec_log
CREATE TABLE IF NOT EXISTS `t_sys_exec_log` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `exec_no` varchar(50) DEFAULT NULL COMMENT '每次在同一批次中执行',
  `proc_name` varchar(200) DEFAULT NULL,
  `trice` datetime DEFAULT NULL,
  `exec_log` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储过程执行日志表';

-- Dumping data for table hplydb_new.t_sys_exec_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_sys_exec_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_sys_exec_log` ENABLE KEYS */;


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
	('0b8f1d89-8655-463a-97be-b8b033d29a8c', 'collections_code', '收款凭证号', '4174', 'SK', b'0', '2014-08-08 23:47:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:23:35', 'mysql.get_next_code', 'SK-2014-0001', 4),
	('12bad01d-9282-44a1-9186-04f7ee7a0078', 'chop_code', '用章申请编号', '2', 'YZ', b'0', '2014-08-05 23:12:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-27 20:50:21', 'mysql.get_next_code', 'YZ-2014-0001', 4),
	('1fdae036-8ba5-4ad5-ad43-e68e38eda5e0', 'arrears_code', '往来欠款凭证号', '55', 'WL', b'0', '2014-08-08 23:52:38', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:36:00', 'mysql.get_next_code', 'WL-2014-0001', 0),
	('22085fc7-5804-4cbb-8940-afeda443a20f', 'pay_types', '支付方式', '现金/银行转帐/汇款/支票/汇票/其他 ', '现金/银行转帐/汇款/支票/汇票/其他 ', b'0', '2014-08-08 23:34:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '收款/付款/往来欠款中使用', 2),
	('2b0dce39-561a-42a8-835c-f488a6a63945', 'payment_code', '付款凭证号', '3714', 'FK', b'0', '2014-08-08 23:51:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:20:28', 'mysql.get_next_code', 'FK-2014-0001', 0),
	('2f0a2f68-097f-11e4-a5cb-080027dbb782', 'appname', '应用名称', '工程项目核算系统', '工程项目核算系统', b'1', '2014-07-12 12:55:06', NULL, '2014-07-12 12:55:06', NULL, NULL, 0),
	('454bc450-6bd1-434b-af64-2f7b402aaccb', 'project_code', '项目编号', '9', 'XM', b'0', '2014-08-05 23:07:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:31:11', 'mysql.get_next_code', 'XM-2014-0001', 10),
	('4fd3df1e-145a-4d39-8164-679f555961fb', 'default_tax_rate', '默认税率', '3.4', '3.4', b'0', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('4fe8fe7f-097f-11e4-a5cb-080027dbb782', 'appversion', '应用版本号', 'V1.0', 'V1.0', b'1', '2014-07-12 12:56:02', NULL, '2014-07-12 12:56:02', NULL, NULL, 0),
	('5f9ddb3d-db23-4804-b5c8-bcee97364626', 'default_manager_rate', '默认管理费率', '3.6', '3.6', b'0', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('6e053860-097f-11e4-a5cb-080027dbb782', 'apppublishtime', '应用发布时间', '2014年8月12日', '2014年8月12日', b'1', '2014-07-12 12:56:52', NULL, '2014-08-05 22:45:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 2),
	('75b571d1-0629-4485-8fbf-c42ec95429a3', 'interest_rate', '默认月利率', '1', '1', b'0', '2014-08-16 21:41:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-16 21:41:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '往来欠款垫资默认月利率：1%', 0),
	('7b7cd4d0-acc2-4d0d-9a2b-d07659eef930', 'billing_types', '发票分类', '材料/劳务/其他', '材料/劳务/其他', b'0', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('93fa58ac-188c-4b08-8afc-cbf0ce3b18bd', 'cc_code', '补充协议编号', '5', 'BC', b'0', '2014-08-05 23:09:18', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-06 08:47:25', 'mysql.get_next_code', 'BC-2014-0001', 4),
	('d8186e7b-ecf4-4e54-a18c-986513d78c30', 'project_status', '项目状态', '进行中/已暂停/已结算/已归档', '进行中/已暂停/已结算/已归档', NULL, '2014-08-05 22:00:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:14:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1),
	('ea2dc602-0c58-40d6-b7f7-cbc2b33e6a67', 'source_of', '款项来源', '工程款/税金/管理费/其他', '工程款/税金/管理费/利息/其他', b'0', '2014-08-08 23:35:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:23:24', '96ef9340-e169-4024-b7e5-ca7070b367fa', '在收款情况中', 2),
	('ed8f1310-a315-4fe1-af52-a44974903a13', 'arrears_type', '往来欠款分类', '垫资/押金/利息/其他', '垫资/投标/押金/其他', b'0', '2014-08-16 21:40:48', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-09-07 08:23:07', '96ef9340-e169-4024-b7e5-ca7070b367fa', '其中只有“垫资”收利息', 2),
	('f5b859ea-6bc8-4fea-9094-54c1d5eedaa8', 'page_size', '每页显示的记录行数', '20', '30', b'0', '2014-08-24 10:50:58', '96ef9340-e169-4024-b7e5-ca7070b367fa', '2014-08-24 10:51:22', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 1);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `res_code` (`res_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12_系统资源';

-- Dumping data for table hplydb_new.t_sys_resource: ~38 rows (approximately)
/*!40000 ALTER TABLE `t_sys_resource` DISABLE KEYS */;
INSERT INTO `t_sys_resource` (`id`, `res_code`, `res_name`, `icon`, `res_url`, `res_type`, `order_by`, `parent_id`, `enabled`, `description`, `version`, `allow_access_uri`) VALUES
	('03772c78-a497-40c8-9338-07a835e3f2c1', NULL, '资源管理', NULL, '/sysresource', 'navigation', 495, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, NULL, 0, NULL),
	('5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '财务核算', NULL, '', 'navigation', 10, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
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
	('5be5788b-1a00-11e4-a01a-001c42328937', NULL, '系统管理', NULL, '', 'navigation', 470, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
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
	('96ef9340-e169-4024-b7e5-ca7070b367fa', 'cqiyi', '成七一', '0ed44f90-0c3a-11e4-9300-001c42328937', '5be9a0e6cd0e287f09555a88abcca799803d66864b24f9ccf107f0030686cfdb', '10.211.55.3', '2014-09-07 08:10:56', 0, 66, '系统管理员', b'1', 20, '2014-08-03 10:18:48', '', '2014-09-07 08:10:55', '96ef9340-e169-4024-b7e5-ca7070b367fa', '', 78, b'0'),
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


-- Dumping structure for procedure hplydb_new.proc_calc_interest_all
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_all`(IN `_pharse` DATE)
    COMMENT '计算往来欠款的利息，每月20日凌晨5:00执行'
proc: BEGIN
	-- 本程序每月20日凌晨5:00自动启动，如果过期未执行，则在第一次系统启动时执行，始终计算截至最近上一周期的20日的利息。
  	
  	declare _project_id char(36);  -- 项目ID
  	declare _interest_amount decimal(20, 4) default 0.0;
  	declare _atdays int;  -- 天数
  	declare _interest_rate decimal(20, 4) default 0.0;  
	declare _description varchar(500);	
  	declare eof bit default 0; -- 定义游标的结束符
  	declare _exec_no varchar(50);
  	declare _month_days int;
  
  	-- 获取指定期的利息明细数据
  	declare cur_for_detail cursor for select project_id, interest_amount, atday from t_arrears_interest
	  				where serial_id in ( select max(serial_id) from t_arrears_interest 
	  									where pharse = _pharse group by project_id);	  									
  	declare continue handler for not found set eof = 1;
  	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_calc_all_interest', date(concat(_pharse, '-20')), '开始执行');
	
	-- 当月1号减一天，也就上上月的最后一天
	set _month_days = day(date(concat(_pharse, '-01')) + interval - 1 day);
  	
  	-- 获取默认月利率
  	set _interest_rate = get_param_value('interest_rate') / 100;
  
  	open cur_for_detail;
  
  	top2: loop
    	fetch cur_for_detail into _project_id, _interest_amount, _atdays;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top2;
    	end if;
    	
    	if _interest_amount > 0 and _atdays > 0 then
    		set _description = concat(_interest_amount, '*',  _interest_rate, '%*', _atdays, '/', _month_days);
    		call proc_set_interest(_project_id, _interest_amount, _interest_amount * _interest_rate *  _atdays / _month_days, _description);
    	end if;
  	end loop top2;
  
  	close cur_for_detail;
	call proc_exec_log(_exec_no, 'proc_calc_all_interest', date(concat(_pharse, '-20')), '执行完成');
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_calc_interest_all_everyday
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_all_everyday`()
BEGIN
	declare _last_trice datetime;
	declare current_trice datetime;
	
	
  	-- 计算本次结息日，如果现在在20日之前，则上月20日为结息日， 否则本月20日为结息日
  	set current_trice = date_add(curdate(),interval - day(curdate()) + 20 day);
  	if current_trice > now() then
    	set current_trice = current_trice + interval -1 month;
  	end if;
  	
	-- 获取存储过程执行记录中最后一次执行的计息时间
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_calc_all_interest';
	
	
	-- 如果为空，则从今天开始计息， 否则，从缺口的下一月，循环到今天
	set _last_trice = if(_last_trice is null, current_trice, date_add(_last_trice, interval + 1 month));
	
	while date(_last_trice) <= date(current_trice) do
		-- 计算当天的利息基数，天数等信息 
		call proc_update_interest_detail(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 month);
	end while;
	
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_clear_all
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_clear_all`()
    COMMENT '清理垃圾数据'
BEGIN
	delete from t_sys_authorization where 
		not (
			exists (select * from t_sys_user where id = user_id) 
			and exists (select * from t_sys_resource where id = resource_id)
		);
		
	truncate table t_project;
	truncate table t_arrears;
	truncate table t_arrears_interest;
	truncate table t_chop;
	truncate table t_collections;
	truncate table t_customer_billing;
	truncate table t_field_types;
	truncate table t_information;
	truncate table t_party_billing;
	truncate table t_payment;
	truncate table t_profile;
	truncate table t_contract_change;
	truncate table t_project_summary;
	truncate table t_information;
	truncate table t_chop;
	
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_exec_log
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_exec_log`(IN `_exec_no` VARCHAR(50), IN `_proc_name` VARCHAR(100), IN `_trice` DATETIME, IN `_exec_log` VARCHAR(500))
    COMMENT '数据库程序执行日志'
BEGIN
	insert into t_sys_exec_log(exec_no, proc_name, trice, exec_log, create_time) values(_exec_no, _proc_name, _trice, _exec_log, now());
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_import_init
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_import_init`()
    COMMENT '导入初始化数据'
proc: BEGIN
	-- 导入初始化数据
	declare eof bit default 0; -- 定义游标的结束符
  	declare _exec_no varchar(50);
  	
  	declare _project_id varchar(50);
	  	
	declare _trice date; -- 摘要信息/时间
	declare _description varchar(500); -- 摘要信息/摘要
	declare _project_code VARCHAR(200); -- 合同项目信息/项目编号
	declare _project_name VARCHAR(200); -- 合同项目信息/项目名称
	declare _organization_name VARCHAR(200); -- 合同项目信息/所在部门
	declare _party_name VARCHAR(200); -- 合同项目信息/甲方名称
	declare _party_address VARCHAR(200); -- 合同项目信息/甲方地址
	declare _manager VARCHAR(200); -- 合同项目信息/项目经理
	declare _corperation VARCHAR(200); -- 合同项目信息/合作单位
	declare _legal_assignee VARCHAR(200); -- 合同项目信息/法人代表
	declare _is_withholding_offsite VARCHAR(20); -- 合同项目信息/异地代扣代缴
	declare _contract_code VARCHAR(20); -- 合同项目信息/合同号
	declare _contract_amount DECIMAL(20,4); -- 合同项目信息/合同金额
	declare _change_amount DECIMAL(20,4); -- 合同项目信息/合同调增额
	declare _change_total_amount DECIMAL(20,4); -- 合同项目信息/累计调增额
	declare _settlement_amount DECIMAL(20,4); -- 合同项目信息/合同结算额
	declare _duty_paid_code VARCHAR(200); -- 合同项目信息/印花税收据编号
	declare _duty_paid_time DATE; -- 合同项目信息/印花税上交时间
	declare _duty_paid_amount DECIMAL(20,4); -- 合同项目信息/印花税上交金额
	declare _capital_occupied VARCHAR(20); -- 合同项目信息/占用资金情况
	declare _project_status VARCHAR(20); -- 合同项目信息/项目状态
	declare _management_rate DECIMAL(20,4); -- 管理费情况/比率
	declare _management_plan_amount DECIMAL(20,4); -- 管理费情况/应收管理费
	declare _management_real_amount DECIMAL(20,4); -- 管理费情况/实收管理费
	declare _management_total_amount DECIMAL(20,4); -- 管理费情况/累计收管理费
	declare _management_owe_amount DECIMAL(20,4); -- 管理费情况/尚欠管理费
	declare _party_billing_amount DECIMAL(20,4); -- 甲方开票情况/发票金额
	declare _party_billing_total_amount DECIMAL(20,4); -- 甲方开票情况/累计开票
	declare _collections_amount DECIMAL(20,4); -- 从甲方收款情况/收款金额
	declare _collections_total_amount DECIMAL(20,4); -- 从甲方收款情况/累计收款
	declare _collections_rate DECIMAL(20,4); -- 从甲方收款情况/回收率
	declare _customer_billing_amount DECIMAL(20,4); -- 客户开票情况/发票金额
	declare _customer_billing_total_amount DECIMAL(20,4); -- 客户开票情况/累计开票
	declare _payment_amount DECIMAL(20,4); -- 支付工程款情况/支付金额
	declare _payment_amount_clv DECIMAL(20,4); -- 支付工程款情况/差旅费
	declare _payment_amount_cliang DECIMAL(20,4); -- 支付工程款情况/车辆费用
	declare _payment_amount_zdai DECIMAL(20,4); -- 支付工程款情况/业务招待费
	declare _payment_total_amount DECIMAL(20,4); -- 支付工程款情况/累计支付
	declare _tax_rate DECIMAL(20,4); -- 税金情况/比率
	declare _tax_plan_amount DECIMAL(20,4); -- 税金情况/应缴税金
	declare _tax_real_amount DECIMAL(20,4); -- 税金情况/已缴税金
	declare _tax_total_amount DECIMAL(20,4); -- 税金情况/累计已缴税金
	declare _tax_owe_amount DECIMAL(20,4); -- 税金情况/尚欠税金
	declare _arrears_amount DECIMAL(20,4); -- 垫付资金情况/金额
	declare _expected_value DECIMAL(20,4); -- 型材（吨）/预计用量
	declare _profile_point VARCHAR(20); -- 型材（吨）/型材点

  
  	-- 获取指定期的利息明细数据
  	declare cur_for_detail cursor for 
		  select date(trice),
					description,
					project_code,
					project_name,
					organization_name,
					party_name,
					party_address,
					manager,
					corperation,
					legal_assignee,
					is_withholding_offsite,
					contract_code,
					contract_amount,
					change_amount,
					change_total_amount,
					settlement_amount,
					duty_paid_code,
					duty_paid_time,
					duty_paid_amount,
					capital_occupied,
					project_status,
					management_rate * 100,
					management_plan_amount,
					management_real_amount,
					management_total_amount,
					management_owe_amount,
					party_billing_amount,
					party_billing_total_amount,
					collections_amount,
					collections_total_amount,
					collections_rate,
					customer_billing_amount,
					customer_billing_total_amount,
					payment_amount,
					payment_amount_clv,
					payment_amount_cliang,
					payment_amount_zdai,
					payment_total_amount,
					tax_rate * 100,
					tax_plan_amount,
					tax_real_amount,
					tax_total_amount,
					tax_owe_amount,
					arrears_amount,
					expected_value,
					profile_point 
		  from t_project_init where project_code not in (select project_code from t_project) and contract_amount > 0;		
  	declare continue handler for not found set eof = 1;
  	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_import_init', now(), '开始执行');
  
  	open cur_for_detail;
  
  	top2: loop
    	fetch cur_for_detail into  _trice,
											_description,
											_project_code,
											_project_name,
											_organization_name,
											_party_name,
											_party_address,
											_manager,
											_corperation,
											_legal_assignee,
											_is_withholding_offsite,
											_contract_code,
											_contract_amount,
											_change_amount,
											_change_total_amount,
											_settlement_amount,
											_duty_paid_code,
											_duty_paid_time,
											_duty_paid_amount,
											_capital_occupied,
											_project_status,
											_management_rate,
											_management_plan_amount,
											_management_real_amount,
											_management_total_amount,
											_management_owe_amount,
											_party_billing_amount,
											_party_billing_total_amount,
											_collections_amount,
											_collections_total_amount,
											_collections_rate,
											_customer_billing_amount,
											_customer_billing_total_amount,
											_payment_amount,
											_payment_amount_clv,
											_payment_amount_cliang,
											_payment_amount_zdai,
											_payment_total_amount,
											_tax_rate,
											_tax_plan_amount,
											_tax_real_amount,
											_tax_total_amount,
											_tax_owe_amount,
											_arrears_amount,
											_expected_value,
											_profile_point;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top2;
    	end if;
    	
    	set _trice = ifnull(_trice, current_date());
    	
    	set _project_id = uuid();
    	
    	-- 导入项目数据
    	insert into t_project(  id,
		 								project_code,
										project_name,
										organization_id,
										party_name,
										party_address,
										manager,
										corperation,
										legal_assignee,
										is_withholding_offsite,
										contract_code,
										contract_amount,
										settlement_amount,
										duty_paid_code,
										duty_paid_time,
										duty_paid_amount,
										capital_occupied,
										project_status,
										management_rate,
										management_plan_amount,
										tax_rate,
										tax_plan_amount,
										trice
						) values(
										_project_id,
										_project_code,
										_project_name,
										(select id from t_sys_organization where  organization_name = _organization_name limit 1),
										_party_name,
										_party_address,
										_manager,
										_corperation,
										_legal_assignee,
										if(ifnull(_is_withholding_offsite, '否') ='否', 1, 0),
										_contract_code,
										_contract_amount,
										_settlement_amount,
										_duty_paid_code,
										_duty_paid_time,
										_duty_paid_amount,
										if(_capital_occupied = '是', 1, 0),
										_project_status,
										_management_rate,
										_management_plan_amount,
										_tax_rate,
										_tax_plan_amount,
										_trice
						);
						
			if ifnull(_change_amount, 0) > 0 then
				-- 发生了合同调整
				insert into t_contract_change(id, project_id, management_rate, change_amount, trice) 
									values(uuid(), _project_id, _management_rate, _change_amount, _trice);
			end if;
			
			-- 实收的管理费
			if ifnull(_management_real_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'),  '管理费', '现金', _management_real_amount, _trice);
			end if;
			
			
			-- 甲方开票
			if ifnull(_party_billing_amount, 0) > 0 then
				insert into t_party_billing(id, project_id, amount, tax_rate, step_status, trice) 
									values(uuid(), _project_id, _party_billing_amount, _tax_rate, 1, _trice);
			end if;
			
			-- 甲方收款
			if ifnull(_collections_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'),  '其他', '现金', _collections_amount, _trice);
			end if;
			
			
			-- 客户开票
			if ifnull(_customer_billing_amount, 0) > 0 then
				insert into t_customer_billing(id, project_id, invoice_code, invoice_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '其他', _customer_billing_amount, _trice);
			end if;
			
			
			-- 支付金额
			if ifnull(_payment_amount, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='其他' limit 1), _payment_amount, _trice);
			end if;
			
			-- 差旅费
			if ifnull(_payment_amount_clv, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='差旅费' limit 1), _payment_amount_clv, _trice);
			end if;
			
			
			
			-- 车辆费用
			if ifnull(_payment_amount_cliang, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='车辆费' limit 1), _payment_amount_cliang, _trice);
			end if;
			
			-- 业务招待费
			if ifnull(_payment_amount_zdai, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='业务招待费' limit 1), _payment_amount_zdai, _trice);
			end if;
			
			
			-- 已缴税金
			if ifnull(_tax_real_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'), '税金', '现金', _tax_real_amount, _trice);
			end if;
			
			-- 垫付资金
			if ifnull(_arrears_amount, 0) > 0 then
				insert into t_arrears(id, project_id, arrears_code, arrears_type, pay_type, amount, interest_rate, trice) 
									values(uuid(), _project_id, get_next_code('arrears_code'), '垫资', '现金', _arrears_amount, 1, _trice);
			end if;
			
			-- 型材
			if ifnull(_expected_value, 0) > 0 then
				insert into t_profile(id, project_id, expected_value, profile_point, trice) 
									values(uuid(), _project_id, _expected_value, _profile_point, _trice);
			end if;
    	
  	end loop top2;
  
  	close cur_for_detail;
	call proc_exec_log(_exec_no, 'proc_import_init', now(),  '执行完成');
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


-- Dumping structure for procedure hplydb_new.proc_update_interest_detail
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_interest_detail`(IN `_trice` datetime)
    COMMENT '根据当日往来欠款，计算利息明细数据'
proc:BEGIN
	-- 此过程每天第一时间执行，可以重复执行，触发机制：
	-- 1、每天中午12点执行，由MySQL事件机制保证
	-- 2、程序第一次登录时执行，由程序调用
	
	declare _project_id varchar(50);
	declare _atday int;
	
	declare _amount decimal(20, 4);
	declare _a1 decimal(20, 4);
	declare _a2 decimal(20, 4);
	
	declare _trice datetime;
	declare _pharse varchar(100);
	declare _description varchar(200);
	declare _exec_no varchar(50);
	
	declare eof bit default 0;
	
	-- 所有有计息往来欠款的项目ID
  	declare cur_for_project cursor for select distinct project_id from t_arrears where project_id is not null and interest_rate > 0;
  	declare continue handler for not found set eof = 1;  
	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_update_interest_detail', _trice, '开始执行');
  	
  	open cur_for_project;
  
  	top0: loop
    	fetch cur_for_project into _project_id;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top0;
    	end if;
    	
    	if (select count(*) from t_arrears_interest where project_id = _project_id and trice = date(_trice)) > 0 then
    		-- 该项目当天的利息已经算过，计算下一个项目
    		iterate top0;
    	end if;
    	
    	-- 计算当前工程昨天的最新欠款额与计息基数，实际是前天发生的费用
    	select amount, interest_amount, atday into _a1, _a2, _atday from t_arrears_interest where project_id = _project_id and date(trice) = date(_trice) - interval 1 day;
    	set _a1 = ifnull(_a1, 0); -- 最新的往来欠款额度
    	set _a2 = ifnull(_a2, 0); -- 计息基数，本期基数的累计
    	set _atday = ifnull(_atday, 0); -- 计息天数
    	
    	-- 获取往来欠款中，昨天的费用总和（指定日期）
    	select sum(amount) into _amount from t_arrears where project_id=_project_id and interest_rate > 0 and trice = date(_trice) - interval 1 day;
    	set _amount = ifnull(_amount, 0);
    	
    	if _amount = 0 and _a1 = 0 then
    		-- 该项目所有欠款已还清，并且没有新借款项
    		iterate top0;
    	end if;
    	
    	-- 计算利息结算的期数，比如2014-08
    	set _pharse = date_format(if(day(_trice) > 20, _trice + interval 1 month, _trice), '%Y-%m');
    	
    	-- 每月21日，期内天数自动归零
    	if day(_trice) = 21 then
    		set _atday = 0;
    	end if;
    	
    	set _description = if(_amount > 0, concat('昨日计息：', _amount), '');
    	
    	if _a1 > 0 then
    		-- 上次计算过利息
    		set _a1 = if(_a1 + _amount > 0, _a1 + _amount, 0);
    		set _a2 = _a1 + _a2;
    		insert into t_arrears_interest(id, project_id, trice, amount, interest_amount, pharse, atday, description) values
			 (uuid(), _project_id, date(_trice), _a1, _a2, _pharse, _atday + 1, _description);
    	
    	else
    		-- _a1 =0 and _amount > 0，历史中没有利息明细，但昨日发生了新的计息费用
    		set _amount = if(_amount > 0, _amount, 0);
    		insert into t_arrears_interest(id, project_id, trice, amount, interest_amount, pharse, atday, description) values
			 (uuid(), _project_id, date(_trice), _amount, _amount, _pharse, 1, _description);
    	end if;
    	
    end loop top0;
   
   close cur_for_project;
   
	call proc_exec_log(_exec_no, 'proc_update_interest_detail', _trice, '执行完成');
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_update_interest_detail_everyday
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_interest_detail_everyday`()
BEGIN
	declare _last_trice datetime;
	
	-- 获取存储过程执行记录中最后一次执行的计息时间
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_update_interest_detail';
	
	-- 如果为空，则从今天开始计息， 否则，从缺口的第二天，循环到今天
	set _last_trice = if(_last_trice is null, now(), date_add(_last_trice, interval + 1 day));
	
	while date(_last_trice) <= date(now()) do
		-- 计算当天的利息基数，天数等信息 
		call proc_update_interest_detail(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 day);
	end while;
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
    COMMENT '获取系统参数表的值'
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


-- Dumping structure for event hplydb_new.evt_calc_all_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `evt_calc_all_interest` ON SCHEDULE EVERY 1 MONTH STARTS '2014-08-20 05:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '计算所有工程的利息每月20日凌晨5点执行' DO BEGIN
	declare _last_trice datetime;
	declare current_trice datetime;
	
	
  	-- 计算本次结息日，如果现在在20日之前，则上月20日为结息日， 否则本月20日为结息日
  	set current_trice = date_add(curdate(),interval - day(curdate()) + 20 day);
  	if current_trice > now() then
    	set current_trice = current_trice + interval -1 month;
  	end if;
  	
	-- 获取存储过程执行记录中最后一次执行的计息时间
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_calc_all_interest';
	
	
	-- 如果为空，则从今天开始计息， 否则，从缺口的下一月，循环到今天
	set _last_trice = if(_last_trice is null, current_trice, date_add(_last_trice, interval + 1 month));
	
	while date(_last_trice) <= date(current_trice) do
		-- 计算当天的利息基数，天数等信息 
		call proc_update_interest_detail(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 month);
	end while;
	
END//
DELIMITER ;


-- Dumping structure for event hplydb_new.evt_update_interest_detail
DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `evt_update_interest_detail` ON SCHEDULE EVERY 1 DAY STARTS '2014-08-20 03:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT '每天凌晨3:00计算利息明细数据' DO BEGIN
	declare _last_trice datetime;
	
	-- 获取存储过程执行记录中最后一次执行的计息时间
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_update_interest_detail';
	
	-- 如果为空，则从今天开始计息， 否则，从缺口的第二天，循环到今天
	set _last_trice = if(_last_trice is null, now(), date_add(_last_trice, interval + 1 day));
	
	while date(_last_trice) <= date(now()) do
		-- 计算当天的利息基数，天数等信息 
		call proc_update_interest_detail(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 day);
	end while;
END//
DELIMITER ;


-- Dumping structure for trigger hplydb_new.tr_arrears_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_arrears_after_insert` AFTER INSERT ON `t_arrears` FOR EACH ROW trig:BEGIN
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
				 uuid(),
				 /*登记时间*/ new.`trice`,
				 /*备注*/ CONCAT('新的往来欠款，',new.description),
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
				/*table_name*/ concat('/arrears/detail/', new.id)
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
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
				 uuid(),
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
				 (new.amount + collections_total_amount) * 100/ IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + change_total_amount) `collections_rate`,
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
				/*table_name*/ concat('/collections/detail/', new.id)
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
			uuid(),
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
		 /*应收管理费*/ new.`management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) AS `management_plan_amount`,
		 `management_real_amount`,
		 `management_total_amount`,
		 new.`management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) - `management_total_amount` AS `management_owe_amount`,
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
		/*table_name*/ concat('/contractchange/detail/', new.id)
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
			uuid(),
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('新的客户开票，',new.description),
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
		/*table_name*/ concat('/customerbilling/detail/', new.id)
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
			uuid(),
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
		/*table_name*/ concat('/partybilling/detail/', new.id)
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
			uuid(),
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
	/*table_name*/ concat('/payment/detail/', new.id)
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
			uuid(),
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
	/*table_name*/ concat('/profile/detail/', new.id)
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
			(uuid(),
			/*trice*/ new.trice, 
			/*description*/ CONCAT('创建新项目，',new.description) , 
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
			/*tax_plan_amount*/ new.tax_plan_amount,
			/*tax_real_amount*/0.0000, 
			/*tax_total_amount*/0.0000, 
			/*tax_owe_amount*/ new.tax_plan_amount, 
			/*arrears_amount*/0.0000, 
			/*expected_value*/0.0000, 
			/*profile_point*/ '', 
			/*version*/0, 
			/*create_time*/CURRENT_TIMESTAMP,
			/*table_name*/ concat('/project/detail/', new.id) );
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
				 uuid(),
		 /*登记时间*/ now(),
		 /*备注*/ CONCAT('修改合同项目信息，',new.description),
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 /*change_amount*/ 0,
			change_total_amount,
		 new.`settlement_amount`,
		 `management_rate`,
		 /*直接修改了应收管理费总额*/ new.management_plan_amount as `management_plan_amount`,
		 /*management_real_amount*/ 0,
		 `management_total_amount`,
		 /*尚欠管理费*/ (new.management_plan_amount - management_plan_amount) + `management_owe_amount`,
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
		 (new.tax_plan_amount - tax_plan_amount) + `tax_owe_amount`,
		 `arrears_amount`,
		 /* expected_value */ 0,
		 /* profile_point */ '',
		/*version*/ 1, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ concat('/project/detail/', new.id)
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
