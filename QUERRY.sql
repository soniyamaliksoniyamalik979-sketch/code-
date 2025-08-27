
CREATE DATABASE SimpleBank;
USE SimpleBank;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Amount INT,
    Type VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert data
INSERT INTO Customers VALUES (1, 'Ali', 'ali@gmail.com');
INSERT INTO Customers VALUES (2, 'Sara', 'sara@yahoo.com');

INSERT INTO Accounts VALUES (101, 1, 'Saving', 5000);
INSERT INTO Accounts VALUES (102, 2, 'Current', 3000);

INSERT INTO Transactions VALUES (1001, 101, 1000, 'Credit');
INSERT INTO Transactions VALUES (1002, 102, 500, 'Debit');

INSERT INTO Branches VALUES (1, 'Main Branch', 'Lahore');
INSERT INTO Branches VALUES (2, 'City Branch', 'Karachi');

-- SELECT queries
SELECT * FROM Customers;

SELECT Name
FROM Customers;


-- Update balance
UPDATE Accounts
SET Balance = Balance + 1000
WHERE AccountID = 101;

-- Delete a transaction
DELETE FROM Transactions
WHERE TransactionID = 1002;

-- LEFT JOIN
SELECT Customers.Name, Accounts.AccountType
FROM Customers
LEFT JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;

-- RIGHT JOIN
SELECT Customers.Name, Accounts.AccountType
FROM Customers
RIGHT JOIN Accounts ON Customers.CustomerID = Accounts.CustomerID;
