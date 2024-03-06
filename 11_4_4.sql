unlock tables;
lock tables book write;
show open tables where in_use>0;
update book set bprice = 25 where bno="B01";
select * from book;
select * from orders;