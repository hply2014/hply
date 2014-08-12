-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.19 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 hplydb 的数据库结构
DROP DATABASE IF EXISTS `hplydb`;
CREATE DATABASE IF NOT EXISTS `hplydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hplydb`;


-- 导出  函数 hplydb.get_next_code 结构
DROP FUNCTION IF EXISTS `get_next_code`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_code`(`arg0` varchar(20)) RETURNS varchar(100) CHARSET utf8
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
DROP FUNCTION IF EXISTS `refresh_all_status`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `refresh_all_status`() RETURNS int(11)
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
DROP TABLE IF EXISTS `t_arrears`;
CREATE TABLE IF NOT EXISTS `t_arrears` (
  `id` char(36) NOT NULL COMMENT 'ID',
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
  `arrears_code` varchar(50) DEFAULT NULL COMMENT '凭证号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `arrears_code_UNIQUE` (`arrears_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='07_往来欠款';

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_chop 结构
DROP TABLE IF EXISTS `t_chop`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_collections 结构
DROP TABLE IF EXISTS `t_collections`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_contract_change 结构
DROP TABLE IF EXISTS `t_contract_change`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_customer_billing 结构
DROP TABLE IF EXISTS `t_customer_billing`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_field_types 结构
DROP TABLE IF EXISTS `t_field_types`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_information 结构
DROP TABLE IF EXISTS `t_information`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_party_billing 结构
DROP TABLE IF EXISTS `t_party_billing`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_payment 结构
DROP TABLE IF EXISTS `t_payment`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_payment_item 结构
DROP TABLE IF EXISTS `t_payment_item`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_profile 结构
DROP TABLE IF EXISTS `t_profile`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_project 结构
DROP TABLE IF EXISTS `t_project`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_project_summary 结构
DROP TABLE IF EXISTS `t_project_summary`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='00_多项目汇总';

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_sys_authorization 结构
DROP TABLE IF EXISTS `t_sys_authorization`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_sys_organization 结构
DROP TABLE IF EXISTS `t_sys_organization`;
CREATE TABLE IF NOT EXISTS `t_sys_organization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11+A_组织机构';

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_sys_parameter 结构
DROP TABLE IF EXISTS `t_sys_parameter`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_sys_resource 结构
DROP TABLE IF EXISTS `t_sys_resource`;
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

-- 数据导出被取消选择。


-- 导出  表 hplydb.t_sys_user 结构
DROP TABLE IF EXISTS `t_sys_user`;
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

-- 数据导出被取消选择。


-- 导出  触发器 hplydb.tr_arrears_insert 结构
DROP TRIGGER IF EXISTS `tr_arrears_insert`;
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
DROP TRIGGER IF EXISTS `tr_collections_insert`;
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
DROP TRIGGER IF EXISTS `tr_contract_change_insert`;
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
DROP TRIGGER IF EXISTS `tr_customer_billing_insert`;
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
DROP TRIGGER IF EXISTS `tr_party_billing_insert`;
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
DROP TRIGGER IF EXISTS `tr_payment_insert`;
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
DROP TRIGGER IF EXISTS `tr_profile_insert`;
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
DROP TRIGGER IF EXISTS `tr_project_update`;
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
