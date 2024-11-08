use market_db;
create table table1
(
	col1 int primary key,
    col2 int,
    col3 int
);
show index from table1;

drop table if exists buy, member;
create table member
(
	mem_id char(8),
    mem_name varchar(10),
     mem_number int,
     addr char(2)
);
INSERT INTO member VALUES('TWC', '트와이스', 9, '서울');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울');
select * from member;

alter table member
	add constraint primary key(mem_id);
    
select * from member;
