完整插入语句如下：

INSERT INTO table_names
SELECT [All|Distinct] <expr of columns> [as 别名] ...
From <表名> [as 别名]... | (<select 派生表>[As] <别名>
Where + 条件表达式（包括：比较，IN,EXISTS,AND,LIKE等)
Group by <列名> [Having<Expr>]] *所选列必须在Group或聚集中
Order by <列名> [ASC|DESC]
LIMIT n, m;

*****************************************
以下语句由于MYSQL重装，因此重新创建数据库
*****************************************
create database students;
use students;

drop database students;
select * from Student_2;
show databases;
show tables

Create table Student_2(
Sno int unsigned primary key,
Sname varchar(20) not null,
Sex tinyint unsigned default 1,
Sage smallint unsigned not null,
Sdept varchar(4) not null default 'CS'
);

alter table Student_2 change column Sno Student_2.Sno int
unsigned;
show columns from Student_2;
show columns from SC;

create table SC(
SC.Sno int unsigned,
Cno tinyint unsigned not null,
Grade smallint unsigned unique
);

insert into Student_2 values(
'201215121','李勇','1','20',"CS");
insert into Student_2 values(
'201215122','刘晨','0','19',"CS");
insert into Student_2 values(
'201215123','WA','0','17',"CS");
insert into Student_2 values(
'201215124','CC','0','22',"CS");
insert into Student_2 values(
'201215125','HH','0','21',"CS");


insert into SC values('201215121',"1","92");
insert into SC values('201215121',"2","85");
insert into SC values('201215121',"3","88");
insert into SC values('201215122',"2","90");
insert into SC values('201215122',"3","80");

select * from student_2 LIMIT 1,2;

Create table TEST(
ID int unsigned primary key auto_increment,
Sname varchar(20) not null
);

select * from student_2 order by SNO DESC LIMIT 1,5;

insert into test(Sname) select sname from student_2 
	where sage >= 18 order by sage ASC LIMIT 1,2; 
/*插入TEST表时，从STUDENT2中选择年龄大于18的学生名，
以升序排列，将第二个到第四个插入*/

Select * from test;