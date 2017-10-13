SELECT  (count(e.CountryCode) - COUNT(mc.MountainId)) AS [CountryCode] FROM Countries as e
LEFT JOIN MountainsCountries AS mc ON e.CountryCode = mc.CountryCode



