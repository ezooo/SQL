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