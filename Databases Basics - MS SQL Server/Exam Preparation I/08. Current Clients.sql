SELECT (c.FirstName + ' ' + c.LastName) AS [Client]
	  , DATEDIFF(DAY, J.IssueDate, '2017-04-24') AS [Days going]
	  , j.Status
 FROM Clients AS c
JOIN Jobs AS j ON j.ClientId = c.ClientId
WHERE Status <> 'Finished'
ORDER BY [Days going] DESC, j.ClientId