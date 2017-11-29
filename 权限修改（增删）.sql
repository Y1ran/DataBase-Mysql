#测试数据库安全操作

use students_id;

show columns from student;
SELECT * FROM students_id.student;

revoke select on table 
student
from root@localhost;

方法一
SELECT DISTINCT CONCAT
('User: ''',user,'''@''',host,''';') 
AS query FROM mysql.user;

方法二
select * from mysql.user;

/查看USER表的结构: desc mysql.user;

插入：
insert into mysql.user(host,user) values
("localhost","test");

#show create table;

查看用户的权限：
Show grants for root@localhost;

对属性列授权：
Grant update(sno), select, insert
on table Student  #多个属性不能同时授予多张表
to root@localhost
with grant option;

grant all privileges
on table student,sc
to root@localhost,mysql.sys@localhost; #！无法多张表授权

删除权限：

Revoke insert on table 
student from root@localhost #没有CASCADE和restrict;

DELETE FROM mysql.user WHERE User="mysql.sys" and 
Host="localhost";

创建用户：

Create user if not exists "test2";

grant all privileges on *.* to 
testuser@localhost identified by "123456";

select * from mysql.user;

更改新用户权限：
grant update(sno) on
table student to test2;

show grants for 'test2'@'%';

给新用户设置密码：
grant all privileges on *.* to test2
identified by "12345" 
with grant option; #允许新用户将权限授予他人

UPDATE mysql.user SET user= 'root'
           WHERE user='new_password';
#如上，权限可以用GRANT语句操作，也可以直接使用UPDATE
#将USER表当做一张表来操作

