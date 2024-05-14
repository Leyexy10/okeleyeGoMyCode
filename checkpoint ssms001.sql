--Create Okeleye Database
Create Database Okeleye
Go

--Access Okeleye Database
Use Okeleye;
Go

Create Table Customers (
Customer_ID Int Primary key Not Null,
Name Varchar(20) Not Null,
Address Varchar (20) Not Null)
;
Go

Create Table Products (
Product_ID Int Primary Key Not Null,
Name Varchar(20) Not Null,
Price Varchar(20) Not Null)
;
Go

Create Table Orders (
Order_ID Int Primary Key Not Null,
Customer_ID Int Foreign Key references Customers (Customer_ID) Not Null,
Product_ID Int Foreign Key references Products (Product_ID) Not Null,
Quantity Int Not Null,
Order_Date Date Not Null)
;
Go

