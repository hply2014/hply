CREATE TABLE `t_arrears` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `ArrearsType` varchar(50) DEFAULT NULL COMMENT 'Ƿ�����',
  `PayType` varchar(50) DEFAULT NULL COMMENT '֧����ʽ',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '���',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `BankName` varchar(200) DEFAULT NULL COMMENT '����������',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_chop` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ChopCode` varchar(50) DEFAULT NULL COMMENT '���',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `ProjectCode` varchar(50) DEFAULT NULL COMMENT '��Ŀ���',
  `ProjectName` varchar(200) DEFAULT NULL COMMENT '��Ŀ����',
  `Manager` varchar(20) DEFAULT NULL COMMENT '��Ŀ����',
  `Content` varchar(500) DEFAULT NULL COMMENT '��Ҫ����',
  `ApplyUser` char(36) DEFAULT NULL COMMENT '������',
  `ApplyTime` datetime DEFAULT NULL COMMENT '����ʱ��',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `Step1Idea` varchar(200) DEFAULT NULL COMMENT '��ҵ��/��Ŀ��������',
  `Step1User` char(36) DEFAULT NULL COMMENT '��ҵ��/��Ŀ�������',
  `Step1Time` datetime DEFAULT NULL COMMENT '��ҵ��/��Ŀ�����ʱ��',
  `Step2Idea` varchar(200) DEFAULT NULL COMMENT '����������',
  `Step2User` char(36) DEFAULT NULL COMMENT '���������',
  `Step2Time` datetime DEFAULT NULL COMMENT '�������ʱ��',
  `Step3Idea` varchar(200) DEFAULT NULL COMMENT '�����˰�����',
  `Step3User` char(36) DEFAULT NULL COMMENT '������',
  `Step3Time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `StepStatus` varchar(20) DEFAULT NULL COMMENT '����״̬',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_collections` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `TicketCode` varchar(50) DEFAULT NULL COMMENT 'ƾ֤��',
  `SourceOF` varchar(50) DEFAULT NULL COMMENT '������Դ',
  `PaymentType` varchar(50) DEFAULT NULL COMMENT '�տʽ',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '�տ���',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `BankName` varchar(200) DEFAULT NULL COMMENT '����������',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�տ�ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_contract_supplemental_agreement` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `CsaCode` varchar(50) DEFAULT NULL COMMENT '����Э����',
  `ManagementRate` decimal(20,4) DEFAULT NULL COMMENT '�������',
  `ChangeAmount` decimal(20,4) DEFAULT NULL COMMENT '�������',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_customer_billing` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `InvoiceCode` varchar(50) DEFAULT NULL COMMENT '��ƱƱ��',
  `InvoiceType` varchar(50) DEFAULT NULL COMMENT '��Ʊ���',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '��Ʊ���',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��Ʊʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_information` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `ProjectName` varchar(200) DEFAULT NULL COMMENT '��Ŀ����',
  `Address` varchar(200) DEFAULT NULL COMMENT '��ַ',
  `Developer` varchar(200) DEFAULT NULL COMMENT '������',
  `EpcCorporation` varchar(200) DEFAULT NULL COMMENT '�ܰ���λ',
  `Variety` varchar(100) DEFAULT NULL COMMENT 'Ʒ��',
  `TotalArea` varchar(20) DEFAULT NULL COMMENT '�����',
  `RealName` varchar(20) DEFAULT NULL COMMENT '����',
  `Identification` varchar(20) DEFAULT NULL COMMENT '���֤��',
  `Contact` varchar(100) DEFAULT NULL COMMENT '��ϵ��ʽ',
  `Subscriber` char(36) DEFAULT NULL COMMENT '�Ǽ���',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_party_billing` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `InvoiceCode` varchar(50) DEFAULT NULL COMMENT '��ƱƱ��',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '��Ʊ���',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��Ʊʱ��',
  `TaxRate` decimal(20,4) DEFAULT NULL COMMENT '˰��',
  `TaxAmount` decimal(20,4) DEFAULT NULL COMMENT 'Ӧ��˰��',
  `Step1Idea` varchar(100) DEFAULT NULL COMMENT '������',
  `Step1User` char(36) DEFAULT NULL COMMENT '�����',
  `Step1Time` datetime DEFAULT NULL COMMENT '���ʱ��',
  `StepStatus` varchar(20) DEFAULT NULL COMMENT '����״̬',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_payment` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `TicketCode` varchar(50) DEFAULT NULL COMMENT 'ƾ֤��',
  `PayType` varchar(50) DEFAULT NULL COMMENT '֧����ʽ',
  `PaymentItemID` char(36) DEFAULT NULL COMMENT '�����ĿID',
  `Amount` decimal(20,4) DEFAULT NULL COMMENT '������',
  `BankAccount` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `BankName` varchar(200) DEFAULT NULL COMMENT '����������',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_payment_item` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ItemName` varchar(50) DEFAULT NULL COMMENT '�����Ŀ����',
  `ReimbursementCap` decimal(20,4) DEFAULT NULL COMMENT '������������',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_profile` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectID` char(36) DEFAULT NULL COMMENT '��ĿID',
  `ExpectedValue` decimal(20,4) DEFAULT NULL COMMENT 'Ԥ������',
  `ProfilePoint` varchar(100) DEFAULT NULL COMMENT '�Ͳĵ�',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_project` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ProjectCode` varchar(50) DEFAULT NULL COMMENT '��Ŀ���',
  `ProjectName` varchar(100) DEFAULT NULL COMMENT '��Ŀ����',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `PartyName` varchar(100) DEFAULT NULL COMMENT '�׷�����',
  `PartyAddress` varchar(200) DEFAULT NULL COMMENT '�׷���ַ',
  `Manager` varchar(50) DEFAULT NULL COMMENT '��Ŀ����',
  `ContractCode` varchar(50) DEFAULT NULL COMMENT '��ͬ��',
  `Cooperation` varchar(100) DEFAULT NULL COMMENT '������λ',
  `LegalAssignee` varchar(50) DEFAULT NULL COMMENT '���˴���',
  `ISWithholdingOffsite` tinyint(4) DEFAULT NULL COMMENT '��ش��۴���',
  `ManagementRate` decimal(20,4) DEFAULT NULL COMMENT '�������',
  `TaxRate` decimal(20,4) DEFAULT NULL COMMENT '˰�����',
  `ContractAmount` decimal(20,4) DEFAULT NULL COMMENT '��ͬ���',
  `SettlementAmount` decimal(20,4) DEFAULT NULL COMMENT '������',
  `DutyPaidTime` datetime DEFAULT NULL COMMENT 'ӡ��˰�Ͻ�ʱ��',
  `DutyPaidAmount` decimal(20,4) DEFAULT NULL COMMENT 'ӡ��˰�Ͻ����',
  `DutyPaidCode` varchar(50) DEFAULT NULL COMMENT 'ӡ��˰�վݱ��',
  `CapitalOccupied` decimal(20,4) DEFAULT NULL COMMENT 'ռ���ʽ����',
  `ProjectStatus` tinyint(4) DEFAULT NULL COMMENT '��Ŀ״̬',
  `Trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_authorization` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ResourceID` char(36) DEFAULT NULL COMMENT '��ԴID',
  `UserID` char(36) DEFAULT NULL COMMENT '�û�ID',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_organization` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `OrganizationName` varchar(50) DEFAULT NULL COMMENT '��������',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_parameter` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `ENName` varchar(100) DEFAULT NULL COMMENT '����Ӣ������',
  `CNName` varchar(100) DEFAULT NULL COMMENT '������������',
  `ParamValue` varchar(500) DEFAULT NULL COMMENT '����ֵ',
  `DefaultValue` varchar(500) DEFAULT NULL COMMENT 'Ĭ��ֵ',
  `ISInner` tinyint(4) DEFAULT NULL COMMENT '�Ƿ�ϵͳ����',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_resource` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `Rescode` varchar(50) DEFAULT NULL COMMENT '��Դ����',
  `Resname` varchar(200) DEFAULT NULL COMMENT 'ͼ��·��',
  `Icon` varchar(100) DEFAULT NULL COMMENT '��Դ����',
  `ResUrl` varchar(200) DEFAULT NULL COMMENT 'URL��ַ',
  `ResType` varchar(50) DEFAULT NULL COMMENT '��Դ����',
  `OrderBY` smallint(6) DEFAULT NULL COMMENT '˳���',
  `ParentID` char(36) DEFAULT NULL COMMENT '��ID',
  `Enabled` smallint(6) DEFAULT NULL COMMENT '�Ƿ����',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_sys_user` (
  `ID` char(36) NOT NULL COMMENT 'ID',
  `LoginName` varchar(50) DEFAULT NULL COMMENT '��½��',
  `RealName` varchar(50) DEFAULT NULL COMMENT '����',
  `OrganizationID` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `Password` varchar(50) DEFAULT NULL COMMENT '����',
  `LastLoginIP` varchar(50) DEFAULT NULL COMMENT '����½IP',
  `LastLoginTime` datetime DEFAULT NULL COMMENT '����½ʱ��',
  `Fails` smallint(6) DEFAULT NULL COMMENT '������¼ʧ�ܴ���',
  `Logined` smallint(6) DEFAULT NULL COMMENT '��½�ܴ���',
  `Position` varchar(50) DEFAULT NULL COMMENT 'ְ��',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '�Ƿ����',
  `OrderBY` tinyint(4) DEFAULT NULL COMMENT '˳���',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `CreateUser` char(36) DEFAULT NULL COMMENT '�����û�',
  `UpdateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `UpdateUser` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `Description` varchar(500) DEFAULT NULL COMMENT '��ע',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SELECT * FROM hplydb_new.t_sys_organization;