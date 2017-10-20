CREATE TRIGGER tr_Order_Delivered ON Orders FOR UPDATE
AS
	IF (SELECT Delivered FROM deleted) = 0 AND (SELECT Delivered FROM inserted) = 1
	BEGIN
		UPDATE Parts
		SET StockQty += op.Quantity
		FROM Parts as P
		JOIN OrderParts AS op ON op.PartId = p.PartId
		JOIN Orders AS o ON o.OrderId = op.OrderId
		JOIN inserted AS i ON o.OrderId = i.OrderId
		JOIN deleted AS d ON d.OrderId = o.OrderId
		WHERE d.Delivered = 0 AND i.Delivered = 1
    END

GO
SELECT o.OrderId, o.Delivered, p.PartId, p.StockQty, op.Quantity FROM Orders AS o
JOIN OrderParts AS op ON op.OrderId = o.OrderId
JOIN Parts AS p ON p.PartId = op.PartId


UPDATE Orders
SET Delivered = 1
WHERE OrderId = 19

