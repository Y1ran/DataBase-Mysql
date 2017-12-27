-- 无限分类的数据表设计

   CREATE TABLE tdb_goods_types(
     type_id   SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     type_name VARCHAR(20) NOT NULL,
     parent_id SMALLINT UNSIGNED NOT NULL DEFAULT 0
  ); 

  INSERT tdb_goods_types(type_name,parent_id) VALUES('家用电器',DEFAULT);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑、办公',DEFAULT);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('大家电',1);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('生活电器',1);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('平板电视',3);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('空调',3);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('电风扇',4);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('饮水机',4);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑整机',2);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑配件',2);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('笔记本',9);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('超级本',9);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('游戏本',9);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('CPU',10);
  INSERT tdb_goods_types(type_name,parent_id) VALUES('主机',10);
  
  
  -- 查找所有分类及其父类

  SELECT s.type_id,s.type_name,p.type_name FROM tdb_goods_types AS s LEFT JOIN tdb_goods_types AS  p ON s.parent_id = p.type_id;
   
-- 查找所有分类及其子类

  SELECT p.type_id,p.type_name,s.type_name FROM tdb_goods_types AS p LEFT JOIN tdb_goods_types AS  s ON s.parent_id = p.type_id;

-- 查找所有分类及其子类的数目

  SELECT p.type_id,p.type_name,count(s.type_name) AS children_count FROM tdb_goods_types AS p LEFT JOIN tdb_goods_types AS s ON s.parent_id = p.type_id GROUP BY p.type_name ORDER BY p.type_id;



-- 为tdb_goods_types添加child_count字段

  ALTER TABLE tdb_goods_types ADD child_count MEDIUMINT UNSIGNED NOT NULL DEFAULT 0;



-- 将刚才查询到的子类数量更新到tdb_goods_types数据表

  UPDATE tdb_goods_types AS t1 INNER JOIN ( SELECT p.type_id,p.type_name,count(s.type_name) AS children_count FROM tdb_goods_types AS p 

  LEFT JOIN tdb_goods_types AS s ON s.parent_id = p.type_id 
                             
            GROUP BY p.type_name 

           ORDER BY p.type_id ) AS t2 

  		ON  t1.type_id = t2.type_id 

  		SET t1.child_count = t2.children_count;


-- 复制编号为12,20的两条记录

  SELECT * FROM tdb_goods WHERE goods_id IN (19,20);


-- INSERT ... SELECT实现复制

  INSERT tdb_goods(goods_name,cate_id,brand_id) SELECT goods_name,cate_id,brand_id FROM tdb_goods WHERE goods_id IN (19,20);

-- 查找重复记录

  SELECT goods_id,goods_name FROM tdb_goods GROUP BY goods_name HAVING count(goods_name) >= 2;

-- 删除重复记录

  DELETE t1 FROM tdb_goods AS t1 LEFT JOIN (SELECT goods_id,goods_name FROM tdb_goods GROUP BY goods_name HAVING count(goods_name) >= 2 ) AS t2  ON t1.goods_name = t2.goods_name  WHERE t1.goods_id > t2.goods_id;
