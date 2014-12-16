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
USE `hplydb_new`;

-- Dumping structure for procedure hplydb_new.proc_calc_interest_indate
DROP PROCEDURE IF EXISTS `proc_calc_interest_indate`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_indate`(IN `_trice` DATETIME)
proc:BEGIN
	-- 此过程由proc_calc_interest_main调用，用于计算传入的当日的所有未结清工程的利息
	declare _exec_no varchar(50);
	
	declare _id varchar(50);
	declare _project_id varchar(50);
	declare _amount decimal(20, 4);
	declare _offset_amount decimal(20, 4);
	declare _interest_amount decimal(20, 4);
	declare _interest_rate decimal(20, 4);
   declare _month_days int; -- 计算利率用的当月天数，20日及之前，则取上月的天数，20日之后取本月天数
	
	declare eof bit default 0;
	
	-- 所有有在传入时间之前的未还清的计息的往来欠款数据
		-- amount，负数是借出金额，正数是还入金额，此处 < 0
		-- offset_amount，已还本金，此处 > 0
		-- interest_rate，计息利率，为月利率
	declare cur_for_arrears cursor for 
	  select id, project_id, amount, offset_amount, interest_amount, interest_rate
			from t_arrears where project_id is not null and trice < date(_trice) and (amount + offset_amount) * interest_rate < 0;
	  		
	declare continue handler for not found set eof = 1;  
	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_calc_interest_indate', _trice, '开始执行');

  
	-- 计算当月天数，20日之前，则取上月的天数，否则是本月天数
  if day(_trice) > 20 then
      set _month_days = day(last_day(_trice));
    else
      set _month_days = day(last_day(_trice + interval - 1 month));
  end if;
  	
	open cur_for_arrears;
  
	top0: loop
    	fetch cur_for_arrears into _id, _project_id, _amount, _offset_amount, _interest_amount, _interest_rate;
    	if eof = 1 then
      	-- 游标遍历完成后，退出循环
      	leave top0;
    	end if;
    	
    	if (select count(*) from t_arrears_interest where arrears_id = _id and trice = date(_trice)) > 0 then
    		-- 该项目当天的利息已经算过，跳出本次循环，计算下一条数据
    		iterate top0;
    	end if;
    	
    	-- 插入往来欠款的利息明细数据
    	insert into t_arrears_interest(id, arrears_id, project_id, trice, amount, offset_amount, interest_amount, description) 
		 values (uuid(), _id, _project_id, 
		 				/*存储过程传入的参数*/ date(_trice), 
		 				/*计息基数*/ _amount + _offset_amount,
		 				/*已还的利息，拆分到当天的*/ 0,
		 				/*当天的利息*/ (_amount + _offset_amount) * _interest_rate / _month_days / 100,
            /*摘要*/ concat('(', _amount, ' + ', _offset_amount, ') * ', _interest_rate, '% / ', _month_days)
		 );
		 
		 update t_arrears set interest_amount = interest_amount + (_amount + _offset_amount) * _interest_rate / _month_days / 100 where id = _id;
	
	end loop top0;
   
	close cur_for_arrears;
	
	call proc_exec_log(_exec_no, 'proc_calc_interest_indate', _trice, '执行完成');

END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_calc_interest_main
DROP PROCEDURE IF EXISTS `proc_calc_interest_main`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_calc_interest_main`()
    COMMENT '计算所有工程往来欠款的利息，在proc_update_all_status中调用，即在系统每次登录时执行'
BEGIN

	declare _last_trice datetime;
  	declare _exec_no varchar(50);
	declare _count int default 0;
  	
	-- 获取存储过程执行记录中最后一次执行的计息时间
	select max(trice) into _last_trice from t_sys_exec_log where proc_name='proc_calc_interest_main';
	
	set _exec_no = uuid();
	call proc_exec_log(_exec_no, 'proc_calc_interest_main', now(), '开始执行');
	
	-- 如果为空，则从今天开始计息， 否则，从缺口的第二天，循环到今天，今天执行，算的是昨天的利息
	set _last_trice = if(_last_trice is null, now(), date_add(_last_trice, interval + 1 day));
	
	while date(_last_trice) <= curdate() do
		-- 计算当天的利息基数，利息金额等信息
		call proc_calc_interest_indate(_last_trice);
		set _last_trice = date_add(_last_trice, interval + 1 day);
		set _count = _count + 1;
	end while;
	
	call proc_exec_log(_exec_no, 'proc_calc_interest_main', now(), concat('执行完成，调用了proc_calc_interest_indate：', _count, '次。'));
	
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_clear_all
DROP PROCEDURE IF EXISTS `proc_clear_all`;
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
DROP PROCEDURE IF EXISTS `proc_exec_log`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_exec_log`(IN `_exec_no` VARCHAR(50), IN `_proc_name` VARCHAR(100), IN `_trice` DATETIME, IN `_exec_log` VARCHAR(500))
    COMMENT '数据库程序执行日志'
BEGIN
	insert into t_sys_exec_log(exec_no, proc_name, trice, exec_log, create_time) values(_exec_no, _proc_name, _trice, _exec_log, now());
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_import_init
DROP PROCEDURE IF EXISTS `proc_import_init`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_import_init`()
    COMMENT '导入初始化数据'
proc: BEGIN
	-- 导入初始化数据
	declare eof bit default 0; -- 定义游标的结束符
  	declare _exec_no varchar(50);
  	
  	declare _project_id varchar(50);
  	declare _id varchar(50);
	  	
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
										ifnull(_contract_amount, 0),
										_settlement_amount,
										_duty_paid_code,
										_duty_paid_time,
										_duty_paid_amount,
										if(_capital_occupied = '是', 1, 0),
										_project_status,
										_management_rate,
										/*先计算合同的应收管理费*/ _management_rate * _contract_amount /100,
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
				set _id = uuid();
				insert into t_party_billing(id, project_id, amount, tax_rate, step_status, trice) 
									values(_id, _project_id, _party_billing_amount, _tax_rate, 0, _trice);
				update t_party_billing set step_status = 1,step1_user='导入的',step1_time=now(), step1_idea='已审核' where id= _id;
			end if;
			
			-- 甲方收款
			if ifnull(_collections_amount, 0) > 0 then
				insert into t_collections(id, project_id, ticket_code, source_of, payment_type, amount, trice) 
									values(uuid(), _project_id, get_next_code('collections_code'),  '工程款', '现金', _collections_amount, _trice);
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
				insert into t_payment(id, project_id, ticket_code, pay_type, payment_item_id, amount, trice) 
									values(uuid(), _project_id, get_next_code('payment_code'), '现金', 
									(select id from t_payment_item where item_name='税金' limit 1), _tax_real_amount, _trice);
			end if;
			
			-- 垫付资金，历史垫资，不计算利息
			if ifnull(_arrears_amount, 0) > 0 then
				insert into t_arrears(id, project_id, arrears_code, arrears_type, pay_type, amount, interest_rate, trice) 
									values(uuid(), _project_id, get_next_code('arrears_code'), '垫资', '现金', -_arrears_amount, 0, _trice);
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


-- Dumping structure for procedure hplydb_new.proc_restore_interest
DROP PROCEDURE IF EXISTS `proc_restore_interest`;
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
      	-- 计算尚欠的本金，可能是上次还了一部分，但未还清，amount是欠款，offset_amount是部分还清的
      	set _amount = 0;
      	select interest_amount + offset_amount into _amount from t_arrears where serial_id = _serial_id;

      	update t_arrears_interest set offset_amount = if(_amount + _offset_amount >= 0, -interest_amount, _offset_amount), description=concat(ifnull(description, ''), '在', curdate(), '偿还利息', if(_amount + _offset_amount >= 0, -interest_amount, _offset_amount), '<br/>') where serial_id = _serial_id;
  
      	set _offset_amount = if(_amount + _offset_amount >= 0, _amount + _offset_amount, 0);
      	set _count = _count + 1;
		end if;
   end while;

	-- 还清了所有历史欠款，将剩余的本金存入当前行数据中
   update t_arrears set offset_amount = _offset_amount, description = concat(ifnull(description, ''), '偿还了', _count, '笔欠款的利息，剩余：', _offset_amount, '<br/>') where id = _arrears_id;
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_restore_principal
DROP PROCEDURE IF EXISTS `proc_restore_principal`;
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
      	-- 计算尚欠的本金，可能是上次还了一部分，但未还清，amount是欠款，offset_amount是部分还清的
      	set _amount = 0;
      	select amount + offset_amount into _amount from t_arrears where serial_id = _serial_id;

      	update t_arrears set offset_amount = if(_amount + _offset_amount >= 0, -amount, _offset_amount), description = concat(ifnull(description, ''), '在', curdate(), '偿还本金：', if(_amount + _offset_amount >= 0, -amount, _offset_amount), '<br/>') where serial_id = _serial_id;
  
      	set _offset_amount = if(_amount + _offset_amount >= 0, _amount + _offset_amount, 0);
      	set _count = _count + 1;
		end if;
   end while;

	-- 还清了所有历史欠款，将剩余的本金存入当前行数据中
   update t_arrears set offset_amount = _offset_amount, description = concat(ifnull(description, ''), '偿还了', _count, '笔欠款的本金，剩余：', _offset_amount, '<br/>') where id = _arrears_id;
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_set_param_value
DROP PROCEDURE IF EXISTS `proc_set_param_value`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_set_param_value`(IN `in_en_name` varCHAR(50), IN `in_param_value` varCHAR(100))
    COMMENT '设置参数值'
BEGIN
	replace into t_sys_parameter(id, en_name, param_value) values(uuid(), in_en_name, in_param_value);
END//
DELIMITER ;


-- Dumping structure for procedure hplydb_new.proc_update_all_status
DROP PROCEDURE IF EXISTS `proc_update_all_status`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_all_status`()
    COMMENT '将所有业务今天以前的数据的状态，从草稿修改为正式状态'
begin
  -- 07_往来欠款
 update t_arrears set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 05_收款情况
 update t_collections set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 02_合同补充协议
 update t_contract_change set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 04_客户开票情况
 update t_customer_billing set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 10_信息登记
 update t_information set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 03_甲方开票情况
 update t_party_billing set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 06_付款情况
 update t_payment set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 08_型材
 update t_profile set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
  -- 01_合同项目信息
 update t_project set status = 1 where create_time < curdate() and ifnull(status, 0) != 1;
 
 -- 计算所有工程往来欠款的利息
 call proc_calc_interest_main();
end//
DELIMITER ;


-- Dumping structure for function hplydb_new.get_next_code
DROP FUNCTION IF EXISTS `get_next_code`;
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
DROP FUNCTION IF EXISTS `get_param_value`;
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
DROP FUNCTION IF EXISTS `get_total_amount`;
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


-- Dumping structure for trigger hplydb_new.tr_arrears_after_insert
DROP TRIGGER IF EXISTS `tr_arrears_after_insert`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tr_arrears_after_insert` AFTER INSERT ON `t_arrears` FOR EACH ROW trig: BEGIN IF new.arrears_type = '垫资' THEN
 -- 垫资费用，计入汇总表
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
 				 /*登记时间*/ new.`trice`,
 				 /*备注*/ CONCAT('往来欠款的垫资费用，', IFNULL(new.description, '')), 
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
 				 /*arrears_amount，垫付资金，仅含本金*/ new.amount + arrears_amount,
 				 /* expected_value */ 0,
 				 /* profile_point */ profile_point,
				 /*version*/0, 
 				/*create_time*/ CURRENT_TIMESTAMP,
 				/*table_name*/ CONCAT('/arrears/detail/', new.id),
 				new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_collections_after_insert
DROP TRIGGER IF EXISTS `tr_collections_after_insert`;
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
				`table_name`, 
				`field_01`)
SELECT 
				 uuid(),
				 /*登记时间*/ new.`trice`,
				 /*备注*/ CONCAT('新的收款，',ifnull(new.description, '')) , 
				 `project_id`,
				 `organization_id`,
				 `project_code`,
				 `project_name`,
				 `contract_amount`,
				 /* change_amount */ 0,
					`change_total_amount`,
				 `settlement_amount`,
				 `management_rate`,
				 `management_plan_amount`, IF(new.source_of = '管理费', new.amount, 0) AS `management_real_amount`, IF(new.source_of = '管理费', new.amount, 0) + `management_total_amount` AS `management_total_amount`, IF(new.source_of = '管理费', management_owe_amount - new.amount, management_owe_amount) AS `management_owe_amount`,
				 /* party_billing_amount */ 0,
				 `party_billing_total_amount`,
				 /* collections_amount */ IF(new.source_of = '工程款', new.amount, 0),
				 /* collections_total_amount */ IF(new.source_of = '工程款', new.amount, 0) + collections_total_amount AS `collections_total_amount`,
				 /* collections_rate */ IF(new.source_of = '工程款', (new.amount + collections_total_amount) * 100/ IF(`settlement_amount` > 0, `settlement_amount`, `contract_amount` + change_total_amount), collections_rate)  as `collections_rate`,
				 `customer_billing_amount`,
				 `customer_billing_total_amount`,
				 /* payment_amount */ 0,
				 `payment_total_amount`,
				 `tax_rate`,
  				 `tax_plan_amount`,
  				 /* tax_real_amount */ 0,
  				 `tax_total_amount`,
  				 `tax_owe_amount`,
				 /* `arrears_amount` */ 0,
				 /* `expected_value` */ 0,
				 `profile_point`,
				 /*version*/0, 
				/*create_time*/ CURRENT_TIMESTAMP,
				/*table_name*/ concat('/collections/detail/', new.id),
 				new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_contract_change_after_insert
DROP TRIGGER IF EXISTS `tr_contract_change_after_insert`;
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('发生了调增，',ifnull(new.description, '')) , 
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
		 /* arrears_amount */ 0,
		 /* expected_value */ 0,
		 /* profile_point */ profile_point,
		 /*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ concat('/contractchange/detail/', new.id),
		 new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_customer_billing_after_insert
DROP TRIGGER IF EXISTS `tr_customer_billing_after_insert`;
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('新的客户开票，',ifnull(new.description, '')) , 
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
		 /* profile_point */ profile_point,
		 /*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ concat('/customerbilling/detail/', new.id),
		 new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_party_billing_after_insert
DROP TRIGGER IF EXISTS `tr_party_billing_after_insert`;
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
			`table_name`, 
			`field_01`)
SELECT 
			uuid(),
		 /*登记时间*/ new.`trice`,
		 /*备注*/ CONCAT('已审批的甲方开票，',ifnull(new.description, '')) , 
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
		 /* profile_point */ profile_point,
	/*version*/0, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ concat('/partybilling/detail/', new.id),
 		new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END IF; END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_payment_after_insert
DROP TRIGGER IF EXISTS `tr_payment_after_insert`;
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	 /*登记时间*/ new.`trice`,
	 /*备注*/ CONCAT('新增的付款，',ifnull(new.description, '')) , 
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
	 IF(new.payment_item_id!='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) as payment_amount,
	 payment_total_amount + IF(new.payment_item_id!='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) AS `payment_total_amount`,
	 `tax_rate`,
	 `tax_plan_amount`,
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) AS `tax_real_amount`, 
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', new.amount, 0) + tax_total_amount AS `tax_total_amount`, 
	 IF(new.payment_item_id='6cc29dc8-0cf4-4cf4-9ccd-98b076b41e24', tax_owe_amount - new.amount, tax_owe_amount) AS `tax_owe_amount`,
	 /*arrears_amount*/ 0,
	 /* expected_value */ 0,
	 /* profile_point */ profile_point,
	/*version*/0, 
	/*create_time*/ CURRENT_TIMESTAMP,
	/*table_name*/ concat('/payment/detail/', new.id),
 	new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_profile_after_insert
DROP TRIGGER IF EXISTS `tr_profile_after_insert`;
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
		`table_name`, 
		`field_01`)
SELECT 
			uuid(),
	 /*登记时间*/ new.`trice`,
	 /*备注*/ CONCAT('型材点，',ifnull(new.description, '')) , 
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
	 /* arrears_amount */ 0,
	 /* expected_value */ new.expected_value,
	 /* profile_point */ new.profile_point,
	/*version*/0, 
	/*create_time*/ CURRENT_TIMESTAMP,
	/*table_name*/ concat('/profile/detail/', new.id),
 	new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.project_id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_project_after_insert
DROP TRIGGER IF EXISTS `tr_project_after_insert`;
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
			`table_name`, 
			`field_01`)
		VALUES
			(uuid(),
			/*trice*/ new.trice, 
			/*description*/ CONCAT('创建新项目，', ifnull(new.description, '')) , 
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
			/*table_name*/ concat('/project/detail/', new.id),
 			new.update_user);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger hplydb_new.tr_project_after_update
DROP TRIGGER IF EXISTS `tr_project_after_update`;
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
			`table_name`, 
			`field_01`)
SELECT UUID(),
		 /*登记时间*/ NOW(),
		 /*备注*/ CONCAT('修改合同项目信息，', IFNULL(new.description, '')), 
		 `project_id`,
		 `organization_id`,
		 `project_code`,
		 `project_name`,
		 new.`contract_amount`,
		 /*change_amount*/ 0,
			change_total_amount,
		 new.`settlement_amount`,
		 new.`management_rate`,
		 /*直接修改了应收管理费总额*/ new.management_plan_amount AS `management_plan_amount`,
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
		 new.`tax_rate`,
		 new.tax_plan_amount AS `tax_plan_amount`,
		 /* tax_real_amount */ 0,
		 `tax_total_amount`,
		 (new.tax_plan_amount - tax_plan_amount) + `tax_owe_amount`,
		 `arrears_amount`,
		 /* expected_value */ 0,
		 /* profile_point */ profile_point,
		/*version*/ 1, 
		/*create_time*/ CURRENT_TIMESTAMP,
		/*table_name*/ CONCAT('/project/detail/', new.id), 
		new.update_user
FROM `t_project_summary`
WHERE serial_id=(
SELECT MAX(serial_id)
FROM t_project_summary
WHERE project_id=new.id AND VERSION >= 0); /*version =-1 作为删除标记*/ END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
