--create database
create database db212Books;
--create Books table
create table Book (
  isbn VARCHAR (12) PRIMARY KEY,
  title VARCHAR (50) NOT NULL,
  author VARCHAR (50) NOT NULL,
  qty_in_stock INTEGER (10) NOT NULL,
  price DECIMAL (6, 2) NOT NULL,
  pubyear INTEGER (4)
);
--insert records
INSERT INTO Book (isbn, title, author, qty_in_stock, price, pubyear) VALUES ("A1234", 
"Data Structures and Algorithms",
"Cormen",
5,
350.00,
2007);

INSERT INTO Book (isbn, title, author, qty_in_stock, price, pubyear)  VALUES ("A1235", 
"Computer Networks",
"Stallings",
7,
500.00,
2003);

INSERT INTO Book (isbn, title, author, qty_in_stock, price, pubyear)  VALUES ("A1236", 
"Operating Systems",
"Stallings",
3,
800.00,
2000);

INSERT INTO Book (isbn, title, author, qty_in_stock, price, pubyear)  VALUES ("A1237", 
"C",
"Koffman",
10,
255.00,
2009);

INSERT INTO Book (isbn, title, author, qty_in_stock, price, pubyear) VALUES ("A1238", 
"Applied Mathematics",
"Chandler",
20,
300.00,
1995);

--create table Customer
create table Customer(
  cid VARCHAR(6) PRIMARY KEY,
  cname VARCHAR (20) NOT NULL,
  address VARCHAR (50),
  age INTEGER (2)
);

--insert queries
INSERT INTO Customer (cid, cname, address, age) VALUES (
"c1", 
"Amar",
"23 M.G. road Ahmadabad",
20
);

INSERT INTO Customer (cid, cname, address, age) VALUES (
"c2", 
"Akbar",
"D-20, Sainivas, Mumbai",
19
);

INSERT INTO Customer (cid, cname, address, age) VALUES (
"c3", 
"Pooja",
"sector no. 23, Vashi, Mumbai",
24
);

INSERT INTO Customer (cid, cname, address, age) VALUES (
"c4", 
"Saloni",
"Hyderabad",
22
);

INSERT INTO Customer (cid, cname, address, age) VALUES (
"c5", 
"John",
"Pune, Shivajinagar",
18
);

--create table Orderbook
create table Orderbook(
  oisbn VARCHAR (12),
  ocid VARCHAR (6),
  qty INTEGER (10),
  order_date DATE,
  FOREIGN KEY (oisbn) REFERENCES Book (isbn) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (ocid) REFERENCES Customer (cid) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (oisbn, order_date)  
);

--insert queries

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1234", 
"c2",
2,
"2013-10-01"
);

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1234", 
"c1",
21,
"2012-07-02"
);

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1236", 
"c3",
2,
"2013-12-12"
);

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1236", 
"c5",
4,
"2012-12-30"
);

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1236", 
"c1",
5,
"2012-05-14"
);

INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1238", 
"c4",
10,
"2012-06-15"
);

--trying wrong query
INSERT INTO Orderbook (oisbn, ocid, qty, order_date) VALUES (
"A1298", 
"c4",
10,
"2012-06-15"
);

/*
  Cannot add or update a child row: a foreign key constraint fails (`db212Books`.`Orderbook`, CONSTRAINT `Orderbook_ibfk_1` FOREIGN KEY (`oisbn`) REFERENCES `Book` (`isbn`))
  FOREIGN KEY FAILED ERROR
 */

--Q3
insert into Orderbook values('A1236','c5',6,'2012-04-30');
--Normal query

--Q4
insert into Orderbook values('A1236','c5',6,'2012-04-30');
--Duplicate query
--Same book cannot be ordered by multiple people on same date

--Q5
delete from Orderbook WHERE ocid = "c5";
--NO

--Q6
delete from Book WHERE isbn = "A1234";
--YES

--Q7
SHOW CREATE TABLE ORDERBOOK
alter table Orderbook drop FOREIGN KEY Orderbook_ibfk_1;
alter table Orderbook drop FOREIGN KEY Orderbook_ibfk_2;

alter table Orderbook ADD CONSTRAINT book_id FOREIGN KEY (oisbn) REFERENCES Book (isbn) ON DELETE CASCADE ON UPDATE CASCADE;
alter table Orderbook ADD CONSTRAINT cust_id FOREIGN KEY (ocid) REFERENCES Customer (cid) ON DELETE CASCADE ON UPDATE CASCADE;

--Q8
update Book SET isbn = "A1239" WHERE isbn = "A1238";
--YES