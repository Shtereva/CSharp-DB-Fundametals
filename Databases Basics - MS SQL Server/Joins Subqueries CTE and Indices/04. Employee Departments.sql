SELECT TOP (5) e.EmployeeID,
  FirstName,
  Salary,
  d.Name AS [DepartmentName]
  FROM Employees AS e
JOIN Departments as d ON d.DepartmentID = e.DepartmentID
WHERE Salary > 15000
ORDER BY e.DepartmentID