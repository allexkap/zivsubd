-- 1 --
-- sudo -i -u postgres
-- createuser --interactive

-- 2 --
-- createdb n33491_410

-- 3 --
-- psql -d n33491_410

-- 4 --
create schema n33491_410_schema_lab1;

-- 5 --
create table n33491_410_tbl1 ();
create table n33491_410_schema_lab1.n33491_410_tbl2 ();

-- 6 --
create table n33491_410_schema_lab1.n33491_410_table_i5 (
    c0 integer,
    c1 varchar,
    c2 char,
    c3 timestamp,
    c4 date,
    c5 bytea
);

-- 7 --
create table n33491_410_schema_lab1.n33491_410_table_i6 (
    c0 integer default 34,
    c1 interval
);

-- 8 --
create type n33491_410_schema_lab1.n33491_410_type as (
    c0 real,
    c1 real,
    c2 date,
    c3 bytea
);

-- 9 --
create type n33491_410_schema_lab1.n33491_410_enum as enum (
    'bolshoi',
    'sredniy',
    'malenkiy'
);

-- 10 --
create domain n33491_410_schema_lab1.n33491_410_domain as integer
check (
    100 <= value and value < 1000
);

-- 11 --
create sequence n33491_410_schema_lab1.n33491_410_seq as integer
start with 1000
increment by -1
maxvalue 1000;

-- 12 --
create index n33491_410_idx1
on n33491_410_schema_lab1.n33491_410_table_i5 (c0);

-- 13 --
create index n33491_410_idx2
on n33491_410_schema_lab1.n33491_410_table_i5 (c0, c4);

-- 14 --
create index n33491_410_idx3
on n33491_410_schema_lab1.n33491_410_table_i5 ((c0%10));

-- 15 --
create index n33491_410_idx4
on n33491_410_schema_lab1.n33491_410_table_i5 (c0)
where 100 <= c0 and c0 <= 1000;

-- 16 --
create table n33491_410_schema_lab1.n33491_410_notnull (
    c0 integer,
    c1 varchar,
    c2 char not null,
    c3 timestamp,
    c4 date,
    c5 bytea
);

-- 17 --
create table n33491_410_schema_lab1.n33491_410_unique (
    c0 integer,
    c1 varchar,
    c2 char,
    c3 timestamp,
    c4 date,
    c5 bytea,
    constraint r unique (c0, c2)
);

-- 18 --
create table n33491_410_schema_lab1.n33491_410_p2k (
    c0 integer primary key,
    c1 varchar,
    c2 char,
    c3 timestamp,
    c4 date,
    c5 bytea
);

-- 19 --
create table n33491_410_schema_lab1.n33491_410_check (
    c0 integer,
    c1 varchar,
    c2 char,
    c3 timestamp,
    c4 date,
    c5 bytea,
    check (c1 ~ '^[^a]*$')
);

-- 20 --
create view n33491_410_schema_lab1.n33491_410_view as
    select c1, c4 from n33491_410_schema_lab1.n33491_410_table_i5;

-- dropdb n33491_410
