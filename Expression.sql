/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO						

---------------------------------------------------------------------
-- Demo: Demo: Expressions
---------------------------------------------------------------------
/*SIMPLE CASE EXPRESSION
Use the simple case expression form to return the information when the DaysToManufacture 
is the say Go when the DaysToManufacture is 1 then say NO GO. 
Also when the Makeflag is 0 say No and when the
Makeflag is 1 say Yes
--HINT: Production.Product, CASE
*/
select 
	DaysToManufacture AS Changed,
	CASE DaysToManufacture
		WHEN 0 THEN 'GO'
		WHEN 1 THEN 'NO GO'
		ELSE 'NO DECISION'
	END AS DerivedColumn,
	ProductNumber,
	CASE Makeflag
		WHEN 0 THEN 'NO'
		WHEN 1 THEN 'Yes'
		ELSE 'Unknown'
	END DerivedColumn2,
	CASE Makeflag
		WHEN 0 THEN 'NO'
	END DerivedColumn3
from Production.Product


/*SEARCHED CASE EXPRESSION
Using the searched case expresshion and return information when the ListPrice is less 
than 100 then display Low when the ListPrice is less that 200 then display 
Medium and when the ListPrice is grater or equal to 200 then display High and 
every other thing should say unknown.
HINT: Production.Product, CASE
*/

--
SELECT Name, 
	Color,
	ListPrice,
	CASE
		WHEN ListPrice < 100 THEN 'Low'
		WHEN ListPrice < 200 THEN 'Medium'
		WHEN ListPrice >= 200 THEN 'High'
		ELSE 'Unknown'
	END AS PriceRange
FROM Production.Product


/*
Write a query to return a record when the LINE TOTAL less than 100 THEN display BAD SALE, 
when line total grater then 100 BUT  less than 300 then display NOT SO BAD and every other things
should say GOOD SALE
HINT: Sales.SalesOrderDetail, CASE
*/
SELECT LineTotal,
	CASE 
		WHEN LineTotal < 100 THEN 'Bad Sale'
		WHEN LineTotal > 100 AND LineTotal <= 300 THEN 'Not a bad sale'
		ELSE 'Good Sale'
	END AS DerivedColumn
FROM Sales.SalesOrderDetail

SELECT LineTotal,
	CASE
		WHEN LineTotal < 100 THEN 'Bad Sale'
		WHEN LineTotal > 100 AND LineTotal <= 300 THEN 'Not a bad sale'
		WHEN LineTotal > 300 THEN 'Good Sale'
		ELSE 'unknown'
	END AS DerivedColumn
FROM Sales.SalesOrderDetail

/* 
Write a code to display the salariedflag in addition to a dervied column called
EmployeeCheck. This derived column should hold information for when the
salariedflag is 0 then say Contract when it is 1 say FTE.
HINT: Sales.SalesOrderDetail, CASE
*/
SELECT SalariedFlag,
		CASE 
			WHEN SalariedFlag = 0 THEN 'Contract'
			WHEN SalariedFlag = 1 THEN 'FTE'
		END AS 'EmployeeCheck'	
FROM HumanResources.Employee


