CREATE PROC usp_TransferMoney(@senderId int, @receiverId int, @amount decimal(18, 4))
AS
	exec usp_WithdrawMoney @senderId , @amount;
	exec usp_DepositMoney @receiverId, @amount;
			

		
exec usp_TransferMoney 5,1, 5000
