create database fortest;
use fortest;
create table member
(
	mem_id varchar(10),
    mem_name varchar(10),
    mem_number int,
    addr varchar(10),
    phone1 varchar(10),
    phone2 varchar(10),
    height int,
    debut_date date
);

create table buy
(
	num int auto_increment primary key,
    memb_id varchar(10),
    prod_name varchar(10),
    group_name varchar(10),
    price int,
    amount int
);
drop table buy;
insert into member values('TWC', '트와이스', 9, '서울', '02', '1111', 167, '2015.10.19');
insert into member values('BLK', '블랙핑크', 4, '부산', '051', '2222', 163, '2016.08.08');
insert into member values('APN', '에이핑크', 6, '창원', '055', '3333', 166, '2011.02.10');
select * from member;
select * from member where mem_name='블랙핑크';
select mem_name, height from member where height between 164 and 168;
select * from member where addr in('부산', '창원');
select * from member where mem_name LIKE "%핑크%";
select * from member where height > 
	(
		select height from member where mem_name='블랙핑크'
	);
select * from buy;
truncate table buy;
delete from buy;
insert into buy values(NULL, 'BLK', '지갑', null, 30, 2);
insert into buy values(NULL, 'BLK', '노트북', '디지털', 1000, 1);
insert into buy values(NULL, 'TWC', '아이폰', '디지털', 200, 1);
select * from buy b
	inner join member m
	on b.memb_id = m.mem_id ;
select b.memb_id, m.mem_name, b.prod_name from buy b
	inner join member m
	on b.memb_id = m.mem_id ;
select memb_id, sum(price) as '구매총액' from buy group by memb_id;
update buy set group_name='악세사리' where group_name is null;