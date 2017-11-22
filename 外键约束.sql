
#外键约束,province

use world;

create table tb4(
id smallint unsigned primary key auto_increment,
pname varchar(20) not null
);

show create table tb4;

#User表
Create table users(
id smallint unsigned primary key auto_increment,
username varchar(10) not null,
pid smallint unsigned, #ID与PID数据类型应相同
foreign key (pid) references tb4 (id)
);

show indexes from tb4;

INSERT INTO provinces(Pname) VALUES("Sichuan")
SELECT * FROM users
ALTER TABLE provinces ADD COLUMN Pnumber SMALLINT UNSIGNED
NOT NULL
INSERT INTO provinces(Pname,Pnumber) VALUES("SHAANXI","012")