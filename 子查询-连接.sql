//Join的使用

USe mooc;
	Select * from tdb_goods group by goods_id ASC;
ALTER TABLE tb_cates rename to goods_cate;
   INSERT goods_cate(cate_name) VALUES('路由器'),('交换机'),('网卡');

   INSERT goods_brands(brand_name) VALUES('海尔'),('清华同方'),('神舟');
-- 在tdb_goods数据表写入任意记录

//通过这三列数据可以发现，当ID不同时存在（插入）两张表时，内连接无法查询到记录
   INSERT tdb_goods(goods_name,cate_id,brand_id,goods_price) VALUES(' LaserJet Pro P1606dn 黑白激光打印机','12','4','1849');
   INSERT goods_brands(brand_name) VALUES('LaserJet Pro P1606dn 黑白激光打印机');
   INSERT goods_cate(cate_name) VALUES('黑白激光打印机');
   
Show columns from tdb_goods;
Show tables from mooc;
describe goods_cate;
describe goods_brands;

//确保上面两张表的各字段数据类型是否一致

**内连接**

Select goods_id, goods_name, cate_name From
	tdb_goods INNER JOIN goods_cate On
    tdb_goods.cate_id = goods_cate.cate_id;
/*新增的三种产品无法显示在内连接中*/

Select * from goods_brands;

**外连接**

Select goods_id, goods_name, brand_name From
	tdb_goods LEFT OUTER JOIN goods_brands On
    tdb_goods.cate_id = goods_brands.brand_id;
    
    truncate goods_brands; /*清楚表内数据之后，外连接的参照列全部为NULL*/
    
**多表连接**

Select goods_id, goods_name, a.cate_id, a.brand_id, goods_price, is_show, is_saleoff
	from tdb_goods AS a INNER JOIN
		goods_brands as b on a.brand_id = b.brand_id INNER JOIN
			goods_cate as c on a.cate_id = c.cate_id;
            
Drop table goods_brands;