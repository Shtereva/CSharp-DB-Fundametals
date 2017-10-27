SELECT a.OpenDate, a.Description, a.Email as [Reporter Email] FROM
(
SELECT  d.Name, r.Description,r.OpenDate, r.CloseDate, u.Email, r.Id FROM Reports AS r
JOIN Categories AS c ON c.Id = r.CategoryId
JOIN Departments AS d ON d.Id = c.Departmentid
JOIN Users AS u ON u.Id = r.UserId
WHERE CloseDate IS  NULL AND (LEN(Description) > 20 AND Description LIKE '%str%')
				AND d.Name IN ('Infrastructure', 'Emergency', 'Roads Maintenance')) AS A
order by a.OpenDate, a.Email, a.Id



