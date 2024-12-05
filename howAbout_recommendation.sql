use howabout;

create table recommendation
(
	recommendId bigint primary key,
    userId varchar(20),
    recommendTitle varchar(40),
	recommendContent varchar(500),
	recommendDate varchar(20)
);

desc recommendation;
select * from recommendation;
alter table recommendation modify recommendDate varchar(20);