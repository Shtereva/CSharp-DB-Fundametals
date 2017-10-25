DECLARE @status varchar(50) =
(SELECT TOP(1) b.Status FROM
		(SELECT TOP 1 c.Name AS [Category Name],
				COUNT(c.Name) OVER (PARTITiON BY c.Name, s.Label ORDER BY c.Name, s.Label) AS [Count],
				COUNT(r.Id) OVER(PARTITiON BY c.Name ORDER BY c.Name) AS [Reports Number],
				s.Label AS [Status]	   
			FROM Categories AS c
			LEFT JOIN Reports AS r ON c.Id = r.CategoryId
			LEFT JOIN Status AS s ON s.Id = r.StatusId
			WHERE r.StatusId IN (1, 2)) AS b
ORDER BY b.Count DESC)


SELECT a.[Category Name], a.[Reports Number],
		CASE WHEN a.count = a.[Reports Number] then a.Status
			 WHEN a.[Reports Number] - a.Count = a.Count THEN 'equal'
			 ELSE @status
			 END AS [Main Status]
		 FROM(
SELECT c.Name AS [Category Name],
	   COUNT(c.Name) OVER (PARTITiON BY c.Name, s.Label ORDER BY c.Name, s.Label) AS [Count],
	   COUNT(r.Id) OVER(PARTITiON BY c.Name ORDER BY c.Name) AS [Reports Number],
	   s.Label AS [Status]	   
 FROM Categories AS c
LEFT JOIN Reports AS r ON c.Id = r.CategoryId
LEFT JOIN Status AS s ON s.Id = r.StatusId
WHERE r.StatusId IN (1, 2)) as a
GROUP BY a.[Category Name], a.[Reports Number],
											    CASE WHEN a.count = a.[Reports Number] then a.Status
												WHEN a.[Reports Number] - a.Count = a.Count THEN 'equal'
												ELSE @status
												END
ORDER BY a.[Category Name], a.[Reports Number], [Main Status]