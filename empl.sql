CREATE TABLE empl ( empno INT(10) PRIMARY KEY , ename VARCHAR(30) NOT NULL, job VARCHAR(30) NOT NULL, mgr INT(10), hiredate date not null ,  sal decimal(8,2) not null, comm decimal(8,2) , deptno int(7) ); 

insert into empl values(8369, 'SMITH','CLERK',8902,'1990-12-18',800.00, NULL,20);
insert into empl values(8499, 'ANYA','SALESMAN',8698,'1991-02-20',1600.00, 300.00,30);
insert into empl values(8521, 'SETH','SALESMAN',8698,'1991-02-22',1250.00, 500.00,30);
insert into empl values(8566, 'MAHADEVAN','MANAGER',8839,'1991-04-02',2985.00, NULL,20);
insert into empl values(8654,'MOMIN','SALESMAN',8698,'1991-09-28',1250.00,1400.00,30);
insert into empl values(8698,'BINA','MANAGER',8839,'1991-05-01',2850.00,NULL,30);
insert into empl values(8882,'SHIVANSH','MANAGER',8839,'1991-06-09',2450.00,NULL,10);
insert into empl values(8888,'SCOTT','ANALYST',8566,'1992-12-09',3000.00,NULL,20);
insert into empl values(8839, 'AMIR','PRESIDENT',NULL,'1991-11-18',5000.00,NULL,10);
insert into empl values(8844, 'KULDEEP','SALESMAN',8698,'1991-09-08',1500.00, 0.00,30);

select * from   empl
select ename from empl where sal >=2200
select ename from empl where comm is  null
select ename,sal from empl where empno not in(select empno from empl where sal between 2500 and 4000)
select ename,job,sal from empl where mgr is not null
select ename,job,sal from empl  where ename like'__a%'
select ename,job,sal from empl  where ename like'%T'
select ename,job,sal from empl  where ename like'm%' and ename like'__l%'
select ename,job,case when comm is null then  'Not Given' else comm end as Comm  from empl   
