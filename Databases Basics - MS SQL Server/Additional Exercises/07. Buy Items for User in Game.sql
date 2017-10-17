UPDATE UsersGames
SET Cash -= (SELECT SUM(Price) FROM Items
WHERE Name IN ('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin',
			   'Golden Gorget of Leoric', 'Hellfire Amulet'))
WHERE Id = 235


INSERT INTO UserGameItems(ItemId, UserGameId)
	SELECT Id, 235 FROM Items
	WHERE Id IN (51, 71, 157, 184, 197, 223)
	

SELECT u.Username
	, g.Name
	,ug.Cash
	,i.Name AS [Item Name]
 FROM Users AS u
JOIN UsersGames as ug on U.Id = ug.UserId
JOIN Games AS g ON ug.GameId = g.Id
JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
JOIN Items AS i ON i.Id = ugi.ItemId
WHERE g.Name = 'Edinburgh'
ORDER BY i.Name