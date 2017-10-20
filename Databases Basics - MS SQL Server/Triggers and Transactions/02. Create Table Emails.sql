
CREATE TRIGGER tr_email ON Logs FOR INSERT
AS	
	DECLARE @recipient int = (SELECT AccountId FROM inserted);

	DECLARE @old decimal(18, 2) = (SELECT OldSum FROM inserted);
	DECLARE @new decimal(18, 2) = (SELECT NewSum FROM inserted);

	DECLARE @subject VARCHAR(MAX) = 'Balance change for account: ' + CAST(@recipient AS varchar(50));
	DECLARE @body varchar(max) = 'On ' + CAST(GETDATE() AS varchar(100)) + ' your balance was changed from ' 
								+ CAST(@old AS varchar(50))+ ' to ' + CAST(@new AS varchar(50)) + '.';

	INSERT INTO NotificationEmails(Recipient, Subject, Body)
	VALUES (@recipient, @subject, @body)

GO

