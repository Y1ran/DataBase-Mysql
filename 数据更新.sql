use students_id;

show columns from sc;
select * from student;
select * from sc;

#数据修改
insert into sc(sno,cno,grade)
	select sno,cno,avg(grade)
    from sc
    group by cno
    having avg(grade) >= 85;
/*Insert into 后面可以跟选择语句*/

update student set student.Sage = 19
where sno in
	(select sno from sc
	group by sno
    having avg(grade) >= 85);

alter table sc add primary key(grade);
alter table sc change grade grade int(10) primary key;
#上面两句等价


#删除记录
delete from student where 
sno in
	(select sno from sc
    group by sno
    having avg(grade) < 95);
    
select * from student;
show columns from student;
#alter table sc add foreign key(sno) 
#references student(sno);


insert into student values(
"201215127","陈晨",1,20,"IS");
insert into sc values(
"201215127",2,99);

update student set sex = null
where sno in
	(select sno from sc
    where grade > 85);cno = 1 or cno = 2
    group by sno
    having avg(grade) > 55);
    
#多行更新
UPDATE student

    SET sex = CASE sage  #CASE相当于THEN后面的VALUE

        WHEN 18 THEN 1

        WHEN 19 THEN 2

        WHEN 20 THEN 3

    END

WHERE sno IN 

		(select sno from sc
    where cno = 1 or cno = 2 or cno = 3
    
    group by grade
    
    having avg(grade) > 55);
    
select * from student;


#修改列,注意两种方式的区别
Alter table tb1 change old_colname new_name int..
Alter table tb1 modify old_colname int...[first|after]

#修改表名称，两种方式
Alter table tb1 rename to|as new_tbname
Rename table tb1 old_name to new_tbname;name2..name3.

