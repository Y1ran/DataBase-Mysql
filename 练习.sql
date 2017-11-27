SHOW columns FROM provinces1;
select * from provinces1;
ALTER table provinces1 ADD password VARCHAR(32)
NOT NULL AFTER ID;
alter table provinces1 ADD school varchar(10)
NOT NULL FIRST; 

DELETE FROM provinces1 WHERE age = 21;
alter table provinces1 DROP COLUMN username;

INSERT INTO provinces1(school, password, Pname, age)
VALUES("XISU", 23322, "Beijing", 21);

TINYINT unsigned
NOT NULL DEFAULT 10;