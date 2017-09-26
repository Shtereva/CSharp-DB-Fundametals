SELECT PeakName
, RiverName
, LOWER(CONCAT(PeakName, RIGHT(RiverName, LEN(RiverName) - 1))) AS [Mix] FROM Peaks, Rivers
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix

SELECT PeakName
, (Rivers.RiverName) AS [RiverName]
, LOWER(CONCAT(PeakName, RIGHT(Rivers.RiverName, LEN(Rivers.RiverName) - 1))) AS [Mix] FROM Peaks
JOIN Rivers ON RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix