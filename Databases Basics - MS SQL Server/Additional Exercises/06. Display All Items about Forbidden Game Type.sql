SELECT i.Name, i.Price, i.MinLevel, g.Name AS [Forbidden Game Type] FROM Items AS i 
FULL JOIN GameTypeForbiddenItems AS f ON f.ItemId = i.Id
FULL JOIN GameTypes AS g ON f.GameTypeId = g.Id
ORDER BY g.Name DESC, i.Name