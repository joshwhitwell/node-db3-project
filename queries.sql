-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT
    P.ProductName as 'Product Name',
    C.CategoryName as 'Category Name'
FROM Product as P
JOIN Category as C
    ON P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    O.Id as 'Order Id',
    S.CompanyName as 'Shipper',
FROM [Order] as O
JOIN Shipper as S
    ON O.ShipVia = S.Id
WHERE O.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    OD.Quantity as 'Quantity',
    P.ProductName as 'Product Name' 
FROM [Order]as O
JOIN OrderDetail as OD
    ON O.Id = OD.OrderId
JOIN Product as P
    ON OD.ProductId = P.Id
WHERE O.Id = 10251;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT
    O.Id as 'Order Id',
    C.CompanyName as 'Customer Company',
    E.LastName as 'Employee Last Name'
FROM [Order] as O
JOIN Customer as C
    ON O.CustomerId = C.Id
JOIN Employee as E
    ON O.EmployeeId = E.Id;

--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
SELECT
	Categories.CategoryName,
    COUNT(*) as 'Number of Products'
FROM Products
JOIN Categories
	ON Products.CategoryID = Categories.CategoryID
GROUP BY Products.CategoryID;

--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT 
	OrderId as 'Order Id',
    COUNT(OrderId) as 'Item Count'
FROM OrderDetails
GROUP BY OrderID;
