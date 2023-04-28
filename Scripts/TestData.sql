USE TestDB
GO

INSERT INTO Products (Name, Colour) VALUES ('Widget', 'Blue')
INSERT INTO Products (Name, Colour) VALUES ('Sprocket', 'Yellow')
INSERT INTO Stock SELECT TOP 1 p.Id, 100 FROM Products p WHERE p.Name = 'Widget'
INSERT INTO Stock SELECT TOP 1 p.Id, 200 FROM Products p WHERE p.Name = 'Sprocket'
GO
