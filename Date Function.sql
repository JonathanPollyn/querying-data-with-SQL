/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO

---------------------------------------------------------------------
-- Date and time functions
---------------------------------------------------------------------
-- Working with Current date and time
SELECT
	GETDATE() AS [GetDate],
	CURRENT_TIMESTAMP AS [CURRENT_TIMESTAMP],
	SYSDATETIME() AS Systemdatetime




-- Working with Date and time parts
--DATEPART
SELECT BirthDate, HireDate, ModifiedDate, 
	DATEPART(YEAR, BirthDate) AS YearDatePart,	
	DATEPART(MONTH, BirthDate) AS MonthDatePart,
	DATEPART(DAY, BirthDate) AS DayDatePart,
	DAY(BirthDate) AS DayFunction,
	YEAR(BirthDate) AS YearFunction,
	MONTH(BirthDate) as MonthFunction
FROM HumanResources.Employee

--DateName
SELECT BirthDate, HireDate, ModifiedDate, 
		DATENAME(MONTH, BirthDate) AS DateNaming,
		DATENAME(DAY, BirthDate) AS Daynaming,		
		DATENAME(WEEKDAY, BirthDate) AS Daynaming
FROM HumanResources.Employee

--Working with Add and diff functions
SELECT DATEADD(MONTH, 2, GETDATE())

SELECT BirthDate, 
		DATEADD(DAY, 12, BirthDate) AS DateAdding,
		DATEADD(YEAR, -1, BirthDate) AS DateSub
FROM HumanResources.Employee

SELECT BirthDate, HireDate,
		DATEDIFF(YEAR,BirthDate, HireDate) As WorkingDateDiff
FROM HumanResources.Employee

---------------------------------------------------------------------
-- Type conversion functions
---------------------------------------------------------------------
-- Working with CAST Function
SELECT BirthDate, HireDate, 
		ModifiedDate, CAST(ModifiedDate AS date) AS CastingDate,
		ModifiedDate, CAST(ModifiedDate AS tinyint) AS CastingDate
FROM HumanResources.Employee
--Working with CONVERT
SELECT BirthDate, HireDate, ModifiedDate,
		ModifiedDate, CAST(ModifiedDate AS date) AS CastingDate,
		CONVERT(date, ModifiedDate) AS ConvertDate,
		CONVERT(date, ModifiedDate, 101) TypeConvert,
		CONVERT(date, ModifiedDate, 103) EU,
		CONVERT(date, ModifiedDate, 109) EU,
		CONVERT(date, '/01/2021', 103) EU
FROM HumanResources.Employee
--Working with PARSE

--Working with TRY_CAST, TRY_CONVERT, TRY_PARSE
SELECT BirthDate, HireDate, 
		ModifiedDate, TRY_CAST(ModifiedDate AS tinyint) AS CastingDate
FROM HumanResources.Employee


