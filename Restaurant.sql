-- restaurant_db.sql
-- 🍽️ Restaurant Management System
-- Author: Eugene Kipchirchir
-- Description: MySQL database schema for managing restaurant operations

-- Create the database
CREATE DATABASE restaurant;
USE restaurant;

-- Table: Customers
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
	EmpRole VARCHAR(50),
    HireDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Salary DECIMAL(10,2)
);

-- Table: MenuItems
CREATE TABLE MenuItems (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItmeName VARCHAR(100) NOT NULL,
    Mendesc TEXT,
    Price DECIMAL(8,2) NOT NULL,
    Category VARCHAR(50) -- e.g., Appetizer, Main Course, Dessert
);

-- Table: Orders
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Table: OrderItems (Many-to-Many: Orders <-> MenuItems)
CREATE TABLE OrderItems (
    OrderID INT,
    ItemID INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (OrderID, ItemID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

-- Table: Reservations
CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ReservationDate DATETIME,
    TableNumber INT,
    NumberOfGuests INT,
    Notes TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
