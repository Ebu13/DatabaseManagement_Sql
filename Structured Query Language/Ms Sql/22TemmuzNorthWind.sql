-- Veritabanýný oluþtur
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Northwind')
BEGIN
    CREATE DATABASE Northwind;
END
GO

USE Northwind;
GO

-- Önceki tablolardan var olanlarý kaldýr
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'OrderDetails')
DROP TABLE OrderDetails;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Orders')
DROP TABLE Orders;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
DROP TABLE Products;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categories')
DROP TABLE Categories;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Customers')
DROP TABLE Customers;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Employees')
DROP TABLE Employees;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Shippers')
DROP TABLE Shippers;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Suppliers')
DROP TABLE Suppliers;
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Messages')
DROP TABLE Messages;
GO

-- Tablolarý oluþtur
CREATE TABLE Categories
(
    CategoryID INTEGER PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(25),
    Description VARCHAR(255)
);
GO

CREATE TABLE Customers
(
    CustomerID INTEGER PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(20),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Password VARCHAR(255)
);
GO

CREATE TABLE Employees
(
    EmployeeID INTEGER PRIMARY KEY IDENTITY(1,1),
    LastName VARCHAR(15),
    FirstName VARCHAR(15),
    BirthDate DATETIME,
    Photo VARCHAR(25),
    Notes VARCHAR(1024),
    Password VARCHAR(255)
);
GO

CREATE TABLE Shippers
(
    ShipperID INTEGER PRIMARY KEY IDENTITY(1,1),
    ShipperName VARCHAR(25),
    Phone VARCHAR(15)
);
GO

CREATE TABLE Suppliers
(
    SupplierID INTEGER PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(50),
    ContactName VARCHAR(50),
    Address VARCHAR(50),
    City VARCHAR(20),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(15)
);
GO

CREATE TABLE Products
(
    ProductID INTEGER PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    SupplierID INTEGER,
    CategoryID INTEGER,
    Unit VARCHAR(25),
    Price NUMERIC,
    FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);
GO

CREATE TABLE Orders
(
    OrderID INTEGER PRIMARY KEY IDENTITY(10248,1),
    CustomerID INTEGER,
    EmployeeID INTEGER,
    OrderDate DATETIME,
    ShipperID INTEGER,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);
GO

CREATE TABLE OrderDetails
(
    OrderDetailID INTEGER PRIMARY KEY IDENTITY(1,1),
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
GO

-- Mesajlar tablosunu oluþtur
CREATE TABLE Messages
(
    MessageID INTEGER PRIMARY KEY IDENTITY(1,1),
    SenderID INTEGER NOT NULL,
    ReceiverID INTEGER NOT NULL,
    MessageText NVARCHAR(MAX),
    SentDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SenderID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ReceiverID) REFERENCES Employees(EmployeeID)
);
GO
