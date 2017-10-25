CREATE PROC usp_AssignEmployeeToReport(@employeeId int, @reportId int)
AS
	IF (SELECT DepartmentId FROM Employees WHERE Id = 17) <> (SELECT c.Departmentid FROM Reports AS r
															  JOIN Categories AS c ON r.CategoryId = c.Id
															  WHERE r.Id =2 )
	BEGIN
	 ;throw 51000, 'Employee doesn''t belong to the appropriate department!', 1;
		RETURN;
	END
	ELSE
	BEGIN
		UPDATE Reports
		SET EmployeeId = @employeeId
		WHERE Id = @reportId
	END
	
