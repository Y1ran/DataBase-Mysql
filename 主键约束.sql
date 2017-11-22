#this is primary key test

use students_id;

CREATE TABLE tb3(
id SMALLINT unsigned auto_increment primary key,
username varchar(20) not null
);
#自增只能用于主键
show columns from tb3;

insert into tb3(username) values("tom");
insert into tb3(username) values("tom");
insert into tb3(username) values("tom");

select * from tb3;

drop table tb3;
#主键不可重复
#主键可以为空
CREATE TABLE tb3(
id SMALLINT unsigned,
username varchar(20) primary key
);

insert into tb3(username) values("");
select * from tb3;
insert into tb3 values("11","sv");
