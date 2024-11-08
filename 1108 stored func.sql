-- 스토어드 함수 사용하기
set global log_bin_trust_function_creators = 1;

use market_db;
-- sum 함수 만들기
delimiter &&
create function sumFunc(number1 int, number2 int)
	returns int
begin
	return number1 + number2;
end &&
delimiter ;
select sumFunc(100,200) as '합계';

-- 연도 차이 구하기
delimiter &&
create function calcYear(dYear int)
	returns int
begin
	declare runYear int;
    set runYear = YEAR(curdate()) - dYear;
	return runYear;
end &&
delimiter ;
select calcYear(2015) as '활동 햇수';
select calcYear(2007) into @debut2007;
select calcYear(2013) into @debut2013;
select @debut2007 - @debut2013 as '2007과 2013 차이';

select mem_id, mem_name, calcYear(YEAR(debut_date)) as '활동 햇수' from member;

drop function calcYear;

-- 커서 사용하기
delimiter &&
create procedure cursor_proc()
begin
	declare memNumber int;
    declare cnt int default 0;
    declare totNumber int default 0;
    declare endOfRow boolean default false;
    -- 조회를 위한 커서
    declare memberCursor cursor for
		select mem_number from member;
        
	declare continue handler for not found
		set endOfRow = true;
        
	open memberCursor;
    
    cursor_loop : loop
		fetch memberCursor into memNumber;
        
        if endOfRow then
			leave cursor_loop;
		end if;
        
        set cnt = cnt+1;
        set totNumber = totNumber + memNumber;
	end loop cursor_loop;
    
    select (totNumber/cnt) as '회원의 평균 인원 수';
    
    close memberCursor;
end &&
delimiter ;

call cursor_proc();
select * from member;
