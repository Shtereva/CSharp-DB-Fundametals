SELECT c.Name AS [Category Name] FROM Categories AS c
LEFT JOIN Reports AS r ON c.Id = r.CategoryId
LEFT JOIN Users AS u ON r.UserId = u.Id
WHERE DATEPART(DAY, r.OpenDate) = DATEPART(DAY, u.BirthDate)
GROUP BY c.Name
ORDER BY [Category Name]