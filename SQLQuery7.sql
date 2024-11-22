--1

create Proc Getst
as
	select dept_name ,COUNT(St_Id)
	from Department d join Student s 
	on d.Dept_Id=s.Dept_Id
	group by Dept_Name


--2
create proc Getemp
as
declare @num int 
set @num = (
   select count(*)
   from Employee e join Works_for w
   on e.SSN=w.ESSn and Pno=100)
   if @num>=3 
    select 'The number of employees in the project p1 is 3 or more'
   else 
     select 'The following employees work for the project p1'
	 union all 
	 select E. Fname +'  ' + Lname as [Full Name] from  Employee e join Works_for w 
	 on e.SSN=w.ESSn and Pno=100
Getemp


--3
CREATE PROCEDURE Replaceemployee
   @OldESSN INT,
    @NewESSN INT,
    @ProjectNumber INT
as 
 begin try
  update Works_for
     SET ESSN = @NewESSN
     where ESSN = @OldESSN
       AND Pno = @ProjectNumber
 end try 
 begin catch 
 select'error'
 end catch 

select*from Works_for


--4
ALTER TABLE Project
ADD Budget DECIMAL(18, 2);
GO
UPDATE Project
SET Budget = 100000 
WHERE PNumber = 1 
UPDATE Project
SET Budget = 95000
WHERE PNumber = 2
 
UPDATE Project
SET Budget = 120000
WHERE PNumber = 3
 
 
CREATE TABLE Audit (
    ProjectNumber INT,
    UserName NVARCHAR(100),
    ModifiedDate DATETIME,
    Budget_Old DECIMAL(18, 2),
    Budget_New DECIMAL(18, 2)
)
 
CREATE TRIGGER trgUpdateBudget
ON Project
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Budget)
    BEGIN
        INSERT INTO Audit (ProjectNumber, UserName, ModifiedDate, Budget_Old, Budget_New)
        SELECT 
            d.dnum AS ProjectNumber, 
            SYSTEM_USER AS UserName,
            GETDATE() AS ModifiedDate,
            d.Budget AS Budget_Old,
            i.Budget AS Budget_New
        FROM 
            inserted i
        JOIN 
            deleted d ON i.PNumber = d.Pnumber;
    END
END;
 
UPDATE Project
SET Budget = 200000
WHERE PNumber = 2


--5
create trigger dbo.t10
on dbo.department
instead of insert
as
	select 'Not allowed For User to insert= '+suser_name()
t10


--6
CREATE TRIGGER trg_Preventmarch
ON Employee
AFTER INSERT
AS
    IF MONTH(GETDATE()) = 3
        ROLLBACK TRANSACTION;
        PRINT 'You cannot insert a new record into the Employee table during March.'



--7
CREATE TRIGGER trg_AuditStudent
ON Student
AFTER INSERT
AS
    INSERT INTO Student_Audit
    SELECT 
        SYSTEM_USER,
        GETDATE(),
       'User ' + SYSTEM_USER + 
        ' Inserted New Row with Key = ' + 
        CAST(i.St_Id AS NVARCHAR(50)) +
        ' in table Student'
    FROM 
        inserted i


 --8
 CREATE TRIGGER trg_AuditStudent2
ON Student
INSTEAD OF DELETE
AS
    INSERT INTO Student_Audit
    SELECT 
        SYSTEM_USER,
        GETDATE(),
       'User ' + SYSTEM_USER + 
        ' Inserted New Row with Key = ' + 
        CAST(i.St_Id AS NVARCHAR(50)) +
        ' in table Student'
    FROM 
        inserted i
