-- step1 : 데이터베이스 생성 (DDL)
create database test1;
-- step1-1 : 생성 확인 (DDL)
show databases;
-- 데이터베이스 사용
use test1;
-- DB만들고 use 안해주면 밑에 에러남 use해야 이 db에 테이블 만들 수 있는듯

-- step2 : 테이블 생성 (DDL)
create table kwsu
(
	id varchar(10),	-- 한줄로 만들어보면 함수의 파라미터와 비슷
    pw varchar(10),
    age int
);
-- 테이블 생성 확인 명령어 (근데 옆에 스키마 창에서 보면 됨)
show tables;
desc kwsu;

-- 데이터 삽입 (DML)
insert into kwsu(id,pw,age) values("a","1234",9);
-- 데이터 조회
select id,pw,age from kwsu;

insert into kwsu values("b","1234",19);
insert into kwsu values("c","1234",49);

select * from kwsu where id='a';
select id,pw,age from kwsu;
delete from kwsu where id='c';