SELECT TOP(5) c.CountryName AS [Country],
	 ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
	 ISNULL(MAX(p.Elevation), 0) AS [Highest Peak Elevation],	 
	 ISNULL(m.MountainRange, '(no mountain)') AS [Mountain]
	  FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
LEFT JOIN Peaks AS p ON m.Id = p.MountainId
GROUP BY c.CountryName, p.PeakName, m.MountainRange
ORDER BY [Country], [Highest Peak Name]