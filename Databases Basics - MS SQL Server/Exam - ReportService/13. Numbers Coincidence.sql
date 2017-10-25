SELECT DISTINCT  u.Username FROM Users AS u 
LEFT JOIN Reports AS r ON u.Id = r.UserId
WHERE LEFT(u.Username, 1) = CAST(r.CategoryId AS varchar(5)) OR
	  RIGHT(u.Username, 1) = CAST(r.CategoryId AS varchar(5))
ORDER BY u.Username

----GROUP BY u.Username, r.Description, r.CategoryId

--WHERE LEFT(A.Username, 1) = CAST(A.Id AS varchar(5)) OR RIGHT(A.Username, 1) = CAST(A.Id AS varchar(5))
--ORDER BY A.Username

--WHERE LEFT(u.Username, 1) LIKE '[1-9]' OR RIGHT(u.Username, 1) LIKE '[1-9]'