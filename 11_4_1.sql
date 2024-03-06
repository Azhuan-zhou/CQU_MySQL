begin;
lock tables book read;
select * from book;
update book set bprice = 25 where bno="B01";
select * from borrow;