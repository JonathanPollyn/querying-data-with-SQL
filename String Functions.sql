/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO						


---------------------------------------------------------------------
-- Demo: Character Functions
---------------------------------------------------------------------

--Using concat function
SELECT FirstName, 
	MiddleName, 
	LastName,
	CONCAT(FirstName,' ',MiddleName,' ',LastName) AS FullNamewithConcat
FROM Person.Person

--Using plus (+) to concat string
SELECT FirstName, 
	MiddleName, 
	LastName,
	FirstName+' '+MiddleName+' '+LastName AS FullNamewithPlus
FROM Person.Person

--Write a query that will return the last four values of the ProductNumber using the substring function
SELECT Name,
		ProductNumber,
		SUBSTRING(ProductNumber,4,4) AS SubofProduct
FROM Production.Product

--Working with the LEFT and RIGHT Function
--JONATHAN
SELECT LEFT('JONATHAN',3)
SELECT RIGHT('JONATHAN',6)

--Write a query to return the first two values of the ProductNumber and call it First2 
SELECT Name,
		ProductNumber,
		LEFT(ProductNumber,2) AS First2,
		RIGHT(ProductNumber, 4) Last4
FROM Production.Product

--Write a query to return the last four values of the ProductNumber and call it Last4
SELECT Name,
		ProductNumber,
		LEFT(ProductNumber,2) AS First2,
		RIGHT(ProductNumber, 4) Last4
FROM Production.Product


--=====================================================
--WORKING WITH  CHARINDEX and SUBSTRING
--=====================================================

--Get the length of spaces on the name column
SELECT [Name], CHARINDEX(' ', [Name]) AS PosOfSpace
FROM HumanResources.Department;

--Get the String length of the name
SELECT [Name], 
		LEN([Name]) AS LenOfName,
		DATALENGTH([Name]) as DataLenOfName
FROM HumanResources.Department;

--==================================
--Working with String alteration
--==================================
--replace the "/" in the date with ":"
SELECT REPLACE('03/11/2021','/',':')  --03:11:2021

--Replicate Asterisks eight times
SELECT REPLICATE('*',8)  


--How to replace two different words in one column at the same time
--for example if we have Engineering Manager and we want to return Engineer Manage
--Engineering Manager  => Engineer Manage
SELECT JobTitle, 
		CHARINDEX(' ',JobTitle ) AS PositionOfSpace, --Get the position of space
		SUBSTRING(JobTitle, 1, CHARINDEX(' ',JobTitle )) AS FirstWord, --extract the first word
		LEN(JobTitle) AS LengthOfJobTitle, --Get the length of the job title
		SUBSTRING(JobTitle, CHARINDEX(' ',JobTitle ), LEN(JobTitle)) AS LastWord, --Get the last word
		REPLACE(SUBSTRING(JobTitle, 1, CHARINDEX(' ',JobTitle )), 'ing', ' ') AS ReplaceING, --replace the word ing from the Engineering
		REPLACE(SUBSTRING(JobTitle, CHARINDEX(' ',JobTitle ), LEN(JobTitle)), 'r', ' ') ReplaceR, --Replace the last r on the word Manager
		CONCAT(REPLACE(SUBSTRING(JobTitle, 1, CHARINDEX(' ',JobTitle )), 'ing', ' ')
					,REPLACE(SUBSTRING(JobTitle, CHARINDEX(' ',JobTitle ), LEN(JobTitle))
					, 'r', ' ')) AS CompleteSoluton --Perfrom a concatination of the two words
FROM HumanResources.Employee
WHERE JobTitle = 'Engineering Manager'

--Working with String Formatting
--aBDr => ABDR
SELECT UPPER('aBDr')  --ABDR
--aBDr => abdr
SELECT LOWER('aBDr')  --abdr
--'      aBDr'
SELECT LEN('      aBDr')
SELECT '      aBDr'
SELECT LTRIM('      aBDr')

--'aBDr             '
SELECT LEN('aBDr             ')
SELECT 'aBDr             '

SELECT RTRIM('aBDr             ')
--NESTING FUNCTION
--Mask the phone number with 10 asteriks and only return the last for number
--for Example where we have 1 (11) 500 555-0110   return  **********0110
SELECT DISTINCT PhoneNumber, 
		RIGHT(PhoneNumber,4) AS Last4,
		REPLICATE('*',10) as RepliAsteriks,
		CONCAT(REPLICATE('*',10),RIGHT(PhoneNumber,4)) AS Req
FROM Person.PersonPhone      
      
--Final Solution
SELECT DISTINCT PhoneNumber, 
		CONCAT(REPLICATE('*',10),RIGHT(PhoneNumber,4)) AS Req
FROM Person.PersonPhone
--Return the first word from the Job title column in the Person table
--Remember that some Job title have only one word, so please account for that
--For example where we have Engineering Manager retrun Engineering
SELECT JobTitle,
		CHARINDEX(' ', JobTitle) AS PositionOfJobTitle,
		SUBSTRING(JobTitle,1,6) AS SubStringExtract,
		SUBSTRING(JobTitle,1,CHARINDEX(' ', JobTitle)) AS SubStringExtractDynamic,
		CASE
			WHEN CHARINDEX(' ', JobTitle) < 1 THEN JobTitle
			ELSE SUBSTRING(JobTitle,1,CHARINDEX(' ', JobTitle))
		END AS Test
FROM HumanResources.Employee

--Final Solution
SELECT JobTitle,
		CASE
			WHEN CHARINDEX(' ', JobTitle) < 1 THEN JobTitle
			ELSE SUBSTRING(JobTitle,1,CHARINDEX(' ', JobTitle))
		END AS Test
FROM HumanResources.Employee


