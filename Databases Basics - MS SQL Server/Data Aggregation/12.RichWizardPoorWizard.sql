DECLARE @ID int = 1
DECLARE @sum decimal(10, 2) = 0
	WHILE @ID < (SELECT COUNT(Id)  FROM WizzardDeposits)
	BEGIN
		SET @sum += (
		(SELECT DepositAmount FROM WizzardDeposits WHERE Id = @ID) - 
		(SELECT DepositAmount FROM WizzardDeposits WHERE Id = @ID + 1)
		);

		SET @ID += 1;
    END

	SELECT @sum AS [SumDifference]

