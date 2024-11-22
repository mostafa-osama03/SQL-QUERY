--security
-------authentication (login name +password)
-->windows authentication
------->windows admin --->SQL server admin

-->SQL server authentication
-------->create new logins --->new password
-------->SA   built in admin



-------authorization (permissions)
--SQL server Schema
--logical group of objects
--dbo   database owner    default schmea 
--[schemaname].[objectname]
select * from student
select * from dbo.Student

create schema HR

create schema Sales

alter schema hr transfer student

alter schema hr transfer instructor

alter schema sales transfer department

create table student
(
 id int,
 name varchar(10)
)

select * from Instructor
select * from hr.Instructor

select * from student
select * from hr.student

create table sales.student
(
 id int,
 ename varchar(20),
 eage int
)

--permissions
--(student+instructor)
-----grant   select insert
-----deny    update delete

--10 steps of security
--change authentication mode
--restart server
--create login
--create user
--create schema
--assign objects to schema
--join [schema+user]
--set permissions
--disconnect ==>connect user
--new query

select * from sales.department

alter schema dbo transfer sales.department

alter schema dbo transfer hr.instructor

use AdventureWorks2012

select * from employee

select * from HumanResources.employee
------------------------------------------------
--transact-SQL
--top
use ITI

select * from  Student

select * from  Student
where st_age>24

select top(2) * 
from  Student

select top(2) st_fname,st_age
from  Student

select top(1)*
from Student

select top(1)*
from Student
where St_Address='alex'

select max(salary)
from Instructor

--> from  select   order  top
select top(2) salary
from Instructor
order  by salary desc

Newid  --builtin function GUID
select Newid()


select * , newid() as Xid
from Student
order by Xid

select top(1)*
from Student

select top(1)*
from Student
order by newid()

select top(10)*
from questions
order by newid()

--fullpath object
--[Servename].[dbName].[schemaName].[objectName]

select * from Student

select * from "Rami".[ITI].dbo.student

use ITI
select * from Project

select * from Company_SD.dbo.Project

select dept_name from Department
union all
select dname from Company_SD.dbo.Departments

--select into
--ddl
--create table from existsing one

select * into tab2
from Student

select * into tab3
from Student


select st_id,st_fname into tab5
from Student
where St_Address='alex'

select * into hr.course
from course

alter schema hr transfer course

select * into company_sd.dbo.student 
from student

select * into tab7
from Student
where 1=2   --false condition   st_age<0

--insert based on select
--DML
insert into tab5
values(3,'ahmed')

insert into tab5
values(310,'ahmed'),(66,'ali'),(665,'eman')

insert into tab5
select st_id,st_fname from Student where St_Address='cairo'

--bulk insert
--insert data from file   [delimited file]
bulk insert tab5
from 'g:\employee.txt'
with (fieldterminator=',')

--->Security  [authentication+authorization]
--->SQL server schema
--->transact_SQL
top   selectinto  newid  insertbasedonselect  bulkinsert
Ranking + Merge
-------------------------------------------------------
select *
from (select *,Row_number() over(order by st_age desc) as RN
       from student) as newtable
where RN=1

select *
from (select *,dense_Rank() over(order by st_age desc) as DR
	  from student) as newtable
where DR=1

select *
from (select *,ntile(3) over(order by st_age desc) as G
      from student) as newtable
where G=1


select *
from (select *,Row_number() over(partition by dept_id order by st_age desc) as RN
       from student) as newtable
where RN=1

select *
from (select *,dense_Rank() over(partition by dept_id order by st_age desc) as DR
	  from student) as newtable
where DR=1

select *
from (select *,ntile(2) over(partition by dept_id order by st_id desc) as G
      from student) as newtable
where g=1 and dept_id=10 
------------------------------------------------
--red gate SQL Prompt

create table Lastt
(
 Xid int,Xname varchar(10),Xval int
)

create table dailyt
(
 Yid int,Yname varchar(10),Yval int
)

Merge into Lastt as T   --target table
using dailyt as S       --Source table
On T.Xid= S.Yid

When Matched Then
	Update
		Set T.Xval = S.yval
When not Matched Then  ---not matched by target
	Insert
	values(S.Yid,S.yname,S.yval);

