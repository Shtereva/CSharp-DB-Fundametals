SELECT p.PartId
	 , p.Description 
	 , pn.Quantity AS [Required]
	 , P.StockQty AS [In Stock]
	 ,  (SELECT COUNT(*) FROM Parts AS p
		JOIN OrderParts AS op ON p.PartId = op.PartId
		JOIN Orders AS o ON o.OrderId = op.OrderId
		WHERE o.JobId = j.JobId ) AS [Ordered]
FROM Parts AS p
JOIN PartsNeeded AS pn ON p.PartId = pn.PartId
JOIN Jobs AS j ON j.JobId = pn.JobId
WHERE j.Status <> 'Finished' AND p.StockQty < pn.Quantity 
ORDER BY p.PartId

