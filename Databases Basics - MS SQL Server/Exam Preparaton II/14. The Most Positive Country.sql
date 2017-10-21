SELECT TOP(1) WITH TIES c.Name AS [CountryName], AVG(f.Rate) AS [FeedbackRate] FROM Countries AS c
JOIN Customers AS cu ON c.Id = cu.CountryId
JOIN Feedbacks AS f ON cu.Id = f.CustomerId
GROUP BY C.Name
ORDER BY AVG(f.Rate) DESC