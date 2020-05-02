create table STUDENT(snum int, sname varchar(40), major varchar(40), lvl varchar(4),age int, PRIMARY KEY(snum));

create table FACULTY(fid int,fname varchar(40), deptid int,PRIMARY KEY(fid));

create table CLASS(cname varchar(40),meets_at time,room varchar(40),fid int,Primary key(cname), FOREIGN KEY(fid) references FACTULTY(fid) on delete cascade);

create table ENROLLED(snum int,cname varchar(40),PRIMARY KEY(snum,cname),FOREIGN KEY(snum) REFERENCES STUDENT(snum),FOREIGN KEY(cname) REFERENCES CLASS(cname) on delete cascade);

insert into STUDENT values(019,'Arjun','CSE','MD',19);
insert into STUDENT values(013,'Amber','CSE','MD',11);
insert into STUDENT values(023,'Aditya','ECE','SR',20);
insert into STUDENT values(041,'Shashank','ME','SS',21);
insert into STUDENT values(051,'Navaneet','ISE','JR',18);
select * from STUDENT;

insert into FACULTY values(020,'NV',001),(030,'GS',002),(026,'HF',002),(044,'VJ',003),(041,'BJ',001),(099,'VJ',003),(011,'KVN',001);
select * from FACULTY;

insert into CLASS values('DBMS','11:15:00','203',011),('ED','10;00;00','211',044),('AI','01:30;00','022',041),('TFC','02:20:10','100',002);
select * from CLASS;

insert into enrolled values(19,'DBMS'),(13,'DBMS'),(023,'TFC'),(41,'AI'),(51,'ED');
select * from enrolled;
                                                                       
SELECT DISTINCT S.sname
FROM STUDENT S, CLASS C, ENROLLED E, FACULTY F
WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND
F.fname = ‘KVN’ AND S.lvl = ‘JR’;
                                                                       
SELECT C.cname
FROM CLASS C
WHERE C.room = ‘203’
OR C.cname IN (SELECT E.cname
FROM Enrolled E
GROUP BY E.cname
HAVING COUNT (*) >= 5);
                                                                       
 SQL&gt;SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum IN (SELECT E1.snum

FROM Enrolled E1, Enrolled E2, Class C1, Class C2
WHERE E1.snum = E2.snum AND E1.cname &lt;&gt; E2.cname
AND E1.cname = C1.cname
AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);                                                                      
