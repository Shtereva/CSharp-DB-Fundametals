SELECT fb.ProductId,
	   CONCAT(c.FirstName, ' ', c.LastName) [CustomerName],
	   fb.Description AS [FeedbackDescription]
FROM Feedbacks as fb
LEFT JOIN Customers AS c ON c.Id = fb.CustomerId	
WHERE fb.CustomerId IN (SELECT F.CustomerId	   
						FROM Feedbacks AS f
						LEFT JOIN Customers AS c ON c.Id = f.CustomerId
						GROUP BY f.CustomerId
						HAVING count(f.Id) >= 3)
ORDER BY fb.ProductId, [CustomerName], fb.Id

