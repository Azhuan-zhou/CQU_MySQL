set session transaction_isolation = 'read-committed';
show variables like 'transaction_isolation';
select * from book;
begin;
update book set bprice=30 where bno="B01";
select * from book;
rollback;
select * from book;

