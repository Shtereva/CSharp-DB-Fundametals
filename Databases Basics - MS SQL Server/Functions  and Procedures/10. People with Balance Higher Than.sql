CREATE PROC usp_GetHoldersWithBalanceHigherThan(@number money)  AS

SELECT FirstName, LastName FROM AccountHolders AS ah
JOIN Accounts AS a ON ah.Id = a.AccountHolderId
GROUP BY FirstName, LastName
having sum(a.Balance) > @number


usp_GetHoldersWithBalanceHigherThan 5585351