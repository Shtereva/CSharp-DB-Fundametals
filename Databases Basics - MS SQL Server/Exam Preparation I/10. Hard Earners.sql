SELECT TOP(3)  (m.FirstName + ' ' + m.LastName) AS [Mechanic], COUNT(j.JobId) AS [Jobs]
 FROM Mechanics AS m 
JOIN Jobs AS j ON m.MechanicId = j.MechanicId
WHERE j.Status <> 'Finished'
GROUP BY (m.FirstName + ' ' + m.LastName)
HAVING COUNT(j.JobId) > 1
ORDER BY [Jobs] DESC