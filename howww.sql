drop database howAbout;

update diary set visit_date=2222, visit_diary="왔다갔다" where diaryId=1111;

drop table location;
delete from location where data_title='강원도';
select * from location;
select count(*) from location;

select * from location where data_title='세존도';
select distinct category_name1 from location;

delete from location where data_title='우리집';

