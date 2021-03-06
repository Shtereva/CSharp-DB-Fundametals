CREATE FUNCTION ufn_CalculateFutureValue (@sum money, @yearlyInterestRate float, @numberOfYears int)
RETURNS decimal(20, 4)
BEGIN
	DECLARE @result decimal(20, 4);

	SET @result = @sum * (POWER((1 + @yearlyInterestRate), @numberOfYears))
	RETURN @result;
END

select dbo.ufn_CalculateFutureValue(1000, 0.1, 5)