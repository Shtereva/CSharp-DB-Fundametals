CREATE PROC usp_WithdrawMoney(@accountId int, @moneyAmount decimal(18, 4))
AS
	BEGIN TRANSACTION
		UPDATE Accounts
		SET Balance -= @moneyAmount
		WHERE Id = @accountId

		DECLARE @balance money = (SELECT Balance FROM Accounts WHERE Id = @accountId);
		IF (@moneyAmount < 0.0001) AND (@balance - @moneyAmount < 0)
		BEGIN
			ROLLBACK
			return
		END

		COMMIT

usp_WithdrawMoney 5, 25