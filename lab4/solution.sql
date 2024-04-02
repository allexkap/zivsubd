-- 1 --
create table tbl (
    key integer,
    value integer
);

-- 2 --
grant all privileges on all tables in schema public to user1;
grant insert, select, update on all tables in schema public to user2;
grant delete on all tables in schema public to user3 with grant option;

-- 3 --
set role user3;
grant delete on all tables in schema public to user4;
reset role;

-- 4 --
revoke all privileges on all tables in schema public from user1;
revoke all privileges on all tables in schema public from user2;
revoke all privileges on all tables in schema public from user3 cascade;

-- 5 --
create schema sub1 authorization user1;
create schema sub2 authorization user2;
create table sub1.tbl (
    key integer,
    value integer
);
create table sub2.tbl (
    value integer,
    info varchar
);

-- 6 --
create view comb as
select tbl1.key as key, tbl1.value as value, tbl2.info as info
from sub1.tbl as tbl1, sub2.tbl as tbl2
where tbl1.value = tbl2.value
order by tbl1.key;

-- 7 --
grant select on tbl to user1;
alter table tbl enable row level security;
create policy key_policy on tbl for all to user1 using (key < 5);
-- current_role?

-- 8 --
create function logging() returns trigger as $$
declare
    info varchar;
begin
    case lower(tg_op)
        when 'insert' then info = new;
        when 'update' then info = old || ' -> ' || new;
        when 'delete' then info = old;
    else
        return new;
    end case;
    raise notice '%: %.% % by %: %', tg_name, tg_table_schema, tg_table_name, tg_op, current_role, info;
    return new;
end
$$ language plpgsql;

create trigger log_trigger
before insert or update or delete
on tbl
for each row
execute procedure logging();
