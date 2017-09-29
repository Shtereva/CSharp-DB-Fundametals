SELECT TOP(10) FirstName, LastName, DepartmentID FROM Employees e
WHERE  Salary >  (SELECT AVG(Salary) FROM Employees e2 where e2.DepartmentID = e.DepartmentID)
ORDER BY DepartmentID


