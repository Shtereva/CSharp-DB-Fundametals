SELECT a.CountryName, a.DisributorName FROM	
	(SELECT DISTINCT c.Name AS [CountryName],
					d.Name AS [DisributorName],
					COUNT(i.Id) AS [Rank]
	FROM Countries AS c
    LEFT JOIN Distributors AS d ON c.Id = d.CountryId
    LEFT JOIN Ingredients AS i ON d.Id = i.DistributorId
	GROUP BY c.Name, d.Name) AS a
WHERE a.DisributorName IS NOT NULL AND a.Rank = (SELECT TOP(1)  COUNT(i.Id) AS [Rank]
												FROM Countries AS c
												LEFT JOIN Distributors AS d ON c.Id = d.CountryId 
												LEFT JOIN Ingredients AS i ON d.Id = i.DistributorId
												WHERE c.Name = a.CountryName
												GROUP BY c.Name, d.Name
												ORDER BY COUNT(i.Id) DESC)

ORDER BY a.CountryName, a.DisributorName