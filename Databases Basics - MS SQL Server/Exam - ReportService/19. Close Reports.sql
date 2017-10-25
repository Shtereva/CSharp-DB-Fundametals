create TRIGGER tr_change_status ON Reports for update
AS
begin	
	IF (SELECT TOP 1 CloseDate FROM inserted) IS NOT NULL
	BEGIN
		UPDATE Reports
		SET StatusId = 3
		WHERE  Id = (SELECT TOP(1) Id FROM inserted)
	END
end	