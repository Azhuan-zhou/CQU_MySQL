set session transaction_isolation = 'repeatable-read';
show variables like 'transaction_isolation';
begin;
select * from book;
update book set bprice=30 where bno="B01";
select * from book;
commit;
select * from book;
