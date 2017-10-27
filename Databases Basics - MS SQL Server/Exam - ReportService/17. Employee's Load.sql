CREATE FUNCTION udf_GetReportsCount(@employeeId INT, @statusId INT)
RETURNS INT
AS
BEGIN
DECLARE @result int = ( SELECT COUNT(Id) AS [Result] FROM Reports
							WHERE EmployeeId = @employeeId AND StatusId = @statusId
							GROUP BY Id) 

RETURN ISNULL(@result, 0)  
END


