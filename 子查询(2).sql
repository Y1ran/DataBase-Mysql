select * from mysql.user;
show variables like 'autocommit';

use mooc;
select * from tdb_goods;

**STEP 1**
//创建新的数据表作为外键INSERT 子查询插入
//用于第二步的模式分解（多表更新）

Create table if not exists tb_cates(
cate_id smallint unsigned not null auto_increment,
cate_name varchar(20) not null,
primary key(cate_id)
);

Select goods_cate From tdb_goods 
	group by goods_cate;
DESC tdb_goods; 
/*根据每一列的数据类型插入，即目标列和查询列必须一致*/



**STEP 2**
Insert INTO tb_cates(cate_name)   /*和select嵌套查询不同，insert不需要=(select)*/
	Select goods_cate From tdb_goods 
		group by goods_cate; 
        
Select * from tb_cates group by cate_id ASC;

//通过TB-cates中对应的序号将原表类别使用ID替代，即连接

Update tdb_goods 
	INNER join tb_cates 
	ON tdb_goods.goods_cate = tb_cates.cate_name
    SET tdb_goods.goods_cate = tb_cates.cate_id
    where tdb_goods.goods_id >= 1; /*安全模式下必须要WHERE+KEY进行UPDATE*/

**STEP 3**
//将STEP 1 & 2合并为一句

SELECT brand_name, count(brand_name)
	from tdb_goods GROUP BY goods_cate ASC;

Create Table goods_brands(
brand_id smallint unsigned auto_increment,
brand_name VARCHAR(40) not null,
primary key(brand_id)
)
Select brand_name from tdb_goods group by 
	brand_name;

SELECT * FROM goods_brands;

UPDATE tdb_goods as A INNER JOIN goods_brands AS b
	ON      /*使用join形成的外键称为“事实外键”，不需要FK声明*/
	A.brand_name = B.brand_name
    SET A.brand_name = B.brand_id;

//测试：修改原表数据类型

Alter table tdb_goods
Change goods_cate cate_id smallint unsigned not null,
Change brand_name brand_id smallint unsigned not null
;


ALTER TABLE tb_cates rename to goods_cate;
   INSERT goods_cate(cate_name) VALUES('路由器'),('交换机'),('网卡');

   INSERT goods_brands(brand_name) VALUES('海尔'),('清华同方'),('神舟');
-- 在tdb_goods数据表写入任意记录
   INSERT tdb_goods(goods_name,cate_id,brand_id,goods_price) VALUES(' LaserJet Pro P1606dn 黑白激光打印机','12','4','1849');


    