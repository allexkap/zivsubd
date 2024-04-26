-- 0 --
create extension pgcrypto;

-- 1 --
create table users (
    login bytea,
    pswd text,
    data bytea
);

insert into users values (
    digest('unbreakablelogin', 'sha1'),
    crypt('verystrongpassword', gen_salt('md5'))
);

-- 2 --
insert into users (data) values (
    pgp_sym_encrypt_bytea('\x6875697461', 'unexpectedkey')
);

-- 1 --
select count(*) from users where
    login = digest('unbreakablelogin', 'sha1') and
    pswd = crypt('verystrongpassword', pswd);

-- 2 --
select pgp_sym_decrypt_bytea(data, 'unexpectedkey') from users;
