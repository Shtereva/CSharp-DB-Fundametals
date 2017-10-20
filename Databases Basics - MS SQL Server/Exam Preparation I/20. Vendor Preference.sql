SELECT tem.Mechanic, tem.Vendor, tem.Parts, CAST(tem.Preference AS varchar(50)) + '%' FROM
	(SELECT m.FirstName + ' ' + m.LastName AS [Mechanic],
			   v.Name AS [Vendor],
			   SUM(op.Quantity) OVER (PARTITION BY m.MechanicId, v.Name) AS [Parts], 
			   ((SUM(op.Quantity) OVER (PARTITION BY m.MechanicId, v.Name) * 100 ) / 
				SUM(op.Quantity) OVER (PARTITION BY m.MechanicId)) AS [Preference] 
	FROM Mechanics AS m
	JOIN Jobs AS j ON m.MechanicId = j.MechanicId
	JOIN Orders AS o ON j.JobId = o.JobId 
	JOIN OrderParts AS op ON op.OrderId = o.OrderId
	JOIN Parts AS p ON p.PartId = op.PartId
	JOIN Vendors AS v ON p.VendorId = v.VendorId) AS tem
GROUP BY tem.Mechanic, tem.Vendor, tem.Parts, tem.Preference
ORDER BY tem.Mechanic, tem.Parts DESC, tem.Vendor



