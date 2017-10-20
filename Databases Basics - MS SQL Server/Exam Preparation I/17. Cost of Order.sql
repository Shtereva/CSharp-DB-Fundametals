CREATE FUNCTION udf_GetCost(@jobID int) 
RETURNS decimal(6,2)
AS
BEGIN
	DECLARE @sum decimal(6,2) = (SELECT ISNULL(SUM(op.Quantity * p.Price), 0) AS [Result]
								FROM Jobs AS j
								LEFT JOIN Orders AS o ON j.JobId = o.JobId
								LEFT JOIN OrderParts AS op ON op.OrderId = o.OrderId
								LEFT JOIN Parts AS p ON op.PartId = p.PartId
								WHERE j.JobId = @jobID
								GROUP BY j.JobId)
	RETURN @sum;
END

go
SELECT dbo.udf_GetCost(3)

