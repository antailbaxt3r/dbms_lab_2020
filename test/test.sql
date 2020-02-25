alter table Artists drop column Nationality;

select * from Artists;

create table RandomTable (
	Name VARCHAR (30) PRIMARY KEY,
    Age INTEGER
);

insert into RandomTable VALUES ("ARJUN", 19); 
insert into RandomTable VALUES ("Andrew", 27);
select * from RandomTable;

select distinct Label from Albums; 

desc RandomTable;
select UserName from Users where accounttype = 'P';
select AlbumName from Albums where ArtistName LIKE "Maroon 5" and genre like "ROCK";


show databases;
use db212lab4;

show tables;
select * from  book;
select oisbn from orderbook group by oisbn having count(*) > 2;

select ocid from orderbook where qty > 4;

select ocid from orderbook group by ocid having timestampdiff(year, max(orderdate), curdate()) < 7;


select ocid from orderbook where ocid IN (
(
select ocid from orderbook where 
(oisbn = (select isbn from book where title like "Operating Systems"))
)
and
(
select ocid from orderbook where
(oisbn = (select isbn from book where title like "Data Structures and Algorithms"))
)
);




select * from book;















