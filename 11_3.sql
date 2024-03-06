set autocommit = 0;
drop procedure if exists borrow_book;
delimiter $
create procedure borrow_book(in reader_name varchar(20),in book_name varchar(100))
begin 
set @cur_num = (select max(borrnum) from borrow);
set @r_no = (select rno from reader where rname = reader_name);
set @b_no = (select bno from book where btitle = book_name);
set @check_borrow_state = (select count(bno) from borrow where rno=@r_no and returndate <=> null);
if @check_borrow_state != 0 then
	begin
		start transaction;
			insert into borrow (borrnum,rno,bno,borrowdate) values (@cur_num+1,@r_no,@b_no,curdate());
			rollback;
            select concat("亲爱的",reader_name,"同学，借阅",book_name,"失败，当前您还有书籍没有归还。") as ' ';
	end;
else
	begin
		 insert into borrow (borrnum,rno,bno,borrowdate) values (@cur_num+1,@r_no,@b_no,curdate());
		 commit;
         select concat("亲爱的",reader_name,"同学，您已成功借阅",book_name,"，请好好保存！") as '';
	end;
end if;
end$
delimiter ;
call borrow_book("王小明","数据结构");
select * from borrow;