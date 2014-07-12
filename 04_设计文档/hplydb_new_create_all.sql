CREATE TABLE `t_arrears` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `ArrearsType` varchar(50) DEFAULT NULL COMMENT '欠款分类',
  `PayType` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '金额',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `BankName` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_chop` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ChopCode` varchar(50) DEFAULT NULL COMMENT '编号',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `ProjectCode` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `ProjectName` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `Manager` varchar(20) DEFAULT NULL COMMENT '项目经理',
  `Content` varchar(500) DEFAULT NULL COMMENT '主要内容',
  `ApplyUser` char(36) DEFAULT NULL COMMENT '申请人',
  `ApplyTime` datetime DEFAULT NULL COMMENT '申请时间',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '所在部门',
  `Step1Idea` varchar(200) DEFAULT NULL COMMENT '事业部/项目部审核意见',
  `Step1User` char(36) DEFAULT NULL COMMENT '事业部/项目部审核人',
  `Step1Time` datetime DEFAULT NULL COMMENT '事业部/项目部审核时间',
  `Step2Idea` varchar(200) DEFAULT NULL COMMENT '财务部审核意见',
  `Step2User` char(36) DEFAULT NULL COMMENT '财务部审核人',
  `Step2Time` datetime DEFAULT NULL COMMENT '财务部审核时间',
  `Step3Idea` varchar(200) DEFAULT NULL COMMENT '经办人办理结果',
  `Step3User` char(36) DEFAULT NULL COMMENT '经办人',
  `Step3Time` datetime DEFAULT NULL COMMENT '经办时间',
  `StepStatus` varchar(20) DEFAULT NULL COMMENT '流程状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_collections` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `TicketCode` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `SourceOF` varchar(50) DEFAULT NULL COMMENT '款项来源',
  `PaymentType` varchar(50) DEFAULT NULL COMMENT '收款方式',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '收款金额',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `BankName` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '收款时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_contract_supplemental_agreement` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `CsaCode` varchar(50) DEFAULT NULL COMMENT '增补协议编号',
  `ManagementRate` decimal(20,4) DEFAULT NULL COMMENT '管理费率',
  `ChangeAmount` decimal(20,4) DEFAULT NULL COMMENT '增减金额',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '增补时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_customer_billing` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `InvoiceCode` varchar(50) DEFAULT NULL COMMENT '发票票号',
  `InvoiceType` varchar(50) DEFAULT NULL COMMENT '发票类别',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '发票金额',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开票时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_information` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '所在部门',
  `ProjectName` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `Address` varchar(200) DEFAULT NULL COMMENT '地址',
  `Developer` varchar(200) DEFAULT NULL COMMENT '开发商',
  `EpcCorporation` varchar(200) DEFAULT NULL COMMENT '总包单位',
  `Variety` varchar(100) DEFAULT NULL COMMENT '品种',
  `TotalArea` varchar(20) DEFAULT NULL COMMENT '总面积',
  `RealName` varchar(20) DEFAULT NULL COMMENT '姓名',
  `Identification` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `Contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `Subscriber` char(36) DEFAULT NULL COMMENT '登记人',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_party_billing` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `InvoiceCode` varchar(50) DEFAULT NULL COMMENT '发票票号',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '发票金额',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '开票时间',
  `TaxRate` decimal(20,4) DEFAULT NULL COMMENT '税率',
  `TaxAmount` decimal(20,4) DEFAULT NULL COMMENT '应收税金',
  `Step1Idea` varchar(100) DEFAULT NULL COMMENT '审核意见',
  `Step1User` char(36) DEFAULT NULL COMMENT '审核人',
  `Step1Time` datetime DEFAULT NULL COMMENT '审核时间',
  `StepStatus` varchar(20) DEFAULT NULL COMMENT '流程状态',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_payment` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `TicketCode` varchar(50) DEFAULT NULL COMMENT '凭证号',
  `PayType` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `PaymentItemID` char(36) DEFAULT NULL COMMENT '付款科目ID',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '付款金额',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `BankName` varchar(200) DEFAULT NULL COMMENT '开户行名称',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '付款时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_payment_item` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ItemName` varchar(50) DEFAULT NULL COMMENT '付款科目名称',
  `ReimbursementCap` decimal(20,4) DEFAULT NULL COMMENT '报销比例上限',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_profile` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '项目ID',
  `ExpectedValue` decimal(20,4) DEFAULT NULL COMMENT '预计用量',
  `ProfilePoint` varchar(100) DEFAULT NULL COMMENT '型材点',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_project` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectCode` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `ProjectName` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '所在部门',
  `PartyName` varchar(100) DEFAULT NULL COMMENT '甲方名称',
  `PartyAddress` varchar(200) DEFAULT NULL COMMENT '甲方地址',
  `Manager` varchar(50) DEFAULT NULL COMMENT '项目经理',
  `ContractCode` varchar(50) DEFAULT NULL COMMENT '合同号',
  `Cooperation` varchar(100) DEFAULT NULL COMMENT '合作单位',
  `LegalAssignee` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `ISWithholdingOffsite` tinyint(4) DEFAULT NULL COMMENT '异地代扣代缴',
  `ManagementRate` decimal(20,4) DEFAULT NULL COMMENT '管理费率',
  `TaxRate` decimal(20,4) DEFAULT NULL COMMENT '税金比率',
  `ContractAmount` decimal(20,4) DEFAULT NULL COMMENT '合同金额',
  `SettlementAmount` decimal(20,4) DEFAULT NULL COMMENT '结算金额',
  `DutyPaidTime` datetime DEFAULT NULL COMMENT '印花税上交时间',
  `DutyPaidAmount` decimal(20,4) DEFAULT NULL COMMENT '印花税上交金额',
  `DutyPaidCode` varchar(50) DEFAULT NULL COMMENT '印花税收据编号',
  `CapitalOccupied` decimal(20,4) DEFAULT NULL COMMENT '占用资金情况',
  `ProjectStatus` tinyint(4) DEFAULT NULL COMMENT '项目状态',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '登记时间',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_authorization` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ResourceID` char(36) DEFAULT NULL COMMENT '资源ID',
  `UserID` char(36) DEFAULT NULL COMMENT '用户ID',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_organization` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `OrganizationName` varchar(50) DEFAULT NULL COMMENT '机构名称',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_parameter` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ENName` varchar(100) DEFAULT NULL COMMENT '参数英文名称',
  `CNName` varchar(100) DEFAULT NULL COMMENT '参数中文名称',
  `ParamValue` varchar(500) DEFAULT NULL COMMENT '参数值',
  `DefaultValue` varchar(500) DEFAULT NULL COMMENT '默认值',
  `ISInner` tinyint(4) DEFAULT NULL COMMENT '是否系统内置',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_resource` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `Rescode` varchar(50) DEFAULT NULL COMMENT '资源编码',
  `Resname` varchar(200) DEFAULT NULL COMMENT '图标路径',
  `Icon` varchar(100) DEFAULT NULL COMMENT '资源名称',
  `ResUrl` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `ResType` varchar(50) DEFAULT NULL COMMENT '资源类型',
  `OrderBY` smallint(6) DEFAULT NULL COMMENT '顺序号',
  `ParentID` char(36) DEFAULT NULL COMMENT '父ID',
  `Enabled` smallint(6) DEFAULT NULL COMMENT '是否禁用',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_user` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `LoginName` varchar(50) DEFAULT NULL COMMENT '登陆名',
  `RealName` varchar(50) DEFAULT NULL COMMENT '姓名',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '所在部门',
  `Password` varchar(50) DEFAULT NULL COMMENT '密码',
  `LastLoginIP` varchar(50) DEFAULT NULL COMMENT '最后登陆IP',
  `LastLoginTime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `Fails` smallint(6) DEFAULT NULL COMMENT '连续登录失败次数',
  `Logined` smallint(6) DEFAULT NULL COMMENT '登陆总次数',
  `Position` varchar(50) DEFAULT NULL COMMENT '职务',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否禁用',
  `OrderBY` tinyint(4) DEFAULT NULL COMMENT '顺序号',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `CreateUser` char(36) DEFAULT NULL COMMENT '创建用户',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '修改用户',
  `Description` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SELECT * FROM hplydb_new.t_sys_organization;