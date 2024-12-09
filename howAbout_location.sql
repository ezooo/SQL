use howabout;

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
	 fileurl5 text
);

select * from location;

select distinct category_name1 from location;

select a.category_name1, b.fileurl1 
	from location a left outer join location b
    on a.category_name1 = b.category_name1
    group by a.category_name1;
    
SELECT a.category_name1, 
	(SELECT b.fileurl1 
	FROM location b 
	WHERE b.category_name1 = a.category_name1 
	LIMIT 1) AS fileurl1
FROM location a
GROUP BY a.category_name1;