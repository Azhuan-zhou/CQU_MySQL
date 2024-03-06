select rname, 2023-rage year from reader;
select * from book where bprice < 50;
select rname,rage from reader where rage between 18 and 20;
select rno,rname,rsex from reader where reducation = '研究生' or reducation = '本科';
select rname,rsex,rage from reader where rname like '林_';
select * from borrow where returndate <=> null;
select count(rno) numReader from reader;
select avg(rage) avgAge from reader where reducation = '研究生';
select * from borrow order by rno asc ,borrowdate desc;
select rno from borrow group by rno having count(rno) > 1;
select distinct r.rname,b.btitle,br.borrowdate from reader r left join borrow br using(rno) 
left join book b using(bno) where br.rno = r.rno and b.bno = br.bno;
select * from reader left join borrow using(rno);
select r.rno, r.rname from reader r inner join borrow br using(rno) where br.bno = 'B02';
select b1.bno,b1.btitle,b1.bprice from book b1 
where bprice < (select b2.bprice from book b2 where bno='B01');
select r.rno, r.rname from reader r where
not exists(select br1.bno from borrow br1 where br1.rno='R01' and 
not exists(select * from borrow br2 where br2.bno = br1.bno and r.rno = br2.rno));
select * from reader into outfile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\data.txt'; 
