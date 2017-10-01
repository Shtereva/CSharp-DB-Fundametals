SELECT DepartmentID, 
(SELECT DISTINCT Salary FROM Employees 
WHERE DepartmentID = e.DepartmentID 
ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY) AS ThirdHighestSalary
FROM Employees e
WHERE (SELECT DISTINCT Salary FROM Employees 
WHERE DepartmentID = e.DepartmentID 
ORDER BY Salary DESC OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY) IS NOT NULL
GROUP BY DepartmentID

--OR

SELECT Salaries.DepartmentID, Salaries.Salary AS [ThirdHighestSalary] FROM 
(SELECT DepartmentID,
	Salary,
	DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS [Rank]
	 FROM Employees
	 GROUP BY DepartmentID, Salary) AS [Salaries] WHERE [Rank] = 3