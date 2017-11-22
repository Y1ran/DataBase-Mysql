create database world2;
use world2;

create schema world2;
drop schema students_id cascade;
#RESTRICT与CASCADE删除只在表级可用


use world;
show columns from users3;

select * from city

set serch_path to "test";

Create table users3(
id smallint unsigned primary key auto_increment,
username varchar(10) not null,
pid smallint unsigned, #ID与PID数据类型应相同
foreign key (pid) references users (id)
);

#对字段重命名
describe users3;
alter table users3 change username users_n varchar(20);


#MYSQL中,有REST，也会删除，除非有外键
drop table users3 restrict;

alter table users2 add ppt smallint unsigned;
alter table users2 add primary key(username);

use world;

#创建视图与查询视图
create view Lang_c as
select ID,CountryCode,Population
from city where CountryCode='NLD';

DESC Lang_c;
select * from Lang_c;

//
drop table city restrict; 