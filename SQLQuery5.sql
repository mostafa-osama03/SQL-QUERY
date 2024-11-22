--1
SELECT 
    SalesOrderID, 
    ShipDate
FROM 
    Sales.SalesOrderHeader
WHERE 
    ShipDate BETWEEN '2002-07-28' AND '2014-07-29'


--2
SELECT 
    ProductID, 
    Name
FROM 
    Production.Product
WHERE 
    StandardCost < 110.00


--3
SELECT 
    ProductID, 
    Name
FROM 
    Production.Product
WHERE 
    Weight IS NULL


--4
SELECT Name , Color FROM Production.Product
WHERE  Color IN ('Silver', 'Black', 'Red')

--5
SELECT ProductID,Name FROM Production.Product
WHERE Name LIKE 'B%'


--6
UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3


SELECT ProductDescriptionID,Description FROM Production.ProductDescription
WHERE Description LIKE '%[_]%'



--7
SELECT 
    OrderDate, 
    SUM(TotalDue) AS TotalDueSum
FROM 
    Sales.SalesOrderHeader
WHERE 
    OrderDate BETWEEN '2001-07-01' AND '2014-07-31'
GROUP BY 
    OrderDate
ORDER BY 
    OrderDate


--8 
SELECT DISTINCT 
    HireDate
FROM 
    HumanResources.Employee


--9
SELECT 
    AVG(DISTINCT ListPrice) AS AverageUniqueListPrice
FROM 
    Production.Product


	--10
SELECT 
    CONCAT('The ', Name, ' is only! ', FORMAT(ListPrice, 'C')) AS ProductDescription
FROM 
    Production.Product
WHERE 
    ListPrice BETWEEN 100 AND 120
ORDER BY 
    ListPrice