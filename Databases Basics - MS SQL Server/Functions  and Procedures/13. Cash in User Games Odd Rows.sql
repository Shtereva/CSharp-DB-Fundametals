--CREATE FUNCTION ufn_CashInUsersGames(@gameName varchar(255)) 
--RETURNS @table TABLE (SumCash decimal(18, 2)) AS
--BEGIN
--	DECLARE @gameID int = (SELECT Id FROM Games WHERE Name = @gameName );
--	INSERT INTO @table(SumCash)  (SELECT  SUM(a.Cash) AS [SumCash] FROM
--											(SELECT Cash, 
--											ROW_NUMBER() OVER(ORDER BY Cash DESC) AS [Row]
--											FROM UsersGames
--											WHERE GameId = @gameID) AS a
--											WHERE a.Row % 2 <> 0);

--RETURN;
--END

--SELECT * from dbo.ufn_CashInUsersGames('Lily Stargazer')

create FUNCTION ufn_CashInUsersGames(@gameName varchar(255)) 
RETURNS TABLE
	RETURN (SELECT  SUM(a.Cash) AS [SumCash] FROM
											(SELECT Cash, 
											ROW_NUMBER() OVER(ORDER BY Cash DESC) AS [Row]
											FROM UsersGames
											WHERE GameId = (SELECT Id FROM Games WHERE Name = @gameName )) AS a
											WHERE a.Row % 2 <> 0);


