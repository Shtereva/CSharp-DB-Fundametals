ALTER FUNCTION ufn_IsWordComprised(@setOfLetters varchar(50), @word varchar(50)) 
RETURNS bit
AS
BEGIN
	DECLARE @count int = 1
	WHILE @count <= LEN(@word)
		BEGIN
			DECLARE @pattern varchar(50) = SUBSTRING(@word, @count, 1);
			IF(CHARINDEX(LOWER(@pattern), LOWER(@setOfLetters)) < 1)
				BEGIN
					RETURN 0
				END;
			SET @count += 1;
		END

RETURN 1
END

GO
SELECT 'oistmiahf' AS [SetOfLetters], 'Sofia' AS [Word],
		 dbo.ufn_IsWordComprised('oistmiahf', 'Sofia') AS [Result]



