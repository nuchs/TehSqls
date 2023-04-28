USE MASTER

CREATE DATABASE TestDB
GO

USE TestDB
GO

CREATE TABLE Products(
    Id INT IDENTITY(1, 1) NOT NULL,
    Name NVARCHAR(16) NOT NULL,
    Colour NVARCHAR(16),

    CONSTRAINT PK_Product_Id PRIMARY KEY CLUSTERED(Id),
)
GO

CREATE TABLE Stock(
    ProductId INT NOT NULL,
    Count INT NOT NULL CONSTRAINT DF_Stock_Count DEFAULT 0,

    CONSTRAINT FK_Stock_ProductId FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE
)
GO

INSERT INTO Products (Name, Colour) VALUES ('Widget', 'Blue')
INSERT INTO Products (Name, Colour) VALUES ('Sprocket', 'Yellow')
INSERT INTO Stock SELECT TOP 1 p.Id, 100 FROM Products p WHERE p.Name = 'Widget'
INSERT INTO Stock SELECT TOP 1 p.Id, 200 FROM Products p WHERE p.Name = 'Sprocket'
GO

CREATE PROCEDURE Report
AS
BEGIN
    SELECT
        p.Name,
        p.Colour,
        s.Count
    FROM
        Products p
    JOIN Stock s ON p.Id = s.ProductId
    ORDER BY
        p.Name ASC
END
