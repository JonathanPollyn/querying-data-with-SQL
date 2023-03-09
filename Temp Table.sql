/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO

--Temporary Tables


--Local Temporary Tables
CREATE TABLE #mytableTest
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NULL
)

select * from #mytableTest

SELECT 
	   CAST(OrderDate AS DATE) AS OrderDate,
	   CAST(DueDate AS date) AS DueDate,
	   CustomerID,
	   TaxAmt,
	   FIRST_VALUE(TaxAmt) OVER(PARTITION BY CUSTOMERID 
			ORDER BY OrderDate
			ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS First_Value,
	   LAST_VALUE(TaxAmt) OVER(PARTITION BY CUSTOMERID 
			ORDER BY OrderDate
			ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS Last_Value
INTO #RecordsOfCustomers 
FROM Sales.SalesOrderHeader 




SELECT * FROM #RecordsOfCustomers




--Global Temporary Tables
CREATE TABLE ##mytableTestGlobal
(
	ID INT NOT NULL,
	NAME VARCHAR(20) NULL
)

select * from ##mytableTestGlobal


DROP TABLE ##mytableTestGlobal


SELECT *
INTO ##AllRecords
FROM HumanResources.Employee

select *
from ##AllRecords

select * from HumanResources.Employee


