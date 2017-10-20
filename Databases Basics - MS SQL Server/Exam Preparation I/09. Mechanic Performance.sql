SELECT Days.Mechanic AS [Mechanic], AVG(Days.Diff) AS [Average Days] FROM
	(SELECT m.MechanicId, (m.FirstName + ' ' + m.LastName) AS [Mechanic], DATEDIFF(DAY, j.IssueDate, j.FinishDate) AS [Diff]
	FROM Mechanics AS m
	JOIN Jobs AS j ON j.MechanicId = m.MechanicId
	WHERE Status = 'Finished') AS Days
GROUP BY Days.Mechanic, Days.MechanicId
ORDER BY Days.MechanicId

