/*
All queries are run against the adventures work database
*/
USE AdventureWorks2014;
GO						

--============================
-- Cross and Inner Join
--============================
--Write SQL query to generate dataset that will return only those people who are employeed
SELECT 
	PP.BusinessEntityID, 
	PP.FirstName, 
	PP.LastName,
	EMP.JobTitle, 
	EMP.Gender, 
	EMP.MaritalStatus
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS EMP
ON PP.BusinessEntityID = EMP.BusinessEntityID


--Using the dataset formt he previous question please add their corresponding departments

SELECT 
	PP.BusinessEntityID, 
	PP.FirstName, 
	PP.LastName,
	EMP.JobTitle, 
	EMP.Gender, 
	EMP.MaritalStatus,
	DEPT.Name
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS EMP
ON PP.BusinessEntityID = EMP.BusinessEntityID
INNER JOIN HumanResources.Department AS DEPT
ON DEPT.DepartmentID = EMP.BusinessEntityID



SELECT FirstName, MiddleName, LastName, JobTitle
FROM Person.Person AS PP
CROSS JOIN HumanResources.Employee

/*
Using your result from the previous question, add the email address, 
remember that all the names 
must have email addresses. Then create a derived columns called Full name that will 
concatenate, First Name Last name. 
HINT: INNER JOIN, Person.EmailAddress, CONCAT
*/
SELECT 
	FirstName,
	LastName,
	CONCAT(FirstName,' ',LastName) AS [Full Name],
	jobtitle,
	HireDate,
	VacationHours,
	EmailAddress
FROM Person.Person AS PP
INNER JOIN HumanResources.Employee AS EMP
ON PP.BusinessEntityID = EMP.BusinessEntityID
INNER JOIN Person.EmailAddress AS EA
ON PP.BusinessEntityID = EA.BusinessEntityID


/*
Provide a list of loginid and resumes from the human resources schema. 
Please return all loginids even if they do not  have a resume
HINT: LEFT JOIN, HumanResources.Employee, HumanResources.JobCandidate
*/

SELECT 
	LoginID,
	Resume
FROM HumanResources.Employee   AS emp -- LoginID  -- 290 rows
LEFT JOIN HumanResources.JobCandidate  AS JC
ON emp.BusinessEntityID = JC.BusinessEntityID

/*
Provide a list of loginid and resumes from the human resources schema. 
Please return all loginids even if they do not  have a resume
HINT: RIGHT JOIN, HumanResources.Employee, HumanResources.JobCandidate
*/

SELECT 
	LoginID,
	Resume
FROM HumanResources.JobCandidate  AS JC
RIGHT JOIN HumanResources.Employee   AS emp -- LoginID  -- 290 rows
ON emp.BusinessEntityID = JC.BusinessEntityID



/*
Wirte SQL Query to retrieve the FirstName, MiddleName, LastName of all the employees. 
Create a derived column called LegalName. LegalName is a combination of the FirstName,
MiddleName and LastName. If the middle name is null replace it with "NA".
Also create a derived column for the age of all the employees as of the day you are 
writing the query. 
HINT: INNER JOIN, Person.Person, HumanResources.Employee, ISNULL(), CONCAT, DATEDIFF
*/

SELECT 
	FirstName,
	MiddleName = ISNULL(MiddleName, 'NA'),
	LastName,
	LegalName = CONCAT(FirstName,' ',MiddleName,' ',LastName),
	BirthDate,
	HireDate,
	Age = DATEDIFF(YEAR, BirthDate, GETDATE())
FROM Person.Person AS pp
INNER JOIN HumanResources.Employee emp
ON emp.BusinessEntityID = pp.BusinessEntityID


--======================
-- Outer Join
--======================
--Generate datasets that will return all the people who are employeed including those who are not employeed.

select FirstName, LastName,
	CONCAT(FirstName,' ', LastName) AS FullName,
	JobTitle,
	HireDate
from Person.Person AS PP
LEFT  JOIN HumanResources.Employee AS EMP
ON PP.BusinessEntityID = EMP.BusinessEntityID
AND JobTitle = 'Pacific Sales Manager'


--Write a code to return all the order quantity, unit price including products names that have not been sold (or quantity are unknown)
select *
from Sales.SalesOrderDetail --121317

select *
from Production.Product --506

--Full Join 
SELECT 
	FirstName, 
	JobTitle
FROM Person.Person PP
FULL OUTER JOIN HumanResources.Employee EMP
ON pp.BusinessEntityID = EMP.BusinessEntityID





