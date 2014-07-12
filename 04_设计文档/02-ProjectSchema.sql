create table t_project (	
	id char(36) not null, 
	project_code varchar(50), 
	project_name varchar(100), 
	organization_id char(36), 
	party_name varchar(100), 
	party_address varchar(200), 
	manager varchar(50), 
	contract_code varchar(50), 
	cooperation varchar(100), 
	legal_assignee varchar(50), 
	is_withholding_offsite tinyint, 
	management_rate decimal(20,4), 
	tax_rate decimal(20,4), 
	contract_amount decimal(20,4), 
	settlement_amount decimal(20,4), 
	duty_paid_time datetime(0), 
	duty_paid_amount decimal(20,4), 
	duty_paid_code varchar(50), 
	capital_occupied decimal(20,4), 
	project_status tinyint, 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_contract_supplemental_agreement (	
	id char(36) not null, 
	project_id char(36), 
	csa_code varchar(50), 
	management_rate decimal(20,4), 
	change_amount decimal(20,4), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_party_billing (	
	id char(36) not null, 
	project_id char(36), 
	invoice_code varchar(50), 
	amount decimal(20,4), 
	trice datetime(0) default current_timestamp, 
	tax_rate decimal(20,4), 
	tax_amount decimal(20,4), 
	step1_idea varchar(100), 
	step1_user char(36), 
	step1_time datetime(0), 
	step_status varchar(20), 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_customer_billing (	
	id char(36) not null, 
	project_id char(36), 
	invoice_code varchar(50), 
	invoice_type varchar(50), 
	amount decimal(20,4), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_collections (	
	id char(36) not null, 
	project_id char(36), 
	ticket_code varchar(50), 
	source_of varchar(50), 
	payment_type varchar(50), 
	amount decimal(20,4), 
	bank_account varchar(50), 
	bank_name varchar(200), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_payment (	
	id char(36) not null, 
	project_id char(36), 
	ticket_code varchar(50), 
	pay_type varchar(50), 
	payment_item_id char(36), 
	amount decimal(20,4), 
	bank_account varchar(50), 
	bank_name varchar(200), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_payment_item (	
	id char(36) not null, 
	item_name varchar(50), 
	reimbursement_cap decimal(20,4), 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_arrears (	
	id char(36) not null, 
	project_id char(36), 
	arrears_type varchar(50), 
	pay_type varchar(50), 
	amount decimal(20,4), 
	bank_account varchar(50), 
	bank_name varchar(200), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_profile (	
	id char(36) not null, 
	project_id char(36), 
	expected_value decimal(20,4), 
	profile_point varchar(100), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	

create table t_chop (	
	id char(36) not null, 
	chop_code varchar(50), 
	project_id char(36), 
	project_code varchar(50), 
	project_name varchar(200), 
	manager varchar(20), 
	content varchar(500), 
	apply_user char(36), 
	apply_time datetime(0), 
	organization_id char(36), 
	step1_idea varchar(200), 
	step1_user char(36), 
	step1_time datetime(0), 
	step2_idea varchar(200), 
	step2_user char(36), 
	step2_time datetime(0), 
	step3_idea varchar(200), 
	step3_user char(36), 
	step3_time datetime(0), 
	step_status varchar(20), 
	primary key (id)
);	

create table t_information
 (	
	id char(36) not null, 
	organization_id char(36), 
	project_name varchar(200), 
	address varchar(200), 
	developer varchar(200), 
	epc_corporation varchar(200), 
	variety varchar(100), 
	total_area varchar(20), 
	real_name varchar(20), 
	identification varchar(20), 
	contact varchar(100), 
	subscriber char(36), 
	trice datetime(0) default current_timestamp, 
	create_time datetime(0) default current_timestamp, 
	create_user char(36), 
	update_time datetime(0) default current_timestamp, 
	update_user char(36), 
	description varchar(500), 
	primary key (id)
);	
