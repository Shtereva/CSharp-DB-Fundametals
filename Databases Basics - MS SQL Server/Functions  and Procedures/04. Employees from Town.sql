CREATE PROCEDURE usp_GetEmployeesFromTown  (@townName varchar(50))  AS
	DECLARE @townID int = (SELECT TownID FROM Towns WHERE Name = @townName)
	SELECT FirstName, LastName FROM Employees AS e
	JOIN Addresses AS a ON a.AddressID = e.AddressID
	WHERE a.TownID = @townID
	


EXEC usp_GetEmployeesFromTown  'Redmond'