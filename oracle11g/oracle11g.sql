--显示所有用户名
select username,password from dba_users;
select * from all_users;
--添加用户 test
create user test identified by 12345678;


--修改用户密码 test
alter user test identified by test;
--查询所有角色
select * from dba_roles;

--给test用户赋予角色
grant connect, resource,dba to test;
--查询系统用户的角色
select * from V$PWFILE_USERS
 select * from dba_role_privs;
--查询角色的权限
select * from session_privs;
SELECT * FROM DBA_ROLE_PRIVS;

--查询当前用户在lance数据库的所有表名
select lance.table_name from user_tables lance;


