CREATE PROC usp_DepositMoney (@accountId int, @moneyAmount decimal(18, 4))
AS
	BEGIN TRANSACTION
		UPDATE Accounts
		SET Balance += @moneyAmount
		WHERE Id = @accountId

		IF @@ROWCOUNT <> 1 
		BEGIN
			ROLLBACK
			RAISERROR('Invalid account', 16, 1)
			RETURN
		END

		IF @moneyAmount < 0.0001
		BEGIN
			ROLLBACK
			return
		END

		COMMIT

usp_DepositMoney 1, 10