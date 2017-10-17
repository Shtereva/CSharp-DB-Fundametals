CREATE TABLE Monasteries (
Id int PRIMARY KEY IDENTITY,
Name varchar(255),
CountryCode char(2) NOT NULL FOREIGN KEY REFERENCES Countries(CountryCode)
) 

INSERT INTO Monasteries(Name, CountryCode) VALUES
('Rila Monastery “St. Ivan of Rila”', 'BG'), 
('Bachkovo Monastery “Virgin Mary”', 'BG'),
('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
('Kopan Monastery', 'NP'),
('Thrangu Tashi Yangtse Monastery', 'NP'),
('Shechen Tennyi Dargyeling Monastery', 'NP'),
('Benchen Monastery', 'NP'),
('Southern Shaolin Monastery', 'CN'),
('Dabei Monastery', 'CN'),
('Wa Sau Toi', 'CN'),
('Lhunshigyia Monastery', 'CN'),
('Rakya Monastery', 'CN'),
('Monasteries of Meteora', 'GR'),
('The Holy Monastery of Stavronikita', 'GR'),
('Taung Kalat Monastery', 'MM'),
('Pa-Auk Forest Monastery', 'MM'),
('Taktsang Palphug Monastery', 'BT'),
('Sümela Monastery', 'TR')


UPDATE Countries
SET IsDeleted = 1
WHERE CountryCode IN  (SELECT C.CountryCode FROM Countries AS c
	   JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
	   JOIN Rivers AS r ON cr.RiverId = r.Id
	   GROUP BY c.CountryCode
	   HAVING COUNT(r.Id) > 3) 

SELECT m.Name AS [Monastery], c.CountryName AS [Country] FROM Monasteries AS m
LEFT JOIN Countries AS c ON m.CountryCode = c.CountryCode
WHERE c.IsDeleted = 0
ORDER BY m.Name