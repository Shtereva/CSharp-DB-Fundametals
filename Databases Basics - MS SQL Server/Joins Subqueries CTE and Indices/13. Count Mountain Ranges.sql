SELECT c.CountryCode, COUNT(m.MountainRange) AS [MountainRanges] FROM Countries AS c
JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m ON mc.MountainId = m.Id
WHERE c.CountryCode = 'US' OR c.CountryCode = 'RU' OR c.CountryCode = 'BG' 
GROUP BY c.CountryCode
