/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO

--Table Expressions
---------------------------------------------------------------------
-- Demo: Derived tables
---------------------------------------------------------------------
--Type of Table expression
--RULES OF TABLE EXPRESSION
--1	All Columns must have a name
--2	Columns name must be unique
--3	Order by are no gurantee

--=========================================
--WORKING WITH DERIVED TABLE
SELECT SalesOrderID, SHIPDATE
FROM 
	(SELECT SalesOrderID,SHIPDATE, 
			CAST(OrderDate AS date) AS OrderDate,
			CAST(DueDate AS date) AS DueDate,
			TaxAmt
	FROM Sales.SalesOrderHeader) as DerivedTable
--==========================
--This will not run. See rule number 1 Above
	SELECT SalesOrderID, SHIPDATE
FROM 
	(SELECT SalesOrderID,SHIPDATE, 
			CAST(OrderDate AS date) AS OrderDate,
			CAST(DueDate AS date),
			TaxAmt
	FROM Sales.SalesOrderHeader) as DerivedTable
--=========================
--This will not run. See rule number 2 above
SELECT SalesOrderID, SHIPDATE
FROM 
	(SELECT SalesOrderID,SHIPDATE, 
			CAST(OrderDate AS date) AS OrderDate,
			CAST(DueDate AS date) AS DueDate,
			CAST(DueDate AS date) AS DueDate,
			TaxAmt
	FROM Sales.SalesOrderHeader) as DerivedTable
--========================
--This will not run See rule number 3 above
SELECT SalesOrderID, SHIPDATE
FROM 
	(SELECT SalesOrderID,SHIPDATE, 
			CAST(OrderDate AS date) AS OrderDate,
			CAST(DueDate AS date) AS DueDate,
			TaxAmt
	FROM Sales.SalesOrderHeader
	ORDER BY SalesOrderID DESC) as DerivedTable
--=========================================	

	SELECT SalesOrderID, SHIPDATE
FROM 
	(SELECT SalesOrderID,SHIPDATE, 
			CAST(OrderDate AS date) AS OrderDate,
			CAST(DueDate AS date) AS DueDate2,
			TaxAmt
	FROM Sales.SalesOrderHeader
	) as DerivedTable
where DueDate2  = '2011-06-12';
--=========================================
--NESTED Derived Table
SELECT OrderDate
FROM 
	(SELECT OrderDate,DueDate2
		FROM 
			(SELECT SalesOrderID,SHIPDATE, 
				CAST(OrderDate AS date) AS OrderDate,
				CAST(DueDate AS date) AS DueDate2,
				TaxAmt
				FROM Sales.SalesOrderHeader
			) AS DerivedTable1
	) as DerivedTable2
where DueDate2  = '2011-06-12';

---------------------------------------------------------------------
-- Common Table Expression (CTE)
---------------------------------------------------------------------
SELECT SalesOrderID, SHIPDATE,  
		CAST(OrderDate AS date) AS OrderDate,
		CAST(DueDate AS date) AS DueDate2,
		CAST(DueDate AS date) AS DueDate,
		TaxAmt
FROM Sales.SalesOrderHeader;


;WITH Test1
AS
(
	SELECT SalesOrderID, SHIPDATE,
		CAST(OrderDate AS date) AS OrderDate,
		CAST(DueDate AS date) AS DueDate2,
		CAST(DueDate AS date) AS DueDate,
		salesOrderNumber,
		TaxAmt
		FROM Sales.SalesOrderHeader
)
SELECT SalesOrderID, SHIPDATE,salesOrderNumber
FROM Test1
where DueDate2  = '2011-06-12';

--Nesting a CTE
;WITH Test2
AS
(
	SELECT SalesOrderID AS OrderID, SHIPDATE,
		CAST(OrderDate AS date) AS OrderDate,
		CAST(DueDate AS date) AS DueDate2,
		CAST(DueDate AS date) AS DueDate,
		salesOrderNumber,
		TaxAmt
		FROM Sales.SalesOrderHeader   --31465
),
Test3 AS
(
SELECT * 
FROM Test2
WHERE OrderID IN (	43662,43663,43664,43665,
					43666,43667,43668,43669,
					43670,43671,43672,43673,43674
				)
)
SELECT *
FROM Test3

---------------------------------------------------------------------
-- Views
---------------------------------------------------------------------
DROP VIEW IF EXISTS MyFirstView
GO
CREATE VIEW MyFirstView
AS
SELECT emp.BusinessEntityID, FirstName, LastName,
		HireDate, BirthDate, VacationHours
FROM Person.Person pp
JOIN HumanResources.Employee EMP
ON EMP.BusinessEntityID = PP.BusinessEntityID
GO


SELECT *
FROM MyFirstView


--Views and the ORDER BY Clause
DROP VIEW IF EXISTS MySecondView
GO
CREATE VIEW MySecondView
AS
SELECT emp.BusinessEntityID, FirstName, LastName,
		HireDate, BirthDate, VacationHours
FROM Person.Person pp
JOIN HumanResources.Employee EMP
ON EMP.BusinessEntityID = PP.BusinessEntityID

GO

SELECT *
FROM MySecondView
ORDER BY FirstName ASC

BEGIN TRANSACTION
ALTER TABLE Person.Person DROP COLUMN LastName
ROLLBACK TRANSACTION

SELECT OBJECT_DEFINITION(OBJECT_ID('MySecondView'))

--View Options
--The ENCRYPTION Option
DROP VIEW IF EXISTS MyThirdView 
GO
CREATE VIEW MyThirdView WITH ENCRYPTION
AS
SELECT emp.BusinessEntityID, FirstName, LastName,
		HireDate, BirthDate, VacationHours
FROM Person.Person pp
JOIN HumanResources.Employee EMP
ON EMP.BusinessEntityID = PP.BusinessEntityID

GO
SELECT OBJECT_DEFINITION(OBJECT_ID('MyThirdView'))
--The SCHEMABINDING Option
DROP VIEW IF EXISTS MyForthView 
GO
CREATE VIEW MyForthView WITH SCHEMABINDING
AS
SELECT emp.BusinessEntityID, FirstName, LastName,
		HireDate, BirthDate, VacationHours
FROM Person.Person pp
JOIN HumanResources.Employee EMP
ON EMP.BusinessEntityID = PP.BusinessEntityID

GO


----------------------------------------------------------------------------------
--Inline Table-Valued Functions
----------------------------------------------------------------------------------

CREATE FUNCTION dbo.GetProductInfo
	(@ProdID AS INT) RETURNS TABLE
AS
	RETURN
		SELECT ProductID, 
			UnitPrice, 
			LineTotal
		FROM Sales.SalesOrderDetail
		WHERE ProductID = @ProdID;
GO

SELECT *
FROM dbo.GetProductInfo(778) AS INL
JOIN Production.Product AS PP
ON INL.ProductID = PP.ProductID



