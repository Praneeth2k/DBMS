create database BANK;
use BANK;
create table BRANCH(
branch_name varchar(30),
branch_city varchar(30),
assets REAL);
alter table BRANCH add primary key(branch_name);

create table BankAccount(
accno int,
branch_name varchar(30),
balance REAL,
primary key(accno),
foreign key(branch_name) references BRANCH(branch_name)
);

create table DEPOSITOR(
customer_name varchar(30),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references BankCustomer(customer_name),
foreign key(accno) references BankAccount(accno)
);

create table LOAN(
loan_number int,
branch_name varchar(30),
amount REAL,
primary key(loan_number),
foreign key(branch_name)references branch(branch_name));

create table BankCustomer(
customer_name varchar(30),
customer_street varchar(100),
city varchar(30),
primary key(customer_name));
desc branch;
select * from branch;
insert into branch values('SBI_Chamrajpet','Banglore',50000),('SBI_RecidencyRoad','Banglore',10000),
('SBI_ShivajiRoad','Bombay',20000),('ParliamentRoad','Bombay',10000),('Jantarmantar','Delhi',20000);

insert into bankaccount value(1,'SBI_Chamrajpet',2000);
insert into bankaccount value(2,'SBI_RecidencyRoad',5000);
insert into bankaccount value(3,'SBI_ShivajiRoad',6000);
insert into bankaccount value(4,'ParliamentRoad',9000);
insert into bankaccount value(5,'Jantarmantar',8000);
insert into bankaccount value(6,'SBI_ShivajiRoad',4000);
insert into bankaccount value(8,'SBI_RecidencyRoad',4000);
insert into bankaccount value(9,'ParliamentRoad',3000);
insert into bankaccount value(10,'SBI_RecidencyRoad',5000);
insert into bankaccount value(11,'Jantarmantar',2000);
select * from branch;
select * from BankAccount;
insert into BankCustomer values('Avinash','Bull_Temple_Road','Banglore');
insert into BankCustomer values('Dinesh','Bannergatta_Road','Banglore');
insert into BankCustomer values('Mohan','NationalCollege_Road','Banglore');
insert into BankCustomer values('Nikil','AkbarRoad','Delhi');
insert into BankCustomer values('Ravi','Prithviraj_Road','Delhi');
insert into depositor values('Avinash',1),('Dinesh',2),('Nikil',4),('Ravi',5),('Avinash',8),('Nikil',9),('Dinesh',10),('Nikil',11);
insert into loan values(1,'SBI_Chamrajpet',1000),(2,'SBI_RecidencyRoad',2000),(3,'SBI_ShivajiRoad',3000),(4,'ParliamentRoad',4000),(5,'Jantarmantar',5000);