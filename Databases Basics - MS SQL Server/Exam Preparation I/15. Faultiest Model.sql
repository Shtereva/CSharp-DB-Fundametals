SELECT TOP(1) WITH TIES  m.Name AS [Model]
	, COUNT(j.JobId) AS [Times Serviced]
	, ISNULL(SUM(p.Price * op.Quantity), 0 ) AS [Parts Total]
FROM Models AS m
 LEFT JOIN Jobs AS j ON m.ModelId = j.ModelId
 LEFT JOIN Orders AS o ON o.JobId = j.JobId
 LEFT JOIN OrderParts AS op ON op.OrderId = o.OrderId
 LEFT JOIN Parts AS p ON p.PartId = op.PartId
WHERE j.Status = 'Finished' 
GROUP BY M.Name
ORDER BY [Times Serviced] DESC