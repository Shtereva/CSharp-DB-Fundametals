SELECT tem.ProductName, tem.ProductAverageRate, tem.DistributorName, tem.DistributorCountry FROM	
	(SELECT p.Name AS [ProductName],
			AVG(f.Rate) AS [ProductAverageRate],
			d.Name AS [DistributorName],
			co.Name AS [DistributorCountry],
			COUNT(d.Name) OVER (PARTITION BY p.Name ORDER BY p.Name ) AS [CountDistr],
			p.Id AS [ProductId]
	FROM Products AS p
	JOIN ProductsIngredients AS [pi] ON p.Id = [pi].ProductId
	JOIN Ingredients AS i ON [pi].IngredientId = i.Id
	JOIN Distributors AS d ON i.DistributorId = d.Id
	JOIN Countries AS co ON d.CountryId = co.Id
	JOIN Feedbacks AS f ON p.Id = f.ProductId
	GROUP BY p.Name, d.Name, co.Name, p.Id) AS tem
WHERE tem.CountDistr = 1
ORDER BY tem.ProductId


