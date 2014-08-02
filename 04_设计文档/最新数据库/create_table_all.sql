CREATE TABLE `t_arrears` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `funds_using` varchar(200) DEFAULT NULL COMMENT '�ʽ�ʹ�÷�',
  `arrears_type` varchar(50) DEFAULT NULL COMMENT 'Ƿ�����',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '֧����ʽ',
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '���',
  `interest_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ϣ��',
  `interest_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '����',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '����������',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='07_����Ƿ��';

CREATE TABLE `t_chop` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `chop_code` varchar(50) DEFAULT NULL COMMENT '���',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `project_code` varchar(50) DEFAULT NULL COMMENT '��Ŀ���',
  `project_name` varchar(200) DEFAULT NULL COMMENT '��Ŀ����',
  `manager` varchar(20) DEFAULT NULL COMMENT '��Ŀ����',
  `content` varchar(500) DEFAULT NULL COMMENT '��Ҫ����',
  `apply_user` char(36) DEFAULT NULL COMMENT '������',
  `apply_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `organization_id` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `step1_idea` varchar(200) DEFAULT NULL COMMENT '��ҵ��/��Ŀ��������',
  `step1_user` char(36) DEFAULT NULL COMMENT '��ҵ��/��Ŀ�������',
  `step1_time` datetime DEFAULT NULL COMMENT '��ҵ��/��Ŀ�����ʱ��',
  `step2_idea` varchar(200) DEFAULT NULL COMMENT '����������',
  `step2_user` char(36) DEFAULT NULL COMMENT '���������',
  `step2_time` datetime DEFAULT NULL COMMENT '�������ʱ��',
  `step3_idea` varchar(200) DEFAULT NULL COMMENT '�����˰�����',
  `step3_user` char(36) DEFAULT NULL COMMENT '������',
  `step3_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `step_status` varchar(20) DEFAULT NULL COMMENT '����״̬',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='09_���¹���';

CREATE TABLE `t_collections` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `ticket_code` varchar(50) DEFAULT NULL COMMENT 'ƾ֤��',
  `source_of` varchar(50) DEFAULT NULL COMMENT '������Դ',
  `payment_type` varchar(50) DEFAULT NULL COMMENT '�տʽ',
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�տ���',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '����������',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�տ�ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='05_�տ����';

CREATE TABLE `t_contract_change` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `csa_code` varchar(50) DEFAULT NULL COMMENT '����Э����',
  `management_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�������',
  `change_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�������',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='02_��ͬ����Э��';

CREATE TABLE `t_customer_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `invoice_code` varchar(50) DEFAULT NULL COMMENT '��ƱƱ��',
  `invoice_type` varchar(50) DEFAULT NULL COMMENT '��Ʊ���',
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ʊ���',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��Ʊʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='04_�ͻ���Ʊ���';

CREATE TABLE `t_field_types` (
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
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����������͵Ĳ�������';

CREATE TABLE `t_information` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_id` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `project_name` varchar(200) DEFAULT NULL COMMENT '��Ŀ����',
  `address` varchar(200) DEFAULT NULL COMMENT '��ַ',
  `developer` varchar(200) DEFAULT NULL COMMENT '������',
  `epc_corporation` varchar(200) DEFAULT NULL COMMENT '�ܰ���λ',
  `variety` varchar(100) DEFAULT NULL COMMENT 'Ʒ��',
  `total_area` varchar(20) DEFAULT NULL COMMENT '�����',
  `real_name` varchar(20) DEFAULT NULL COMMENT '����',
  `identification` varchar(20) DEFAULT NULL COMMENT '���֤��',
  `contact` varchar(100) DEFAULT NULL COMMENT '��ϵ��ʽ',
  `subscriber` char(36) DEFAULT NULL COMMENT '�Ǽ���',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='10_��Ϣ�Ǽ�';

CREATE TABLE `t_party_billing` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `invoice_code` varchar(50) DEFAULT NULL COMMENT '��ƱƱ��',
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ʊ���',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '��Ʊʱ��',
  `tax_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '˰��',
  `tax_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ӧ��˰��',
  `step1_idea` varchar(100) DEFAULT NULL COMMENT '������',
  `step1_user` char(36) DEFAULT NULL COMMENT '�����',
  `step1_time` datetime DEFAULT NULL COMMENT '���ʱ��',
  `step_status` varchar(20) DEFAULT NULL COMMENT '����״̬',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='03_�׷���Ʊ���';

CREATE TABLE `t_payment` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `ticket_code` varchar(50) DEFAULT NULL COMMENT 'ƾ֤��',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '֧����ʽ',
  `payment_item_id` char(36) DEFAULT NULL COMMENT '�����ĿID',
  `amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '������',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '�����˺�',
  `bank_name` varchar(200) DEFAULT NULL COMMENT '����������',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06_�������';

CREATE TABLE `t_payment_item` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `item_name` varchar(50) DEFAULT NULL COMMENT '�����Ŀ����',
  `reimbursement_cap` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '������������',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='06+A_�����Ŀ';

CREATE TABLE `t_profile` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `expected_value` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ԥ������',
  `profile_point` varchar(100) DEFAULT NULL COMMENT '�Ͳĵ�',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='08_�Ͳ�';

CREATE TABLE `t_project` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `project_code` varchar(50) DEFAULT NULL COMMENT '��Ŀ���',
  `project_name` varchar(100) DEFAULT NULL COMMENT '��Ŀ����',
  `organization_id` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `party_name` varchar(100) DEFAULT NULL COMMENT '�׷�����',
  `party_address` varchar(200) DEFAULT NULL COMMENT '�׷���ַ',
  `manager` varchar(50) DEFAULT NULL COMMENT '��Ŀ����',
  `contract_code` varchar(50) DEFAULT NULL COMMENT '��ͬ��',
  `corperation` varchar(100) DEFAULT NULL COMMENT '������λ',
  `legal_assignee` varchar(50) DEFAULT NULL COMMENT '���˴���',
  `is_withholding_offsite` tinyint(4) DEFAULT NULL COMMENT '��ش��۴���',
  `management_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�������',
  `tax_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '˰�����',
  `contract_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��ͬ���',
  `settlement_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '������',
  `duty_paid_time` datetime DEFAULT NULL COMMENT 'ӡ��˰�Ͻ�ʱ��',
  `duty_paid_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'ӡ��˰�Ͻ����',
  `duty_paid_code` varchar(50) DEFAULT NULL COMMENT 'ӡ��˰�վݱ��',
  `capital_occupied` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'ռ���ʽ����',
  `project_status` tinyint(4) DEFAULT NULL COMMENT '��Ŀ״̬',
  `trice` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�Ǽ�ʱ��',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '����״̬��0���ݸ�/1����ʽ',
  `management_plan_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ӧ�չ����',
  `tax_plan_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ӧ��˰��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='01_��ͬ��Ŀ��Ϣ';

CREATE TABLE `t_project_summary` (
  `id` char(36) NOT NULL DEFAULT '' COMMENT 'ID',
  `trice` datetime DEFAULT NULL COMMENT 'ʱ��',
  `description` varchar(500) DEFAULT NULL COMMENT 'ժҪ',
  `project_id` char(36) DEFAULT NULL COMMENT '��ĿID',
  `organization_id` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `project_code` varchar(50) DEFAULT NULL COMMENT '��Ŀ���',
  `project_name` varchar(100) DEFAULT NULL COMMENT '��Ŀ����',
  `contract_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��ͬ���',
  `change_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��ͬ������',
  `settlement_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��ͬ�����',
  `management_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '����',
  `management_plan_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ӧ�չ����',
  `management_real_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'ʵ�չ����',
  `management_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼ��չ����',
  `management_owe_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ƿ�����',
  `party_billing_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ʊ���',
  `party_billing_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼƿ�Ʊ',
  `collections_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�տ���',
  `collections_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼ��տ�',
  `collections_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '������',
  `customer_billing_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ʊ���',
  `customer_billing_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼƿ�Ʊ',
  `payment_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '֧�����',
  `payment_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼ�',
  `tax_rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '����',
  `tax_plan_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ӧ��˰��',
  `tax_real_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ѽ�˰��',
  `tax_total_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '�ۼ��ѽ�˰��',
  `tax_owe_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '��Ƿ˰��',
  `arrears_amount` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '���',
  `expected_value` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Ԥ������',
  `profile_point` varchar(100) DEFAULT NULL COMMENT '�Ͳĵ�',
  `version` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ�䣬��������ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='00_����Ŀ����';

CREATE TABLE `t_sys_authorization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `resource_id` char(36) DEFAULT NULL COMMENT '��ԴID',
  `user_id` char(36) DEFAULT NULL COMMENT '�û�ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`user_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='13_��Ȩ��ϵ';

CREATE TABLE `t_sys_organization` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `organization_name` varchar(50) DEFAULT NULL COMMENT '��������',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11+A_��֯����';

CREATE TABLE `t_sys_parameter` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `en_name` varchar(100) DEFAULT NULL COMMENT '����Ӣ������',
  `cn_name` varchar(100) DEFAULT NULL COMMENT '������������',
  `param_value` varchar(500) DEFAULT NULL COMMENT '����ֵ',
  `default_value` varchar(500) DEFAULT NULL COMMENT 'Ĭ��ֵ',
  `is_inner` tinyint(4) DEFAULT NULL COMMENT '�Ƿ�ϵͳ����',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='14_ϵͳ����';

CREATE TABLE `t_sys_resource` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `res_code` varchar(50) DEFAULT NULL COMMENT '��Դ����',
  `res_name` varchar(200) DEFAULT NULL COMMENT 'ͼ��·��',
  `icon` varchar(100) DEFAULT NULL COMMENT '��Դ����',
  `res_url` varchar(200) DEFAULT NULL COMMENT 'URL��ַ',
  `res_type` varchar(50) DEFAULT NULL COMMENT '��Դ����',
  `order_by` smallint(6) DEFAULT NULL COMMENT '˳���',
  `parent_id` char(36) DEFAULT NULL COMMENT '��ID',
  `enabled` smallint(6) DEFAULT NULL COMMENT '�Ƿ����',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='12_ϵͳ��Դ';

CREATE TABLE `t_sys_user` (
  `id` char(36) NOT NULL COMMENT 'ID',
  `login_name` varchar(50) DEFAULT NULL COMMENT '��½��',
  `real_name` varchar(50) DEFAULT NULL COMMENT '����',
  `organization_id` char(36) DEFAULT NULL COMMENT '���ڲ���',
  `password` varchar(200) DEFAULT NULL COMMENT '����',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '����½IP',
  `last_login_time` datetime DEFAULT NULL COMMENT '����½ʱ��',
  `fails` smallint(6) DEFAULT NULL COMMENT '������¼ʧ�ܴ���',
  `logined` smallint(6) DEFAULT NULL COMMENT '��½�ܴ���',
  `position` varchar(50) DEFAULT NULL COMMENT 'ְ��',
  `enabled` tinyint(4) DEFAULT NULL COMMENT '�Ƿ����',
  `order_by` tinyint(4) DEFAULT NULL COMMENT '˳���',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '����ʱ��',
  `create_user` char(36) DEFAULT NULL COMMENT '�����û�',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�޸�ʱ��',
  `update_user` char(36) DEFAULT NULL COMMENT '�޸��û�',
  `description` varchar(500) DEFAULT NULL COMMENT '��ע',
  `version` int(11) NOT NULL DEFAULT '0',
  `must_change_password` tinyint(4) DEFAULT '0' COMMENT '�´ε�¼�Ƿ�����޸�����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='11_ϵͳ�û�';
