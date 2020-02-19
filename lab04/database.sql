DROP DATABASE IF EXISTS db212lab4;
create database db212lab4;
use db212lab4; 

DROP TABLE IF EXISTS OrderBook;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Customer;


create table Book(isbn Varchar(12) Primary key, title Varchar(50) NOT NULL, author Varchar(50) NOT NULL, qty_in_stock integer(10) NOT NULL, price Decimal (6,2) NOT NULL, year_published Integer(4));
insert into Book values("A1234","Data Structures and Algorithms","Cormen",5,50.00, 2007);
insert into Book values("A1235","Computer Networks","Stallings",7,500.00,2003);
insert into Book values("A1236","Operating Systems","Stallings",3,800.00,2000);
insert into Book values("A1237","C","Koffman", 10, 255.00, 2009);
insert into Book values("A1238","Applied Mathematics","Chandler", 20, 300.00, 1995);
 
create table Customer(cid Varchar(6) Primary key, cname Varchar(20) NOT NULL , address Varchar(50), age Integer(2));
insert into Customer values("c1", "Amar"," 23, M.G. road, Ahmadabad", 20);
insert into Customer values("c2", "Akbar","D-20, Sainivas, Mumbai",19);
insert into Customer values("c3","Pooja","sector no. 23, Vashi, Mumbai",24);
insert into Customer values("c4","Saloni","Hyderabad",22);
insert into Customer values("c5","John","Pune, Shivajinagar",18);
 
create table OrderBook(oisbn Varchar(12), ocid Varchar(6) NOT NULL, qty Integer(10),orderdate date,
Foreign key(oisbn) references Book(isbn), Foreign key(ocid) references Customer(cid), primary key(oisbn, orderdate));
 
insert into OrderBook values("A1234","c2",2,'2013-10-01');
insert into OrderBook values("A1234","c1",1,'2012-07-02');
insert into OrderBook values("A1236","c3",2 ,'2013-12-12');
insert into OrderBook values("A1236","c5",4, '2012-12-30');
insert into OrderBook values("A1236","c1",5, '2012-05-14');
insert into OrderBook values("A1238","c4",10, '2012-06-15');