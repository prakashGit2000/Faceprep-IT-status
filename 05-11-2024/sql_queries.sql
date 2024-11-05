show databases;
create database vit;
drop database VIT;

use vit;
select database();
create table emp(
emp_no int,
emp_name varchar(25),
emp_designation varchar(35)
);
desc emp;

insert into emp values(1001 ,'prakash','java'),(1002 ,'sanju','python'),(1002 ,'dhanush','c++'),(1003,0815,'full stack');

select * from emp;

show tables from vit;  
drop table emp;
start transaction;
savepoint s1;
commit;
insert into emp values(151 ,'del me','deleted in rollback');
select * from emp;
commit;
rollback;
delete from emp where emp_no=151;
select * from emp;
SELECT DISTINCT emp_designation FROM emp;
SELECT count(DISTINCT emp_designation) FROM emp;
alter table emp add(emp_phno int8(10));
alter table emp add(emp_phno int8(10),emp_phno1 int8(10));
alter table emp drop column emp_phno;
ALTER TABLE emp DROP COLUMN emp_phno, DROP COLUMN emp_phno1;
desc emp;
alter table emp add(country varchar(25) default "India");
alter table emp drop column country;
select * from emp;
alter table emp change country mycountry varchar(50);
alter table emp change mycountry ourcountry varchar(20);
insert into emp values(1010 ,'col change','javas','asdfghjklasdfghjklas');
alter table emp change ourcountry mycountry varchar(15);
insert into emp values(10 ,'after alter','alter method',123456789052);
delete from emp where emp_no =151;
delete from emp where emp_name="815";
select * from emp;
rename table emp to employee;
rename table employee to emp;
update emp set emp_no=1003 where emp_name="dhanush";
update emp set emp_no=1004,emp_name="sowmya", emp_designation="python", ourcountry=default where emp_no=1010;
update emp set emp_no=1005,emp_name="pavan", emp_designation="c lang", ourcountry=default where emp_no=10;
alter table emp add(country varchar(25) default "India");
alter table emp drop column ourcountry;
desc emp;
update emp set emp_no=1005,emp_name="pavan", emp_designation="c lang", country=default where emp_no=1003;
update emp set emp_no=emp_no+1;
select * from emp;
select emp_name , emp_no+1000 from emp;



-- best example for commit and rollback
CREATE TABLE sbi(
    cid INT,
    cname VARCHAR(20),
    balance INT
);

INSERT INTO sbi VALUES
    (1, 'prakash', 500),
    (2, 'sanju', 100);

-- Verify the data
SELECT * FROM sbi;

START TRANSACTION;
SAVEPOINT after_debit;
-- Deduct 200 from prakash's account if the balance is sufficient
UPDATE sbi SET balance = balance - 200 WHERE cid = 1 AND balance >= 200;

-- Check the updated balance of prakash
SELECT * FROM sbi WHERE cid = 1;



-- Add 200 to sanju's account
UPDATE sbi SET balance = balance + 200 WHERE cid = 2;

-- Check the updated balance of sanju
SELECT * FROM sbi WHERE cid = 2;
-- Try to update a non-existent account (cid = 3)
UPDATE sbi SET balance = balance + 100 WHERE cid = 3;

SELECT ROW_COUNT();
ROLLBACK TO after_debit ;
-- Now, check the data to confirm that only the credit to sanju was undone
SELECT * FROM sbi;
COMMIT;
















select * from emp where emp_name="del me";
select * from emp where emp_no<200;
select * from emp where emp_no between 9 and 200;
select * from emp where emp_designation like "%d";
select * from emp where emp_designation like "d%";
select * from emp where emp_designation in ('java','c++');
select * from emp order by emp_no;
select * from emp order by emp_no asc;
select * from emp order by emp_no desc;
select * from emp order by emp_name asc;
select * from emp order by emp_name asc,emp_designation desc;
SELECT * FROM emp WHERE ourCountry = 'india' AND emp_name LIKE 'p%';
























/*

SELECT - extracts data from a database
UPDATE - updates data in a database
DELETE - deletes data from a database
INSERT INTO - inserts new data into a database
CREATE DATABASE - creates a new database
ALTER DATABASE - modifies a database
CREATE TABLE - creates a new table
ALTER TABLE - modifies a table
DROP TABLE - deletes a table
CREATE INDEX - creates an index (search key)
DROP INDEX - deletes an index         */



#2nd 
create database org123;
use org123;
drop table persons;
show tables from org123;
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);
desc persons;
ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;

ALTER TABLE Persons
MODIFY COLUMN id int not null;

insert into persons values (1,'n','prakash',18);
insert into persons values (2,'s','sanju',18);
select * from persons;	

update persons set age=19 where lastname='s';
ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL,
MODIFY COLUMN id int not null;

insert into persons values (3,'p','flower',20);

CREATE TABLE Personsprimary (
    ID int primary key,             /*not null unique both is indirectly primary key*/
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int not null
);
desc  Personsprimary;
insert into personsprimary values (1,'n','prakash',18);

CREATE TABLE Persons1 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);
desc persons1;
insert into persons1 values (2,'n','prakash',18);
select * from persons1;
desc persons1;
drop table primary2;
CREATE TABLE primary2 (
    ID INT PRIMARY KEY NOT NULL,                      /*unique id*/
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Age INT NOT NULL,
    CONSTRAINT UC_Person UNIQUE (LastName, FirstName),  /*both together firstname and lastname should be unique*/
    CHECK (Age >= 0)                                     /*age must be greater than 0*/
);

desc primary2;
ALTER TABLE primary2
ADD CONSTRAINT UC_Person1 unique (LastName,firstname,age);

ALTER TABLE primary2
DROP PRIMARY KEY;
desc primary2;

ALTER TABLE primary2
DROP INDEX UC_Person;

desc primary2;
select * from primary2;

insert into primary2 values (2,'n','prakash',18);

ALTER TABLE primary2
MODIFY COLUMN Age INT  NOT NULL;



ALTER TABLE primary2
ADD PRIMARY KEY (ID);

ALTER TABLE primary2 MODIFY COLUMN lastname VARCHAR(255) NOT NULL;


desc primary2; 
insert into primary2 values (3,'n','prakash',-1);    /*  age must be >0 bcoz check(age>=0) declared while creating table*/


/*alias means dummy name to the column name temporary*/
desc persons;
select lastname as surname  from Persons;   






