--1
select*from EMPLOYEE
--2
select Fname,Lname,salary,Dno from Employee
--3
select*from Project
select Pname,plocation,Dnum from Project
--4
select Fname +'  ' + Lname as [Full Name] , Salary*1.2 as [ANNUAL COMM]from employee 
--5
select SSN, Fname, Lname from employee where salary > 1000
--6
select SSN, Fname, Lname from employee where salary*12 > 10000
--7
select Fname +'  ' + Lname as [Full Name]  from employee where Sex='F'
--8
select DNum, Dname from Departments where MGRSSN = 968574
--9
select*from Project
select Pnumber, Pname, Plocation from Project where Dnum = 10
