create database market;
use market;
drop table member;
create table member
(
	id varchar(10) not null,
    name varchar(10) not null,
    address varchar(2) null,
    tel varchar(10),
    height int default 160,
    date DATE,
    primary key(id)
)charset utf8mb4;

create table buy
(
	no int auto_increment not null primary key,
    id  varchar(10) not null,
    product varchar(10) not null,
    price int,
    qnt int default 1,
    foreign key (id) references member(id)
);
show tables;
desc buy;
insert into buy values(null,'dd','dd',22,22);

alter table buy add column Regi_date DATE;
select * from buy;
alter table member drop column height;
select * from member;

alter table buy
	add constraint price_const check(price<=100000);
insert into member values('무무','dd','dd','aa',161,'2022.02.02');
insert into buy values(null,'aa','dd',22,22,'2022.02.02');
insert into buy values(null,'aa','dd',220000,22,'2022.02.02');

alter table buy
	drop constraint price_const;
    
alter table buy 
	add constraint foreign key(id) references member(id)
    on update cascade
    on delete cascade;
delete from member where id='aa';
drop table buy;
create table buy
(
	no int auto_increment not null primary key,
    id  varchar(10) not null,
    product varchar(10) not null,
    price int,
    qnt int default 1
);
insert into buy values(null,'aa','dd',22,22);
insert into buy values(null,'ba','dd',22,22);
delete from member where id='aa';
select * from buy;
select * from member;

drop table member, buy;
