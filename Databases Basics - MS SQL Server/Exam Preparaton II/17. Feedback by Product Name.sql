CREATE FUNCTION udf_GetRating(@name nvarchar(50)) 
RETURNS NVARCHAR(50)
AS
BEGIN
	DECLARE @avgSum decimal(20,2) =  (SELECT AVG(F.Rate)
		FROM Products AS p
		RIGHT JOIN Feedbacks AS f ON p.Id = f.ProductId
		WHERE P.Name = @name
		GROUP BY p.Name, p.Description)

	IF @avgSum < 5 RETURN 'Bad';
	IF @avgSum > 8 RETURN 'Good';
	IF @avgSum BETWEEN 5 AND 8 RETURN 'Average';
	RETURN 'No rating';
END

