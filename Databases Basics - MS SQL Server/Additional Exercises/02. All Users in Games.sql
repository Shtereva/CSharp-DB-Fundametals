SELECT g.Name AS [Game]
	 , gt.Name AS [Game Type]
	 , u.Username
	 , ug.Level
	 , ug.Cash
	 , c.Name AS [Character]
FROM Games AS g
JOIN GameTypes AS gt ON gt.Id = g.GameTypeId
JOIN UsersGames AS ug ON g.Id = ug.GameId
JOIN Users AS u ON ug.UserId = u.Id
JOIN Characters AS c ON c.Id = ug.CharacterId
ORDER BY ug.Level DESC, U.Username, g.Name