-- 1 --
create table transactions (
    name varchar,
    value integer
);
create table summary (
    name varchar,
    total integer
);

create or replace function aggreg() returns void as $$
begin
    delete from summary;
    with tmp as (select name, sum(value) as total from transactions group by name)
        insert into summary select * from tmp order by total desc;
end
$$ language plpgsql;


-- 2 --
create or replace function transactions_trigger() returns trigger as $$
begin
    perform * from aggreg();
    return new;
end
$$ language plpgsql;

create trigger transactions_trigger
after insert on transactions
execute procedure transactions_trigger();


-- 3 --
create table year23 (id int, ts date);
create table year24 (id int, ts date);

create view dates as
select * from year23 union select * from year24;

create or replace function dates_trigger() returns trigger as $$
declare
    tmp int;
begin
    tmp := extract(YEAR from NEW.ts);
    if tmp = 2024 then
        insert into year24 values (NEW.id, NEW.ts);
    elsif tmp = 2023 then
        insert into year23 values (NEW.id, NEW.ts);
    end if;
    return NEW;
end
$$ language plpgsql;

create trigger dates_trigger
instead of insert on dates
for each row
execute procedure dates_trigger();


-- 4 --
create table dict (
    key varchar,
    value varchar
);

create table digits (
    value varchar
);

create or replace function replace_trigger() returns trigger as $$
begin
    NEW.value := (select value from dict where (key = NEW.value));
    return NEW;
end
$$ language plpgsql;

create or replace trigger replace_trigger
before insert on digits
for each row
execute procedure replace_trigger();


-- 5 --
create table golden (
    value integer
);

create or replace function golden_sum() returns integer as $$
declare
    size integer;
    index integer;
begin
    size := (select count(*) from golden);
    index := size / ((1 + sqrt(5)) / 2);
    return (
        select sum(value) from (
            select row_number() over() as pos, * from golden
        ) where pos = index+1 or pos = size-index
    );
end
$$ language plpgsql;
