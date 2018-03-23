
create table first (
	t1 varchar(10), t2 INT);

-------------------------------------------------------------------------------

create table testing (
	t5 varchar(10) not null,
	t6 varchar(20)
);

-------------------------------------------------------------------------------

insert into first values('2', 5);
insert into testing values('5', null);
insert into testing values('8', 8);
select * from first;

