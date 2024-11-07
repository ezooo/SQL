create database jspbook;
use jspbook;
create table if not exists member
(
	id varchar(20) not null primary key,
    pw varchar(20),
    name varchar(30)
);
show tables;
desc member;

insert into member values('euae', '1234', '도마뱀');
select * from member;