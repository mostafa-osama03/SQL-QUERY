--1
SELECT Dependent_name, sex FROM Dependent WHERE Sex = 'F' AND ESSN IN (SELECT SSN FROM Employee WHERE Sex = 'F')
UNION
SELECT Dependent_name, sex FROM Dependent WHERE Sex = 'M' AND ESSN IN (SELECT SSN FROM Employee WHERE Sex = 'M')
--2
SELECT P.Pname, SUM(W.Hours) AS TotalHours
FROM Project P JOIN Works_for W ON P.Pnumber = W.Pno
GROUP BY P.Pname
--3
SELECT D.*
FROM Departments D JOIN Employee E ON D.Dnum = E.Dno
WHERE E.SSN = (SELECT MIN(SSN) FROM Employee)
--4
SELECT D.Dname, MAX(E.Salary) AS MaxSalary, MIN(E.Salary) AS MinSalary, AVG(E.Salary) AS AvgSalary
FROM Departments D JOIN Employee E ON D.Dnum = E.Dno
GROUP BY D.Dname
--5
SELECT E. Fname +'  ' + Lname as [Full Name]
FROM Employee E
WHERE E.SSN NOT IN (SELECT ESSN FROM Dependent) AND E.SSN IN (SELECT Mgrssn FROM Departments)
--6
SELECT D.Dnum, D.Dname, COUNT(E.SSN) AS EmployeeCount
FROM Departments D JOIN Employee E ON D.Dnum = E.Dno
GROUP BY D.Dnum, D.Dname
HAVING AVG(E.Salary) < (SELECT AVG(Salary) FROM Employee)
--7
SELECT E.Lname, E.Fname, P.Pname
FROM Employee E JOIN Works_for W ON E.SSN = W.ESSN JOIN Project P ON W.Pno = P.Pnumber
ORDER BY E.Dno, E.Lname, E.Fname 
--8
SELECT DISTINCT Salary
FROM Employee
WHERE Salary IN (SELECT ma Salary FROM Employee ORDER BY Salary desc )
--9
SELECT E.Fname, E.Lname
FROM Employee E
WHERE EXISTS (SELECT * FROM Dependent D WHERE  E.Lname LIKE '%' + D.Dependent_name + '%')
--10
select
  (SELECT MAX(Salary) FROM Employee) maxsalary,
  (SELECT MAX(Salary) FROM Employee
  WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee )) as [2nd_max_salary]
--11
insert into Departments(Dname,Dnum,MGRSSN,[MGRStart Date])
values ('DEPT IT',100,112233,11/1/2006)
--12
UPDATE Departments 
SET MGRSSN = 968574 WHERE Dnum = 100
UPDATE Departments SET MGRSSN = 102672 
WHERE Dnum = 20
UPDATE Employee
SET Superssn = 102672 WHERE SSN = 102660
--13
DELETE FROM Employee WHERE SSN = 223344
DELETE FROM Dependent WHERE ESSN = 223344
UPDATE Departments SET MGRSSN = NULL WHERE MGRSSN = 223344
UPDATE Employee SET Superssn = NULL WHERE Superssn = 223344
DELETE FROM Works_for WHERE ESSN = 223344
--14
UPDATE Employee
SET Salary = (Salary * 1.30)
WHERE SSN IN (SELECT ESSN FROM Works_for WHERE Pno IN (SELECT Pnumber FROM Project WHERE Pname = 'AlRabwah'))
