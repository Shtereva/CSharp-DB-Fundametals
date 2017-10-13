CREATE PROCEDURE usp_GetTownsStartingWith (@letters varchar(50))  AS
	SELECT Name FROM Towns
	WHERE LEFT(Name, LEN(@letters)) = @letters
	


EXEC usp_GetTownsStartingWith  'b'