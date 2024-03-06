drop procedure if exists search_borrow_record;
delimiter $
use library $
create procedure search_borrow_record(in r_name varchar(20))
begin
select b.btitle, br.borrowdate, b.bauthor from book b, borrow br, reader r 
where r.rname = r_name and r.rno = br.rno and b.bno = br.bno;
end$
delimiter ;
set @r_name = '王小明';
call search_borrow_record(@r_name);

drop procedure if exists max_min_price;
delimiter $
create procedure max_min_price (out max_price decimal(5,2), out min_price decimal(5,2))
begin
select min(bprice) into min_price
from book;
select max(bprice) into max_price
from book;
end$
delimiter ;
set @min_price = 0.00;
set @max_price = 0.00;
call max_min_price(@max_price,@min_price);
select @max_price,@min_price;

drop procedure if exists search_borrow_record2;
delimiter $
use library $
create procedure search_borrow_record2(in r_name varchar(20),in b_name varchar(100))
begin
select b.bauthor,b.bprice,br.borrowdate,br.returndate from book b, borrow br, reader r 
where r.rname = r_name and b.btitle = b_name and r.rno = br.rno and b.bno = br.bno;
end$
delimiter ;
set @r_name = '王小明';
set @b_name = '数据结构';
call search_borrow_record2(@r_name,@b_name);

drop procedure if exists count_borrow_book;
delimiter $
use library $
create procedure count_borrow_book(in b_name varchar(100), out num int)
begin
select count(*) into num from book b, borrow br where b.btitle=b_name and b.bno = br.bno;
end $
delimiter ;
set @num = 0;
set @b_name = '数据结构';
call count_borrow_book(@b_name,@num);
select @num number_of_book;

drop procedure if exists search_reader_information;
delimiter $
use library $
create procedure search_reader_information(in b_name varchar(100))
begin
select r.rname, r.rage, r.reducation, br.borrowdate, br.returndate from reader r, borrow br, book b
where b.btitle = b_name and b.bno = br.bno and r.rno = br.rno
order by br.borrowdate desc;
end$
delimiter ;
set @b_name = '操作系统概论';
call search_reader_information(@b_name);


drop function if exists  search_borrow_record3;
delimiter $
use library$
create function search_borrow_record3(r_name varchar(20), b_name varchar(100))
returns varchar(100)
reads sql data
return 
(select br.borrowdate from reader r, borrow br, book b
where r.rname = r_name and b.btitle = b_name and  br.rno = r.rno and b.bno = br.bno);$
delimiter ;
set @r_name = '王小明';
set @b_name = '数据结构';
select search_borrow_record3(@r_name,@b_name);


drop function if exists average_age_of_reader;
delimiter $
use library $
create function average_age_of_reader(b_name varchar(100))
returns float
reads sql data
return (select avg(r.rage) from reader r, borrow br, book b
where b.btitle = b_name and b.bno = br.bno and br.rno = r.rno);$
delimiter ;
set @b_name = '数据结构';
select average_age_of_reader(@b_name);


select r.rno, count(bno) times,
case when count(bno) >= 5 then 'A'
when count(bno) >= 2 then 'B'
when count(bno) >= 0 then 'C'
else 'D' 
end level_reading
from reader r left join borrow br on r.rno = br.rno
group by r.rno;