Q1
SELECT Orders.OrderID, Orders.ShipperID, Shippers.ShipperName,
COUNT(Orders.ShipperID) as NumShipped
FROM Orders 
	INNER JOIN Shippers ON Shippers.ShipperID=Orders.ShipperID
GROUP BY Shippers.ShipperName
ORDER BY numShipped desc


Q2
SELECT Orders.EmployeeID, Employees.LastName,
COUNT(Orders.EmployeeID) AS numOrdered
FROM Orders
	INNER JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Orders.EmployeeID
ORDER BY numOrdered DESC




Q2
CREATE TABLE newTable AS
SELECT Orders.OrderID, OrderDetails.Quantity, Products.ProductName, Customers.Country,
COUNT(*) as numOrders
FROM OrderDetails, Orders
	INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE Country = "Germany"
GROUP BY Products.ProductName

ALTER TABLE newTable
ADD totalAmt int
UPDATE newTable
SET totalAmt = newTable.Quantity * newTable.numOrders
ORDER BY totalAmt DESC