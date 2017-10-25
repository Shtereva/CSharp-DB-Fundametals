SELECT 
	  CONCAT(e.Firstname, ' ', e.Lastname) AS [Name],
	  COUNT(r.UserId) AS [Users Number]
FROM Employees AS e
LEFT JOIN Reports AS r ON e.Id = r.EmployeeId
GROUP BY CONCAT(e.Firstname, ' ', e.Lastname)
ORDER BY COUNT(r.UserId) DESC, [Name]
