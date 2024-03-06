create unique index bnox on book(bno);

drop index bnox on book;

create table student(
sno int,
name varchar(20)
);

delimiter $
create procedure auto_insert()
begin
declare i int default 1;
while(i<10000)do
insert into student values (i,concat('Student',i));
set i = i + 1;
end while;
end$
delimiter ;

call auto_insert();

select * from student;

select * from student where name='Student7000';

explain select * from student where name='Student1000';

create index id on student(sno);
select * from student where name='Student7000';

create index namex on student(name);
select * from student where name='Student7000';
explain select * from student where name='Student7000';