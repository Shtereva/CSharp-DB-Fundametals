SELECT a.[Department Name],
	   a.[Category Name],
	   CAST(ROUND((CAST(a.LocalCount AS decimal(10)) / a.TotalCount) * 100, 0) AS INT) AS [Percentage]
FROM
	(SELECT DISTINCT d.Name AS [Department Name],
		   c.Name AS [Category Name],
		   COUNT(r.Id) OVER (PARTITION BY d.Name, c.Name ORDER BY d.Name, c.Name) AS [LocalCount],
		   COUNT(r.Id) OVER (PARTITION BY d.Name ORDER BY d.Name) AS [TotalCount]	   
	FROM Departments AS d
	LEFT JOIN Categories AS c ON c.Departmentid = d.Id
	LEFT JOIN Reports AS r ON c.Id = r.CategoryId
	WHERE R.UserId IS NOT NULL) AS a
ORDER BY a.[Department Name], a.[Category Name], [Percentage]



