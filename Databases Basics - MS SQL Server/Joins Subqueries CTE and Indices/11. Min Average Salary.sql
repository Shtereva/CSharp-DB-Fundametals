SELECT MIN(Average) AS [MinAverageSalary] FROM
(SELECT DepartmentID, AVG(Salary) AS [Average] FROM Employees
GROUP BY DepartmentID) AS Average