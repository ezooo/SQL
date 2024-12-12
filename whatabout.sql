create database IF NOT EXISTS whatabout;
use whatabout;
create table location
(
	 data_title varchar(20),
	 user_address varchar(50),
	 lattitude varchar(50),
	 logitude varchar(50),
	 insttnm varchar(20),
	 category_name1 varchar(20),
	 category_name2 varchar(20),
	 data_content text,
	 telno varchar(20),
	 fileurl1 text,
	 fileurl2 text,
	 fileurl3 text,
	 fileurl4 text,
	 fileurl5 text,
     num int primary key auto_increment
);
select * from location;


create table recommendation
(
	recommendId bigint primary key,
    userId varchar(20),
    recommendTitle varchar(40),
	recommendContent varchar(500),
	recommendDate varchar(20)
);

create table diary
(
	diaryId bigint primary key,
	userId varchar(20),
    visit_date varchar(20),
    visit_diary varchar(500),
    filename varchar(50),
    foreign key(userId) references aboutMember(userId)
);

create table diaryimage
(
	num int primary key auto_increment,
    userId varchar(20),
	diaryId bigint,	-- 이거 다이어리랑 연결할 외래키
    foreign key(diaryId) references diary(diaryId),
    foreign key(userId) references aboutMember(userId)
);

create table aboutMember(
   userName varchar(10) ,
    userId varchar(20) primary key,
    userPw varchar(20),
    userTel char(12),
    userAddr varchar(100),
    userDate char(10),
    userEamil varchar(100) unique,
    enabled boolean
);
drop table diaryimage;
drop table diary;
select * from diaryimage;
select * from diary;
delete from diaryimage;
insert into diaryImage values(null, 123456, 'aa');
select * from diaryimage where diaryId=1733907217102;

insert into aboutMember(userName,userId,userPw) values(null, 'aaa', '1234');
