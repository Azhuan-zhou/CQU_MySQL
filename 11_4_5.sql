unlock tables;
select * from book;
begin;
update book set bprice = 100 where bno = "B01";
update book set bprice = 40 where bno = "B02";