use naver_db;

alter table buy
	add constraint primary key (num);
    
drop table if exists buy;
create table buy
(
	num int primary key auto_increment,
    id varchar(8),
    product varchar(20)
);
alter table buy add constraint
	foreign key(id) references member(id)
    on update cascade  
    on delete cascade;
    
INSERT INTO buy VALUES(NULL, 'PINK', '물건');
select * from buy;
select * from member;
update member set id='AAK' where id='PINK';

drop table if exists buy, member;
create table member
(
	id varchar(8) primary key,
    name varchar(10) not null,
    height int,
    email char(30) unique
);
insert into member values('BLK', '블랙핑크', 163, 'pink@gmail.com');
insert into member values('TWC', '트와이스', 167, null);
insert into member values('APN', '에이핑크', 164, 'pink2@gmail.com');
select * from member;

drop table if exists member;
create table member
(
	id varchar(8) primary key,
    name varchar(10) not null,
    height int null check(height >= 100),
    phone1 char(3) null
);
insert into member values('BLK', '블랙핑크', 163, null);
insert into member values('TWC', '트와이스', 99, null);
alter table member add constraint
	check(phone1 IN('02', '031', '054', '055'));
insert into member values('TWC', '트와이스', 161, '02');
insert into member values('APN', '에이핑크', 164, '010');

select * from member;
drop table if exists member;
create table member
(
	id varchar(8) primary key,
    name varchar(10) not null,
    height int null default 160,
    phone1 char(3) null
);
insert into member values('BLK', '블랙핑크', 163, null);
insert into member values('TWC', '트와이스', null, null);
insert into member values('APN', '에이핑크', default, '010');

select * from member;
drop table if exists member;
create table member
(
	id varchar(8) primary key,
    name varchar(10) not null,
    height int not null default 160,
    phone1 char(3) null
);
insert into member values('BLK', '블랙핑크', 163, null);
insert into member values('TWC', '트와이스', null, null);
insert into member values('APN', '에이핑크', default, '010');
insert into member values('TWC', '트와이스', '', null);
insert into member values('TWC', '트와이스', null);