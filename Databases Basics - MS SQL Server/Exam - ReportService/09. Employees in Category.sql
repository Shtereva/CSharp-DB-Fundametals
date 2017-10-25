SELECT c.Name, COUNT(e.Id) FROM Categories AS c
JOIN Departments AS d ON c.Departmentid = d.Id
JOIN Employees AS e ON d.Id = e.DepartmentId
GROUP BY c.Name
ORDER BY c.Name