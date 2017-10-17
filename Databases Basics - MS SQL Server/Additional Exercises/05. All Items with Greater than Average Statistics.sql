SELECT i.Name, i.Price, i.MinLevel, s.Strength, s.Defence, s.Speed, s.Luck, s.Mind
FROM Items AS i
JOIN [Statistics] AS s ON s.Id = i.StatisticId
WHERE 
	(SELECT AVG(Speed) FROM [Statistics]) < s.Speed AND
	(SELECT AVG(Luck) FROM [Statistics]) < s.Luck AND
	(SELECT AVG(Mind) FROM [Statistics]) < s.Mind
GROUP BY i.Name,i.Price,i.MinLevel, s.Strength, s.Defence, s.Speed, s.Luck, s.Mind
ORDER BY i.Name

