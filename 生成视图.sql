use students_id;

#创建视图

CREATE VIEW MA_student
AS
	Select sno,sname,sage
    from student
    where sdept = 'MA'
with check option;

Select * from IS_student;
Select * from IS_S13;

Drop view CS_student restrict;

#创建基于多个表的视图

Create view IS_S13(S1,S2,S3)
AS
	SELECT student.sno,IS_student.sname,student.sage
    from student,IS_student
    Where sdept = 'IS' AND
    student.sno = IS_student.sno;
#这种视图可以创建于一个基本表和另一个视图上
#视图也是一种表，作为虚拟表而存在于数据字典中

Select * from
	(Select sno, sage
    from sc
    group by sno)
AS 
	IS_student(sno,sage)
    where sage != 0;
    
对于update，有with check option，
要保证update后，数据要被视图查询出来

对于delete，有无with check option都一样

对于insert，有with check option，
要保证insert后，数据要被视图查询出来

对于没有where子句的视图，使用with check option是多余的

创建视图的完整方法：
CREATE [OR REPLACE] [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
DEFINER = `root`@`localhost` 
SQL SECURITY DEFINER
    VIEW view_name [(column_list)]
    AS select_statement
    [WITH [CASCADED | LOCAL] CHECK OPTION]
    

括号中的OR REPLACE关键字是可选的。
如果当前数据库中已经存在指定名称的视图时，没有该关键字，
将会提示错误信息；如果使用了OR REPLACE关键字，则当前正在创建的视图会覆盖掉原来同名的视图。
[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
ALGORITHM子句表示使用何种算法来处理视图。此外，它并不属于标准SQL的一部分，而是MySQL对标准SQL进行的功能扩展。

ALGORITHM可以设置三个值：MERGE、TEMPTABLE或UNDEFINED。如果没有ALGORITHM子句，则默认值为UNDEFINED(未定义的)。 
(对于MERGE，会将引用视图的语句的文本与视图定义合并起来，使得视图定义的某一部分取代语句的对应部分。
对于TEMPTABLE，视图的结果将被置于临时表中，然后使用它执行语句。
对于UNDEFINED，MySQL将选择所要使用的算法。如果可能，它倾向于MERGE而不是TEMPTABLE，这是因为MERGE通常更有效，
)

而且如果使用了临时表，视图是不可更新的。
之所以提供TEMPTABLE选项，是因为TEMPTABLE在创建临时表之后、并在完成语句处理之前，能够释放基表上的锁定。
与MERGE算法相比，锁定释放的速度更快，这样，使用视图的其他客户端不会被屏蔽过长时间。
此外，MERGE算法要求视图中的行和基表中的行具有一对一的关系。如果视图包含聚合函数
(SUM(), MIN(), MAX(), COUNT()等)、
DISTINCT、GROUP BY、HAVING、UNION或UNION ALL、
没有基表的引用文字值(例如：SELECT 'hello';)
等结构中的任何一种，将失去一对一的关系，此时必须使用临时表取而代之。