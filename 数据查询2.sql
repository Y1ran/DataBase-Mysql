/*数据查询语言*/
#2017.11.15#

use students_id;
#基本语句

SELECT [All|Distinct] <expr of columns> [as 别名] ...
From <表名> [as 别名]... | (<select 派生表>[As] <别名>
[Where + 条件表达式（包括：比较，IN,EXISTS,AND,LIKE等)
[Group by <列名> [Having<Expr>]] *所选列必须在Group或聚集中
[Order by <列名> [ASC|DESC]
;

练习
select * from student;

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

insert into SC values('201215121',"1","92");
insert into SC values('201215121',"2","85");
insert into SC values('201215121',"3","88");
insert into SC values('201215122',"2","90");
insert into SC values('201215122',"3","80");

delete from Student_2 where Sno="201215122";
#insert into Student_2(Sdept) values("CS");

alter table SC drop primary key;

Select * from Student_2;

Select Student_2.*,SC.*
From Student_2,SC Where Student_2.Sno=SC.Sno;

自然连接
Select Student.Sno,Sname,Sex,Sage,Sdept,Cno,Grade
From Student,SC
Where Student.Sno=SC.Sno;
/*
Drop table Student;
Alter table Student_2 rename to Student;
*/
查询选了2号并且成绩大于90分的
Select Student.Sno,Sname
From Student,SC where Student.Sno=SC.Sno And SC.Cno='2'
And SC.Grade >= 90;

自身连接（为同一张表赋不同名称）
Insert into Student values(
'201215123','王敏','0','18',"MA");
Insert into Student values(
'201215125','张立','1','19',"IS");

外连接
Select student.Sno,Sname,Sex,Sage,Sdept,Cno,Grade
From Student right outer join SC on(student.Sno=SC.Sno);

嵌套查询
Select Student.sno,Sname from student
where Sno in
	(Select Sno from SC where
    Cno='2')
order by Sno DESC;

1.不相关子查询
查询与刘晨所在系的同学（分为AB两种实现)
a.嵌套查询
Select Student.Sno,Sname,Sdept
From Student where Sdept in
	(Select Sdept from Student where
    Sname="刘晨");
    
b.自身连接
Select gg.Sno,gg.Sname,gg.sdept
From Student gg,student mm
where mm.Sname = "刘晨" and mm.Sdept = gg.sdept;

2.相关子查询

找出每个学生超过他课程平均分的课程号
Select Sno,Cno From SC x
where Grade >= (
	Select Avg(Grade) From SC y where y.sno = x.sno);
/*
Select x.Sno,x.cno From SC x,Sc y
where x.sno = y.sno 
group by cno
having avg(y.grade) > 88;
*/
**相关子查询会自动遍历内外，不相关则一次求解

3.Any,All谓词与聚集函数，IN运算符的关系

Select sname,sage from Student
where sage < any #等价于IN
	(select max(sage) from student where sdept="CS"
    )
And sdept <> "CS";

Select sname,sage from student
where sage < #MIN聚集函数等价于ALL
	(select min(sage) from student
    where sdept="CS")
And sdept != "CS";

*注意，EXISTS返回布尔值，父查询根据真假判断是否选择

4.基于派生表的查询

Select sno,cno from sc
(select sno, avg(grade) from sc group by sno) as 
	avg_sc(avg_sno,avg_grade)
	where sc.sno = avg_sc.avg_sno and 
sc.grade >= avg_sc.avg_grade;