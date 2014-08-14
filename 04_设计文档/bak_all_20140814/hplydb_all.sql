-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.19 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 hplydb 的数据库结构
CREATE DATABASE IF NOT EXISTS `hplydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hplydb`;


-- 导出  函数 hplydb.get_next_code 结构
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


-- 导出  函数 hplydb.refresh_all_status 结构
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `refresh_all_status`() RETURNS int(11)
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
 
 RETURN 1; 
END//
DELIMITER ;


-- 导出  表 hplydb.t_arrears 结构
CREATE TABLE IF NOT EXISTS `t_arrears` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `arrears_code` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `funds_using` varchar(200) DEFAULT NULL COMMENT '资金使用方',
  `arrears_type` varchar(50) DEFAULT NULL COMMENT '欠款分类',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '金额',
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `arrears_code_UNIQUE` (`arrears_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='07_往来欠款';

-- 正在导出表  hplydb.t_arrears 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_arrears` DISABLE KEYS */;
REPLACE INTO `t_arrears` (`id`, `arrears_code`, `project_id`, `funds_using`, `arrears_type`, `pay_type`, `amount`, `interest_amount`, `interest_rate`, `bank_account`, `bank_name`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('a934f3c6-b512-4015-857a-7ef4536a7620', 'WL-2014-0005', NULL, '', '', '', 0.0000, 0.0000, 0.0000, '', '', '2014-08-10 08:00:00', '2014-08-10 12:09:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 12:09:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('fecc10c3-ca5c-4d61-bb1d-18b1fa29b453', 'WL-2014-0004', NULL, '', '', '', 0.0000, 0.0000, 0.0000, '', '', '2014-08-14 08:00:00', '2014-08-10 10:46:24', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 10:46:24', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('fecc10c3-ca5c-4d61-bb1d-18b1fa29b454', 'WL-2014-0001', NULL, '', '', '', 0.0000, 0.0000, 0.0000, '', '', '2014-08-14 08:00:00', '2014-08-10 10:46:24', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 10:46:24', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1);
/*!40000 ALTER TABLE `t_arrears` ENABLE KEYS */;


-- 导出  表 hplydb.t_chop 结构
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

-- 正在导出表  hplydb.t_chop 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_chop` DISABLE KEYS */;
REPLACE INTO `t_chop` (`id`, `chop_code`, `project_id`, `project_code`, `project_name`, `manager`, `content`, `apply_user`, `apply_time`, `organization_id`, `step1_idea`, `step1_user`, `step1_time`, `step2_idea`, `step2_user`, `step2_time`, `step3_idea`, `step3_user`, `step3_time`, `step_status`, `version`, `status`) VALUES
	('28cd58a4-5a83-421f-82c2-4f49eb3ee331', '去去去', '111', '11', '', '', '', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-03 22:03:47', '', '', '', NULL, '', '', NULL, '', '', NULL, '', 0, 0),
	('35094c7d-8815-4e88-afb8-aac7200f4f06', '', '', '', '', '', '', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 21:31:21', '', '', '', NULL, '', '', NULL, '', '', NULL, '', 0, NULL);
/*!40000 ALTER TABLE `t_chop` ENABLE KEYS */;


-- 导出  表 hplydb.t_collections 结构
CREATE TABLE IF NOT EXISTS `t_collections` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_collections 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_collections` DISABLE KEYS */;
REPLACE INTO `t_collections` (`id`, `project_id`, `ticket_code`, `source_of`, `payment_type`, `amount`, `bank_account`, `bank_name`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('00324953-d1f8-4dc6-95e1-9ae9d17f6732', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0014', '工程款', '现金', 1300.0000, '', '', '2014-08-14 07:26:00', '2014-08-14 07:25:59', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:25:59', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('278ec7b2-7a48-4143-887b-74758e8bf9ad', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 'SK-2014-0004', '税金', '', 3000.0000, '', '', '2014-08-10 08:00:00', '2014-08-10 19:28:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 19:28:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 'www', 0, 1),
	('61118fd4-2a86-4804-abbf-9b303342cec9', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0016', '管理费', '现金', 1200.0000, '', '', '2014-08-14 07:28:28', '2014-08-14 07:28:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:28:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('76997244-f44e-40fb-9c45-41ce5fd5c950', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0010', '工程款', '现金', 2000.0000, '', '', '2014-08-12 22:25:07', '2014-08-12 22:25:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:25:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('99b756c6-9f64-4d95-b5a8-f030eab022cb', '80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'SK-2014-0003', '3333', '', 3333.0000, '', '', '2014-08-10 08:00:00', '2014-08-10 12:05:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 12:05:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('bd884dd1-61e6-42b0-82fb-07d75867b25e', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0015', '税金', '现金', 800.0000, '', '', '2014-08-14 07:27:48', '2014-08-14 07:27:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:27:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('dc208575-4ebf-488e-9bba-aa36c4fa1ab5', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0009', '管理费', '现金', 1000.0000, '', '', '2014-08-12 22:24:53', '2014-08-12 22:24:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:24:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('ef37c1e9-e86d-4f04-89b5-611c48adeee2', 'eb549da6-8830-4319-b01c-ba29011481a6', 'SK-2014-0011', '工程款', '现金', 120000.0000, '', '', '2014-08-12 22:31:07', '2014-08-12 22:31:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:31:06', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1);
/*!40000 ALTER TABLE `t_collections` ENABLE KEYS */;


-- 导出  表 hplydb.t_contract_change 结构
CREATE TABLE IF NOT EXISTS `t_contract_change` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_contract_change 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `t_contract_change` DISABLE KEYS */;
REPLACE INTO `t_contract_change` (`id`, `project_id`, `csa_code`, `management_rate`, `change_amount`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('55e8b215-68ee-494c-a239-a215e8533462', '80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'BC-2014-0024', 3.6000, -100.0000, '2014-08-10 08:54:04', '2014-08-10 08:54:03', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:54:03', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('5f289b15-2517-47ff-b635-c6129c5dad93', '80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'BC-2014-0023', 3.6000, 100.0000, '2014-08-10 08:53:51', '2014-08-10 08:53:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:53:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('7fa3e71b-4cfc-48f1-8a1e-4d612f6ca363', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 'BC-2014-0031', 3.6000, 5000.0000, '2014-08-11 22:23:04', '2014-08-11 22:23:04', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 22:23:04', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('8b6958b0-2ac3-46cc-bc53-a454ebcff69e', 'wrw', 'fsdfs', 0.0000, 0.0000, '2014-08-15 08:00:00', '2014-08-04 23:17:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 21:05:03', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 'qqq', 1, 1),
	('9c34d18b-9b92-47ef-b63c-9d7b98ef992d', '868244a6-e9a8-46e3-9ece-94a620c75a13', 'BC-2014-0015', 0.0000, 0.0000, '2014-08-10 08:00:00', '2014-08-10 08:40:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:40:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '呜呜呜', 0, 1),
	('a06fb71f-eb8e-43f4-929d-55485c57bcc6', '', 'BC-2014-0002', 0.0000, 0.0000, '2014-08-09 08:00:00', '2014-08-09 22:16:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 22:16:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('a1bb8206-6ad3-4734-bf4f-8222b862fe57', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 'BC-2014-0027', 3.6000, 10000.0000, '2014-08-10 19:13:41', '2014-08-10 19:13:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 19:13:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '增加了1万', 0, 1),
	('da85c27b-75a8-4128-9613-efa7e35048fd', '80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'BC-2014-0020', 3.6000, 0.0000, '2014-08-10 08:48:36', '2014-08-10 08:48:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:48:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('f54e4cc7-5ffd-4c99-8bdf-f018764016ba', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 'BC-2014-0030', 3.6000, 300.0000, '2014-08-11 22:20:20', '2014-08-11 22:20:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 22:20:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1);
/*!40000 ALTER TABLE `t_contract_change` ENABLE KEYS */;


-- 导出  表 hplydb.t_customer_billing 结构
CREATE TABLE IF NOT EXISTS `t_customer_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_customer_billing 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_customer_billing` DISABLE KEYS */;
REPLACE INTO `t_customer_billing` (`id`, `project_id`, `invoice_code`, `invoice_type`, `amount`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('023bc9e1-e7ea-4d5f-8ba4-601e71bb5ca1', 'e4297d0d-f1af-47f5-8f8a-85eb8b6267f7', '77777', '劳务', 90000.0000, '2014-08-12 22:24:15', '2014-08-12 22:24:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:24:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('319ab306-3040-4a5c-a992-bc2b0c1c13df', 'e6f4c8e6-4976-46d2-ab1d-dc0d4487d4fd', '222', '材料,劳务', 500.0000, '2014-08-12 22:01:50', '2014-08-12 22:01:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:01:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('5b686cf4-dfb6-4a9c-9818-e52b2bdcdd0e', 'eb549da6-8830-4319-b01c-ba29011481a6', 'aaaa001', '劳务', 500.0000, '2014-08-12 22:08:52', '2014-08-12 22:08:51', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:08:51', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('88ad4381-ad1e-4ded-b4b1-b3ca1225b266', '', '', '', 0.0000, '2014-08-04 08:00:00', '2014-08-04 23:18:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-04 23:18:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('ddd9f2aa-a34b-4f18-9585-c7f584dec697', 'ddd', 'dd', '', 0.0000, '2014-08-10 08:00:00', '2014-08-10 20:46:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 20:46:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1);
/*!40000 ALTER TABLE `t_customer_billing` ENABLE KEYS */;


-- 导出  表 hplydb.t_field_types 结构
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

-- 正在导出表  hplydb.t_field_types 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_field_types` DISABLE KEYS */;
REPLACE INTO `t_field_types` (`id`, `field_t01`, `field_t02`, `field_t03`, `field_t04`, `field_t05`, `field_t06`, `field_t07`, `field_t08`, `field_t09`, `version`, `status`) VALUES
	('0e3ee756446a477a8d6deda3094f482f', '啊司法', 2348132.3453, '', '', '', '2005-02-11 08:00:00', '', 0, 0, 3, 0),
	('199ca65456d747c988922892956f45f8', '发违法', 0.0000, '', '', '', '1970-01-16 08:00:00', '阿萨德发', 1, 0, 1, 0);
/*!40000 ALTER TABLE `t_field_types` ENABLE KEYS */;


-- 导出  表 hplydb.t_information 结构
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

-- 正在导出表  hplydb.t_information 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_information` DISABLE KEYS */;
REPLACE INTO `t_information` (`id`, `organization_id`, `project_name`, `address`, `developer`, `epc_corporation`, `variety`, `total_area`, `real_name`, `identification`, `contact`, `subscriber`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('49cebb8a-b300-4783-b837-d3842fdb4c08', '啊司法', '阿迪沙发', 'adsfa', 'fasf', '', '', '', '', '', '', '', '2014-08-10 08:00:00', '2014-08-10 12:12:25', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 12:12:25', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('6f98517a-d329-4344-8513-ea666c2a5917', '0ed4d3a1-0c3a-11e4-9300-001c42328937', '我是一个中国人我是一个中国人我是一个中国人', '我是一个中国人', '我是一个中国人我是一个中国人', '我是一个中国人', '我是一个中国人', '我是一个中国人', '我是一个中国人', '我是一个中国人', '我是一个中国人', '我是一个中国人', '2014-08-03 08:00:00', '2014-08-03 21:34:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-03 21:43:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '我是一个中国人', 3, 1),
	('f13dffd2-bf24-408c-a5ba-4e640f4d44b5', '0ed38235-0c3a-11e4-9300-001c42328937', '项目123', '阿萨德发', '阿道夫', '阿萨德发', '阿萨德发', '阿萨德发', '我让', '阿萨德发', '阿萨德发', '阿萨德发', '2014-08-15 08:00:00', '2014-08-03 21:23:56', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-03 21:43:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '阿萨德发', 2, 1),
	('f7db6226-2eaf-47dd-be25-82492b126cfd', '事业部', '什么什么的项目', '我们的学校', '', '', '', '', '', '', '', '', '2014-08-13 08:00:00', '2014-08-05 21:32:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:05:00', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1);
/*!40000 ALTER TABLE `t_information` ENABLE KEYS */;


-- 导出  表 hplydb.t_party_billing 结构
CREATE TABLE IF NOT EXISTS `t_party_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_party_billing 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `t_party_billing` DISABLE KEYS */;
REPLACE INTO `t_party_billing` (`id`, `project_id`, `invoice_code`, `amount`, `trice`, `tax_rate`, `tax_amount`, `step1_idea`, `step1_user`, `step1_time`, `step_status`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('1121385b-88a8-4eea-9777-6e5e175d7c80', 'eb549da6-8830-4319-b01c-ba29011481a6', 'XX-BB-002', 3000.0000, '2014-08-12 21:22:47', 3.4000, 0.0000, '同意，审核通过', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', NULL, '1', '2014-08-12 21:22:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 21:36:11', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '这是三千，这个有问题吧？', 3, 1),
	('83491638-7be7-4610-ab14-f6f85834bd59', 'e6f4c8e6-4976-46d2-ab1d-dc0d4487d4fd', '三十岁', 300.0000, '2014-08-11 23:48:47', 3.6000, 0.0000, NULL, NULL, NULL, NULL, '2014-08-11 22:33:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 23:48:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1),
	('8412ac8f-13b3-4c60-8dc5-08c70426d730', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '2222', 2000.0000, '2014-08-10 08:00:00', 3.0000, 3.0000, '', '', NULL, '1', '2014-08-10 19:25:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 19:25:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('c4753ed2-dcb8-42bd-80f9-3de477453954', NULL, '鹅鹅鹅鹅', 20000.0000, '2014-08-10 08:00:00', 3.6000, 300.0000, '同意，审核通过', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 21:48:27', '1', '2014-08-10 19:23:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 21:48:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1);
/*!40000 ALTER TABLE `t_party_billing` ENABLE KEYS */;


-- 导出  表 hplydb.t_payment 结构
CREATE TABLE IF NOT EXISTS `t_payment` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_payment 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `t_payment` DISABLE KEYS */;
REPLACE INTO `t_payment` (`id`, `project_id`, `ticket_code`, `pay_type`, `payment_item_id`, `amount`, `bank_account`, `bank_name`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('161336a9-e5b3-44a6-8a78-13ce5f8ee569', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0029', '现金', 'e00dfdf3-4193-476a-9612-b3ae31eefbc4', 300.0000, '', '', '2014-08-14 08:18:54', '2014-08-14 08:18:54', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:18:54', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('302de783-e7d3-4cd5-a563-3a4da3550b71', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 'FK-2014-0004', 'www', '', 3000.0000, '', '', '2014-08-10 08:00:00', '2014-08-10 20:31:38', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 20:31:38', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('49b95e8b-e59d-4eb1-b753-2f7920264313', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0033', '现金', '54bf359d-68d1-4170-8d92-0353d2526325', 500.0000, '', '', '2014-08-14 08:27:21', '2014-08-14 08:27:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:27:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('6f942558-884e-4a90-a4b2-5bbf5dcc7a1f', '80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'FK-2014-0003', 'asdfa', '', 0.0000, '', '', '2014-08-10 08:00:00', '2014-08-10 12:08:51', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 12:08:51', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1),
	('87a7e6d7-2236-492a-b428-3ad364a546e0', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0007', '', '', 600.0000, '', '', '2014-08-13 08:00:00', '2014-08-14 07:30:11', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:30:11', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('abc5898a-0871-4928-9ddc-8dbe53c7a0b1', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0035', '汇票', '2762ebb5-a879-4c28-b4bf-28b622ae8011', 650.0000, '', '', '2014-08-14 08:28:51', '2014-08-14 08:28:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:28:50', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('aec55e42-f8ed-42f2-b26f-a48a17d99b1a', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0030', '现金', 'e00dfdf3-4193-476a-9612-b3ae31eefbc4', 0.0000, '', '', '2014-08-14 08:24:23', '2014-08-14 08:24:22', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:24:22', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL),
	('f42f5790-f52b-40b6-936f-48ca2622f431', 'eb549da6-8830-4319-b01c-ba29011481a6', 'FK-2014-0034', '汇款', '54bf359d-68d1-4170-8d92-0353d2526325', 500.0000, '', '', '2014-08-14 08:28:20', '2014-08-14 08:28:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:28:20', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, NULL);
/*!40000 ALTER TABLE `t_payment` ENABLE KEYS */;


-- 导出  表 hplydb.t_payment_item 结构
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

-- 正在导出表  hplydb.t_payment_item 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `t_payment_item` DISABLE KEYS */;
REPLACE INTO `t_payment_item` (`id`, `item_name`, `reimbursement_cap`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`) VALUES
	('2762ebb5-a879-4c28-b4bf-28b622ae8011', '差旅费', 1.0000, '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:07', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('54bf359d-68d1-4170-8d92-0353d2526325', '期间费用', 2.0000, '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:35:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('e00dfdf3-4193-476a-9612-b3ae31eefbc4', '业务招待费', 5.0000, '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:37:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0);
/*!40000 ALTER TABLE `t_payment_item` ENABLE KEYS */;


-- 导出  表 hplydb.t_profile 结构
CREATE TABLE IF NOT EXISTS `t_profile` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
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

-- 正在导出表  hplydb.t_profile 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_profile` DISABLE KEYS */;
REPLACE INTO `t_profile` (`id`, `project_id`, `expected_value`, `profile_point`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`) VALUES
	('0ae19056-819a-4cd6-bf7a-fa0b810f2fb7', 'e4297d0d-f1af-47f5-8f8a-85eb8b6267f7', 3333.0000, '', '2014-08-10 08:00:00', '2014-08-10 12:09:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 12:09:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '3', 0, 1),
	('3a8eea488c8c4dafaa95d1cd95b6fdc3', '94e70e8f-fc6f-4795-9a69-b3fa1bf6e7de', 33.0000, 'ert', '2014-07-11 08:00:00', '2014-07-31 23:00:37', 'eee', '2014-08-10 12:09:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 'wwe', 1, 1),
	('b5e5640b-6ab5-4012-9dd6-de90f87b82c0', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', 300.0000, '呵呵呵', '2014-08-10 08:00:00', '2014-08-10 20:29:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 20:29:53', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1);
/*!40000 ALTER TABLE `t_profile` ENABLE KEYS */;


-- 导出  表 hplydb.t_project 结构
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

-- 正在导出表  hplydb.t_project 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `t_project` DISABLE KEYS */;
REPLACE INTO `t_project` (`id`, `project_code`, `project_name`, `organization_id`, `party_name`, `party_address`, `manager`, `contract_code`, `corperation`, `legal_assignee`, `is_withholding_offsite`, `management_rate`, `tax_rate`, `contract_amount`, `settlement_amount`, `duty_paid_time`, `duty_paid_amount`, `duty_paid_code`, `capital_occupied`, `project_status`, `trice`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `status`, `management_plan_amount`, `tax_plan_amount`) VALUES
	('4c31c1aa-5364-44ef-b2f5-072deb8bea9d', 'XM-2014-0100', '第二个项目', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 100000.0000, 1200000.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-10 08:36:01', '2014-08-10 08:33:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:36:00', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1, 43200.0000, 40800.0000),
	('6853e2cb-fb74-4e53-acb1-19333bd50b55', 'wsss2', 'sssss', '0ed44f90-0c3a-11e4-9300-001c42328937', 'eee', 'eee', 'eee', 'eee', 'eee', 'eee', 1, 0.0000, 0.0000, 123.0000, 0.0000, '2014-08-29 08:00:00', 0.0000, '', 0.0000, 0, '2014-08-13 08:00:00', '2014-08-03 22:21:05', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:37:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 2, 1, 0.0000, 0.0000),
	('79eecfe0-5229-4785-8446-0947fcfd16c5', '金鸡湖各个', 'join哦iu', '0ed44f90-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '2014-08-04 23:14:53', '2014-08-04 23:14:52', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-04 23:14:52', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1, NULL, NULL),
	('80fbb480-f3e5-4627-ab8e-c87efc636c3e', 'XM-2014-0101', '我是特别长的项目名称我是特别长的项目名称', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 100.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-10 08:39:03', '2014-08-10 08:39:02', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 08:39:02', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1, 3.6000, 3.4000),
	('868244a6-e9a8-46e3-9ece-94a620c75a13', 'rrr额', 'eee呃呃呃', '0ed38235-0c3a-11e4-9300-001c42328937', 'eee', 'eee', 'eee', 'eee', 'eee', 'eee', 1, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000, '', NULL, 0, '2014-08-04 23:05:30', '2014-08-03 22:16:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-04 23:05:30', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1, NULL, NULL),
	('94e70e8f-fc6f-4795-9a69-b3fa1bf6e7de', 'XM-2014-001', '我们的第一个项目', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-05 08:00:00', '2014-08-05 21:35:04', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:36:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1, 1, 0.0000, 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', 'XM-2014-0107', '令人惊喜的项目', '0ed44f90-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.6000, 3.4000, 100000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-10 19:12:18', '2014-08-10 19:12:17', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 19:12:17', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1, 3600.0000, 3400.0000),
	('a94defc6-d6c5-412d-a8d5-be1915b43c3c', 'XM-2014-0062', 'dddd', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-09 21:10:26', '2014-08-09 21:10:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:10:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1, 0.0000, 0.0000),
	('e4297d0d-f1af-47f5-8f8a-85eb8b6267f7', 'XM-2014-0065', '柔柔弱弱', '0ed38235-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', NULL, 3.4000, 3.4000, 0.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-09 22:44:01', '2014-08-09 22:44:01', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 22:44:01', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0, 1, 0.0000, 0.0000),
	('e6f4c8e6-4976-46d2-ab1d-dc0d4487d4fd', 'XM-2014-0099', '我的项目了', '0ed44f90-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', 1, 3.6000, 3.4000, 10000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-10 07:39:00', '2014-08-10 07:38:24', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-10 07:38:59', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 2, 1, 360.0000, 340.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', 'XM-2014-0110', '今天的项目', '0ed4d3a1-0c3a-11e4-9300-001c42328937', '', '', '成七一', '', '', '', NULL, 3.6000, 3.4000, 500000.0000, 0.0000, NULL, 0.0000, '', 0.0000, NULL, '2014-08-11 22:31:58', '2014-08-11 22:31:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 22:31:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '这一个新项目了。', 0, 1, 18000.0000, 17000.0000),
	('fcfd2e18-388d-4290-b935-ed936677bb8e', '呜呜呜12', '柔柔弱弱', '0ed44f90-0c3a-11e4-9300-001c42328937', '', '', '', '', '', '', 1, NULL, NULL, NULL, 400.0000, NULL, NULL, '', NULL, NULL, '2014-08-04 23:15:37', '2014-08-04 23:06:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-04 23:15:37', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 4, 1, NULL, NULL);
/*!40000 ALTER TABLE `t_project` ENABLE KEYS */;


-- 导出  表 hplydb.t_project_summary 结构
CREATE TABLE IF NOT EXISTS `t_project_summary` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `trice` datetime DEFAULT NULL COMMENT '时间',
  `description` varchar(500) DEFAULT NULL COMMENT '摘要',
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `organization_id` char(36) DEFAULT NULL COMMENT '所在部门',
  `project_code` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `contract_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同金额',
  `change_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '合同调增额',
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
  `serial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录流程号',
  `table_name` varchar(100) DEFAULT NULL,
  `change_total_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '累计调增额',
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='00_多项目汇总';

-- 正在导出表  hplydb.t_project_summary 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `t_project_summary` DISABLE KEYS */;
REPLACE INTO `t_project_summary` (`id`, `trice`, `description`, `project_id`, `organization_id`, `project_code`, `project_name`, `contract_amount`, `change_amount`, `settlement_amount`, `management_rate`, `management_plan_amount`, `management_real_amount`, `management_total_amount`, `management_owe_amount`, `party_billing_amount`, `party_billing_total_amount`, `collections_amount`, `collections_total_amount`, `collections_rate`, `customer_billing_amount`, `customer_billing_total_amount`, `payment_amount`, `payment_total_amount`, `tax_rate`, `tax_plan_amount`, `tax_real_amount`, `tax_total_amount`, `tax_owe_amount`, `arrears_amount`, `expected_value`, `profile_point`, `version`, `create_time`, `serial_id`, `table_name`, `change_total_amount`) VALUES
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-10 19:12:18', '', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 3600.0000, 0.0000, 0.0000, 3600.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-10 19:12:17', 3, 't_project', 0.0000),
	('a1bb8206-6ad3-4734-bf4f-8222b862fe57', '2014-08-10 19:13:41', '增加了1万', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 10000.0000, 0.0000, 3.6000, 396000.0000, 0.0000, 0.0000, 396000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-10 19:13:41', 4, 't_contract_change', 10000.0000),
	('8412ac8f-13b3-4c60-8dc5-08c70426d730', '2014-08-10 08:00:00', '', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 396000.0000, 0.0000, 0.0000, 396000.0000, 2000.0000, 2000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.0000, 6000.0000, 0.0000, 0.0000, 6000.0000, 0.0000, 0.0000, '', 2, '2014-08-10 19:26:10', 5, 't_party_billing', 10000.0000),
	('278ec7b2-7a48-4143-887b-74758e8bf9ad', '2014-08-10 08:00:00', 'www', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 396000.0000, 0.0000, 0.0000, 396000.0000, 2000.0000, 2000.0000, 3000.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 0.0000, 3.0000, 6000.0000, 3000.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 3, '2014-08-10 19:28:28', 6, 't_collections', 10000.0000),
	('b5e5640b-6ab5-4012-9dd6-de90f87b82c0', '2014-08-10 08:00:00', '', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 396000.0000, 0.0000, 0.0000, 396000.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 0.0000, 3.0000, 6000.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 300.0000, '呵呵呵', 4, '2014-08-10 20:29:53', 7, 't_arrears', 10000.0000),
	('302de783-e7d3-4cd5-a563-3a4da3550b71', '2014-08-10 08:00:00', '', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 396000.0000, 0.0000, 0.0000, 396000.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 3000.0000, 3000.0000, 3.0000, 6000.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 5, '2014-08-10 20:31:38', 8, 't_payment', 10000.0000),
	('f54e4cc7-5ffd-4c99-8bdf-f018764016ba', '2014-08-11 22:20:20', '发生了调增，', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 300.0000, 0.0000, 3.6000, 397080.0000, 0.0000, 0.0000, 397080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 6000.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 6, '2014-08-11 22:20:20', 9, 't_contract_change', 10300.0000),
	('7fa3e71b-4cfc-48f1-8a1e-4d612f6ca363', '2014-08-11 22:23:04', '发生了调增，', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 5000.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 0.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 6000.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 7, '2014-08-11 22:23:04', 10, 't_contract_change', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-11 22:31:58', '新项目，这一个新项目了。', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 0.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-11 22:31:57', 11, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 21:15:56', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:15:56', 12, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 21:15:56', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:15:56', 13, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 21:21:20', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:21:20', 14, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 21:21:20', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:21:20', 15, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 21:34:44', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:34:44', 16, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 21:34:44', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:34:44', 17, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 21:42:15', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:42:15', 18, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 21:42:15', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:42:15', 19, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 21:47:13', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:47:13', 20, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 21:47:13', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 21:47:13', 21, 't_project', 0.0000),
	('5b686cf4-dfb6-4a9c-9818-e52b2bdcdd0e', '2014-08-12 22:08:52', '新增的客户开票，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 500.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-12 22:08:51', 22, 't_customer_billing', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 22:10:16', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 22:10:16', 23, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 22:10:16', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 22:10:16', 24, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-12 22:23:45', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-12 22:23:45', 25, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-12 22:23:45', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 18000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-12 22:23:45', 26, 't_project', 0.0000),
	('dc208575-4ebf-488e-9bba-aa36c4fa1ab5', '2014-08-12 22:24:53', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 1000.0000, 19000.0000, 17000.0000, 0.0000, 0.0000, 1000.0000, 1000.0000, 0.0020, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-12 22:24:53', 27, 't_collections', 0.0000),
	('76997244-f44e-40fb-9c45-41ce5fd5c950', '2014-08-12 22:25:07', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 19000.0000, 17000.0000, 0.0000, 0.0000, 2000.0000, 3000.0000, 0.0060, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-12 22:25:07', 28, 't_collections', 0.0000),
	('ef37c1e9-e86d-4f04-89b5-611c48adeee2', '2014-08-12 22:31:07', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 19000.0000, 17000.0000, 0.0000, 0.0000, 120000.0000, 123000.0000, 0.2460, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-12 22:31:06', 29, 't_collections', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-14 07:13:54', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:13:54', 30, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-14 07:13:54', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 17000.0000, 0.0000, 0.0000, 0.0000, 123000.0000, 0.2460, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:13:54', 31, 't_project', 0.0000),
	('00324953-d1f8-4dc6-95e1-9ae9d17f6732', '2014-08-14 07:26:00', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 17000.0000, 0.0000, 0.0000, 1300.0000, 124300.0000, 0.2486, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, '', 0, '2014-08-14 07:25:59', 32, 't_collections', 0.0000),
	('bd884dd1-61e6-42b0-82fb-07d75867b25e', '2014-08-14 07:27:48', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 17000.0000, 0.0000, 0.0000, 800.0000, 125100.0000, 0.2502, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 800.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 07:27:47', 33, 't_collections', 0.0000),
	('61118fd4-2a86-4804-abbf-9b303342cec9', '2014-08-14 07:28:28', '新的收款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 1200.0000, 19200.0000, 15800.0000, 0.0000, 0.0000, 1200.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 0.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 07:28:27', 34, 't_collections', 0.0000),
	('87a7e6d7-2236-492a-b428-3ad364a546e0', '2014-08-13 08:00:00', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 19200.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 600.0000, 600.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 07:30:11', 35, 't_payment', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-14 07:54:49', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:54:49', 36, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-14 07:54:49', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 600.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:54:49', 37, 't_project', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-14 07:59:23', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:59:23', 38, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-14 07:59:23', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 600.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 1, '2014-08-14 07:59:23', 39, 't_project', 0.0000),
	('161336a9-e5b3-44a6-8a78-13ce5f8ee569', '2014-08-14 08:18:54', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 300.0000, 900.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 08:18:54', 40, 't_payment', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-14 08:21:39', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-14 08:21:39', 41, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-14 08:21:39', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 900.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 1, '2014-08-14 08:21:39', 42, 't_project', 0.0000),
	('aec55e42-f8ed-42f2-b26f-a48a17d99b1a', '2014-08-14 08:24:23', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 900.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 08:24:22', 43, 't_payment', 0.0000),
	('49b95e8b-e59d-4eb1-b753-2f7920264313', '2014-08-14 08:27:21', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 500.0000, 1400.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 08:27:21', 44, 't_payment', 0.0000),
	('a043e829-9c2a-4b92-9c42-36affd2e53c7', '2014-08-14 08:27:37', '修改项目', 'a043e829-9c2a-4b92-9c42-36affd2e53c7', '0ed44f90-0c3a-11e4-9300-001c42328937', 'XM-2014-0107', '令人惊喜的项目', 100000.0000, 0.0000, 0.0000, 3.6000, 415080.0000, 0.0000, 3600.0000, 415080.0000, 0.0000, 2000.0000, 0.0000, 3000.0000, 0.0273, 0.0000, 0.0000, 0.0000, 3000.0000, 3.0000, 3400.0000, 0.0000, 3000.0000, 3000.0000, 0.0000, 0.0000, '', 1, '2014-08-14 08:27:37', 45, 't_project', 15300.0000),
	('eb549da6-8830-4319-b01c-ba29011481a6', '2014-08-14 08:27:37', '修改项目', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 0.0000, 1400.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 1, '2014-08-14 08:27:37', 46, 't_project', 0.0000),
	('f42f5790-f52b-40b6-936f-48ca2622f431', '2014-08-14 08:28:20', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 500.0000, 1900.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 08:28:20', 47, 't_payment', 0.0000),
	('abc5898a-0871-4928-9ddc-8dbe53c7a0b1', '2014-08-14 08:28:51', '新增的付款，', 'eb549da6-8830-4319-b01c-ba29011481a6', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'XM-2014-0110', '今天的项目', 500000.0000, 0.0000, 0.0000, 3.6000, 18000.0000, 0.0000, 18000.0000, 15800.0000, 0.0000, 0.0000, 0.0000, 126300.0000, 0.2526, 0.0000, 500.0000, 650.0000, 2550.0000, 3.4000, 17000.0000, 0.0000, 800.0000, -800.0000, 0.0000, 0.0000, '', 0, '2014-08-14 08:28:50', 48, 't_payment', 0.0000);
/*!40000 ALTER TABLE `t_project_summary` ENABLE KEYS */;


-- 导出  表 hplydb.t_sys_authorization 结构
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

-- 正在导出表  hplydb.t_sys_authorization 的数据：~72 rows (大约)
/*!40000 ALTER TABLE `t_sys_authorization` DISABLE KEYS */;
REPLACE INTO `t_sys_authorization` (`id`, `resource_id`, `user_id`, `create_time`, `create_user`, `version`) VALUES
	('0099711a-b569-4b0c-9210-6cc29a6689fd', '5bd90b40-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:02', '', 0),
	('013156b6-81fd-4647-8758-67f7b4f277f4', '5bdddcff-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:33', '', 0),
	('0200bc70-a5a4-4883-b182-62a05f17223c', '5be453c4-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('027fec0c-4c98-49ce-81db-659641e11139', '5bdec453-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:23', '', 0),
	('02d4cd6d-4813-42c3-a9ad-46fe2e66ee4f', '5be22822-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:40', '', 0),
	('040d78e4-f756-4c50-8c7b-77bd92535759', '5be49301-1a00-11e4-a01a-001c42328937', 'a5bd3318-0c3a-11e4-9300-001c42328937', '2014-08-02 14:33:02', '', 0),
	('05f2c3ef-f5ca-4b2c-94ac-0d78946a0e63', '5be38674-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:41', '', 0),
	('0d254e42-5b63-4c0b-8e1d-a6d253e9936d', '5bdf11d3-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:34', '', 0),
	('0e0064f2-1631-4555-8db4-8474a1892219', '5bdd3b82-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:15', '', 0),
	('0e493146-6514-42e7-a03d-1c8fe75acfda', '5be4f0d5-1a00-11e4-a01a-001c42328937', 'a5bd3318-0c3a-11e4-9300-001c42328937', '2014-08-02 14:33:04', '', 0),
	('12dd3b3a-75b5-4dff-8e06-9dd182032900', '5bd84fbf-1a00-11e4-a01a-001c42328937', '51a72f56-c138-40d0-959c-00ad78fdada0', '2014-08-03 16:46:49', '', 0),
	('15bd1448-a085-4fba-bb80-0b1fb47b6147', '5be095d6-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:27', '', 0),
	('1740066b-9d6b-4acd-8515-a1f867d0fae3', 'a5644308-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:47', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('1c110f91-c266-46e9-9cb6-4623a11f12d9', '5bde85c0-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:22', '', 0),
	('2090d8e1-7a0e-4072-83a9-a92f6cad098e', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:31', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('245fbe0a-a31a-47b7-989a-b47c1f803a91', '5be5788b-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:20', '', 0),
	('25d121f5-742d-4337-be93-dfde97643ee7', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'a5bff42c-0c3a-11e4-9300-001c42328937', '2014-08-02 14:50:28', '', 0),
	('262fd6e7-411a-44f0-92f7-94f3dc81c030', '5be5b341-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:27', '', 0),
	('27080a20-d1f5-4a96-b7cf-6b11368d756c', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:22', '', 0),
	('288d214f-ca38-4258-b838-0ddc1e15a617', '5bd8b940-1a00-11e4-a01a-001c42328937', 'a5bff42c-0c3a-11e4-9300-001c42328937', '2014-08-02 14:50:26', '', 0),
	('2cff95d0-3c1a-44b7-8520-e6fc3330bda7', '5bd9e43d-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 07:40:58', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('384a3518-7dd5-4d75-8e82-67049533bc56', '5be60849-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:28', '', 0),
	('397c9161-737b-4cc3-9122-7f6a0662cc87', '5be49301-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:32', '', 0),
	('3bc7ac45-e1a4-43bb-a1e9-235195da937e', '5bd8b940-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:01', '', 0),
	('3f95b657-842f-4aaa-b07c-fff13dd7ac2c', '5bd952a7-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:40', '', 0),
	('445fc4a8-dbee-475f-ad9f-4041f86963ba', '5bdbd8c0-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:23:12', '', 0),
	('46beb293-8425-4eee-be59-a68b98598fe3', '5be26834-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:21', '', 0),
	('4bf4c07f-1746-4d50-b8e8-cf4b62c6b1f0', 'a5644308-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:33', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('518cb82a-0a70-4e85-90d4-206aa4fcfb51', '5bd90b40-1a00-11e4-a01a-001c42328937', 'a5bff42c-0c3a-11e4-9300-001c42328937', '2014-08-02 14:50:30', '', 0),
	('5382f819-f210-4db6-9b5e-8177ba3e09c1', '5be01fb5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:35', '', 0),
	('558ef2a7-d81f-4580-abd5-2d6a921f4f82', '5bd99809-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:50', '', 0),
	('574564d5-cd03-429c-8f39-028dfe532234', '5bdc8dba-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:23:10', '', 0),
	('5c1e2360-4f2e-4d42-869e-6fa026df1c33', '5bde20f9-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:21', '', 0),
	('5cf2a840-f0ed-4025-9b85-871cdea7824f', 'a5644308-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:23', '', 0),
	('5daaec66-c6fb-4534-b3ed-5159693ab346', '7c37d393-276a-4551-9c2b-ab9a7ab4704d', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:05:15', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('5e79f7d1-f837-4019-84d7-60ee7a719d56', '5bd90b40-1a00-11e4-a01a-001c42328937', '51a72f56-c138-40d0-959c-00ad78fdada0', '2014-08-03 16:46:51', '', 0),
	('60885c63-b880-47eb-85ec-797d9adfb92f', '5bdd726f-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:16', '', 0),
	('696b318a-534e-4f80-a953-de9265fb61c3', '5bdc1299-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 20:44:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('71d8cd18-24fa-40b4-8e9a-3a7d1728a7b8', '5be49301-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:37', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('7217d903-df67-4e87-b9fc-15c13c2b6041', '5bdb83c8-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:30', '', 0),
	('73b27d8b-caab-4fab-a4ac-81d2acab778b', '5be2abf8-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:38', '', 0),
	('7636120f-1fd8-4886-98f0-70347894fc5f', '5be055a9-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:27', '', 0),
	('7824abf1-9e0b-40b0-90d1-a6c6304daf65', '5bdcfa83-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:31', '', 0),
	('83f71646-331e-4a70-856c-d2f3e69263f4', '5be0efa3-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:28', '', 0),
	('844bdc36-3857-4315-8a59-c8e83d55fa8c', '5bdd3b82-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:44', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('866517d0-9d5e-460f-b2e4-8ad8985e3a7c', '03772c78-a497-40c8-9338-07a835e3f2c1', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 21:53:28', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('92dffb86-245f-4f8e-8526-1b8309ca9646', '5bd8b940-1a00-11e4-a01a-001c42328937', '51a72f56-c138-40d0-959c-00ad78fdada0', '2014-08-03 16:46:50', '', 0),
	('9389af73-0c91-4460-acb9-9f8256348c94', '5be536f5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:35', '', 0),
	('9524ae72-9c21-4bdf-9b66-542e2f6a07fa', '5be38674-1a00-11e4-a01a-001c42328937', 'a5bd3318-0c3a-11e4-9300-001c42328937', '2014-08-02 14:32:43', '', 0),
	('97d64992-2aaa-4d20-bd31-ea778c6b506a', '5be131bc-1a00-11e4-a01a-001c42328937', 'a5bd3318-0c3a-11e4-9300-001c42328937', '2014-08-02 14:39:03', '', 0),
	('9c16de2d-e8db-4b07-881c-7d53b7f8e5f6', '5bdfb2b0-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:24', '', 0),
	('a46a1d6f-9f19-4244-8a58-dc5d3bc77830', '5be4f0d5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:34', '', 0),
	('ab35c44c-1900-4f48-9894-59b52c8eb80a', 'a5644308-1a00-11e4-a01a-001c42328939', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-06 23:34:22', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('ad75bb79-8014-4a2f-bf00-cd8122345b8c', '5be33246-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:40', '', 0),
	('ae2e69e9-624e-4074-9235-8e8f47613b12', '5be453c4-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:20', '', 0),
	('aefdf263-5644-4ea5-b19a-80741a53eb9b', '5bda33d9-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:03', '', 0),
	('b2b7eb48-c766-4476-8cb8-97a7d884cfca', '5bdb83c8-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:40', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('c1391396-28d7-40ab-875d-30e840c1c1c7', '5be3c313-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:42', '', 0),
	('ca357851-2067-47d6-baee-7905f566607e', '5bdbd8c0-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:41', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('d077815c-63d5-4e46-95ba-d655f90c3c30', '5bda8270-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:23:15', '', 0),
	('d4ac4785-44b7-4f0e-807a-4b87339e91dd', '5bdf4a76-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:24', '', 0),
	('d653d6d1-fa91-4c13-820b-417788715da6', '5bd90b40-1a00-11e4-a01a-001c42328937', 'bcf22909-751a-4203-9987-03cd5d80889e', '2014-08-06 21:11:30', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('d9338004-5def-410c-b13e-ba7da2050f46', '5be131bc-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:37', '', 0),
	('da1bf3c3-8726-424d-ac54-f72f1e591372', '5be1d6d8-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:41', '', 0),
	('ddd302fa-d545-4384-b956-8e91019fbef4', '5be1956c-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:11:42', '', 0),
	('e06548bb-a20b-4763-963f-ff46138f67c3', '5be2e82d-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:39', '', 0),
	('e0fb6621-1f3a-4de0-b182-1be7a2078b4a', '5bd84fbf-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e4623136-e7f8-409d-b6ee-e62fd6b023bb', '5bdfead0-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:25', '', 0),
	('e6a97c8f-27c8-4303-8d27-c03b1526f961', '5bdcfa83-1a00-11e4-a01a-001c42328937', 'a5c10025-0c3a-11e4-9300-001c42328937', '2014-08-06 22:22:43', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('e9b34ee1-7a3e-4d3e-b703-ba9ec91d9ca2', '5be64de5-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 21:54:02', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0),
	('eb892a99-7cec-4146-a093-004621fc007b', '5bdda8b1-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:22:16', '', 0),
	('f132ada3-2134-4612-86e0-248e7c4af589', '5be3fdc9-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-02 13:10:43', '', 0),
	('fb6aae17-50d1-4dfe-a83a-bc4a123cc475', '5bdcc171-1a00-11e4-a01a-001c42328937', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 20:44:45', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', 0);
/*!40000 ALTER TABLE `t_sys_authorization` ENABLE KEYS */;


-- 导出  表 hplydb.t_sys_organization 结构
CREATE TABLE IF NOT EXISTS `t_sys_organization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11+A_组织机构';

-- 正在导出表  hplydb.t_sys_organization 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `t_sys_organization` DISABLE KEYS */;
REPLACE INTO `t_sys_organization` (`id`, `organization_name`, `create_time`, `description`, `version`) VALUES
	('0ed38235-0c3a-11e4-9300-001c42328937', '事业部', '2014-07-16 00:07:02', NULL, 0),
	('0ed44f90-0c3a-11e4-9300-001c42328937', '项目部', '2014-07-16 00:07:02', NULL, 0),
	('0ed4d3a1-0c3a-11e4-9300-001c42328937', '财务部', '2014-07-16 00:07:02', NULL, 0);
/*!40000 ALTER TABLE `t_sys_organization` ENABLE KEYS */;


-- 导出  表 hplydb.t_sys_parameter 结构
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

-- 正在导出表  hplydb.t_sys_parameter 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `t_sys_parameter` DISABLE KEYS */;
REPLACE INTO `t_sys_parameter` (`id`, `en_name`, `cn_name`, `param_value`, `default_value`, `is_inner`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`) VALUES
	('0b8f1d89-8655-463a-97be-b8b033d29a8c', 'collections_code', '收款凭证号', '18', 'SK', b'0', '2014-08-08 23:47:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 07:43:22', 'mysql.get_next_code', 'SK-2014-0001', 4),
	('12bad01d-9282-44a1-9186-04f7ee7a0078', 'chop_code', '用章申请编号', '7', 'YZ', b'0', '2014-08-05 23:12:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 22:40:18', 'FUNCTION.get_next_code', 'YZ-2014-0001', 4),
	('1fdae036-8ba5-4ad5-ad43-e68e38eda5e0', 'arrears_code', '往来欠款凭证号', '8', 'WL', b'0', '2014-08-08 23:52:38', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-12 22:33:13', 'mysql.get_next_code', 'WL-2014-0001', 0),
	('22085fc7-5804-4cbb-8940-afeda443a20f', 'pay_types', '支付方式', '现金/银行转帐/汇款/支票/汇票/其他 ', '现金/银行转帐/汇款/支票/汇票/其他 ', b'0', '2014-08-08 23:34:10', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:46', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '收款/付款/往来欠款中使用', 2),
	('2b0dce39-561a-42a8-835c-f488a6a63945', 'payment_code', '付款凭证号', '38', 'FK', b'0', '2014-08-08 23:51:57', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-14 08:31:49', 'mysql.get_next_code', 'FK-2014-0001', 0),
	('2f0a2f68-097f-11e4-a5cb-080027dbb782', 'appname', '应用名称', '工程项目核算系统', '工程项目核算系统', b'1', '2014-07-12 12:55:06', NULL, '2014-07-12 12:55:06', NULL, NULL, 0),
	('454bc450-6bd1-434b-af64-2f7b402aaccb', 'project_code', '项目编号', '110', 'XM', b'0', '2014-08-05 23:07:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 22:31:06', 'FUNCTION.get_next_code', 'XM-2014-0001', 10),
	('4fd3df1e-145a-4d39-8164-679f555961fb', 'default_tax_rate', '默认税率', '3.4', '3.4', b'0', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:36:26', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('4fe8fe7f-097f-11e4-a5cb-080027dbb782', 'appversion', '应用版本号', 'V1.0', 'V1.0', b'1', '2014-07-12 12:56:02', NULL, '2014-07-12 12:56:02', NULL, NULL, 0),
	('5f9ddb3d-db23-4804-b5c8-bcee97364626', 'default_manager_rate', '默认管理费率', '3.6', '3.6', b'0', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-09 21:35:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('6e053860-097f-11e4-a5cb-080027dbb782', 'apppublishtime', '应用发布时间', '2014年8月12日', '2014年8月12日', b'1', '2014-07-12 12:56:52', NULL, '2014-08-05 22:45:35', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 2),
	('7b7cd4d0-acc2-4d0d-9a2b-d07659eef930', 'billing_types', '发票分类', '材料/劳务/其他', '材料/劳务/其他', b'0', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:38:39', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 0),
	('93fa58ac-188c-4b08-8afc-cbf0ce3b18bd', 'cc_code', '补充协议编号', '31', 'BC', b'0', '2014-08-05 23:09:18', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-11 22:22:52', 'FUNCTION.get_next_code', 'BC-2014-0001', 4),
	('d8186e7b-ecf4-4e54-a18c-986513d78c30', 'project_status', '项目状态', '进行中/已暂停/已结算', '进行中/已暂停/已结算', NULL, '2014-08-05 22:00:27', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-05 22:14:08', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 1),
	('ea2dc602-0c58-40d6-b7f7-cbc2b33e6a67', 'source_of', '款项来源', '工程款/税金/管理费/利息/其他', '工程款/税金/管理费/利息/其他', b'0', '2014-08-08 23:35:49', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '2014-08-08 23:36:21', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '在收款情况中', 1);
/*!40000 ALTER TABLE `t_sys_parameter` ENABLE KEYS */;


-- 导出  表 hplydb.t_sys_resource 结构
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

-- 正在导出表  hplydb.t_sys_resource 的数据：~38 rows (大约)
/*!40000 ALTER TABLE `t_sys_resource` DISABLE KEYS */;
REPLACE INTO `t_sys_resource` (`id`, `res_code`, `res_name`, `icon`, `res_url`, `res_type`, `order_by`, `parent_id`, `enabled`, `description`, `version`, `allow_access_uri`) VALUES
	('03772c78-a497-40c8-9338-07a835e3f2c1', NULL, '资源管理', NULL, '/sysresource', 'navigation', 495, '5be5788b-1a00-11e4-a01a-001c42328937', NULL, NULL, 0, NULL),
	('5bd84fbf-1a00-11e4-a01a-001c42328937', '``', '财务核算', NULL, '', 'navigation', 10, 'a5644308-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bd8b940-1a00-11e4-a01a-001c42328937', '`projectsummary`', '项目汇总表', NULL, '/projectsummary', 'navigation', 20, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '允许查看多项目汇总表。', 0, NULL),
	('5bd90b40-1a00-11e4-a01a-001c42328937', '`project`', '合同项目信息', NULL, '/project', 'navigation', 30, '5bd84fbf-1a00-11e4-a01a-001c42328937', NULL, '', 0, NULL),
	('5bd952a7-1a00-11e4-a01a-001c42328937', '`project_create`', '新建', '', '/project/create', 'action', 40, '5bd90b40-1a00-11e4-a01a-001c42328937', NULL, '仅允许新建操作，不能对数据进行修改和删除。', 1, NULL),
	('5bd99809-1a00-11e4-a01a-001c42328937', '`project_modify1`', '修改应收税金', '', '/project/modify', 'action', 50, '5bd90b40-1a00-11e4-a01a-001c42328937', NULL, '允许修改全部数据，包括其他人添加的数据，以及历史数据。', 1, NULL),
	('5bd9e43d-1a00-11e4-a01a-001c42328937', '`project_modify2`', '修改应收管理费', '', '/project/delete', 'action', 60, '5bd90b40-1a00-11e4-a01a-001c42328937', NULL, '允许删除数据。', 1, NULL),
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
	('7c37d393-276a-4551-9c2b-ab9a7ab4704d', '`payment-item`', '付款科目设置', '付款科目维护', '/paymentitem', 'action', NULL, '5bdf11d3-1a00-11e4-a01a-001c42328937', NULL, '', 1, NULL),
	('a5644308-1a00-11e4-a01a-001c42328937', '', '系统功能结构', '', '/', 'navigation', NULL, 'root', NULL, '整个系统的根地址', 1, NULL);
/*!40000 ALTER TABLE `t_sys_resource` ENABLE KEYS */;


-- 导出  表 hplydb.t_sys_user 结构
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

-- 正在导出表  hplydb.t_sys_user 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `t_sys_user` DISABLE KEYS */;
REPLACE INTO `t_sys_user` (`id`, `login_name`, `real_name`, `organization_id`, `password`, `last_login_ip`, `last_login_time`, `fails`, `logined`, `position`, `enabled`, `order_by`, `create_time`, `create_user`, `update_time`, `update_user`, `description`, `version`, `must_change_password`) VALUES
	('96ef9340-e169-4024-b7e5-ca7070b367fa', 'cqiyi', '成七一', '0ed44f90-0c3a-11e4-9300-001c42328937', '8ef611ce3ae26cb0ec0371bb96df1e6db79b817f4b681a478f3c52295b3294a0', '', NULL, 0, 0, '系统管理员', b'1', 20, '2014-08-03 10:18:48', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 9, b'0'),
	('a5bd3318-0c3a-11e4-9300-001c42328937', 'dujuan', '杜鹃', '0ed4d3a1-0c3a-11e4-9300-001c42328937', '2a60f4ff68c7e7704cc732eac8b7bece2a1ec40530d7ce5ee2e3afb157a3825d', '', NULL, 0, 0, '财务总监', b'1', 1, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 16, b'0'),
	('a5bf7c7c-0c3a-11e4-9300-001c42328937', 'zhangmeng', '张梦', '0ed4d3a1-0c3a-11e4-9300-001c42328937', '2294ae17936ae620d46f9936f0a6896fe5375eb8b61059953edb32fb70b6313f', '10.211.55.3', '2014-08-14 08:27:37', 0, 113, '财务经理，系统管理员', b'1', 2, '2014-07-16 00:11:15', '', '2014-08-14 08:27:36', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 130, b'0'),
	('a5bff42c-0c3a-11e4-9300-001c42328937', 'liuyuecui', '刘月翠', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'f5ad14ac63bb1db129523082f16417452bda2a9ef4c0b3e77a7940bbe94dedc0', '', NULL, 0, 0, '财务核算员', b'1', 3, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 5, b'0'),
	('a5c05eb4-0c3a-11e4-9300-001c42328937', 'wangshuyan', '王书岩', '0ed4d3a1-0c3a-11e4-9300-001c42328937', 'c91238d1efd1aa58ff5dd624cee17b2b6b39ee310962c9fbada78a84fe31d0aa', '', NULL, 0, 0, '盖章经办人', b'1', 4, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 5, b'0'),
	('a5c0b286-0c3a-11e4-9300-001c42328937', 'yangdeyou', '杨德友', '0ed44f90-0c3a-11e4-9300-001c42328937', NULL, NULL, NULL, NULL, NULL, '项目部负责人', b'1', 5, '2014-07-16 00:11:15', '', '2014-08-06 21:58:12', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 6, b'1'),
	('a5c10025-0c3a-11e4-9300-001c42328937', 'wangyong', '王勇', '0ed44f90-0c3a-11e4-9300-001c42328937', 'a69dbd0d57a553412549024460449b002668fdf1c4213d2ea0efa0ad115323c6', '10.211.55.3', '2014-08-06 22:23:35', 0, 3, '项目部操作员', b'1', 6, '2014-07-16 00:11:15', '', '2014-08-06 22:23:35', 'a5c10025-0c3a-11e4-9300-001c42328937', '', 13, b'0'),
	('a5c14c0b-0c3a-11e4-9300-001c42328937', 'xiadongyan', '夏冬燕', '0ed44f90-0c3a-11e4-9300-001c42328937', 'cc7363aa7310e38221ddc5721d6d49b622974e8d73414e34c28c515e3c1c6044', NULL, NULL, NULL, NULL, '项目部操作员', b'1', 7, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 6, NULL),
	('a5c18a31-0c3a-11e4-9300-001c42328937', 'zhangyan', '张岩', '0ed44f90-0c3a-11e4-9300-001c42328937', '66b4ff4a8084040e2d20042903317c84f08eabcc33456f7bb1ce761769b0907b', NULL, NULL, 0, 0, '项目部操作员', b'1', 8, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 7, b'0'),
	('a5c1c216-0c3a-11e4-9300-001c42328937', 'wangpeng', '王鹏', '0ed44f90-0c3a-11e4-9300-001c42328937', '21aed91a873051e3f3eabee5f21e4f385d4947c0ba3a9d42ed70f997d7afcbaf', NULL, NULL, NULL, NULL, '项目部操作员', b'1', 9, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 7, NULL),
	('a5c2073b-0c3a-11e4-9300-001c42328937', 'wangyouqing', '王有青', '0ed38235-0c3a-11e4-9300-001c42328937', 'ba14a06504db07a2b86ba239e2149d26b71324da2d81afbcae5faecc1c17a9ac', '', NULL, 0, 0, '事业部负责人', b'1', 10, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 5, b'0'),
	('a5c25820-0c3a-11e4-9300-001c42328937', 'zhoukai', '周楷', '0ed38235-0c3a-11e4-9300-001c42328937', '7995655193a4870db47b22af2fc9ff1524dccb851f453867032fbb7620b0d50d', '', NULL, 0, 0, '项目部操作员', b'1', 11, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 5, b'0'),
	('a5c299fc-0c3a-11e4-9300-001c42328937', 'wangjiaxin', '王佳鑫', '0ed38235-0c3a-11e4-9300-001c42328937', '355270b9d9cf0dc8b4f89b2b176d6445191b8032153643e83d45f4db5c240fe7', '', NULL, 0, 0, '项目部操作员', b'1', 12, '2014-07-16 00:11:15', '', '2014-08-04 21:32:34', 'a5bf7c7c-0c3a-11e4-9300-001c42328937', '', 5, b'0');
/*!40000 ALTER TABLE `t_sys_user` ENABLE KEYS */;


-- 导出  触发器 hplydb.tr_arrears_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_arrears_insert` AFTER INSERT ON `t_arrears` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_collections_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_collections_insert` AFTER INSERT ON `t_collections` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_contract_change_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_contract_change_insert` AFTER INSERT ON `t_contract_change` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_customer_billing_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_customer_billing_insert` AFTER INSERT ON `t_customer_billing` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_party_billing_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_party_billing_insert` AFTER UPDATE ON `t_party_billing` FOR EACH ROW BEGIN IF new.step_status = 1 AND old.step_status != 1 THEN 	
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
		 new.`tax_rate` * (new.amount + party_billing_total_amount) AS `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 new.`tax_rate` * (new.amount + party_billing_total_amount) - tax_total_amount AS `tax_owe_amount`,
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


-- 导出  触发器 hplydb.tr_payment_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_payment_insert` AFTER INSERT ON `t_payment` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_profile_insert 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_profile_insert` AFTER INSERT ON `t_profile` FOR EACH ROW BEGIN
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


-- 导出  触发器 hplydb.tr_project_update 结构
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_project_update` AFTER UPDATE ON `t_project` FOR EACH ROW BEGIN 	
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
		 /*备注*/ CONCAT('修改项目', if(new.management_plan_amount != old.management_plan_amount, '应收管理费', ''), if(new.tax_plan_amount != old.tax_plan_amount, '应缴税金', '')),
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
		 /*直接修改了应收管理费总额*/ new.management_plan_amount as `management_total_amount`,
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
