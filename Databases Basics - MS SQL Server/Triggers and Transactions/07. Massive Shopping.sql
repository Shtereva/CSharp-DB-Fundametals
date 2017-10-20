BEGIN TRY
BEGIN TRANSACTION
	DECLARE @sum money = (SELECT SUM(Price) FROM Items WHERE MinLevel IN(11, 12))

	UPDATE UsersGames
	SET Cash -= @sum
	WHERE Id = 110

	IF (SELECT ug.Cash FROM UsersGames AS ug
					   WHERE ug.Id = 110) - @sum < 0
	BEGIN
		ROLLBACK
		
	END

	INSERT INTO UserGameItems (ItemId, UserGameId)
	SELECT Id, 110 FROM Items WHERE MinLevel IN(11, 12)
	
	COMMIT
	END TRY 
	BEGIN CATCH
			ROLLBACK
	END CATCH

	BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @sum2 money = (SELECT SUM(Price) FROM Items WHERE MinLevel IN (19, 20, 21))

	UPDATE UsersGames
	SET Cash -= @sum2
	WHERE Id = 110
	
	IF (SELECT ug.Cash FROM UsersGames AS ug
					   WHERE ug.Id = 110) - @sum2 < 0
	BEGIN
		ROLLBACK
		
	END

	INSERT INTO UserGameItems (ItemId, UserGameId)
	SELECT Id, 110 FROM Items WHERE MinLevel IN (19, 20, 21)
	
	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK
	END CATCH

	SELECT i.Name AS [Item Name] FROM Items AS i 
	JOIN UserGameItems AS ugi ON i.Id = ugi.ItemId
	WHERE ugi.UserGameId = 110
	ORDER BY i.Name