SELECT TOP (50) e.EmployeeID,
  FirstName,
  LastName,
  d.Name AS [DepartmentName]
  FROM Employees AS e
JOIN Departments as d ON d.DepartmentID = e.DepartmentID
WHERE d.Name = 'Sales'
ORDER BY e.EmployeeID