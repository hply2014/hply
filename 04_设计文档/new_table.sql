/*
-- Query: SELECT * FROM hplydb_new.new_table
LIMIT 0, 1000

-- Date: 2014-07-14 22:41
*/

CREATE TABLE `new_table` (
  `id` char(36) NOT NULL,
  `t1` varchar(45) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `t3` datetime DEFAULT NULL,
  `t4` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('6277b768-0b5e-11e4-ba8f-001c42328937','this is 中国',20,'2014-07-14 22:04:02',3.1415926579893);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('631d825b-0b5e-11e4-ba8f-001c42328937','this is 中国',23,'2014-07-14 22:04:03',3.1415926579893);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('637b5267-0b5e-11e4-ba8f-001c42328937','this is 中国',20,'2014-07-14 22:04:04',3.1415926579893);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('639fb87e-0b5e-11e4-ba8f-001c42328937','this is 中国',20,'2014-07-14 22:04:04',3.1415926579893);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('63d80d95-0b5e-11e4-ba8f-001c42328937','this is 中国',21,'2014-07-14 22:04:04',21.345);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('642b110d-0b5e-11e4-ba8f-001c42328937','this is 中国',20,'2014-07-14 22:04:05',3.1415926579893);
INSERT INTO `new_table` (`id`,`t1`,`t2`,`t3`,`t4`) VALUES ('644e8ea3-0b5e-11e4-ba8f-001c42328937','this is 中国',20,'2014-07-14 22:04:05',3.1415926579893);
