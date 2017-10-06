SELECT TOP (3) EmployeeID,
  FirstName
  FROM Employees
WHERE EmployeeID != ALL (SELECT EmployeeID FROM EmployeesProjects)
ORDER BY EmployeeID