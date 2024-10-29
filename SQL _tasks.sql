--Create Checkpoint Database
Create Database Checkpoint_1
Go
--Access Database Checkpoint_1
Use Checkpoint_1;
Go
Create Table products (
Id int primary key,
Product_name Varchar(50),
Price int);
Go
Create Table Customers (
Id int primary key,
Customer_name Varchar(50),
Customer_address Varchar(50),
);
Go
--Delete Table Customers
Drop table Customers

Create Table Customers (
Customers_Id int primary key,
Customer_name Varchar(50),
Customer_address Varchar(50)
);
Go
Create Table Orders (
Order_id int primary key,
Customers_id int foreign key references Customers(Customers_id),
Id int foreign key references Products(Id),
Quantity int,
Order_date date
);
Go

--Delete Table Products
Drop Table products

Create Table products (
Id int primary key,
Product_name Varchar(50),
Price Float);
Go

Insert into products(Id,product_name,price)
Values (1,'cookies',10),
(2,'candy',5.2);
Go

Insert into Customers(Customers_id,Customer_name,Customer_address)
Values (1,'Ahmed','Tunisia'),
(2,'Coulibaly','Senegal'),
(3,'Hasan','Egypt');
Go

Insert into Orders(Order_id,Customers_id,Id,Quantity,Order_date)
Values (1,1,2,3,'2023/01/22'),
(2,2,1,10,'2023/04/14');
Go

--Updating the second quantity in the Order table
Update Orders
Set Quantity=6
Where Order_id=2

--deleting third customer from the customers table
Delete from Customers
where Customers_id=3

delete from Orders;

drop table Orders;
