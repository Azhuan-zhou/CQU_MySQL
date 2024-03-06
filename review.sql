select null=null, null<=>null,1=null;
show character set;
show variables like 'character%';
USE library;
select 1+1 as 'add';
select * from book;
select rno from borrow;
SELECT cid,cname FROM customers 
WHERE cname NOT LIKE '__\%%';
SELECT cid,cname FROM customers 
WHERE cname NOT LIKE '__#%%' escape '#';
select * from borrow where returndate  <=> null;
select rno,bno from borrow group by rno;
select * from reader r,borrow b;
select * from reader r inner join borrow br;
select * from reader full join borrow using(rno);
select * from reader r natural join borrow br;




