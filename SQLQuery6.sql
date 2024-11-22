--1
select *from Student
where St_Age is not null
--2
select distinct Ins_Name from Instructor
--3
select  St_id as [Student ID] , isnull( St_fname,'') +'  ' + isnull (St_lname,'') as [Student Full Name],isnull (Dept_Name,'') as [Department name]
from Student s join Department d on s.Dept_Id=d.Dept_Id
--4
select Ins_Name ,Dept_name 
from Instructor i LEFT join Department d on i.Dept_Id=d.Dept_Id
--5
select  St_fname +'  ' +  St_lname as [Student Full Name] ,Crs_name
from Stud_Course s
inner join Course a on s.Crs_Id=a.Crs_Id
inner join Student c on c.St_Id=s.st_id  and Grade is not null


--6
SELECT top_name, COUNT(c.crs_id) AS topiccount
FROM Topic t JOIN Course c ON c.Top_Id = t.Top_Id
GROUP BY  Top_Name
--7
select
(select max(salary) from Instructor)  maxsalary ,
(select min(Salary) from Instructor )  minsalary 
--8
select ins_name from Instructor
where salary < (select avg (salary)from Instructor)
--9
select dept_name from 
Department d
inner join Instructor i on i.Dept_Id=d.Dept_Id
and i.Salary=(select min(Salary) from Instructor )
--10
select
  (SELECT MAX(Salary) FROM Instructor) maxsalary,
  (SELECT MAX(Salary) FROM Instructor
  WHERE Salary NOT IN (SELECT MAX(Salary) FROM Instructor)) as [2nd_max_salary]
  ---
  select top(2) salary
from Instructor
order  by salary desc
--11
SELECT 
    i.ins_name, 
    COALESCE(CAST(i.salary AS VARCHAR), 'Bonus') AS Salary
FROM 
    instructor i
--12
select avg (salary)from Instructor
--13
SELECT 
    s.st_fname , i.* 
FROM 
    student s
JOIN 
    instructor i 
ON 
    s.st_super = i.ins_id
--14
CREATE VIEW  StudentGradeView as  
 SELECT  
    s.st_fname+ ' '+ s.st_lname AS full_name,
    c.crs_name , g.grade
FROM 
    student s
JOIN 
    Stud_Course g 
ON 
    s.st_id = g.st_id
JOIN 
    course c 
ON 
    g.crs_id = c.crs_id
WHERE 
    g.grade > 50
select * from StudentGradeView
--15
CREATE VIEW InstructorCourse with encryption AS
SELECT 
    i.ins_Name, 
    c.crs_Name
FROM 
    Instructor i
JOIN 
    Ins_Course ic 
ON 
    i.ins_ID = ic.ins_ID
JOIN 
    Course c 
ON 
    ic.crs_ID = c.crs_ID
select * from InstructorCourse
--16
CReate view instracturnS as 
select ins_name ,dept_name 
from Instructor i join Department d on d.Dept_Id=i.Dept_Id
where d.Dept_Name in('SD' ,'java')
select*from instracturnS
