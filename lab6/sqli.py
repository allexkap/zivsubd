import sqlite3

create_table = """\
create table if not exists passwd (
    login text primary key,
    password text not null,
    shell text not null
);
"""
insert_values = """\
insert or replace into passwd values
    ('root', 'toor', '/bin/bash'),
    ('sunr', '1234', '/usr/bin/bash'),
    ('tmp', '', '/usr/bin/nologin');
"""
cmd = "select shell from passwd where login = '{}' and password = '{}'"

con = sqlite3.connect(':memory:')
cur = con.cursor()
cur.execute(create_table)
cur.execute(insert_values)


login, password = input('login: '), input('password: ')
shell = cur.execute(cmd.format(login, password)).fetchone()

if shell:
    print('user shell is', shell[0])
else:
    print('user not found')


# ' and false union select group_concat(sql) from sqlite_master --
# ' and false union select group_concat(login || ', ' || password || ', ' || shell, '; ') from passwd --
