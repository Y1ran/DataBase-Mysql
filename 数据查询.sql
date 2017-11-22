数据查询语句

use students_id;
show columns from student;

select * from student;

alter table student change sno sno int 
not null auto_increment;

insert into student values(0,"guo","1","CS",1991/11/12,18);
insert into student values(0,"bai","1","CS",1991/08/06,18);
insert into student values(0,"Chen","1","DS",1991/01/04,18);
insert into student values(0,"Li","1","OP",1991/12/10,18);
insert into student values(0,"LIU","1","CS",1991/01/07,18);
insert into student values(0,"sun","1","IS",1991/01/12,18);

1.单表查询
select sno, sname, dept
from student;

#选择+表达式
show columns from student;
select sname, 2017-age from student;

#字符串增加选择中的行
select sname, "Year of Birth", 2017-age, dept
from student;
Select sname NAME, "Year of Birth" BIRTH, 2017-age 
	BirthYear, dept Dept
From student;

２．投影，选择多个行
select sname from student;
select distinct dept from student;

select distinct sname from student
where dept = "CS";

select sno, dept from student
where sno > 4;

select sno, dept from student
where sno between 2 and 5; #包括上下标界

select sno, sname, dept from student
where dept like "C";

select sname, sno, dept from student
where dept like "_p";
#Escape'\' 为转意符号

select sno, dept from student
where sex is not null;

show columns from student;
select distinct sno, dept from student
where sex = "1"
order by sno ASC;

#聚集函数
select count(distinct sname) from student;
select avg(age) from student where sex = "1";
select max(dept) from student where sex = "1";

select sname, count(dept) from student
where sex = "1"
group by sname;