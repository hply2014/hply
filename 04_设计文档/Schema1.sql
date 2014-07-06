/*  -------------------------------------------------- */
/*  Generated by Enterprise Architect Version 11.0.1106*/
/*  Created On : ������, 05 ����, 2014 */
/*  DBMS       : MySql */
/*  -------------------------------------------------- */


SET FOREIGN_KEY_CHECKS=0;


/* Drop Tables, Stored Procedures and Views */

DROP TABLE IF EXISTS t_sys_authorization CASCADE
;
DROP TABLE IF EXISTS t_sys_parameter CASCADE
;
DROP TABLE IF EXISTS t_sys_resource CASCADE
;
DROP TABLE IF EXISTS t_sys_user CASCADE
;

/* Create Tables */
CREATE TABLE t_sys_authorization
(
	id VARCHAR(10) NOT NULL,
	resource_id VARCHAR(10),
	user_id VARCHAR(10),
	create_time DATETIME(0) DEFAULT CURRENT_TIMESTAMP,
	create_user VARCHAR(10),
	PRIMARY KEY (id),
	KEY (resource_id),
	KEY (user_id)

) 
;


CREATE TABLE t_sys_parameter
(
	id VARCHAR(10) NOT NULL,
	en_name VARCHAR(100),
	cn_name VARCHAR(100),
	param_value VARCHAR(500),
	default_value VARCHAR(500),
	is_inner INT DEFAULT 0,
	create_time DATETIME(0) DEFAULT CURRENT_TIMESTAMP,
	create_user VARCHAR(10),
	update_time DATETIME(0) DEFAULT CURRENT_TIMESTAMP,
	update_user VARCHAR(10),
	description VARCHAR(500),
	PRIMARY KEY (id)

) 
;


CREATE TABLE t_sys_resource
(
	id VARCHAR(10) NOT NULL,
	res_code VARCHAR(50),
	res_name VARCHAR(50),
	icon VARCHAR(200),
	res_path VARCHAR(500),
	res_url VARCHAR(500),
	res_type VARCHAR(50),
	order_by INT DEFAULT 0,
	parent_id VARCHAR(10),
	enabled INT DEFAULT 1,
	description VARCHAR(500),
	PRIMARY KEY (id)

) 
;


CREATE TABLE t_sys_user
(
	id VARCHAR(10) NOT NULL,
	login_name VARCHAR(50),
	real_name VARCHAR(50),
	department VARCHAR(50),
	password VARCHAR(100),
	last_login_ip VARCHAR(50),
	last_login_time DATETIME(0),
	fails INT DEFAULT 0,
	logined INT DEFAULT 0,
	position VARCHAR(50),
	enabled INT DEFAULT 1,
	order_by INT DEFAULT 0,
	create_time DATETIME(0) DEFAULT CURRENT_TIMESTAMP,
	create_user VARCHAR(10),
	update_time DATETIME(0) DEFAULT CURRENT_TIMESTAMP,
	update_user VARCHAR(10),
	description VARCHAR(500),
	PRIMARY KEY (id)

) 
;



SET FOREIGN_KEY_CHECKS=1;
