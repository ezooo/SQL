create database naver_db;
use naver_db;
create table member
(
	id varchar(8) primary key,
    name varchar(5),
    no int,
    addr varchar(8),
    tel1 char(3),
    tel2 char(8),
    height int,
    debute date
);
show tables;

create table buy
(
	num int primary key auto_increment,
    id varchar(8),
    product varchar(20),
    category varchar(20),
    price int,
    amount int,
    foreign key(id) references member(id)
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);

select * from buy;
select * from member;

insert into member values('BLK', '블랙핑크', 163);
select m.id, m.name, b.product
	from buy b
		inner join member m 
        on b.id = m.id;

update member set id='PINK' where id='BLK';
INSERT INTO member VALUES('MUU', '마무', 4, '전남', '061', '99999999', 165, '2014.06.19');
update member set id='PINK' where id='MUU';

alter table buy add constraint
	foreign key(id) references member(id)
    on update cascade;
alter table buy add constraint
	foreign key(id) references member(id)    
    on delete cascade;

INSERT INTO buy VALUES(NULL, 'PINK', '물건', NULL, 40, 4);

update member set id='AAK' where id='PINK';
delete from member where id='PINK';
select * from member;
select * from buy;


