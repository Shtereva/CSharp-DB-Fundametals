
SELECT a.[Category Name], a.[Reports Number], 
		CASE WHEN a.countInProgress > a.countWaiting THEN 'in progress'
		     WHEN a.countInProgress < a.countWaiting THEN 'waiting'
			 ELSE 'equal'
		END AS [Main Status]
	FROM
	(SELECT c.Name AS [Category Name],
		   count(r.Id) OVER(PARTITiON BY c.Name ORDER BY c.Name) AS [Reports Number],
		   CountStatus.countInProgress,
		   CountStatus.countWaiting	   
	 FROM Categories AS c
	LEFT JOIN Reports AS r ON c.Id = r.CategoryId
	LEFT JOIN Status AS s ON s.Id = r.StatusId
	LEFT JOIN 
		(SELECT re.CategoryId,
				SUM(CASE WHEN st.Label = 'in progress' THEN 1 ELSE 0 END) AS [countInProgress],
				SUM(CASE WHEN st.Label = 'waiting' THEN 1 ELSE 0 END) AS [countWaiting]
			 FROM Reports AS re
			 JOIN Status AS st ON st.Id = re.StatusId
			 WHERE st.Label IN ('in progress', 'waiting')
			 GROUP BY re.CategoryId) AS [CountStatus] ON C.Id = CountStatus.CategoryId
WHERE r.StatusId IN (1, 2)) AS a
GROUP BY a.[Category Name], a.[Reports Number], CASE WHEN a.countInProgress > a.countWaiting THEN 'in progress'
													 WHEN a.countInProgress < a.countWaiting THEN 'waiting'
													 ELSE 'equal'
												END 
ORDER BY a.[Category Name], a.[Reports Number], [Main Status]