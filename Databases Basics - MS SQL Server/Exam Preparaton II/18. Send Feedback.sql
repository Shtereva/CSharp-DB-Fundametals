CREATE PROC usp_SendFeedback(@customerID int, @productID int, @rate decimal(20, 2), @description nvarchar(255))
AS
	IF (SELECT COUNT(*) FROM Feedbacks WHERE CustomerId = @customerID AND ProductId = @productID) >= 3
	BEGIN
		RAISERROR('You are limited to only 3 feedbacks per product!', 16, 1)
		RETURN;
	END

	INSERT INTO Feedbacks(Description, Rate, ProductId, CustomerId)
	VALUES
	(@description, @rate, @productID, @customerID)
