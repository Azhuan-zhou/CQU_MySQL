create table book(
		bno char(10) not null,
        btitle varchar(100),
        bauthor varchar(50),
        bprice decimal(5,2),
        primary key (bno)
        );
create table borrow(
		borrnum int not null,
        rno char(10),
        bno char(10),
        borrowdate date,
        returndate date,
        primary key (borrnum)
        );