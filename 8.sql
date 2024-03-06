create view view_borrow as
select r.rno,b.btitle,br.borrowdate from reader r,book b, borrow br
where r.rno = br.rno and b.bno = br.bnoview_borrow;
create view view_reader1 as
select r.rno,r.rname, r.reducation from reader r
where r.reducation='研究生';
create view view_reader2 as
select r.rno,r.rname, r.reducation from reader r
where r.reducation='研究生'
with check option;
update view_reader2 set reducation = '本科';
select * from view_borrow;
insert into view_reader1 (rno,rname,reducation) values('R07','张三','本科');
insert into view_reader2 (rno,rname,reducation) values('R07','张三','本科');
update view_reader1 set reducation='本科' where rno='R01';
alter view view_borrow as
select r.rno,b.btitle,br.borrowdate,b.bauthor from reader r,book b, borrow br
where r.rno = br.rno and b.bno = br.bno;
drop view view_reader2;

