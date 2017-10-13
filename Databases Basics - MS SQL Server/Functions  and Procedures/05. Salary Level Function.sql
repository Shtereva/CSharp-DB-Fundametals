CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4)) 
RETURNS varchar(10)
AS
BEGIN
	IF (@salary < 30000)
	BEGIN
		return 'Low'
	END

	ELSE IF (@salary > 50000)
	BEGIN
		return 'High'
	END

RETURN 'Average'
END

GO
SELECT Salary, dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level] FROM Employees