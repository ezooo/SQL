use world;
show tables;
select * from city;

create table city_popul
(
	city_name varchar(35),
    population int
);
select * from city_popul;
insert into city_popul
	select Name, Population from world.city;