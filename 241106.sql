use market_db;
set @myvar1 = 5;
set @myvar2 = 4.25;

select @myvar1;
select @myvar1 + @myvar2;

set @txt = '가수 이름 ==> ';
set @height = 166;
select @txt, mem_name from member where height > @height;

set @count = 3;
prepare mysql from 'select mem_name, height from member order by height limit ?';
execute mysql using @count;

select avg(price) as '평균 가격' from buy;
select cast(avg(price) as signed) as '평균 가격' from buy;
select convert(avg(price), signed) as '평균 가격' from buy;

select cast('2022/12/12' as date);
select cast('2022.12.12' as date);

select num, concat(cast(price as char), 'X', convert(amount, char),' = ') '가격X수량', price*amount '구매액'
	from buy;
    
select 100 + '200';

select * from buy
	inner join member
    on buy.mem_id = member.mem_id;
    
select * from member
	inner join buy
    on buy.mem_id = member.mem_id;
    
select buy.mem_id, mem_name, prod_name, addr, concat(phone1, phone2) as '연락처'
	from buy
    inner join member
    on buy.mem_id = member.mem_id;
    
select m.mem_id, m.mem_name, b.prod_name, m.addr
	from buy b
		inner join member m
        on b.mem_id = m.mem_id
	order by m.mem_id;
     
select m.mem_id, m.mem_name, b.prod_name, m.addr
	from member m
		left outer join buy b
        on b.mem_id = m.mem_id
	order by m.mem_id;
    
select m.mem_id, m.mem_name, b.prod_name
	from member m
		right outer join buy b
        on b.mem_id = m.mem_id
	order by m.mem_id;
    
create table emp_table
(
	emp char(4),
    manager char(4),
    phone varchar(8)
);
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
insert into emp_table values('','','');
select * from emp_table;
delete from emp_table;

drop procedure if exists ifproc3;
delimiter &&
	create procedure ifproc3()
    begin
		declare debutdate date;
        declare curdate date;
        declare days int;
        
        select debut_date into debutdate
        from market_db.member
        where mem_id = 'APN';
        
        set curdate = current_date();
        set days = datediff(curdate, debutdate);
        
        if (days/365) >=5 then
			select concat('데뷔한 지 ', days, '일이나 되었습니다. 축하') as 'message';
		else
			select '데뷔한 지 '+ days +'일 밖에 안됨. 화이팅' as 'message';
		end if;
	end &&
delimiter ;
call ifproc3();

select mem_id, sum(price*amount) as '총 구매액'
	from buy
    group by mem_id;
    
select mem_id, sum(price*amount) as '총 구매액'
	from buy
    group by mem_id
    order by sum(price*amount) desc;
    
select b.mem_id, m.mem_name, sum(price*amount) as '총 구매액'
	from buy b
		inner join member m
        on b.mem_id = m.mem_id
    group by b.mem_id
    order by sum(price*amount) desc;
    
select m.mem_id, m.mem_name, sum(price*amount) as '총 구매액'
	from buy b
		right outer join member m
        on b.mem_id = m.mem_id
    group by m.mem_id
    order by sum(price*amount) desc;
    
select m.mem_id, m.mem_name, sum(price*amount) as '총 구매액',
		case
			when (sum(price*amount) >= 1500) then '최우수고객'
            when (sum(price*amount) >= 1000) then '우수고객'
            when (sum(price*amount) >= 1) then '일반고객'
			else '유령고객'
		end '회원등급'
	from buy b
		right outer join member m
        on b.mem_id = m.mem_id
    group by m.mem_id
    order by sum(price*amount) desc;
    
drop procedure if exists whileproc;
delimiter %%
	create procedure whileproc()
    begin
		declare i int;
        declare hap int;
        set i =1;
        set hap = 0;
        
        while(i <=100) do
			set hap = hap + i;
            set i = i+1;
        end while;
        
        select '1부터 100까지의 합 ==> ' as '합', hap as '값';
    end %%
delimiter ;
call whileproc();

drop procedure if exists whileproc2;
delimiter &&
create procedure whileproc2()
begin
	declare i int;
    declare hap int;
    set i =1;
    set hap = 0;
    
    mywhile:
    while(i<=100) do
		if(i%4 = 0) then
			set i = i+1;
            iterate mywhile;
        end if;
        set hap = hap +i;
        set i = i+1;
        if(hap>1000) then
			leave mywhile;
        end if;
        
    end while;
    select '1부터 100까지의 합(4의 배수 제외), 1000 넘으면 종료 ==> ' as '합', hap as '값';
end &&
delimiter ;
call whileproc2();