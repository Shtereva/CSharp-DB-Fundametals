--CREATE TABLE Deleted_Employees(
--EmployeeId int PRIMARY KEY identity,
--FirstName varchar(100),
--LastName varchar(100),
--MiddleName varchar(100),
--JobTitle varchar(100),
--DepartmentId int,
--Salary money
--)

CREATE TRIGGER tr_deleted_employees ON Employees FOR DELETE
AS


INSERT INTO Deleted_Employees(FirstName,LastName,MiddleName,JobTitle,DepartmentId,Salary)
SELECT d.FirstName, d.LastName, d.MiddleName, d.JobTitle, d.DepartmentID, d.Salary FROM deleted AS d



--DELETE FROM Employees
--WHERE EmployeeID = 1