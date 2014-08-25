CREATE TABLE `t_hply_user` (
  `id` varchar(50) NOT NULL,
  `login_id` varchar(50) ,
  `password` varchar(50) ,
  `real_name` varchar(50) ,
  `last_login_ip` varchar(50) ,
  `last_login_time` datetime,
  `login_count` int,
  `fail_count` int ,
  `lock_time` datetime,
  `create_user_id` varchar(45) ,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `enabled` varchar(50) ,
  `level`int ,
  `description` varchar(500) ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `test1` (
  `id` varchar(50) NOT NULL,
  `t1` varchar(50) DEFAULT NULL,
  `t2` datetime DEFAULT CURRENT_TIMESTAMP,
  `t3` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

