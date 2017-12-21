Create database MOOC;

Use MOOC;
SET NAMES utf8;

  CREATE TABLE IF NOT EXISTS tdb_goods(
    goods_id    SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    goods_name  VARCHAR(150) NOT NULL,
    goods_cate  VARCHAR(40)  NOT NULL,
    brand_name  VARCHAR(40)  NOT NULL,
    goods_price DECIMAL(15,3) UNSIGNED NOT NULL DEFAULT 0,
    is_show     BOOLEAN NOT NULL DEFAULT 1,
    is_saleoff  BOOLEAN NOT NULL DEFAULT 0
  );

ALTER TABLES tdb_goods CHARACTER SET utf8;

Delete from tdb_goods; //测试安全模式
  
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('R510VC 15.6英寸笔记本','笔记本','华硕','3399',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Y400N 14.0英寸笔记本电脑','笔记本','联想','4899',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('G150TH 15.6英寸游戏本','游戏本','雷神','8499',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X550CC 15.6英寸笔记本','笔记本','华硕','2799',DEFAULT,DEFAULT);
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X240(20ALA0EYCD) 12.5英寸超极本','超级本','联想','4999',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('U330P 13.3英寸超极本','超级本','联想','4299',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('SVP13226SCB 13.3英寸触控超极本','超级本','索尼','7999',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iPad mini MD531CH/A 7.9英寸平板电脑','平板电脑','苹果','1998',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iPad Air MD788CH/A 9.7英寸平板电脑 （16G WiFi版）','平板电脑','苹果','3388',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' iPad mini ME279CH/A 配备 Retina 显示屏 7.9英寸平板电脑 （16G WiFi版）','平板电脑','苹果','2788',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('IdeaCentre C340 20英寸一体电脑 ','台式机','联想','3499',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Vostro 3800-R1206 台式电脑','台式机','戴尔','2899',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iMac ME086CH/A 21.5英寸一体电脑','台式机','苹果','9188',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('AT7-7414LP 台式电脑 （i5-3450四核 4G 500G 2G独显 DVD 键鼠 Linux ）','台式机','宏碁','3699',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Z220SFF F4F06PA工作站','服务器/工作站','惠普','4288',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('PowerEdge T110 II服务器','服务器/工作站','戴尔','5388',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Mac Pro MD878CH/A 专业级台式电脑','服务器/工作站','苹果','28888',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' HMZ-T3W 头戴显示设备','笔记本配件','索尼','6999',DEFAULT,DEFAULT);

 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('商务双肩背包','笔记本配件','索尼','99',DEFAULT,DEFAULT);

 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X3250 M4机架式服务器 2583i14','服务器/工作站','IBM','6888',DEFAULT,DEFAULT);
 
 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('玄龙精英版 笔记本散热器','笔记本配件','九州风神',default,DEFAULT,DEFAULT);

 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' HMZ-T3W 头戴显示设备','笔记本配件','索尼','6999',DEFAULT,DEFAULT);

 INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('商务双肩背包','笔记本配件','索尼','99',DEFAULT,DEFAULT);
 
 Select count(goods_id) as How_many from tdb_goods;
 Select * from tdb_goods\G
 
 /**************
 **子查询练习**
 **************/

//查询价格大于平均价格的产品
select ROUND(AVG(goods_price),1) as Avgerage_price from tdb_goods;
写法一
select goods_id, goods_name, goods_price from tdb_goods 
    group by goods_price, goods_id /*GROUP BY可以放置任意字段作为函数依据*/
    having
	goods_price >= 
    ROUND(AVG(goods_price),1);
写法二
select goods_id, goods_name, goods_price from tdb_goods 
    where goods_price >=  (select
    ROUND(AVG(goods_price),1) from tdb_goods); 
    

//查询价格大于超极本的笔记本
select goods_id, goods_name, goods_price from tdb_goods 
    where goods_price >=  any (select
    goods_price from tdb_goods where goods_cate = '超级本'); 
