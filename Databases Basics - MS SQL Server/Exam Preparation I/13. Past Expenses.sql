SELECT j.JobId, ISNULL(SUM(p.Price * op.Quantity), 0 ) AS [Total] FROM Parts AS p
FULL JOIN OrderParts AS op ON op.PartId = p.PartId
FULL JOIN Orders AS o ON op.OrderId = o.OrderId
FULL JOIN Jobs AS j ON o.JobId = j.JobId
WHERE j.Status = 'Finished'
GROUP BY j.JobId
ORDER BY [Total] DESC, j.JobId

