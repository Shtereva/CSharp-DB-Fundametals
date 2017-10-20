SELECT (m.FirstName + ' ' + m.LastName) AS [Available]
	 FROM Mechanics AS m 
WHERE m.MechanicId NOT IN (SELECT DISTINCT j.MechanicId FROM Jobs AS j
							WHERE j.Status <> 'Finished' AND j.MechanicId IS NOT NULL)
ORDER BY M.MechanicId


