SELECT ISNULL(SUM(p.Price * op.Quantity), 0 ) AS [Parts Total] FROM Parts AS p
full JOIN OrderParts AS op ON op.PartId = p.PartId
full JOIN Orders AS o ON op.OrderId = o.OrderId
WHERE DATEDIFF(WEEK, o.IssueDate, '2017-04-24') <= 3


