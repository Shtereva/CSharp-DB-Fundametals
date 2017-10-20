SELECT m.ModelId, m.Name ,
	 CAST(AVG(DATEDIFF(DAY, j.IssueDate, j. FinishDate)) AS varchar(50)) + ' ' + 'days'  AS [Average Service Time]
 FROM Models AS m
JOIN Jobs AS j ON m.ModelId = j.ModelId
WHERE j.FinishDate IS NOT NULL
GROUP BY m.ModelId, m.Name
ORDER BY AVG(DATEDIFF(DAY, j.IssueDate, j. FinishDate))