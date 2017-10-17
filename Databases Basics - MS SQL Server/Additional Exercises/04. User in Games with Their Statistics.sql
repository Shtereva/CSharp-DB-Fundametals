SELECT u.Username, g.Name AS [Game], MAX(CharStats.Name) AS [Character],
	 (SUM(ItemStats.Strength) + MAX(GameTypeStats.Strength) + MAX(CharStats.Strength)) AS [Strength],
	 (SUM(ItemStats.Defence) + MAX(GameTypeStats.Defence) + MAX(CharStats.Defence)) AS [Defence],
	 (SUM(ItemStats.Speed) + MAX(GameTypeStats.Speed) + MAX(CharStats.Speed)) AS [Speed],
	 (SUM(ItemStats.Mind) + MAX(GameTypeStats.Mind) + MAX(CharStats.Mind)) AS [Mind],
	 (SUM(ItemStats.Luck) + MAX(GameTypeStats.Luck) + MAX(CharStats.Luck)) AS [Luck]  
FROM Users AS u
JOIN UsersGames AS ug ON u.Id = ug.UserId
JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
JOIN Games AS g ON ug.GameId = g.Id
JOIN
	(SELECT ch.Id, ch.Name, s.Strength, s.Defence, s.Mind, s.Speed, s.Luck FROM Characters AS ch
	 JOIN [Statistics] AS s ON ch.StatisticId = s.Id) AS CharStats
ON CharStats.Id = ug.CharacterId
JOIN 
	(SELECT i.Id, s.Strength, s.Defence, s.Mind, s.Speed, s.Luck FROM Items AS i
	 JOIN [Statistics] AS s ON i.StatisticId = s.Id) AS ItemStats
ON ItemStats.Id = ugi.ItemId
JOIN
	(SELECT gt.Id, s.Strength, s.Defence, s.Mind, s.Speed, s.Luck FROM GameTypes AS gt
	 JOIN [Statistics] AS s ON s.Id = gt.BonusStatsId) AS GameTypeStats
ON GameTypeStats.Id = g.GameTypeId
GROUP BY U.Username, g.Name
ORDER BY [Strength] DESC, [Defence] DESC, [Speed] DESC, [Mind] DESC, [Luck] DESC