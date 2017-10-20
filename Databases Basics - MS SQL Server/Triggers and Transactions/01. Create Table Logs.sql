
CREATE TRIGGER tr_logs ON Accounts FOR UPDATE 
AS
BEGIN
	INSERT INTO Logs(AccountId, OldSum, NewSum)
	SELECT inserted.Id, deleted.Balance, inserted.Balance FROM inserted
	JOIN deleted ON inserted.Id = deleted.Id
END

