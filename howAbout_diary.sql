create database howAbout;
use howAbout;

create table diary
(
	diaryId long,
	userId varchar(20),
    visit_date varchar(20),
    visit_diary varchar(500),
    filename varchar(50)
);

select * from diary;
delete from diary;
insert into diary(diaryId,userId, visit_date,visit_diary) values(1111, "d", "d", "d");

alter table diary modify diaryId BigInt;
desc diary;

alter table diary add column num int auto_increment primary key;
alter table diary drop column num;