SELECT TOP (10) WITH TIES p.Name,
	 p.Description, 
	 ISNULL(AVG(f.Rate), 0.0) AS [AverageRate], 
	 ISNULL(COUNT(f.Id), 0) AS [FeedbacksAmount] 
FROM Products AS p
RIGHT JOIN Feedbacks AS f ON p.Id = f.ProductId
GROUP BY p.Name, p.Description
ORDER BY  AVG(f.Rate) DESC, COUNT(f.Id)  DESC

