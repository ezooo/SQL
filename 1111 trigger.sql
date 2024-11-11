-- 트리거

use market_db;
create table if not exists trigger_table
(
	id int,
    txt varchar(10)
);
insert into trigger_table values(1, '레드벨벳');
insert into trigger_table values(2, '잇지');
insert into trigger_table values(3, '블랙핑크');
select * from trigger_table;
-- 트리거 부착하기
delimiter &&
	create trigger myTrigger
		after delete
        on trigger_table
        for each row
    begin
		set @msg = '가수 그룹이 삭제됨' ;	-- 트리거 실행 시 작동되는 코드들
    end &&
delimiter ;

set @msg = '';
insert into trigger_table values(4, '마마무');
select @msg;
update trigger_table set txt = '블핑' where id = 3;
select @msg;
-- msg 계속 빈 문자열
delete from trigger_table where id = 4;
select @msg;

create table singer
(
	select mem_id, mem_name, mem_number, addr from member
);
create table backup_singer
(
	mem_id char(8) not null,
    mem_name varchar(10) not null,
    mem_number int not null,
    addr char(2) not null,
    modtype char(2),
    moddate date,
    moduser varchar(30)
);

delimiter &&
create trigger singer_update
	after update
    on singer
    for each row
begin
	insert into backup_singer values(
		old.mem_id, old.mem_name, old.mem_number, old.addr, '수정', curdate(), current_user());
end &&
delimiter ;

delimiter &&
create trigger singer_delete
	after delete
    on singer
    for each row
begin
	insert into backup_singer values(
		old.mem_id, old.mem_name, old.mem_number, old.addr, '삭제', curdate(), current_user());
end &&
delimiter ;

select * from singer;
update singer set addr='영국' where mem_id='BLK';
delete from singer where mem_number>=7;
select * from backup_singer;

truncate table singer;
