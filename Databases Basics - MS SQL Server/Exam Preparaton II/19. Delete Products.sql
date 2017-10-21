CREATE TRIGGER tr_delete_product ON Products INSTEAD OF DELETE AS

DELETE FROM ProductsIngredients
WHERE ProductId = (SELECT Id FROM deleted)

DELETE FROM Feedbacks
WHERE ProductId = (SELECT Id FROM deleted)

DELETE FROM Products
WHERE Id = (SELECT Id FROM deleted)




DELETE FROM Products WHERE Id = 7