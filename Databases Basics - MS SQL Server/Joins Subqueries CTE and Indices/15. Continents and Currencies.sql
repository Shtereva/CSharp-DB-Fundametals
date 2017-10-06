
SELECT SubContinent.ContinentCode, SubContinent.CurrencyCode, MAX(SubContinent.CurrencyUsage) AS [MaxUsage]
 FROM
	(SELECT con.ContinentCode, cr.CurrencyCode, count(cr.CurrencyCode) as [CurrencyUsage],
	  DENSE_RANK() OVER (PARTITION BY con.ContinentCode ORDER BY count(cr.CurrencyCode) DESC) AS [Rank]
	  FROM Continents AS con
	JOIN Countries AS c ON con.ContinentCode = c.ContinentCode
	JOIN Currencies AS cr ON c.CurrencyCode = cr.CurrencyCode
	GROUP BY con.ContinentCode, cr.CurrencyCode
	) AS SubContinent
WHERE SubContinent.Rank = 1	
GROUP BY SubContinent.ContinentCode, SubContinent.CurrencyCode
HAVING MAX(SubContinent.CurrencyUsage)  > 1
ORDER BY SubContinent.ContinentCode, SubContinent.CurrencyCode