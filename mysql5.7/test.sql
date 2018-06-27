###常用mysql命令
#########################################数据库操作 start##########################
##显示所有数据库

show databases

##删除数据库 test
drop database test;
##创建数据库 test 
#utf8字符集"default character set  utf8 "
#大小写不敏感"collate utf8_general_ci";

create database  if not exists test2 default character set  utf8 collate utf8_general_ci;


##使用数据库 test

use test; 



#########################################数据库操作 end##########################

#########################################mysql注释 start ##########################
/*
 1.单行注释"#"  ,等价于c语言的"//"
 2.单行注释第二种写法"-- 空格", 注意"--"和注释内容之间要有空格
 3.多行注释 类似于c语言的多行注释
*/
#########################################mysql注释 end##########################


#########################################数据表操作 start##########################

##显示数据库test的所有表 
show tables;   

##删除表 test
             
drop table test;						 
##创建表test         
create table test(
	cust_id int not null auto_increment,    #auto_increment 自动增长属性，一般用于主键，数值自动加1
	cust_name char(50) not null,#not null 非空限制
	cust_address  char(50) null,   
	cust_city char(50) null,
	cust_state char(5) null,
	cust_zip char(10) null,
	cust_country char(50) null,
	cust_contact char(50) null,
	cust_email char(255) null,
	primary key (cust_id)   #定义主键primary_key (key_id)
) engine = InnoDB  default charset =utf8 ;  #engine = InnoDB设置存储引擎，default charset=utf8 设置编码格式   


##显示表结构

show columns from test;
#或
describe test;
     

show grants;
#########################################数据表操作 end############################

##插入数据到test表
/*

insert into table_name
[(field1,field2...fieldN)]
values
(value1,value2...valueN)

[,(value1,value2...valueN)]
[,(value1,value2...valueN)]
[,(value1,value2...valueN)];

注：SQL语句是不区分大小写，不过习惯是将SQL关键字使用大写，对表名和列名使用小写，便于阅读


*/
insert into test(cust_id,cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email)
VALUES(10001, 'Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com');
INSERT INTO test(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES(10002, 'Mouse House', '333 Fromage Lane', 'Columbus', 'OH', '43333', 'USA', 'Jerry Mouse');
INSERT INTO test(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES(10003, 'Wascals', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'rabbit@wascally.com');
INSERT INTO test(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES(10004, 'Yosemite Place', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Y Sam', 'sam@yosemite.com');
INSERT INTO test(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES(10005, 'E Fudd', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'E Fudd');
commit;  #提交事务

#删除语句
/*
delete from table_name
[where condition1[and][or]condition2]
*/



#########################################select 语句 start############################

/* 
select column_name1,column_name2...column_nameN
from table_name1,table_name2...table_nameN
[where condition1 [and][or]condition2...] 
[limit num1[,num2]]
[offset num] 
[order by]

1.select命令可以读取一列或多列记录（列之间使用逗号分隔），使用*代替所有记录

2.查询语句可以使用一个或者多个表，表之间用逗号隔开
3.where子句包含任何条件，and或者or指定一个或多个条件
4.limit  接受一个或者两个整数常量参数，
指定一个参数num2，表示返回记录行的最大数，初始记录行的偏移量默认为0
指定两个参数，num1表示返回记录行的偏移量 ,num2表示返回记录行的最大数；
5.offset    指定select语句开始查询的数据偏移量，默认为0  ,只能与带一个参数的limit结合使用

*/

##查询test表所有内容
select * from  test;
##查询单个列的内容
select cust_name from test;

##查询test 部分字段表内容

select cust_id,cust_name,cust_city 
from test;

##查询 test 前2两条记录

select * from test
limit 2;

##查询test表从第3条记录开始的3条记录
select * from test
limit 2,3;
#或
select* from test
limit 3
offset 2;

###使用完全限定的表名 (同时使用表名和列名)

select test.cust_name from test;
#########################################select 语句 end############################



#########################################where 子句 过滤数据 start############################

/*
where 子句相当于程序设计语言的if语句
条件可以是: 
=，！=，>,<,<=,>=,
and表示且
or 表示或                      
is null,is not null 判断某列是否为null   注：任何类型包括null与null进行=或者！=运算都返回false
regexp 正则
like  使用百分号%表示任意字符，获取含有某个字符的所有记录

注：mysql的where子句字符串比较不区分大小写 
可以使用binary 关键字设定where子句的字符串是区分大消息的

*/

##查询cust_id=10001用户信息
select * from test 
where binary cust_name="WascalS"  #可以使用binary 关键字设定where子句的字符串是区分大消息的
;
##查询首字母为c的用户信息

select * from test
where  cust_name regexp "^C";
 
##查询名字有ac的用户信息
select * from test
where  cust_name like "%ac%";

#########################################where 子句 过滤数据 end############################


#########################################order by 子句 排序数据 start############################


#########################################order by 子句 排序数据 start############################
