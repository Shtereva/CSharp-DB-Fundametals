SELECT TOP(10) ProjectID AS Id,
	Name,
	Description,
	StartDate,
	EndDate
 FROM Projects ORDER BY StartDate, Name