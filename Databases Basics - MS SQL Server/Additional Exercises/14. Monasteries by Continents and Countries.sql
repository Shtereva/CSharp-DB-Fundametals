UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries(Name, CountryCode)
SELECT 'Hanga Abbey', c.CountryCode FROM Countries AS c
LEFT JOIN Monasteries AS m ON c.CountryCode = m.CountryCode
WHERE c.CountryName = 'Tanzania'

INSERT INTO Monasteries(Name, CountryCode)
SELECT 'Myin-Tin-Daik', c.CountryCode FROM Countries AS c
JOIN Monasteries AS m ON c.CountryCode = m.CountryCode
WHERE c.CountryName = 'Myanmar'

SELECT co.ContinentName, c.CountryName, COUNT(m.Id) AS [MonasteriesCount] FROM Continents AS co
LEFT JOIN Countries AS c ON co.ContinentCode = c.ContinentCode
LEFT JOIN Monasteries AS m ON c.CountryCode = m.CountryCode
WHERE c.IsDeleted = 0
GROUP BY co.ContinentName, c.CountryName
ORDER BY COUNT(m.Id) DESC, c.CountryName
