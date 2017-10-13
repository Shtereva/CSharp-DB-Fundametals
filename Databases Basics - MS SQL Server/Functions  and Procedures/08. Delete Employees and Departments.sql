

CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId INT) AS

ALTER TABLE Employees nocheck constraint [FK_Employees_Departments]
ALTER TABLE Departments nocheck constraint [FK_Departments_Employees]
ALTER TABLE EmployeesProjects nocheck constraint [FK_EmployeesProjects_Employees]
ALTER TABLE Employees nocheck constraint [FK_Employees_Employees]

DELETE FROM Employees
WHERE DepartmentID = @departmentId

DELETE FROM Departments
WHERE DepartmentID = @departmentId

SELECT COUNT(*) FROM Employees where DepartmentID = @departmentId

exec usp_DeleteEmployeesFromDepartment 11

