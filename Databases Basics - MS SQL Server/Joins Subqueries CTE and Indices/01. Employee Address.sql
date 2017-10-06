SELECT TOP (5) EmployeeID, JobTitle, e.AddressID, a.AddressText FROM Employees AS e
JOIN Addresses as a ON a.AddressID = e.AddressID
ORDER BY e.AddressID