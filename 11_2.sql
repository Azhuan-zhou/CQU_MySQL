set autocommit = 0;
drop procedure if exists borrow_book;
delimiter $
create procedure borrow_book(in reader_name varchar(20),in book_name varchar(100))
begin 
set @cur_num = (select max(borrnum) from borrow);
set @r_no = (select rno from reader where rname = reader_name);
set @b_no = (select bno from book where btitle = book_name);
set @book_remain = 5 - (select count(bno) from borrow where bno=@b_no  and returndate <=> null);
if @book_remain > 0 then
	begin
		start transaction;
			insert into borrow (borrnum,rno,bno,borrowdate) values (@cur_num+1,@r_no,@b_no,curdate());
            commit;
            select concat(reader_name,"成功借阅",book_name) as ' ';
	end;
else
	begin
		rollback;
        select concat(reader_name,"借阅",book_name,"失败") as '';
	end;
end if;
end$
delimiter ;
call borrow_book("李伟","数据结构");
select * from borrow;