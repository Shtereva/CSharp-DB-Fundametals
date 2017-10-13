CREATE PROC usp_CalculateFutureValueForAccount(@accountID int, @rate float) as 
SELECT ah.Id AS [Account Id], 
	FirstName AS [First Name], 
	LastName AS [Last Name], 
	a.Balance as [Current Balance],
	dbo.ufn_CalculateFutureValue(a.Balance, @rate, 5) AS [Balance in 5 years] 
FROM AccountHolders as ah
JOIN Accounts AS a ON ah.Id = a.AccountHolderId
WHERE a.Id = @accountID



EXEC usp_CalculateFutureValueForAccount 6, 0.1

