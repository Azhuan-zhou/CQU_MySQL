describe book;
alter table book
add primary key (bno);
alter table book
add unique(bno);
insert into book (bno) values ('B01');
describe borrow;
alter table borrow
add primary key (borrnum);
alter table borrow
add unique(borrnum);
insert into borrow (borrnum) values ('1');
describe reader;
alter table reader
drop primary key;
alter table reader
add primary key (rno);
alter table reader
add unique(rno);
insert into reader (rno) values ('R01');
alter table borrow
add constraint rno
foreign key (rno)
references reader(rno)
on delete no action
on update no action;
delete from reader where rno='R01';
alter table borrow
add constraint bno
foreign key (bno)
references book(bno)
on delete no action
on update no action;
delete from book where bno='B01';
alter table reader 
add constraint rname check(rname is not null) enforced;
insert into reader (rno,rname) values ('R09',null);
alter table reader
drop constraint rname;
alter table reader 
add constraint rsex check(rsex='男' or rsex='女') enforced;
insert into reader (rno,rsex) values ('R09','中性');
alter table reader 
add constraint rage check(rage <= 100 and rage>=0) enforced;
insert into reader (rno,rage) values ('R09',101);
alter table book 
add constraint bprice check (bprice > 0) enforced;
insert into book (bno,bprice) values ('B09',-1);
alter table borrow 
drop constraint returndate;
alter table borrow
alter borrowdate set default (date(sysdate()));
insert into borrow (borrnum) values ('11');
select * from borrow where borrnum='11';
delete from borrow where borrnum='11';

drop trigger if exists drop_reader_borrow;
delimiter $$
create trigger  drop_reader_borrow 
BEFORE delete on reader
for each row
begin
delete from borrow where rno=old.rno;
end$$
delimiter ;

delete from reader where rno='R01';

create table book_count (
		Bno char(10) Not NULL,
        BorrowTimes int,
        primary key (Bno)
        );
        
insert into book_count select bno, count(bno) from borrow group by bno;

drop trigger if exists add_BorrowTimes;
delimiter $$
create trigger  add_BorrowTimes
after insert on borrow
for each row
begin
update book_count set BorrowTimes = BorrowTimes + 1 where bno = new.bno;
end$$
delimiter ;

insert into borrow (borrnum,bno) values ('11','B01')
