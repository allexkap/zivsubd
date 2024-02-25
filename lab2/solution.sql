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
