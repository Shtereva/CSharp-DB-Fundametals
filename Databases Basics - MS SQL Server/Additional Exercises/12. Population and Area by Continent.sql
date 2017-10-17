SELECT co.ContinentName, 
       SUM(CAST(c.AreaInSqKm AS bigint)) AS [CountriesArea],
	   SUM(CAST(c.Population AS bigint)) AS [CountriesPopulation]
FROM Continents AS co
JOIN Countries AS c ON co.ContinentCode = c.ContinentCode
GROUP BY co.ContinentName
ORDER BY SUM(CAST(c.Population AS bigint)) DESC