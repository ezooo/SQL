use whatabout;
create table weatherarea
(
	areaname char(2),
    areacode varchar(10)
);
insert into weatherarea values('거제','11H20403');
insert into weatherarea values('거창','11H20502');
insert into weatherarea values('고성','11H20404');
insert into weatherarea values('김해','11H20304');
insert into weatherarea values('남해','11H20405');
insert into weatherarea values('밀양','11H20601');
insert into weatherarea values('사천','11H20402');
insert into weatherarea values('산청','11H20703');
insert into weatherarea values('양산','11H20102');
insert into weatherarea values('의령','11H20602');
insert into weatherarea values('진주','11H20701');
insert into weatherarea values('창녕','11H20604');
insert into weatherarea values('창원','11H20301');
insert into weatherarea values('통영','11H20401');
insert into weatherarea values('하동','11H20704');
insert into weatherarea values('함안','11H20603');
insert into weatherarea values('함양','11H20501');
insert into weatherarea values('합천','11H20503');

select * from weatherarea;

create table WeatherOfWeek
(
	basedate varchar(10) primary key,
	wf4Am varchar(20),
    wf5Am varchar(20),
    wf6Am varchar(20),
    wf7Am varchar(20),
    wf8 varchar(20),
    wf9 varchar(20),
    wf10 varchar(20)
);
select * from WeatherOfWeek;
delete from WeatherOfWeek;
drop table WeatherOfWeek;