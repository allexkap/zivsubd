-- 2 --
update n33491_410_schema_lab1.n33491_410_p2k set i2='3' where i0 < (select avg(i0) from n33491_410_schema_lab1.n33491_410_check);

-- 3 --
delete from n33491_410_schema_lab1.n33491_410_check where i2 in (select i2 from n33491_410_schema_lab1.n33491_410_table_i5 where i0<3);

-- 4 --
select i0, i2, i3 from n33491_410_schema_lab1.n33491_410_table_i5;

-- 5 --
select * from n33491_410_schema_lab1.n33491_410_table_i5 where i0<3;

-- 6 --
select * from n33491_410_schema_lab1.n33491_410_unique, n33491_410_schema_lab1.n33491_410_p2k;

-- 7 --
select * from n33491_410_schema_lab1.n33491_410_check where i2 in (select i2 from n33491_410_schema_lab1.n33491_410_table_i5 where i0<3);

-- 8 --
select sum(i0) from n33491_410_schema_lab1.n33491_410_check;
select avg(i0) from n33491_410_schema_lab1.n33491_410_check;
select min(i0) from n33491_410_schema_lab1.n33491_410_check;
select max(i0) from n33491_410_schema_lab1.n33491_410_check;

-- 9 --
select * from n33491_410_schema_lab1.n33491_410_table_i5 order by i0 asc;

-- 10 -- 
select * from n33491_410_schema_lab1.n33491_4_10_table_i5 order by i0 desc limit 4;

-- 11.2 --
insert into n33491_410_schema_lab1.n33491_410_check values (6, '52', '6', '05-05-5555', '05-05-5555', '/x55555555');
insert into n33491_410_schema_lab1.n33491_410_check values (4, '55', '7', '05-05-5555', '05-05-5555', '/x55555555');
insert into n33491_410_schema_lab1.n33491_410_check values (5, '53', '5', '05-05-5555', '05-05-5555', '/x55555555');
insert into n33491_410_schema_lab1.n33491_410_check values (7, '55', '8', '05-05-5555', '05-05-5555', '/x55555555');
select sum(i0), i4 from n33491_410_schema_lab1.n33491_410_check group by i4;

-- 12 --
with t1 as (select sum(i0) as i0, i4 from n33491_410_schema_lab1.n33491_410_check group by i4) select * from t1 where i0 > 2;
