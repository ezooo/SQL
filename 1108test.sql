create table customer
(
	id varchar(10) primary key,
    name varchar(10) not null,
    age int,
    grade char(2) not null,
    job varchar(10),
    cost int default 0
);

use test1;
create table product
(
	num varchar(20) primary key,
    name int,
    stock int,
    cost int,
    업체 int,
    constraint stock_const check(0<=stock and stock<=10000)
);
insert into product(num, cost) values(1, -1);
select * from product;

insert into product(num, cost) values(2, -1);
insert into product(num, stock) values(4, -11);

alter table product add column 가입날짜 date;
alter table product add 가입날짜wkkw date;

alter table product drop column 가입날짜wkkw;
alter table product
	add constraint cost_const check(cost>=20);
    
drop table product;
insert into product(num, cost, stock) values(2, 21, 5);
insert into product(num, cost, stock) values(21, 21, -5);
alter table product drop constraint stock_const;
insert into product(num, cost, stock) values(22, 21, -5);

alter table product add constraint stock_con check( stock in(5,-5,10) );
insert into product(num, cost, stock) values(12, 21, -5);
insert into product(num, cost, stock) values(13, 21, 10);
insert into product(num, cost, stock) values(14, 21, 7);
alter table product add constraint stock_con check(0<=stock and stock<=10000);