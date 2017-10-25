SELECT e.Firstname,
	   e.Lastname, 
	   r.Description,
	   FORMAT(r.OpenDate, 'yyyy-MM-dd') AS [OpenDate]
FROM Employees AS e
JOIN Reports AS r ON e.Id = r.EmployeeId
ORDER BY e.Id, [OpenDate], r.Id