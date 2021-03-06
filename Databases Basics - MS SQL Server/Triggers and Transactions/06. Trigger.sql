ALTER TRIGGER tr_insert_items ON UserGameItems FOR INSERT
AS
	DECLARE @userLevel int = (SELECT ug.Level FROM UsersGames AS ug WHERE (SELECT i.UserGameId FROM inserted AS i) = ug.UserId)
	DECLARE @itemLevel int = (SELECT i.MinLevel FROM Items AS i WHERE (SELECT i.ItemId FROM inserted AS i) = i.Id)

	IF @itemLevel > @userLevel
	BEGIN
		ROLLBACK
	END
	ELSE
	BEGIN
		UPDATE UsersGames
		SET Cash -= (SELECT i.Price FROM Items AS i WHERE I.Id = (SELECT i.ItemId FROM inserted AS i))
		WHERE (SELECT ug.UserId FROM UsersGames AS ug) = (SELECT i.UserGameId FROM inserted AS i)
	END
GO


UPDATE UsersGames
SET Cash += 50000
WHERE GameId = 212 AND (UserId IN (61, 22, 37, 52, 12))
GO

DECLARE @count int = 251;
WHILE @count <= 299
BEGIN
	INSERT INTO UserGameItems(ItemId, UserGameId) VALUES
	(@count, 61),
	(@count, 22),
	(@count, 37),
	(@count, 52),
	(@count, 12)

	SET @count += 1
END;

SET @count = 501;
WHILE @count <= 539
BEGIN
	INSERT INTO UserGameItems(ItemId, UserGameId) VALUES
	(@count, 61),
	(@count, 22),
	(@count, 37),
	(@count, 52),
	(@count, 12)

	SET @count += 1
END;


SELECT u.Username,ug.UserId, g.Name, ug.Cash, i.Name AS [Item Name] FROM Users AS u
FULL JOIN UsersGames AS ug ON u.Id = ug.UserId
FULL JOIN Games AS g ON ug.GameId = g.Id
FULL JOIN UserGameItems AS ugi ON ug.UserId = ugi.UserGameId
FULL JOIN Items AS i ON ugi.ItemId = i.Id
WHERE g.Name = 'Bali' AND (u.Username IN('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos'))
ORDER BY u.Username, i.Name