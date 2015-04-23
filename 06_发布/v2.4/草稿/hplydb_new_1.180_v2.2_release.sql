-- --------------------------------------------------------
-- Host:                         192.168.1.180
-- Server version:               5.6.19 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
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
  `amount` decimal(20,4) DEFAULT '0.0000' COMMENT '金额,出为负数，入为正数',
  `offset_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '已还本金，由amount同步来的',
  `interest_amount` decimal(20,4) DEFAULT '0.0000' COMMENT '应还的利息总额，没还清每天累计',
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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `arrears_code_UNIQUE` (`arrears_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='07_往来欠款';

-- Data exporting was unselected.


-- Dumping structure for table hplydb_new.t_arrears_interest
CREATE TABLE IF NOT EXISTS `t_arrears_interest` (
  `id` char(36) DEFAULT NULL COMMENT 'uuid序号',
  `serial_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `arrears_id` char(36) DEFAULT NULL,
  `project_id` char(36) DEFAULT NULL COMMENT '项目ID',
  `trice` date DEFAULT NULL COMMENT '计息时间',
  `amount` decimal(20,4) DEFAULT NULL COMMENT '计息基数',
  `offset_amount` decimal(20,4) DEFAULT NULL COMMENT '已还的利息，拆分到天的',
  `interest_amount` decimal(20,4) DEFAULT NULL COMMENT '当天的利息',
  `version` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(500) DEFAULT NULL COMMENT '摘要',
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='往来欠款的利息计算明细';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='09_盖章管理';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='05_收款情况';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='02_合同补充协议';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='04_客户开票情况';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='所有数据类型的测试样表';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='10_信息登记';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='03_甲方开票情况';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06_付款情况';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06+A_付款科目';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='08_型材';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_code` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='01_合同项目信息';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `project_code` (`project_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据初始化表';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`serial_id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='00_多项目汇总';

-- Data exporting was unselected.


-- Dumping structure for table hplydb_new.t_sys_authorization
CREATE TABLE IF NOT EXISTS `t_sys_authorization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `resource_id` char(36) DEFAULT NULL COMMENT '资源ID',
  `user_id` char(36) DEFAULT NULL COMMENT '用户ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` char(36) DEFAULT NULL COMMENT '创建用户',
  `version` int(11) NOT NULL DEFAULT '0',
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='13_授权关系';

-- Data exporting was unselected.


-- Dumping structure for table hplydb_new.t_sys_exec_log
CREATE TABLE IF NOT EXISTS `t_sys_exec_log` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `exec_no` varchar(50) DEFAULT NULL COMMENT '每次在同一批次中执行',
  `proc_name` varchar(200) DEFAULT NULL,
  `trice` datetime DEFAULT NULL,
  `exec_log` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`serial_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储过程执行日志表';

-- Data exporting was unselected.


-- Dumping structure for table hplydb_new.t_sys_organization
CREATE TABLE IF NOT EXISTS `t_sys_organization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `version` int(11) NOT NULL DEFAULT '0',
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11+A_组织机构';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_enname` (`en_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='14_系统参数';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`),
  UNIQUE KEY `res_code` (`res_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12_系统资源';

-- Data exporting was unselected.


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
  `field_01` varchar(200) DEFAULT NULL COMMENT '预留字段01',
  `field_02` varchar(200) DEFAULT NULL COMMENT '预留字段02',
  `field_03` varchar(200) DEFAULT NULL COMMENT '预留字段03',
  `field_04` varchar(200) DEFAULT NULL COMMENT '预留字段04',
  `field_05` varchar(200) DEFAULT NULL COMMENT '预留字段05',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_loginName` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11_系统用户';

-- Data exporting was unselected.


-- Dumping structure for procedure hplydb_new.proc_calc_interest_indate
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_indate`(IN `_trice` DATETIME)
proc:BEGIN
	
	declare _exec_no varchar(50);
	
	declare _id varchar(50);
	declare _project_id varchar(50);
	declare _amount decimal(20, 4);
	declare _offset_amount decimal(20, 4);
	declare _interest_amount decimal(20, 4);
	declare _interest_rate decimal(20, 4);
   declare _month_days int; 
	
	declare eof bit default 0;
	
	
		
		
		
	declare cur_for_arrears cursor for 
	  select id, project_id, amount, offset_amount, interest_amount, interest_rate
			from t_arrears where project_id is not null and trice < date(_trice) and (amount + offset_amount) * interest_rate < 0;
	  		
	declare continue handler for not found set eof = 1;  
	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_calc_interest_indate', _trice, '开始执行');

  
	
  if day(_trice) > 20 then
      set _month_days = day(last_day(_trice));
    else
      set _month_days = day(last_day(_trice + interval - 1 month));
  end if;
  	
	open cur_for_arrears;
  
	top0: loop
    	fetch cur_for_arrears into _id, _project_id, _amount, _offset_amount, _interest_amount, _interest_rate;
    	if eof = 1 then
      	
      	leave top0;
    	end if;
    	
    	if (select count(*) from t_arrears_interest where arrears_id = _id and trice = date(_trice)) > 0 then
    		
    		iterate top0;
    	end if;
    	
    	
    	insert into t_arrears_interest(id, arrears_id, project_id, trice, amount, offset_amount, interest_amount, description) 
		 values (uuid(), _id, _project_id, 
		 				 date(_trice), 
		 				 _amount + _offset_amount,
		 				 0,
		 				 (_amount + _offset_amount) * _interest_rate / _month_days / 100,
             concat('(', _amount, ' + ', _offset_amount, ') * ', _interest_rate, '% / ', _month_days)
		 );
		 
		 update t_arrears set interest_amount = interest_amount + (_amount + _offset_amount) * _interest_rate / _month_days / 100 where id = _id;
	
	end loop top0;
   
	close cur_for_arrears;
	
	call proc_exec_log(_exec_no, 'proc_calc_interest_indate', _trice, '执行完成');

END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_calc_interest_main
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_main`()
    COMMENT '计算所有工程往来欠款的利息，在proc_update_all_status中调用，即在系统每次登录时执行'
BEGIN

	declare _last_trice datetime;
  	declare _exec_no varchar(50);
	declare _count int default 0;
  	
	
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_calc_interest_main';
	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_calc_interest_main', now(), '开始执行');
	
	
	set _last_trice = if(_last_trice is null, now(), date_add(_last_trice, interval + 1 day));
	
	while date(_last_trice) <= curdate() do
		
		call proc_calc_interest_indate(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 day);
		set _count = _count + 1;
	end while;
	
	call proc_exec_log(_exec_no, 'proc_calc_interest_main', now(), concat('执行完成，调用了proc_calc_interest_indate：', _count, '次。'));
	
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
	truncate table t_sys_exec_log;
	
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
	
	declare eof bit default 0; 
  	declare _exec_no varchar(50);
  	
  	declare _project_id varchar(50);
  	declare _id varchar(50);
	  	
	declare _trice date; 
	declare _description varchar(500); 
	declare _project_code VARCHAR(200); 
	declare _project_name VARCHAR(200); 
	declare _organization_name VARCHAR(200); 
	declare _party_name VARCHAR(200); 
	declare _party_address VARCHAR(200); 
	declare _manager VARCHAR(200); 
	declare _corperation VARCHAR(200); 
	declare _legal_assignee VARCHAR(200); 
	declare _is_withholding_offsite VARCHAR(20); 
	declare _contract_code VARCHAR(20); 
	declare _contract_amount DECIMAL(20,4); 
	declare _change_amount DECIMAL(20,4); 
	declare _change_total_amount DECIMAL(20,4); 
	declare _settlement_amount DECIMAL(20,4); 
	declare _duty_paid_code VARCHAR(200); 
	declare _duty_paid_time DATE; 
	declare _duty_paid_amount DECIMAL(20,4); 
	declare _capital_occupied VARCHAR(20); 
	declare _project_status VARCHAR(20); 
	declare _management_rate DECIMAL(20,4); 
	declare _management_plan_amount DECIMAL(20,4); 
	declare _management_real_amount DECIMAL(20,4); 
	declare _management_total_amount DECIMAL(20,4); 
	declare _management_owe_amount DECIMAL(20,4); 
	declare _party_billing_amount DECIMAL(20,4); 
	declare _party_billing_total_amount DECIMAL(20,4); 
	declare _collections_amount DECIMAL(20,4); 
	declare _collections_total_amount DECIMAL(20,4); 
	declare _collections_rate DECIMAL(20,4); 
	declare _customer_billing_amount DECIMAL(20,4); 
	declare _customer_billing_total_amount DECIMAL(20,4); 
	declare _payment_amount DECIMAL(20,4); 
	declare _payment_amount_clv DECIMAL(20,4); 
	declare _payment_amount_cliang DECIMAL(20,4); 
	declare _payment_amount_zdai DECIMAL(20,4); 
	declare _payment_total_amount DECIMAL(20,4); 
	declare _tax_rate DECIMAL(20,4); 
	declare _tax_plan_amount DECIMAL(20,4); 
	declare _tax_real_amount DECIMAL(20,4); 
	declare _tax_total_amount DECIMAL(20,4); 
	declare _tax_owe_amount DECIMAL(20,4); 
	declare _arrears_amount DECIMAL(20,4); 
	declare _expected_value DECIMAL(20,4); 
	declare _profile_point VARCHAR(20); 

  
  	
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
		  from t_project_init where project_code not in (select project_code from t_project);		
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
      	
      	leave top2;
    	end if;
    	
    	set _trice = ifnull(_trice, current_date());
    	
    	set _project_id = uuid();
    	
    	
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
										trice,
										description
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
										ifnull(_contract_amount, 0),
										_settlement_amount,
										_duty_paid_code,
										_duty_paid_time,
										_duty_paid_amount,
										if(_capital_occupied = '是', 1, 0),
										_project_status,
										_management_rate,
										 _management_rate * _contract_amount /100,
										_tax_rate,
										_tax_plan_amount,
										_trice,
										description
						);
						
			if ifnull(_change_amount, 0) > 0 then
				
				insert into t_contract_change(id, project_id, management_rate, change_amount, trice) 
									values(uuid(), _project_id, _management_rate, _change_amount, _trice);
			end if;
			
			
			if ifnull(_management_real_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'),  '管理费', '现金', _management_real_amount, _trice);
			end if;
			
			
			
			if ifnull(_party_billing_amount, 0) > 0 then
				set _id = uuid();
				insert into t_party_billing(id, project_id, amount, tax_rate, step_status, trice) 
									values(_id, _project_id, _party_billing_amount, _tax_rate, 0, _trice);
				update t_party_billing set step_status = 1,step1_user='导入的',step1_time=now(), step1_idea='已审核' where id= _id;
			end if;
			
			
			if ifnull(_collections_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'),  '工程款', '现金', _collections_amount, _trice);
			end if;
			
			
			
			if ifnull(_customer_billing_amount, 0) > 0 then
				insert into t_customer_billing(id, project_id, invoice_code, invoice_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '其他', _customer_billing_amount, _trice);
			end if;
			
			
			
			if ifnull(_payment_amount, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='其他' limit 1), _payment_amount, _trice);
			end if;
			
			
			if ifnull(_payment_amount_clv, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='差旅费' limit 1), _payment_amount_clv, _trice);
			end if;
			
			
			
			
			if ifnull(_payment_amount_cliang, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='车辆费' limit 1), _payment_amount_cliang, _trice);
			end if;
			
			
			if ifnull(_payment_amount_zdai, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='业务招待费' limit 1), _payment_amount_zdai, _trice);
			end if;
			
			
			
			if ifnull(_tax_real_amount, 0) > 0 then
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='税金' limit 1), _tax_real_amount, _trice);
			end if;
			
			
			if ifnull(_arrears_amount, 0) > 0 then
				insert into t_arrears(id, project_id, arrears_code, arrears_type, pay_type, amount, interest_rate, trice) 
									values(uuid(), _project_id, get_next_code('arrears_code'), '垫资', '现金', -_arrears_amount, 0, _trice);
			end if;
			
			
			if ifnull(_expected_value, 0) > 0 then
				insert into t_profile(id, project_id, expected_value, profile_point, trice) 
									values(uuid(), _project_id, _expected_value, _profile_point, _trice);
			end if;
    	
  	end loop top2;
  
  	close cur_for_detail;
	call proc_exec_log(_exec_no, 'proc_import_init', now(),  '执行完成');
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_restore_interest
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_restore_interest`(IN `_arrear_id` VARCHAR(50))
    COMMENT '归还利息'
proc:BEGIN
   declare _serial_id int default 1;
   declare _project_id varchar(50);
	declare _amount decimal(20, 4);
	declare _offset_amount decimal(20, 4);
	declare _count int default 0;
	
	select project_id, amount into _project_id, _offset_amount from t_arrears where id=_arrears_id;

   while _serial_id > 0 and _offset_amount > 0 do
		set _serial_id = 0;
      select min(serial_id) into _serial_id from t_arrears where project_id = _project_id and (amount + offset_amount) * interest_rate < 0;
      
      if _serial_id > 0  then
      	
      	set _amount = 0;
      	select interest_amount + offset_amount into _amount from t_arrears where serial_id = _serial_id;

      	update t_arrears_interest set offset_amount = if(_amount + _offset_amount >= 0, -interest_amount, _offset_amount), description=concat(ifnull(description, ''), '在', curdate(), '偿还利息', if(_amount + _offset_amount >= 0, -interest_amount, _offset_amount), '<br/>') where serial_id = _serial_id;
  
      	set _offset_amount = if(_amount + _offset_amount >= 0, _amount + _offset_amount, 0);
      	set _count = _count + 1;
		end if;
   end while;

	
   update t_arrears set offset_amount = _offset_amount, description = concat(ifnull(description, ''), '偿还了', _count, '笔欠款的利息，剩余：', _offset_amount, '<br/>') where id = _arrears_id;
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_restore_principal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_restore_principal`(IN `_arrears_id` VARCHAR(50))
    COMMENT '归还本金的存储过程'
proc:BEGIN
   declare _serial_id int default 1;
   declare _project_id varchar(50);
	declare _amount decimal(20, 4);
	declare _offset_amount decimal(20, 4);
	declare _count int default 0;
	
	select project_id, amount into _project_id, _offset_amount from t_arrears where id=_arrears_id;

   while _serial_id > 0 and _offset_amount > 0 do
		set _serial_id = 0;
      select min(serial_id) into _serial_id from t_arrears where project_id = _project_id and (amount + offset_amount) * interest_rate < 0;
      
      if _serial_id > 0  then
      	
      	set _amount = 0;
      	select amount + offset_amount into _amount from t_arrears where serial_id = _serial_id;

      	update t_arrears set offset_amount = if(_amount + _offset_amount >= 0, -amount, _offset_amount), description = concat(ifnull(description, ''), '在', curdate(), '偿还本金：', if(_amount + _offset_amount >= 0, -amount, _offset_amount), '<br/>') where serial_id = _serial_id;
  
      	set _offset_amount = if(_amount + _offset_amount >= 0, _amount + _offset_amount, 0);
      	set _count = _count + 1;
		end if;
   end while;

	
   update t_arrears set offset_amount = _offset_amount, description = concat(ifnull(description, ''), '偿还了', _count, '笔欠款的本金，剩余：', _offset_amount, '<br/>') where id = _arrears_id;
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
    COMMENT '每次登录时被调用'
begin
  declare _flag int default -1;
  
  -- 禁用自动修改状态
  if _flag > 0 then
      update t_arrears set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_collections set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_contract_change set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_customer_billing set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_information set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_party_billing set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_payment set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_profile set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
      
      update t_project set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
  end if;
 
  -- 计算利息
  call proc_calc_interest_main();
end//
DELIMITER ;


-- Dumping structure for function hplydb_new.get_next_code
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_code`(`arg0` varchar(20)) RETURNS varchar(100) CHARSET utf8
    COMMENT '获取各个业务的唯一编码，以年为单位，到下一年自动归1'
BEGIN 
		DECLARE next_id INT DEFAULT 0; 
		DECLARE next_code VARCHAR(100) DEFAULT 'KEY'; 
		
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


-- Dumping structure for function hplydb_new.get_year
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `get_year`(`arg0` DATETIME) RETURNS varchar(100) CHARSET utf8
BEGIN
	return concat(year(date(arg0) + interval + 11 day), '年');
END//
DELIMITER ;


-- Dumping structure for trigger hplydb_new.tr_01_project_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_01_project_after_insert` AFTER INSERT ON `t_project` FOR EACH ROW BEGIN
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
			`table_name`, 
			`field_01`)
		VALUES
			(uuid(),
			 new.trice, 
			 CONCAT('创建：合同项目信息，', ifnull(new.description, '')) , 
			 new.id, 
			 new.organization_id, 
			 new.project_code, 
			 new.project_name, 
			 new.contract_amount, 
			 0.0000, 
			 0.0000,
			 new.settlement_amount, 
			 new.management_rate, 
			 new.management_plan_amount, 
			 0.0000, 
			 0.0000, 
			 new.management_plan_amount, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 0.0000, 
			 new.tax_rate, 
			 new.tax_plan_amount,
			 0.0000, 
			 0.0000, 
			 new.tax_plan_amount, 
			 0.0000, 
			 0.0000, 
			 '', 
			 0, 
			 CURRENT_TIMESTAMP,
			 concat('/project/detail/', new.id),
 			new.update_user);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_02_project_after_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_02_project_after_update` AFTER UPDATE ON `t_project` FOR EACH ROW BEGIN
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
			`table_name`, 
			`field_01`)
SELECT UUID(),
		  NOW(),
		  CONCAT(if(new.status=1, '审核', '修改'), '：合同项目信息，', IFNULL(new.description, '')), 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 new.`contract_amount`,
		  0,
			change_total_amount,
		 new.`settlement_amount`,
		 new.`management_rate`,
		  new.management_plan_amount AS `management_plan_amount`,
		  0,
		 `management_total_amount`,
		  (new.management_plan_amount - management_plan_amount) + `management_owe_amount`,
		  0,
		 `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  0,
		 `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`,
		 new.`tax_rate`,
		 new.tax_plan_amount AS `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 (new.tax_plan_amount - tax_plan_amount) + `tax_owe_amount`,
		 `arrears_amount`,
		  0,
		  profile_point,
		 1, 
		 CURRENT_TIMESTAMP,
		 CONCAT('/project/detail/', new.id), 
		new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_03_project_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_03_project_after_delete` AFTER DELETE ON `t_project` FOR EACH ROW BEGIN
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
				`table_name`, 
				`field_01`)
SELECT 
				 uuid(),
				  old.`trice`,
				  CONCAT('删除：合同项目信息') , 
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				  0,
				 `change_total_amount`,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`, 
				 0, 
				 `management_total_amount`, 
				 `management_owe_amount`,
				  0,
				 `party_billing_total_amount`,
				 0, 
				  `collections_total_amount`,
				  `collections_rate`,
				 `customer_billing_amount`,
				 `customer_billing_total_amount`,
				  0,
				 `payment_total_amount`,
				 `tax_rate`,
  				 `tax_plan_amount`,
  				  0,
  				 `tax_total_amount`,
  				 `tax_owe_amount`,
				  0,
				  0,
				 `profile_point`,
				  0, 
				 CURRENT_TIMESTAMP,
				 concat('/project/detail/', old.id),
 				old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_10_contract_change_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_10_contract_change_after_insert` AFTER INSERT ON `t_contract_change` FOR EACH ROW BEGIN
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		  new.`trice`,
		  CONCAT('创建：合同补充协议，',ifnull(new.description, '')) , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 new.`change_amount`,
		  new.`change_amount` + `change_total_amount` AS `change_total_amount`,
		 `settlement_amount`,
		  `management_rate`,
		  `management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) AS `management_plan_amount`,
		 `management_real_amount`,
		 `management_total_amount`,
		 `management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + new.`change_amount` + `change_total_amount`) - `management_total_amount` AS `management_owe_amount`,
		  0,
		 `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  0,
		 `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
		  0, 
		 CURRENT_TIMESTAMP,
		 concat('/contractchange/detail/', new.id),
		 new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_11_contract_change_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_11_contract_change_after_delete` AFTER DELETE ON `t_contract_change` FOR EACH ROW BEGIN
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		  old.`trice`,
		  CONCAT('删除：合同补充协议，') , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		 -old.`change_amount`,
		  -old.`change_amount` + `change_total_amount` AS `change_total_amount`,
		 `settlement_amount`,
		  `management_rate`,
		  `management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + -old.`change_amount` + `change_total_amount`) AS `management_plan_amount`,
		 `management_real_amount`,
		 `management_total_amount`,
		 `management_rate`/100 * IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + -old.`change_amount` + `change_total_amount`) - `management_total_amount` AS `management_owe_amount`,
		  0,
		 `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  0,
		 `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
		  0, 
		 CURRENT_TIMESTAMP,
		 concat('/contractchange/detail/', old.id),
		 old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_20_party_billing_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_20_party_billing_after_insert` AFTER INSERT ON `t_party_billing` FOR EACH ROW BEGIN		
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		  new.`trice`,
		  CONCAT('创建：甲方开票，',ifnull(new.description, '')) , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		  0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		  0,
		 `management_total_amount`,
		 `management_owe_amount`,
		 new.amount party_billing_amount,
		 new.amount + party_billing_total_amount AS `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  0,
		 `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`, 
		 `tax_rate`,
		 (`tax_rate`/100) * (new.amount + party_billing_total_amount) AS `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 (`tax_rate`/100)  * (new.amount + party_billing_total_amount) - tax_total_amount AS `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
	 0, 
		 CURRENT_TIMESTAMP,
		 concat('/partybilling/detail/', new.id),
 		new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_21_party_billing_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_21_party_billing_after_delete` AFTER DELETE ON `t_party_billing` FOR EACH ROW BEGIN		
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		  old.`trice`,
		  CONCAT('删除：甲方开票') , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		  0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		  0,
		 `management_total_amount`,
		 `management_owe_amount`,
		 -old.amount party_billing_amount,
		 -old.amount + party_billing_total_amount AS `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  0,
		 `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`, 
		 `tax_rate`,
		 (`tax_rate`/100) * (-old.amount + party_billing_total_amount) AS `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 (`tax_rate`/100)  * (-old.amount + party_billing_total_amount) - tax_total_amount AS `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
	 0, 
		 CURRENT_TIMESTAMP,
		 concat('/partybilling/detail/', old.id),
 		old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_30_customer_billing_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_30_customer_billing_after_insert` AFTER INSERT ON `t_customer_billing` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
		  new.`trice`,
		  CONCAT('创建：客户开票，',ifnull(new.description, '')) , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		  0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		  0,
		 `management_total_amount`,
		 `management_owe_amount`,
		  0,
		 `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  new.amount,
		 new.amount + `customer_billing_total_amount` AS `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
		  0, 
		 CURRENT_TIMESTAMP,
		 concat('/customerbilling/detail/', new.id),
		 new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_31_customer_billing_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_31_customer_billing_after_delete` AFTER DELETE ON `t_customer_billing` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
		  old.`trice`,
		  CONCAT('删除：客户开票，') , 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 `contract_amount`,
		  0,
			change_total_amount,
		 `settlement_amount`,
		 `management_rate`,
		 `management_plan_amount`,
		  0,
		 `management_total_amount`,
		 `management_owe_amount`,
		  0,
		 `party_billing_total_amount`,
		  0,
		 `collections_total_amount`,
		 `collections_rate`,
		  -old.amount,
		 -old.amount + `customer_billing_total_amount` AS `customer_billing_total_amount`,
		  0,
		 `payment_total_amount`,
		 `tax_rate`,
		 `tax_plan_amount`,
		  0,
		 `tax_total_amount`,
		 `tax_owe_amount`,
		  0,
		  0,
		  profile_point,
		  0, 
		 CURRENT_TIMESTAMP,
		 concat('/customerbilling/detail/', old.id),
		 old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_40_collections_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_40_collections_after_insert` AFTER INSERT ON `t_collections` FOR EACH ROW BEGIN
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
				`table_name`, 
				`field_01`)
SELECT 
				 uuid(),
				  new.`trice`,
				  CONCAT('创建：收款，', new.source_of, ', ',ifnull(new.description, '')) , 
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				  0,
					`change_total_amount`,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`, IF(new.source_of = '管理费', new.amount, 0) AS `management_real_amount`, IF(new.source_of = '管理费', new.amount, 0) + `management_total_amount` AS `management_total_amount`, IF(new.source_of = '管理费', management_owe_amount - new.amount, management_owe_amount) AS `management_owe_amount`,
				  0,
				 `party_billing_total_amount`,
				  IF(new.source_of = '工程款', new.amount, 0),
				  IF(new.source_of = '工程款', new.amount, 0) + collections_total_amount AS `collections_total_amount`,
				  IF(new.source_of = '工程款', (new.amount + collections_total_amount) * 100/ IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + change_total_amount), collections_rate)  as `collections_rate`,
				 `customer_billing_amount`,
				 `customer_billing_total_amount`,
				  0,
				 `payment_total_amount`,
				 `tax_rate`,
  				 `tax_plan_amount`,
  				  0,
  				 `tax_total_amount`,
  				 `tax_owe_amount`,
				  0,
				  0,
				 `profile_point`,
				  0, 
				 CURRENT_TIMESTAMP,
				 concat('/collections/detail/', new.id),
 				new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_41_collections_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_41_collections_after_delete` AFTER DELETE ON `t_collections` FOR EACH ROW BEGIN
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
				`table_name`, 
				`field_01`)
SELECT 
				 uuid(),
				  old.`trice`,
				  CONCAT('删除：收款，', old.source_of) , 
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				  0,
					`change_total_amount`,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`, IF(old.source_of = '管理费', -old.amount, 0) AS `management_real_amount`, IF(old.source_of = '管理费', -old.amount, 0) + `management_total_amount` AS `management_total_amount`, IF(old.source_of = '管理费', management_owe_amount - -old.amount, management_owe_amount) AS `management_owe_amount`,
				  0,
				 `party_billing_total_amount`,
				  IF(old.source_of = '工程款', -old.amount, 0),
				  IF(old.source_of = '工程款', -old.amount, 0) + collections_total_amount AS `collections_total_amount`,
				  IF(old.source_of = '工程款', (-old.amount + collections_total_amount) * 100/ IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + change_total_amount), collections_rate)  as `collections_rate`,
				 `customer_billing_amount`,
				 `customer_billing_total_amount`,
				  0,
				 `payment_total_amount`,
				 `tax_rate`,
  				 `tax_plan_amount`,
  				  0,
  				 `tax_total_amount`,
  				 `tax_owe_amount`,
				  0,
				  0,
				 `profile_point`,
				  0, 
				 CURRENT_TIMESTAMP,
				 concat('/collections/detail/', old.id),
 				old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_50_payment_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_50_payment_after_insert` AFTER INSERT ON `t_payment` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	  new.`trice`,
	   CONCAT('创建：付款，', ifnull(new.description, '')) , 
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	  0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	  0,
	 `management_total_amount`,
	 `management_owe_amount`,
	  0,
	 `party_billing_total_amount`,
	  0,
	 `collections_total_amount`,
	 `collections_rate`,
	  0,
	 `customer_billing_total_amount`,
	 new.amount as payment_amount,
	 payment_total_amount + new.amount AS `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) AS `tax_real_amount`, 
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) + tax_total_amount AS `tax_total_amount`, 
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', tax_owe_amount - new.amount, tax_owe_amount) AS `tax_owe_amount`,
	  0,
	  0,
	  profile_point,
	 0, 
	 CURRENT_TIMESTAMP,
	 concat('/payment/detail/', new.id),
 	new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_51_payment_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_51_payment_after_delete` AFTER DELETE ON `t_payment` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	  old.`trice`,
	   CONCAT('删除：付款，') , 
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	  0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	  0,
	 `management_total_amount`,
	 `management_owe_amount`,
	  0,
	 `party_billing_total_amount`,
	  0,
	 `collections_total_amount`,
	 `collections_rate`,
	  0,
	 `customer_billing_total_amount`,
	 -old.amount AS payment_amount,
	 payment_total_amount - old.amount AS `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	 IF(old.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', -old.amount, 0) AS `tax_real_amount`, 
	 IF(old.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', -old.amount, 0) + tax_total_amount AS `tax_total_amount`, 
	 IF(old.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', tax_owe_amount - -old.amount, tax_owe_amount) AS `tax_owe_amount`,
	  0,
	  0,
	  profile_point,
	 0, 
	 CURRENT_TIMESTAMP,
	 concat('/payment/detail/', old.id),
 	old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_60_arrears_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_60_arrears_after_insert` AFTER INSERT ON `t_arrears` FOR EACH ROW trig: BEGIN IF new.arrears_type = '垫资' THEN
 
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
 				`table_name`, `field_01`)
SELECT UUID(),
 				  new.`trice`,
 				  CONCAT('创建：垫资费用，', IFNULL(new.description, '')), 
 				 `project_id`,
 				 `organization_id`,
 				 `project_code`,
 				 `project_name`,
 				 `contract_amount`,
 				  0,
 					change_total_amount,
 				 `settlement_amount`,
 				 `management_rate`,
 				 `management_plan_amount`,
 				  0,
 				 `management_total_amount`,
 				 `management_owe_amount`,
 				  0,
 				 `party_billing_total_amount`,
 				  0,
 				 `collections_total_amount`,
 				 `collections_rate`,
 				  0,
 				 `customer_billing_total_amount`,
 				  0,
 				 `payment_total_amount`,
 				 `tax_rate`,
 				 `tax_plan_amount`,
 				  0,
 				 `tax_total_amount`,
 				 `tax_owe_amount`,
 				  new.amount + arrears_amount,
 				  0,
 				  profile_point,
				  0, 
 				 CURRENT_TIMESTAMP,
 				 CONCAT('/arrears/detail/', new.id),
 				new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_61_arrears_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_61_arrears_after_delete` AFTER DELETE ON `t_arrears` FOR EACH ROW trig: BEGIN IF old.arrears_type = '垫资' THEN
 
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
 				`table_name`, `field_01`)
SELECT UUID(),
 				  old.`trice`,
 				  CONCAT('删除：垫资费用，'), 
 				 `project_id`,
 				 `organization_id`,
 				 `project_code`,
 				 `project_name`,
 				 `contract_amount`,
 				  0,
 					change_total_amount,
 				 `settlement_amount`,
 				 `management_rate`,
 				 `management_plan_amount`,
 				  0,
 				 `management_total_amount`,
 				 `management_owe_amount`,
 				  0,
 				 `party_billing_total_amount`,
 				  0,
 				 `collections_total_amount`,
 				 `collections_rate`,
 				  0,
 				 `customer_billing_total_amount`,
 				  0,
 				 `payment_total_amount`,
 				 `tax_rate`,
 				 `tax_plan_amount`,
 				  0,
 				 `tax_total_amount`,
 				 `tax_owe_amount`,
 				  -old.amount + arrears_amount,
 				  0,
 				  profile_point,
				  0, 
 				 CURRENT_TIMESTAMP,
 				 CONCAT('/arrears/detail/', old.id),
 				old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_70_profile_after_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_70_profile_after_insert` AFTER INSERT ON `t_profile` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	  new.`trice`,
	  CONCAT('创建：型材点，',ifnull(new.description, '')) , 
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	  0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	  0,
	 `management_total_amount`,
	 `management_owe_amount`,
	  0,
	 `party_billing_total_amount`,
	  0,
	 `collections_total_amount`,
	 `collections_rate`,
	  0,
	 `customer_billing_total_amount`,
	  0,
	 `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	  0,
	 `tax_total_amount`,
	 `tax_owe_amount`,
	  0,
	  new.expected_value,
	  new.profile_point,
	 0, 
	 CURRENT_TIMESTAMP,
	 concat('/profile/detail/', new.id),
 	new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_71_profile_after_delete
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_71_profile_after_delete` AFTER DELETE ON `t_profile` FOR EACH ROW BEGIN
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	  old.`trice`,
	  CONCAT('删除：型材点，') , 
	 `project_id`,
	 `organization_id`,
	 `project_code`,
	 `project_name`,
	 `contract_amount`,
	  0,
		change_total_amount,
	 `settlement_amount`,
	 `management_rate`,
	 `management_plan_amount`,
	  0,
	 `management_total_amount`,
	 `management_owe_amount`,
	  0,
	 `party_billing_total_amount`,
	  0,
	 `collections_total_amount`,
	 `collections_rate`,
	  0,
	 `customer_billing_total_amount`,
	  0,
	 `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	  0,
	 `tax_total_amount`,
	 `tax_owe_amount`,
	  0,
	  old.expected_value,
	  old.profile_point,
	 0, 
	 CURRENT_TIMESTAMP,
	 concat('/profile/detail/', old.id),
 	old.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=old.project_id AND VERSION >= 0);  END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
