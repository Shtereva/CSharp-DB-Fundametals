SELECT c.CountryName,
	   co.ContinentName,
	   CASE WHEN COUNT(r.Id) IS NULL THEN 0 ELSE COUNT(r.Id) END AS [RiversCount],
	   CASE WHEN SUM(r.Length) IS NULL THEN 0 ELSE SUM(r.Length) END AS [TotalLength]
 FROM Countries AS c
LEFT JOIN Continents AS co ON co.ContinentCode = c.ContinentCode
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
GROUP BY c.CountryName, co.ContinentName
ORDER BY COUNT(r.Id) DESC, SUM(r.Length) DESC, c.CountryName