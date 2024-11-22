--1
select d.Dnum, d.Dname AS DepartmentName , MGRSSN AS MANAGERID, m.Dependent_name as managerName 
from Departments d,Dependent m 
--2
SELECT Dname , Pname 
FROM Departments d , Project p
WHERE p.Dnum = d.Dnum
--3
SELECT de.* , e.Fname+'',e.Lname AS EmployeeName
FROM Dependent de
JOIN Employee e ON de.ESSN= e.SSN
--4
select Pname,plocation,Pnumber 
from Project
where City in ('cairo','alex')
--5
select *from Project
where Pname LIKE 'a%'
--6
select*from Employee
where Dno=30 and Salary between 1000 and 2000
--7
select Fname+'',Lname as employeename
from Employee
join Works_for on ESSn=Works_for.ESSN 
JOIN Project ON Works_for .Pno= Project.Pnumber
where Dno=10 and Pname='AL Rabwah'AND Hours>=10 
--8
select emp.Fname from Employee
emp join Employee sup 
on emp.Superssn=sup.SSN where sup.Fname = 'kamel' and sup.Lname='Mohamed '
--9
SELECT Fname+'',Lname AS EmployeeName, Pname AS ProjectName
FROM Employee
JOIN  Works_for ON SSN = Works_for.ESSn
JOIN Project ON Works_for.Pno = project.Pnumber
ORDER BY Pname
--10
select project.Pnumber,Departments.Dname,Employee.Lname,Employee.Address,Employee.Bdate 
from Project,Departments,Employee 
where Project.Dnum=Departments.Dnum 
and Employee.SSN=Departments.MGRSSN and Project.City='Cairo'
--11
SELECT *FROM Employee
WHERE SSN IN (SELECT MGRSSN FROM Departments)
--12
SELECT Employee.*, de.*
FROM Employee 
left JOIN Dependent de ON SSN = ESSN
--13
INSERT INTO Employee (SSN, Fname,Lname,  Dno, Superssn,Salary)
VALUES (102672, 'mostafa','osama',  30, 112233,3000)
SELECT*from Employee
--14
INSERT INTO Employee (SSN, Fname,Lname,  Dno)
values (102660,'abdelrahman','abdelnasser',30)
SELECT*from Employee

UPDATE    Employee
SET  Salary=(3000)
where Fname='mostafa'
--15
UPDATE    Employee
SET  Salary = (Salary*.2 + Salary)
WHERE Fname='mostafa'
--1
Select Employee.SSN,Employee.Fname,Departments.Dnum
,Departments.Dname from Employee join Departments
on Employee.SSN=Departments.MGRSSN

