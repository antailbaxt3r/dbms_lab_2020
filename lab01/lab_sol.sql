/*Create a database called ‘db212BITSStream’*/
create database db212BITSStream;
use db212BITSStream;

/*Add tables*/

create table Albums(
  AlbumID CHARACTER (12) PRIMARY KEY,
  AlbumName VARCHAR (30) NOT NULL,
  ArtistName VARCHAR (30) NOT NULL,
  HoursStreamed INTEGER default 0,
  Label VARCHAR (30),
  Genre VARCHAR (30), 
  ReleaseDate DATE NOT NULL);

create table Artists(
  ArtistID CHARACTER (12) PRIMARY KEY,
  Name VARCHAR (30) NOT NULL,
  ActiveSince DATE,
  RetirementDate DATE,
  NumberOfFollowers INTEGER,
  Nationality VARCHAR (30)
);

create table Users(
  UserID CHARACTER (12),
  UserName VARCHAR (30) NOT NULL,
  EmailID VARCHAR (50),
  MembershipCategory ENUM ('P', 'F') default 'F',
  CONSTRAINT ue UNIQUE (EmailID), 
  PRIMARY KEY (UserID, UserName)
);

/*View tables*/
desc Albums;
desc Artists;
desc Users;

/*
    1. Change the name of column ‘Membership Category’ to ‘Account Type’ in the Users
    table.
    2. Remove the nationality attribute from the Artists table.
    3. Change number of hours streamed to a decimal type with precision 6 and scale as 2.
 */
alter table Users change MembershipCategory AccountType ENUM ('P', 'F') default 'F';
alter table Albums modify HoursStreamed DECIMAL (6, 2) default 0.0;

/*Add data to tables*/

/*Albums*/
insert into Albums (AlbumID, ArtistName, AlbumName, HoursStreamed, Label, Genre, ReleaseDate) VALUES (
  39391, 
  "Linkin Park", 
  "A Thousand Suns", 
  128,
  "Warner Bros",
  "Rock", 
  "2016-06-17"
);

insert into Albums (AlbumID, ArtistName, AlbumName, HoursStreamed, Label, Genre, ReleaseDate) VALUES (
  14573, 
  "Maroon 5", 
  "Overexposed", 
  452, 
  "A&M", 
  "Funk", 
  "2016-11-11"
);

insert into Albums (AlbumID, ArtistName, AlbumName, HoursStreamed, Label, Genre, ReleaseDate) VALUES (
  24573, 
  "Maroon", 
  "Overexposed", 
  400, 
  "A&M", 
  "Funk", 
  "2016-11-30"
);

/*Artists*/
insert into Artists (ArtistID, Name, ActiveSince, RetirementDate, NumberOfFollowers) VALUES (
  100,
  "Maroon 5", 
  "2007-11-13", 
  NULL, 
  16000123
);

insert into Artists (ArtistID, Name, ActiveSince, RetirementDate, NumberOfFollowers) VALUES (
  101, 
  "Linkin Park", 
  "2000-02-14", 
  "2017-07-20", 
  21174672
);

insert into Artists (ArtistID, Name, ActiveSince, RetirementDate, NumberOfFollowers) VALUES (
  102, 
  "Eminem", 
  "2001-01-15", 
  NULL, 
  14093412
);

insert into Artists (ArtistID, Name, ActiveSince, RetirementDate, NumberOfFollowers) VALUES (
  103, 
  "Coldplay", 
  "2002-05-13", 
  NULL, 
  18000992
);

/*Users*/
insert into Users (UserID, UserName, EmailID, AccountType) VALUES (
  10003, 
  "Anurag Dwivedi", 
  "adwivedi@gmail.com", 
  'F'
);

insert into Users (UserID, UserName, EmailID, AccountType) VALUES (
  10004, 
  "Sana Kothari", 
  "sana123@gmail.com", 
  'P'
);

insert into Users (UserID, UserName, EmailID) VALUES (
  10005, 
  "Vishal Ghosh", 
  "vishy@gmail.com"
);

/*SQL QUERY QUESTIONS*/

/*Q6*/
select Label from Albums;
select DISTINCT Label from Albums;
/*Q7*/
select * from Users where AccountType = 'P';
/*Q8*/
select * from Albums where Genre = "Rock" and ArtistName = "Maroon 5";
/*Q9*/
update Albums SET HoursStreamed = HoursStreamed + 200 where Genre = "Rock";
/*Q10*/
alter table Artists ADD COLUMN Duration INTEGER NOT NULL;
/*Q11*/
delete from Albums where HoursStreamed > 400;
/*Q12*/
select HoursStreamed * 1.2, AlbumName from Albums;
/*Q13*/
update Artists SET NumberOfFollowers = NumberOfFollowers + 200 where ArtistID = 100;
/*Q14*/
update Artists SET Duration = datediff(curdate(), ActiveSince);
/*Q16*/
select curdate() from dual; /*only shows date*/
select sysdate() from dual; /*shows both date and time*/

/*Q17*/
/*
  USE THS COMMAND ON THE TERMINAL TO EXPORT DATABASE
  $ mysqldump -u [username] -p [database name] > [database name].sql
 */

/*Q18*/
drop table Albums, Artists, Users;
drop database db212BITSStream;

/*Q19*/
create database db212BITSGaana;
/*
  USE THS COMMAND ON THE TERMINAL TO IMPORT DATABASE
  $mysql -u [username] -p newdatabase < [database name].sql
 */
use db212BITSGaana;

/*Q20
  YES
*/

/*Q22 <CHALLENGE>*/
select * from Albums where Genre = "Rock" or Genre = "Funk";