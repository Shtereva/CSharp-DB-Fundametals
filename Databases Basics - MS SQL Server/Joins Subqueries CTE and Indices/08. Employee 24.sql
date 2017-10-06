SELECT  e.EmployeeID, e.FirstName,
	CASE 
		WHEN p.Name = ANY (SELECT Name FROM Projects WHERE StartDate > '2005') THEN NULL
		ELSE p.Name
	END AS [ProjectName]
FROM Employees AS e
JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects as p ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24

 
