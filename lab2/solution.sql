-- 2 --
update n33491_410_schema_lab1.n33491_410_p2k set c2='3' where c0 < (select avg(c0) from n33491_410_schema_lab1.n33491_410_check);

-- 3 --
delete from n33491_410_schema_lab1.n33491_410_check where c2 in (select c2 from n33491_410_schema_lab1.n33491_410_table_i5 where c0<3);

-- 4 --
select c0, c2, c3 from n33491_410_schema_lab1.n33491_410_table_i5;

-- 5 --
select * from n33491_410_schema_lab1.n33491_410_table_i5 where c0<3;

-- 6 --
select * from n33491_410_schema_lab1.n33491_410_unique, n33491_410_schema_lab1.n33491_410_p2k;

-- 7 --
select * from n33491_410_schema_lab1.n33491_410_check where c2 in (select c2 from n33491_410_schema_lab1.n33491_410_table_i5 where c0<3);

-- 8 --
select sum(c0) from n33491_410_schema_lab1.n33491_410_check;
select avg(c0) from n33491_410_schema_lab1.n33491_410_check;
select min(c0) from n33491_410_schema_lab1.n33491_410_check;
select max(c0) from n33491_410_schema_lab1.n33491_410_check;

-- 9 --
select * from n33491_410_schema_lab1.n33491_410_table_i5 order by c0 asc;

-- 10 -- 
select * from n33491_410_schema_lab1.n33491_410_table_i5 order by c0 desc limit 4;

-- 11 --
select sum(c0), c5 from n33491_410_schema_lab1.n33491_410_check group by c5;

-- 12 --
with t1 as (select sum(c0) as c0, c5 from n33491_410_schema_lab1.n33491_410_check group by c5) select * from t1 where c0 > 2;
