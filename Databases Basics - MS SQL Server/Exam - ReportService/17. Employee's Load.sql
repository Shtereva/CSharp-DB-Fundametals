CREATE FUNCTION udf_GetReportsCount(@employeeId INT, @statusId INT)
RETURNS INT
AS
BEGIN
DECLARE @result int = ( SELECT ISNULL(COUNT(Id), 0) AS [Result] FROM Reports
							WHERE EmployeeId = @employeeId AND StatusId = @statusId
							GROUP BY Id) 

RETURN @result  
END

SELECT Id, FirstName, Lastname, dbo.udf_GetReportsCount(Id, 2) AS ReportsCount
FROM Employees
ORDER BY Id
