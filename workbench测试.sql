use test;

create table tb1(
username varchar(20),
age tinyint unsigned,
salary float(8,2) unsigned
);

select * from tb1

/*select database();*/

show tables from test;
show columns from "4";

use test;


INSERT INTO tb1 (username) VALUES("chen");
INSERT INTO tb1 VALUES("WAB",18,2400);

CREATE TABLE IF NOT EXISTS `test`.`4` (
  `idtable1` INT UNSIGNED NOT NULL,
  `table1col` VARCHAR(45) NULL DEFAULT NULL,
  `table1col1` VARCHAR(45) NOT NULL,
  `table1col2` VARCHAR(45) BINARY NULL,
  `table1col3` VARCHAR(45) NULL,
  `table1col4` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtable1`),
  UNIQUE INDEX `idtable1_UNIQUE` (`idtable1` ASC));

