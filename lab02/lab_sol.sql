/*Create a database called 'db212Employees'*/
create database db212Employees;
use db212Employees;

create table Employees(
  emp_id VARCHAR (12) PRIMARY KEY,
  designation CHARACTER (30) NOT NULL,
  zip_code INTEGER NOT NULL,
  date_of_birth DATE NOT NULL,
  email_ID VARCHAR (30) NOT NULL,
  salary INTEGER NOT NULL,
  joining_date DATE NOT NULL,
  gender ENUM ('M', 'F') NOT NULL,
  apartment_name CHARACTER (20) NOT NULL default ("NONE"),
  street_no VARCHAR (12),
  street_name CHARACTER (20) NOT NULL,
  city CHARACTER (20) NOT NULL,
  state CHARACTER (20) NOT NULL,
  first_name CHARACTER (20) NOT NULL,
  middle_name CHARACTER (20),
  last_name CHARACTER (20) NOT NULL,
  age INTEGER
);

create table mobile_number(
  mobile_number VARCHAR (10),
  emp_id VARCHAR (12),
  FOREIGN KEY (emp_id) REFERENCES Employees (emp_id)
);

/*ADDING EMPLOYEE DATA*/
insert into Employees (emp_id , first_name, 
                      last_name, gender, apartment_name,
                       street_name, city, state, zip_code , 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0030",
  "Adarsh",

  "Sharma",
  'M',
  "A/380",
  
  "M.G road",
  "Indore",
  "M.P.",
  452018,
  "Team Lead",
  "1990-12-19",
  80000,
  "2005-07-01",
  "sharma.adrash90@yymail.com"
);

insert into Employees (emp_id , first_name, 
                      last_name, gender, apartment_name, street_no,
                      street_name, city, state, zip_code , 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0031",
  "Mohit",
  "Malviya",
  'M',
  "C/290",
  "54",
  "Vijaynagar",
  "Indore",
  "M.P.",
  452011,
  "Developer",
  "1983-03-12",
  50000,
  "2005-08-10",
  "mohit_malviya1203@yymail.com"
);

insert into Employees (emp_id , first_name, middle_name,
                      last_name, gender, apartment_name, 
                      street_name, city, state, zip_code , 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0032",
  "Amit",
  "Kumar",
  "Rai",
  'M',
  "A/181",
  "Abhinandan Nagar",
  "Indore",
  "M.P.",
  452010,
  "Developer",
  "1990-12-15",
  90000,
  "2005-09-10",
  "amit_rai1990@coolmail.com"
);

insert into Employees (emp_id , first_name, 
                      last_name, gender, apartment_name,
                      street_name, city, state, zip_code, 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0033",
  "Ayushi",
  "Jain",
  'F',
  "E-320",
  "Friganj",
  "Ujjain",
  "M.P.",
  452016,
  "Developer",
  "1992-07-01",
  30000,
  "2007-02-05",
  "jain_aysuhi1992@coolmail.com"
);

insert into Employees (emp_id , first_name, 
                      last_name, gender, apartment_name, street_no,
                      street_name, city, state, zip_code, 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0034",
  "Anand",
  "Diwedi",
  'M',
  "A/661",
  "58",
  "Bhavarkuwa",
  "Indore",
  "M.P.",
  452020,
  "Tester",
  "1994-10-02",
  30000,
  "2006-04-15",
  "anand007@coolmail.com"
);

insert into Employees (emp_id , first_name, 
                      last_name, gender, apartment_name, street_no,
                      street_name, city, state, zip_code, 
                      designation, date_of_birth, salary, 
                      joining_date, email_ID) VALUES (
  "2019XYZ0035",
  "Khushboo",
  "Rathi",
  'F',
  "C/230",
  "280",
  "Shastri nagar",
  "Ujjain",
  "M.P.",
  452023,
  "Tester",
  "1992-01-05",
  30000,
  "2008-06-20",
  "k_rathi12@coolmail.com"
);


/*ADDING MOBILE NUMBERS*/
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0030",
  "7012500001"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0030",
  "7710000030"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0030",
  "8985232632"
); 
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0031",
  "8982646300"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0032",
  "7012245201"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0032",
  "9424075236"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0033",
  "7012015121"
);    
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0033",
  "8985632520"
);
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0034",
  "8865263452"
); 
insert into mobile_number (emp_id ,mobile_number) VALUES (
  "2019XYZ0035",
  "8458512332"
);

/*SET AGES*/
update Employees SET age = timestampdiff(year,  date_of_birth, curdate());

/*SQL QUERY QUESTIONS*/
/*Q2*/
select emp_id, first_name, middle_name, last_name from Employees;
/*Q3*/
select first_name, last_name from Employees WHERE gender = 'F';
/*Q4*/
select DISTINCT salary from Employees;
/*Q5*/
select first_name, last_name from Employees WHERE designation = "HR";
/*Q6*/
select first_name from Employees WHERE year(joining_date) > 2006;
/*Q7*/
select MIN(age) from Employees;
/*Q8*/
select emp_id, first_name, salary from Employees ORDER BY salary DESC;
/*Q9*/
select emp_id, first_name, email_ID from Employees WHERE email_ID LIKE "%@coolmail.com";
/*Q10*/
select first_name from Employees WHERE date_of_birth > "1992-01-01" AND date_of_birth < "1995-01-01";
/*Q11*/
select SUM(salary) from Employees;
/*Q12*/
select COUNT(*) FROM Employees WHERE gender = 'M';
/*Q13*/
select MAX(salary) from Employees;
/*Q14*/
select COUNT(*) from Employees WHERE designation = "Developer" OR designation = "Tester";
/*Q15*/
select emp_id, first_name from Employees WHERE timestampdiff(year, joining_date, curdate()) > 12;
/*Q16*/
select emp_id, first_name from Employees WHERE first_name LIKE "A%" AND middle_name is NULL;
/*Q17*/
select first_name, last_name from Employees WHERE last_name NOT LIKE "C%";
/*Q18*/
select first_name from Employees WHERE first_name LIKE "___i%";
/*Q19*/
select CONCAT(first_name, " ", coalesce(middle_name, ""), " " , last_name) from Employees WHERE first_name LIKE "A%";