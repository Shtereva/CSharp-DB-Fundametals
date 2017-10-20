--CREATE TABLE Deleted_Employees(
--EmployeeId int PRIMARY KEY,
--FirstName varchar(100),
--LastName varchar(100),
--MiddleName varchar(100),
--JobTitle varchar(100),
--DeparmentId int,
--Salary money
--)

ALTER TRIGGER tr_deleted_employees ON Employees FOR DELETE
AS
DELETE FROM EmployeesProjects
WHERE EmployeeID = (SELECT EmployeeID FROM deleted)

UPDATE Departments
SET ManagerID = 0
WHERE ManagerID = (SELECT EmployeeID FROM deleted)

INSERT INTO Deleted_Employees
SELECT d.EmployeeID, d.FirstName, d.LastName, d.MiddleName, d.JobTitle, d.DepartmentID, d.Salary FROM deleted AS d



DELETE FROM Employees
WHERE EmployeeID = 1