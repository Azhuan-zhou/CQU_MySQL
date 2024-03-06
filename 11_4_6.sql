unlock tables;
select * from book;
begin;
update book set bprice = 100 where bno = "B02";
update book set bprice = 25 where bno = "B01";
