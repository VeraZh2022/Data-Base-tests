
use voodoo;
select * from Shippers;
select BirthDate, FirstName, LastName from Employees limit 3;
select FirstName, LastName from Employees where BirthDate like '1958%';
select * from Products where price between 23 and 25;
select * from Products where price>=23 and Price<=25;
select * from Products;
use voodoo;
select * from Products;
select ProductID, ProductName, SupplierID, CategoryID, Unit, Price from Products group by Price;
select ProductID,ProductName,SupplierID,CategoryID,Unit,min(Price) group by ProductID;
select * from Products having Price=min(Price);
select * from Products where Unit='10 pkgs.';
select * from Suppliers;
select Address from Suppliers where City='Tokyo' or City='Frankfurt' or City='Osaka';
select * from Products;
select ProductName from Products where ProductName like 'G%' and Price>37;
select Country from Suppliers where Country like 'S____';
select sum(Price) as Summ from Products where ProductName like '%od%';
select * from Customers;
select count(CustomerID) as Countt from Customers where Country<>'France' and Country<>'Germany';
select * from Employees;
select FirstName from Employees where BirthDate>'1968.01.01' order by FirstName;
select * from Employees;
select * from Products;
select Products.ProductName from Products 
union
select Products.Price from Products where Products.Price=13 or Products.Price=15 order by Price;
select Products.ProductName from Products where Products.Price=13 union select Products.ProductName from Products where Products.Price=15 order by Products.Price;
select Products.ProductName from Products where Products.ProductName like '__m%'
union 
select Suppliers.SupplierName from Suppliers where Products.SupplierID=Suppliers.SupplierID;
select ProductID, ProductName, SupplierID, CategoryID, Unit, min(Price) from Products;
select * from Employees;
select Employees.FirstName, Employees.LastName from Employees 
join Orders on Employees.EmployeeID=Orders.EmployeeID where OrderDate='1996-11-27';
select Employees.FirstName, Employees.LastName from Employees where Employees.FirstName= (select Orders.OrderDate from Orders where Orders.OrderDate='1996-11-27');
select Orders.OrderDate from Orders where Orders.OrderDate='1996-11-27';
select Products.ProductName, Suppliers.SupplierName, Products.Price from Products, Suppliers
where Suppliers.SupplierName= 'Grandma%' and Products.Price>27 and Products.SupplierID=Suppliers.SupplierID;
select * from Products;
select sum(OrderDetails.Quantity) as Summ from OrderDetails 
join Products on Products.ProductID=OrderDetails.ProductID
where Products.ProductName='Queso Cabrales';
select * from Customers where Address='Ekergatan 24';
select ProductName from Products where Price = 13 union select ProductName from Products where Price = 15;
select * from Customers;
select * from Products where Price = (select min(Price) from Products);
select * from Products where Price = (select max(Price) from Products);
select Products.ProductName, (select Suppliers.SupplierName from Suppliers where Suppliers.SupplierID = Products.SupplierID) as SupplierName from Products where substring(ProductName, 3, 1) = 'm';
select Employees.FirstName, Employees.LastName from Employees where (select Orders.EmployeeID from Orders where Orders.EmployeeID = Employees.EmployeeID and Orders.OrderDate = '1996-11-27') ;
select Products.ProductName, (select Suppliers.SupplierName from Suppliers where Suppliers.SupplierID = Products.SupplierID) as SupplierName, Price from Products having SupplierName = "Grandma Kelly's Homestead" and Price > 27;
select sum(OrderDetails.Quantity) as Summ from OrderDetails where (select Products.ProductID from Products where Products.ProductID = OrderDetails.ProductID and Products.ProductName = 'Queso Cabrales');
select Orders.OrderID, Customers.CustomerName, 
concat(Employees.FirstName, ' ', Employees.LastName) as EmployeeName
from Orders
left join Customers on Orders.CustomerID = Customers.CustomerID
left join Employees on Orders.EmployeeID = Employees.EmployeeID
where Customers.Address='Ekergatan 24';


select *from Products;
select Orders.OrderID, Customers.CustomerName, Employees.FirstName, Employees.LastName from Orders, Customers, Employees where Orders.CustomerID = Customers.CustomerID and Employees.EmployeeID = Orders.EmployeeID and Customers.Address = "Ekergatan 24";
select sum(Price) as Summ from Products where ProductName like '%od%';
select Orders.OrderID, Orders.OrderDate, Products.ProductName from Orders
join OrderDetails on Orders.OrderID=OrderDetails.OrderID
join Products on Products.ProductID=OrderDetails.ProductID
where Orders.OrderDate like '1997%' and length(Products.ProductName)<5;
select Orders.OrderID, Orders.OrderDate, Products.ProductName from Orders, Products 
where (select OrderDetails.OrderID from OrderDetails where OrderDetails.OrderID = Orders.OrderID and Products.ProductID = OrderDetails.ProductID)
and Orders.OrderDate like '1997%' and length(Products.ProductName) < 5;

select  count(distinct Customers.CustomerID) as Buyers from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
join OrderDetails on OrderDetails.OrderID = Orders.OrderID
join Products on Products.ProductID = OrderDetails.ProductID
where Products.ProductName in ("Queso Cabrales", "Gustaf's Knäckebröd", "Louisiana Fiery Hot Pepper Sauce", "Schoggi Schokolade", "Gnocchi di nonna Alice");
select round(avg(Price), 2) as Summ from Products where Products.Unit like '%bottle%';
select Categories.CategoryName, Products.ProductName from Categories
join Products on Categories.CategoryID=Products.CategoryID
join OrderDetails on Products.ProductID=OrderDetails.ProductID
where (length(Categories.CategoryName) - length(replace(Categories.CategoryName, ' ', '')) + 1) > 1 and Customers.CustomerName = 'Blondel père et fils';
select Categories.CategoryName, Products.ProductName from Categories
join Products on Products.CategoryID = Categories.CategoryID
join OrderDetails on OrderDetails.ProductID = Products.ProductID
join Orders on Orders.OrderID = OrderDetails.OrderID
join Customers on Customers.CustomerID = Orders.CustomerID
where (length(Categories.CategoryName) - length(replace(Categories.CategoryName, ' ', '')) + 1) > 1 and Customers.CustomerName = 'Blondel père et fils';
select  count(distinct Customers.CustomerID) as Buyers from Customers
join Orders on Orders.CustomerID = Customers.CustomerID
join OrderDetails on OrderDetails.OrderID = Orders.OrderID
join Products on Products.ProductID = OrderDetails.ProductID
where Products.ProductName in ("Queso Cabrales", "Gustaf's Knäckebröd", "Louisiana Fiery Hot Pepper Sauce", "Schoggi Schokolade", "Gnocchi di nonna Alice");