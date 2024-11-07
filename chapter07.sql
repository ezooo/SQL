-- 7장 스토어드 프로시저
USE market_db;
delimiter &&
create procedure user_proc()
begin
	select * from member;
end &&
delimiter ;
call user_proc();

-- 매개변수 추가
delimiter &&
create procedure user_proc1(in userName varchar(10))
begin
	select * from member where mem_name = userName;
end &&
delimiter ;
call user_proc1('에이핑크');

delimiter &&
create procedure user_proc2
	(in userNumber int,
    in userHeight int)
begin
	select * from member 
    where mem_number > userNumber and height > userHeight;
end &&
delimiter ;
call user_proc2(6,165);

-- 출력 매개변수
create table notable
(
	id int auto_increment primary key,
    txt char(10)
);
delimiter &&
create procedure user_proc3
	(in txtvalue char(10),
     out outvalue int)
begin
	insert into notable values(null, txtvalue);
    select max(id) into outvalue from notable;
end &&
delimiter ;
call user_proc3('테스트1', @myvalue);
select concat('입력된 ID값 ==> ', @myvalue) as '출력 매개변수';
select @myvalue;

-- 조건문 사용
drop procedure if exists ifelse_proc;
delimiter &&
create procedure ifelse_proc(in memName varchar(10))
begin
	declare debutyear int;
    select year(debut_date) into debutyear from member where mem_name = memName;
	if(debutyear >=2015) then
		select '신인 가수네요. 화이팅' as 'message';
    else
		select '고참 가수네요. 대단해요' as 'message';
    end if;
end &&
delimiter ;
call ifelse_proc('오마이걸');
select * from member;

-- 동적 SQL
delimiter &&
create procedure dyna_proc(in tableName varchar(20))
begin
	set @query = concat('select * from ', tableName);
    prepare myQuery from @query;
    execute myQuery;
    deallocate prepare myQuery;
end &&
delimiter ;
call dyna_proc('member');