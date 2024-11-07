product-- ddl : 데이터베이스 생성하기 (create)
create database shop_db;
use shop_db;
-- ddl : 데이터베이스 조회하기 (read)
show databases;
-- ddl : 데이터베이스 수정하기 (update)
ALTER SCHEMA `shop_db`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_unicode_ci ;
-- ddl : 데이터베이스 삭제하기 (delete)
drop database shop_db;

-- ddl 테이블생성
create table member
(
	member_id char(8) not null primary key,
    member_name char(5) not null,
    member_add char(20) null
) default charset utf8mb3;
create table product
(
	product_name char(4) not null primary key,
    cost int not null,
    make_date date,
    company char(5),
    amount int not null
) default charset utf8;
-- ddl 테이블수정

-- ddl 테이블삭제
drop table member;

-- -------------------------
-- dml 
insert into member values("tess","나훈아","경기 부천시");
insert into member values("hero","임영웅","서울 은평구");
insert into member values("iyou","아이유","인천 남구");
insert into member values("jyp","박진영","경기 고양시");

select * from member;

insert into product values("바나나",1500,"2021-07-01","델몬트",17);
insert into product values("카스",2500,"2022-03-02","OB",3);
insert into product values("삼각김밥",808,"2023-09-01","CJ",22);

