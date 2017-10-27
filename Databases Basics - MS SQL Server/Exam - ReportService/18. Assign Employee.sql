CREATE PROC usp_AssignEmployeeToReport(@employeeId int, @reportId int)
AS
	IF (SELECT DepartmentId FROM Employees WHERE Id = @employeeId) <> (SELECT c.Departmentid FROM Reports AS r
															  JOIN Categories AS c ON r.CategoryId = c.Id
															  WHERE r.Id = @reportId )
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
	
