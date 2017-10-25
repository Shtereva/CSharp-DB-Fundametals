SELECT  a.Name,
	   CONCAT(CAST(a.CountClosed AS varchar(10)), '/', CAST(a.CountOpen AS varchar(10))) AS [Closed Open Reports]
FROM
	(SELECT  CONCAT(e.Firstname, ' ', e.Lastname) AS [Name],
		   r.OpenDate,
		   r.CloseDate,
		   e.Id,
		   COUNT(r.OpenDate) AS [CountOpen],
		   COUNT(r.CloseDate) AS [CountClosed]
	FROM Employees AS e
	JOIN Reports AS r ON e.Id = r.EmployeeId
	WHERE (DATEPART(YEAR, r.OpenDate) = 2016 AND r.CloseDate IS NULL)
	OR (DATEPART(YEAR, r.CloseDate) = 2016)
	GROUP BY CONCAT(e.Firstname, ' ', e.Lastname), e.Id, R.OpenDate, R.CloseDate) AS a
ORDER BY a.Name, a.Id