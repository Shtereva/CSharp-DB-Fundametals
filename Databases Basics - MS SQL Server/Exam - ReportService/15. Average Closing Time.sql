SELECT Final.[Department Name],
	   CASE WHEN Final.[Average Duration] IS NULL THEN 'no info' ELSE Final.[Average Duration] END
FROM	
	(SELECT a.[Department Name],
		   CAST(AVG(a.Time) AS varchar(50)) AS [Average Duration]
	FROM
		(SELECT d.Name AS [Department Name], DATEDIFF(DAY, r.OpenDate, r.CloseDate) AS [Time] FROM Departments AS d
		JOIN Categories AS c ON c.Departmentid = d.Id
		join Reports AS r ON c.Id = r.CategoryId
		GROUP BY d.Name, DATEDIFF(DAY, r.OpenDate, r.CloseDate)) AS a
	GROUP BY a.[Department Name] ) AS [Final]
ORDER BY Final.[Department Name]

 